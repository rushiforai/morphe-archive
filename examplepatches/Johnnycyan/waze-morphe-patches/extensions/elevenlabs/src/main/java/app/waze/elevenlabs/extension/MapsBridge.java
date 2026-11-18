package app.waze.elevenlabs.extension;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Entry points called from the patched Google Maps code.
 *
 * Maps prepares every navigation instruction ahead of time on its speech queue: a synthesizer
 * writes the instruction text to an audio file, which Maps moves into its "tts-cache" directory
 * and later plays with MediaPlayer. The patch routes that synthesizer call here. The ElevenLabs
 * MP3 is written to the file Maps asked for; if ElevenLabs is off or fails, Maps' own synthesizer
 * runs as before.
 *
 * Maps keys its cache by instruction, not by voice, so a cache filled under one voice would keep
 * playing after the voice changes. The cache is emptied at startup whenever the voice differs
 * from the one it was filled with, and lookups miss for the rest of a session in which the voice
 * changed.
 */
public final class MapsBridge {
    private static final String TAG = "MapsElevenLabs";
    private static final String STATE = "elevenlabs_voice_maps";
    private static final String OFF = "off";
    private static final Map<Class<?>, Method> SYNTHESIZERS = new ConcurrentHashMap<>();
    private static final Map<Class<?>, Field> TEXT_FIELDS = new ConcurrentHashMap<>();
    private static volatile Context context;
    // The voice identity Maps' tts-cache holds audio for during this session.
    private static volatile String cacheIdentity = OFF;
    // androidx.preference method names for this build, supplied by the patch through bindPreferences().
    private static volatile String setTitle, setSummary, setKey, addPreference;
    private static volatile WeakReference<Object> entry = new WeakReference<>(null);

    private MapsBridge() {}

    /** Called when Maps creates its tts-cache, before the cache reads the directory. */
    public static void initialize(Context value) {
        Context app = value.getApplicationContext() != null ? value.getApplicationContext() : value;
        context = app;
        ElevenLabsBridge.initialize(app);
        String identity = identity(app);
        SharedPreferences state = app.getSharedPreferences(STATE, Context.MODE_PRIVATE);
        if (!identity.equals(state.getString("tts_cache_identity", OFF))) {
            File[] files = app.getDir("tts-cache", Context.MODE_PRIVATE).listFiles();
            if (files != null) for (File file : files) delete(file);
            state.edit().putString("tts_cache_identity", identity).commit();
            Log.i(TAG, "Voice changed; cleared the Maps speech cache");
        }
        cacheIdentity = identity;
    }

    private static String identity(Context app) {
        ElevenLabsSettings.Config config = ElevenLabsSettings.load(app);
        return config.usable() ? ElevenLabsClient.voiceIdentity(config) : OFF;
    }

    /** Maps' cache lookup: treat cached speech as missing once the voice changed this session. */
    public static File cachedVoice(File cached) {
        Context app = context;
        if (cached == null || app == null) return cached;
        return identity(app).equals(cacheIdentity) ? cached : null;
    }

    /** Replaces Maps' synthesizer call: synthesizer.synthesize(instruction, route, outputPath). */
    public static boolean synthesize(Object synthesizer, Object instruction, Object route, String path) {
        Context app = context;
        ElevenLabsSettings.Config config = app == null ? null : ElevenLabsSettings.load(app);
        if (config != null && config.usable() && path != null) {
            String text = text(instruction);
            if (text != null) {
                try {
                    copy(ElevenLabsClient.speech(app.getCacheDir(), config, text), new File(path));
                    ElevenLabsBridge.report("Spoke \"" + text + "\"");
                    return true;
                } catch (Exception error) {
                    ElevenLabsBridge.report(ElevenLabsSettings.message(error) + "; used the Google voice");
                    Log.w(TAG, "Synthesis failed", error);
                }
            }
        }
        return original(synthesizer, instruction, route, path);
    }

    private static boolean original(Object synthesizer, Object instruction, Object route, String path) {
        try {
            return (Boolean) synthesizerMethod(synthesizer.getClass(), instruction)
                    .invoke(synthesizer, instruction, route, path);
        } catch (InvocationTargetException error) {
            Throwable cause = error.getCause();
            if (cause instanceof RuntimeException) throw (RuntimeException) cause;
            if (cause instanceof Error) throw (Error) cause;
            Log.e(TAG, "Maps synthesizer failed", cause);
            return false;
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.e(TAG, "Cannot call the Maps synthesizer", error);
            return false;
        }
    }

    /** The synthesizer's (instruction, route, path) -> boolean method; its name is obfuscated. */
    private static Method synthesizerMethod(Class<?> type, Object instruction) throws NoSuchMethodException {
        Method cached = SYNTHESIZERS.get(type);
        if (cached != null) return cached;
        Method found = null;
        for (Method method : type.getMethods()) {
            Class<?>[] params = method.getParameterTypes();
            if (method.getReturnType() == boolean.class && params.length == 3 && params[2] == String.class
                    && !params[1].isPrimitive() && params[0].isInstance(instruction)) {
                if (found != null) throw new NoSuchMethodException("Several synthesizer methods in " + type);
                found = method;
            }
        }
        if (found == null) throw new NoSuchMethodException("No synthesizer method in " + type);
        found.setAccessible(true);
        SYNTHESIZERS.put(type, found);
        return found;
    }

    /** Instruction text: the instruction holder's only String field. */
    private static String text(Object instruction) {
        if (instruction == null) return null;
        try {
            Field field = TEXT_FIELDS.get(instruction.getClass());
            if (field == null) {
                for (Field candidate : instruction.getClass().getDeclaredFields()) {
                    if (candidate.getType() != String.class) continue;
                    if (field != null) throw new NoSuchFieldException("Several text fields in " + instruction.getClass());
                    field = candidate;
                }
                if (field == null) throw new NoSuchFieldException("No text field in " + instruction.getClass());
                field.setAccessible(true);
                TEXT_FIELDS.put(instruction.getClass(), field);
            }
            String text = (String) field.get(instruction);
            if (text == null) return null;
            // Drop any SSML markup; ElevenLabs would read it out.
            text = text.replaceAll("<[^>]+>", " ").replaceAll("\\s+", " ").trim();
            return text.isEmpty() ? null : text;
        } catch (ReflectiveOperationException error) {
            Log.e(TAG, "Cannot read the instruction text", error);
            return null;
        }
    }

    private static void copy(File from, File to) throws IOException {
        File parent = to.getParentFile();
        if (parent != null && !parent.isDirectory() && !parent.mkdirs()) throw new IOException("Cannot create " + parent);
        try (InputStream in = new FileInputStream(from); OutputStream out = new FileOutputStream(to)) {
            byte[] buffer = new byte[16 * 1024];
            for (int n; (n = in.read(buffer)) > 0; ) out.write(buffer, 0, n);
        }
    }

    private static void delete(File file) {
        File[] children = file.listFiles();
        if (children != null) for (File child : children) delete(child);
        file.delete();
    }

    public static void bindPreferences(String title, String summary, String key, String add) {
        setTitle = title; setSummary = summary; setKey = key; addPreference = add;
    }

    /** Called with Maps' "Sound & voice" settings category; adds the ElevenLabs entry to it. */
    public static void addSettingsEntry(Object category) {
        if (category == null || setTitle == null) return;
        try {
            ClassLoader loader = category.getClass().getClassLoader();
            Class<?> preference = Class.forName("androidx.preference.Preference", false, loader);
            Class<?> group = Class.forName("androidx.preference.PreferenceGroup", false, loader);
            Context ui = (Context) fieldOfType(preference, Context.class).get(category);
            Object item = preference.getConstructor(Context.class).newInstance(ui);
            // Maps' click handler compares every tapped preference's key, so a null key crashes it.
            preference.getMethod(setKey, String.class).invoke(item, "elevenlabs_voice");
            preference.getMethod(setTitle, CharSequence.class).invoke(item, "ElevenLabs voice");
            preference.getMethod(setSummary, CharSequence.class).invoke(item, ElevenLabsSettings.summary(ui));
            // The click listener runs before Maps' own click handler, which would otherwise consume the tap.
            clickListenerField(preference).set(item, clickListener(preference, ui));
            group.getMethod(addPreference, preference).invoke(category, item);
            entry = new WeakReference<>(item);
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.e(TAG, "Cannot add settings entry", error);
        }
    }

    /** Updates the settings entry's summary after the dialog saved. */
    static void refreshSummary(Context ui) {
        Object item = entry.get();
        if (item == null || setSummary == null) return;
        try {
            item.getClass().getMethod(setSummary, CharSequence.class).invoke(item, ElevenLabsSettings.summary(ui));
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w(TAG, "Cannot update settings entry", error);
        }
    }

    /** Preference's OnPreferenceClickListener field: an interface whose one method is (Preference) -> boolean. */
    private static Field clickListenerField(Class<?> preference) throws NoSuchFieldException {
        Field found = null;
        for (Field field : preference.getDeclaredFields()) {
            Class<?> type = field.getType();
            if (!type.isInterface() || type.getDeclaredMethods().length != 1) continue;
            Method method = type.getDeclaredMethods()[0];
            if (method.getReturnType() != boolean.class || method.getParameterTypes().length != 1
                    || method.getParameterTypes()[0] != preference) continue;
            if (found != null) throw new NoSuchFieldException("Several click listener fields in " + preference);
            found = field;
        }
        if (found == null) throw new NoSuchFieldException("No click listener field in " + preference);
        found.setAccessible(true);
        return found;
    }

    private static Object clickListener(Class<?> preference, Context ui) throws NoSuchFieldException {
        Class<?> type = clickListenerField(preference).getType();
        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, (proxy, method, args) -> {
            switch (method.getName()) {
                case "hashCode": return System.identityHashCode(proxy);
                case "equals": return proxy == args[0];
                case "toString": return "ElevenLabs settings entry";
                default:
                    ui.startActivity(new Intent(ui, ElevenLabsActivity.class));
                    return true;
            }
        });
    }

    private static Field fieldOfType(Class<?> owner, Class<?> type) throws NoSuchFieldException {
        Field found = null;
        for (Field field : owner.getDeclaredFields()) {
            if (field.getType() != type) continue;
            if (found != null) throw new NoSuchFieldException("Several " + type.getSimpleName() + " fields in " + owner);
            found = field;
        }
        if (found == null) throw new NoSuchFieldException("No " + type.getSimpleName() + " field in " + owner);
        found.setAccessible(true);
        return found;
    }
}
