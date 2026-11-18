package app.waze.elevenlabs.extension;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.io.File;
import java.io.InputStreamReader;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Entry points called from the patched Waze code.
 *
 * Waze plays speech three ways: an online chunk URL (text known from the chunk), a local prompt
 * file (text looked up in Waze's own phrase table) and its native TTS cache (text known from the
 * download request). Each is intercepted, its text is synthesized by ElevenLabs, and the resulting
 * MP3 goes back through Waze's own file player so audio focus, volume and completion callbacks work
 * as usual. Anything that fails or takes too long falls back to the original Waze call.
 */
public final class ElevenLabsBridge {
    private static final String TAG = "WazeElevenLabs";
    private static final String WAZE_NOTE = "In Voice & sound → Waze voice, pick a voice marked “Including street names”. "
            + "Only those voices give Waze the instruction text that ElevenLabs reads out.";
    private static final long TIMEOUT_MS = 9000;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    // One thread: utterances are synthesized in the order Waze asked for them.
    private static final ExecutorService NETWORK = Executors.newSingleThreadExecutor();
    private static final Map<String, String> TEXT = new LinkedHashMap<String, String>() {
        protected boolean removeEldestEntry(Map.Entry<String, String> e) { return size() > 2048; }
    };
    private static final Map<Integer, Pending> JOBS = new LinkedHashMap<>();
    private static final AtomicInteger IDS = new AtomicInteger();
    private static final ThreadLocal<Boolean> BYPASS = new ThreadLocal<>();
    private static volatile Context context;
    private static volatile Object soundPlayer;
    private static volatile PromptTextCatalog promptCatalog;
    private static volatile String status = "Nothing spoken yet";
    private static int generation; // main thread only
    // Obfuscated Waze names for this build, supplied by the patch through bind().
    private static volatile String callbackClass, urlPlayMethod, filePlayMethod, nativePlayMethod;

    private enum Kind { URL, FILE, NATIVE }

    private ElevenLabsBridge() {}

    public static void initialize(Context value) { context = value.getApplicationContext(); }

    public static void attachPlayer(Object value) { soundPlayer = value; }

    public static void bind(String callback, String urlPlay, String filePlay, String nativePlay) {
        callbackClass = callback; urlPlayMethod = urlPlay; filePlayMethod = filePlay; nativePlayMethod = nativePlay;
    }

    static String status() { return status; }

    static void report(String value) { status = value; }

    static void background(Runnable task) { NETWORK.execute(task); }

    private static ElevenLabsSettings.Config active() {
        if (context == null || Boolean.TRUE.equals(BYPASS.get())) return null;
        ElevenLabsSettings.Config config = ElevenLabsSettings.load(context);
        return config.usable() ? config : null;
    }

    /** Native TTS cache lookup: report text we have not seen yet as uncached, so Waze requests it. */
    public static boolean needsText(String key) {
        if (active() == null) return false;
        synchronized (TEXT) { return !TEXT.containsKey(key); }
    }

    public static void remember(String text, String url, String key) {
        if (text == null || text.trim().isEmpty()) return;
        synchronized (TEXT) { TEXT.put(url, text); TEXT.put(key, text); }
    }

    public static boolean play(Object player, String url, String key, Object callback) {
        ElevenLabsSettings.Config config = active();
        if (config == null) return false;
        String text;
        synchronized (TEXT) { text = TEXT.get(url); if (text == null) text = TEXT.get(key); }
        if (text == null) return false;
        return enqueue(new Pending(Kind.URL, config, text, player, url, key, callback, false, false, null));
    }

    public static boolean playFile(Object player, String path, String stats, boolean ignoreMute,
            boolean ignoreHardMute, Object callback) {
        ElevenLabsSettings.Config config = active();
        if (config == null) return false;
        String text;
        synchronized (TEXT) { text = TEXT.get(path); }
        if (text == null) {
            try { text = catalog().resolve(path); }
            catch (Exception error) { Log.e(TAG, "Cannot load Waze prompt phrases", error); }
        }
        // Not a spoken prompt (a chime or sound effect): leave it to Waze.
        if (text == null) return false;
        return enqueue(new Pending(Kind.FILE, config, text, player, path, stats, callback, ignoreMute, ignoreHardMute, null));
    }

    public static boolean playCached(Object manager, String key, boolean ignoreHardMute) {
        ElevenLabsSettings.Config config = active();
        if (config == null || soundPlayer == null) return false;
        String text;
        synchronized (TEXT) { text = TEXT.get(key); }
        if (text == null) return false;
        try {
            Class<?> type = callbackType();
            // Waze's native path has no completion callback; give the file player a no-op one.
            Object callback = Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type},
                    (proxy, method, args) -> {
                        switch (method.getName()) {
                            case "hashCode": return System.identityHashCode(proxy);
                            case "equals": return proxy == args[0];
                            case "toString": return "ElevenLabs completion";
                            default: return null;
                        }
                    });
            return enqueue(new Pending(Kind.NATIVE, config, text, soundPlayer, key, null, callback, false, ignoreHardMute, manager));
        } catch (Exception error) {
            Log.e(TAG, "Cannot route native TTS", error);
            return false;
        }
    }

    private static boolean enqueue(Pending pending) {
        Log.i(TAG, "Queued " + pending.kind + " #" + pending.id + " \"" + pending.text + "\"");
        File cacheDir = context.getCacheDir();
        MAIN.post(() -> {
            pending.generation = generation;
            JOBS.put(pending.id, pending);
            MAIN.postDelayed(() -> finish(pending.id, null, "ElevenLabs timed out; used the Waze voice"), TIMEOUT_MS);
            NETWORK.execute(() -> {
                File audio = null;
                String failure = null;
                try { audio = ElevenLabsClient.speech(cacheDir, pending.config, pending.text); }
                catch (Exception error) {
                    failure = ElevenLabsSettings.message(error) + "; used the Waze voice";
                    Log.w(TAG, "Synthesis failed", error);
                }
                File result = audio;
                String reason = failure;
                MAIN.post(() -> finish(pending.id, result, reason));
            });
        });
        return true;
    }

    private static void finish(int id, File audio, String failure) {
        Pending pending = JOBS.remove(id);
        if (pending == null || pending.generation != generation) return;
        Log.i(TAG, "Finished #" + id + (audio != null ? " with ElevenLabs audio" : ": " + failure));
        try {
            Class<?> type = callbackType();
            if (audio != null) {
                Method method = pending.player.getClass().getMethod(filePlayMethod, String.class, String.class,
                        boolean.class, boolean.class, type);
                BYPASS.set(true);
                try {
                    method.invoke(pending.player, audio.getAbsolutePath(),
                            pending.kind == Kind.FILE ? pending.key : null,
                            pending.ignoreMute, pending.ignoreHardMute, pending.callback);
                } finally { BYPASS.remove(); }
                status = "Spoke \"" + pending.text + "\"";
            } else {
                status = failure;
                original(pending, type);
            }
        } catch (Exception error) {
            status = "Playback error: " + error.getClass().getSimpleName() + "; used the Waze voice";
            Log.e(TAG, status, error);
            try { original(pending, callbackType()); }
            catch (Exception again) { Log.e(TAG, "Original playback also failed", again); }
        }
    }

    private static void original(Pending pending, Class<?> type) throws Exception {
        BYPASS.set(true);
        try {
            switch (pending.kind) {
                case URL:
                    pending.player.getClass().getMethod(urlPlayMethod, String.class, String.class, type)
                            .invoke(pending.player, pending.url, pending.key, pending.callback);
                    break;
                case FILE:
                    pending.player.getClass().getMethod(filePlayMethod, String.class, String.class, boolean.class, boolean.class, type)
                            .invoke(pending.player, pending.url, pending.key, pending.ignoreMute, pending.ignoreHardMute, pending.callback);
                    break;
                case NATIVE:
                    pending.manager.getClass().getMethod(nativePlayMethod, String.class, boolean.class)
                            .invoke(pending.manager, pending.url, pending.ignoreHardMute);
                    break;
            }
        } finally { BYPASS.remove(); }
    }

    /** Waze stopped its speech (route ended, rerouted, muted): drop everything still queued. */
    public static void cancel() {
        MAIN.post(() -> {
            generation++;
            JOBS.clear();
        });
    }

    private static Class<?> callbackType() throws ClassNotFoundException {
        return Class.forName(callbackClass, false, context.getClassLoader());
    }

    private static synchronized PromptTextCatalog catalog() throws java.io.IOException {
        if (promptCatalog == null) {
            try (InputStreamReader reader = new InputStreamReader(
                    context.getAssets().open("res/key_value_tts_strings.txt"), StandardCharsets.UTF_8)) {
                promptCatalog = new PromptTextCatalog(reader);
            }
        }
        return promptCatalog;
    }

    /** Called when a Waze settings page rebuilds its rows; adds our entry to the main and voice pages. */
    public static void addSettingsEntry(Object fragment) {
        // Post: the page clears and re-adds its rows in the hooked method itself.
        MAIN.post(() -> {
            try {
                Bundle args = (Bundle) fragment.getClass().getMethod("getArguments").invoke(fragment);
                String page = args == null ? "" : args.getString("model", "");
                if (!page.equals("settings_main") && !page.equals("settings_main.voice")) return;
                View root = (View) fragment.getClass().getMethod("getView").invoke(fragment);
                Activity activity = (Activity) fragment.getClass().getMethod("getActivity").invoke(fragment);
                if (root == null || activity == null || activity.isFinishing() || activity.isDestroyed()) return;
                initialize(activity);
                int id = root.getResources().getIdentifier("settingsLinearLayout", "id", activity.getPackageName());
                View target = root.findViewById(id);
                if (!(target instanceof LinearLayout)) {
                    Log.e(TAG, "Settings row container not found");
                    return;
                }
                LinearLayout rows = (LinearLayout) target;
                if (rows.findViewWithTag("elevenlabs_entry") != null) return;
                rows.addView(entry(activity), Math.min(1, rows.getChildCount()),
                        new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            } catch (Exception error) {
                Log.e(TAG, "Cannot add settings entry", error);
            }
        });
    }

    private static View entry(Activity activity) {
        LinearLayout row = new LinearLayout(activity);
        row.setTag("elevenlabs_entry");
        row.setOrientation(LinearLayout.VERTICAL);
        int pad = ElevenLabsSettings.dp(activity, 16);
        row.setPadding(pad, pad, pad, pad);
        row.setClickable(true);
        row.setFocusable(true);
        TypedValue ripple = new TypedValue();
        if (activity.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, ripple, true)) {
            row.setBackgroundResource(ripple.resourceId);
        }
        TextView title = new TextView(activity);
        title.setText("ElevenLabs voice");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        TextView summary = new TextView(activity);
        summary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        summary.setAlpha(0.7f);
        summary.setText(ElevenLabsSettings.summary(activity));
        row.addView(title);
        row.addView(summary);
        row.setOnClickListener(v -> ElevenLabsSettings.show(activity, WAZE_NOTE,
                () -> summary.setText(ElevenLabsSettings.summary(activity))));
        return row;
    }

    private static final class Pending {
        final int id = IDS.incrementAndGet();
        final Kind kind;
        final ElevenLabsSettings.Config config;
        final String text, url, key;
        final Object player, callback, manager;
        final boolean ignoreMute, ignoreHardMute;
        int generation;

        Pending(Kind kind, ElevenLabsSettings.Config config, String text, Object player, String url, String key,
                Object callback, boolean ignoreMute, boolean ignoreHardMute, Object manager) {
            this.kind = kind; this.config = config; this.text = text; this.player = player; this.url = url;
            this.key = key; this.callback = callback; this.ignoreMute = ignoreMute;
            this.ignoreHardMute = ignoreHardMute; this.manager = manager;
        }
    }
}
