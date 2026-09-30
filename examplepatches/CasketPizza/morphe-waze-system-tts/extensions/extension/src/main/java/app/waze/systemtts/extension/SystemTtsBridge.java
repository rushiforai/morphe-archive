package app.waze.systemtts.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.os.Bundle;
import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.CheckBox;
import android.widget.TextView;
import android.widget.ScrollView;
import java.io.File;
import java.io.InputStreamReader;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

/** Waze 5.24.5: Chunk -> SoundPlayer.g -> local audio -> SoundPlayer.c. */
public final class SystemTtsBridge {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<String, String> TEXT = new LinkedHashMap<String, String>() {
        protected boolean removeEldestEntry(Map.Entry<String, String> e) { return size() > 2048; }
    };
    private static final Map<String, Pending> JOBS = new LinkedHashMap<>();
    private static final AtomicInteger IDS = new AtomicInteger();
    private static final ThreadLocal<Boolean> BYPASS = new ThreadLocal<>();
    private static volatile Context context;
    private static volatile Object soundPlayer;
    private static volatile PromptTextCatalog promptCatalog;
    private static volatile String lastUnmatched = "none";
    private static TextToSpeech engine;
    private static boolean ready;
    private static int generation;
    private static volatile String status = "No navigation chunks received yet";

    private SystemTtsBridge() {}

    public static void initialize(Context value) { context = value.getApplicationContext(); }

    public static void attachPlayer(Object value) { soundPlayer = value; }

    public static boolean needsText(String key) {
        if (!enabled() || Boolean.TRUE.equals(BYPASS.get())) return false;
        synchronized (TEXT) { return !TEXT.containsKey(key); }
    }

    private static boolean enabled() {
        return context != null && context.getSharedPreferences("system_tts", 0).getBoolean("enabled", false);
    }

    public static void remember(String text, String url, String key) {
        if (text == null || text.trim().isEmpty()) return;
        synchronized (TEXT) { TEXT.put(url, text); TEXT.put(key, text); }
    }

    public static boolean play(Object player, String url, String key, Object callback) {
        if (!enabled() || Boolean.TRUE.equals(BYPASS.get())) return false;
        String text;
        synchronized (TEXT) { text = TEXT.get(url); if (text == null) text = TEXT.get(key); }
        if (text == null) { status = "Unmatched URL audio: using Waze voice"; return false; }
        return enqueue(player, url, key, callback, text, 0, false, false, null);
    }

    public static boolean playFile(Object player, String path, String stats, boolean ignoreMute,
            boolean ignoreHardMute, Object callback) {
        if (!enabled() || Boolean.TRUE.equals(BYPASS.get())) return false;
        String text;
        synchronized (TEXT) { text = TEXT.get(path); }
        if (text == null) {
            try {
                text = catalog().resolve(path);
            } catch (Exception error) { Log.e("WazeSystemTTS", "Cannot load prompt phrases", error); }
        }
        if (text == null) {
            lastUnmatched = new File(path).getName();
            return false;
        }
        return enqueue(player, path, stats, callback, text, 1, ignoreMute, ignoreHardMute, null);
    }

    public static boolean playCached(Object manager, String key, boolean ignoreHardMute) {
        if (!enabled() || soundPlayer == null || Boolean.TRUE.equals(BYPASS.get())) return false;
        String text;
        synchronized (TEXT) { text = TEXT.get(key); }
        if (text == null) return false;
        try {
            Class<?> callbackType = Class.forName("h.g.a.a");
            Object callback = Proxy.newProxyInstance(callbackType.getClassLoader(), new Class<?>[]{callbackType},
                    (proxy, method, args) -> {
                        if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                        if (method.getName().equals("equals")) return proxy == args[0];
                        if (method.getName().equals("toString")) return "System TTS completion";
                        return null;
                    });
            return enqueue(soundPlayer, key, null, callback, text, 2, false, ignoreHardMute, manager);
        } catch (Exception error) {
            Log.e("WazeSystemTTS", "Cannot route cached TTS", error);
            return false;
        }
    }

    private static boolean enqueue(Object player, String url, String key, Object callback, String text,
            int kind, boolean ignoreMute, boolean ignoreHardMute, Object manager) {
        MAIN.post(() -> {
            String spoken = text;
            try {
                String alert = catalog().alertKey(url, text);
                if (alert != null) spoken = context.getSharedPreferences("system_tts_alerts", 0).getString(alert, text);
            } catch (Exception error) { Log.e("WazeSystemTTS", "Cannot customize alert", error); }
            Pending pending = new Pending(player, url, key, callback, spoken, generation,
                    kind, ignoreMute, ignoreHardMute, manager);
            JOBS.put(pending.id, pending);
            ensureEngine();
            if (ready) synthesize(pending);
            MAIN.postDelayed(() -> finish(pending.id, false), 10000);
        });
        return true;
    }

    private static void ensureEngine() {
        if (engine != null || context == null) return;
        engine = new TextToSpeech(context, result -> MAIN.post(() -> {
            ready = result == TextToSpeech.SUCCESS;
            if (!ready) {
                status = "System TTS initialization failed; using Waze voice";
                for (String id : JOBS.keySet().toArray(new String[0])) finish(id, false);
                engine.shutdown(); engine = null;
                return;
            }
            engine.setOnUtteranceProgressListener(new UtteranceProgressListener() {
                public void onStart(String id) {}
                public void onDone(String id) { MAIN.post(() -> finish(id, true)); }
                public void onError(String id) { MAIN.post(() -> finish(id, false)); }
            });
            status = "Ready: " + engine.getDefaultEngine();
            for (Pending job : JOBS.values().toArray(new Pending[0])) synthesize(job);
        }));
    }

    private static void synthesize(Pending pending) {
        if (pending.started) return;
        pending.started = true;
        if (engine.synthesizeToFile(pending.text, null, pending.file, pending.id) == TextToSpeech.ERROR) finish(pending.id, false);
    }

    private static void finish(String id, boolean success) {
        Pending pending = JOBS.remove(id);
        if (pending == null) return;
        if (pending.generation != generation) { pending.file.delete(); return; }
        try {
            Class<?> callbackType = Class.forName("h.g.a.a");
            if (success && enabled() && pending.file.length() > 44) {
                Method method = pending.player.getClass().getMethod("c", String.class, String.class,
                        boolean.class, boolean.class, callbackType);
                BYPASS.set(true);
                try {
                    method.invoke(pending.player, pending.file.getAbsolutePath(),
                            pending.kind == 1 ? pending.key : null,
                            pending.ignoreMute, pending.ignoreHardMute, pending.callback);
                } finally { BYPASS.remove(); }
                status = (pending.kind == 0 ? "Navigation" : "Prompt / alert") + " audio replaced using " + engine.getDefaultEngine();
                MAIN.postDelayed(() -> pending.file.delete(), 300000);
            } else {
                status = "System synthesis failed or timed out; using Waze voice";
                original(pending, callbackType);
            }
        } catch (Exception error) {
            status = "Playback integration error: " + error.getClass().getSimpleName();
            Log.e("WazeSystemTTS", status, error);
            try { original(pending, Class.forName("h.g.a.a")); }
            catch (Exception failure) { Log.e("WazeSystemTTS", "Original playback also failed", failure); }
        }
    }

    private static void original(Pending pending, Class<?> callbackType) throws Exception {
        BYPASS.set(true);
        try {
            if (pending.kind == 0) {
                pending.player.getClass().getMethod("g", String.class, String.class, callbackType)
                        .invoke(pending.player, pending.url, pending.key, pending.callback);
            } else if (pending.kind == 1) {
                pending.player.getClass().getMethod("c", String.class, String.class, boolean.class, boolean.class, callbackType)
                        .invoke(pending.player, pending.url, pending.key, pending.ignoreMute, pending.ignoreHardMute, pending.callback);
            } else {
                pending.manager.getClass().getMethod("play", String.class, boolean.class)
                        .invoke(pending.manager, pending.url, pending.ignoreHardMute);
            }
        } finally { BYPASS.remove(); pending.file.delete(); }
    }

    public static void cancel() {
        MAIN.post(() -> {
            generation++;
            if (engine != null) engine.stop();
            for (Pending pending : JOBS.values()) pending.file.delete();
            JOBS.clear();
        });
    }

    public static void addSettingsPage(Object fragment) {
        // The real SettingsPageFragment rebuilds its rows in x(). Run after that
        // rebuild, and bind the button to its view rather than the host activity.
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
                    Log.e("WazeSystemTTS", "Settings row container not found");
                    return;
                }
                LinearLayout content = (LinearLayout) target;
                if (content.findViewWithTag("system_tts_button") != null) return;
                Button button = new Button(activity);
                button.setTag("system_tts_button");
                button.setText("Android system TTS");
                button.setAllCaps(false);
                content.addView(button, Math.min(1, content.getChildCount()),
                        new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
                button.setOnClickListener(v -> showSettings(activity));
            } catch (Exception error) {
                Log.e("WazeSystemTTS", "Cannot add settings row", error);
            }
        });
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

    private static void showSettings(Activity activity) {
        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        int padding = (int) (20 * activity.getResources().getDisplayMetrics().density);
        content.setPadding(padding, padding, padding, padding);
        TextView instructions = new TextView(activity);
        instructions.setText("Required: in Voice & sound → Waze voice, select a voice marked “Including street names”. Keep that voice selected so Waze supplies full navigation text. Android system TTS replaces its spoken audio.");
        content.addView(instructions);
        CheckBox toggle = new CheckBox(activity);
        toggle.setText("Use system voice for navigation and alerts");
        toggle.setChecked(enabled());
        toggle.setOnCheckedChangeListener((button, checked) -> {
            context.getSharedPreferences("system_tts", 0).edit().putBoolean("enabled", checked).apply();
            cancel();
        });
        content.addView(toggle);
        Button customize = new Button(activity);
        customize.setText("Customize alert text");
        customize.setOnClickListener(v -> {
            try { AlertTextSettings.show(activity, catalog()); }
            catch (Exception error) {
                new AlertDialog.Builder(activity).setMessage("Unable to load Waze alert phrases.")
                        .setPositiveButton("OK", null).show();
            }
        });
        content.addView(customize);
        Button test = new Button(activity);
        test.setText("Test / status");
        test.setOnClickListener(v -> {
                        ensureEngine();
                        MAIN.postDelayed(() -> {
                            if (activity.isFinishing() || activity.isDestroyed()) return;
                            if (ready) engine.speak("In two hundred metres, turn left onto George Street.",
                                    TextToSpeech.QUEUE_FLUSH, null, "test");
                            new AlertDialog.Builder(activity).setTitle("System TTS status")
                                    .setMessage(status + "\nLast unmatched file (may be a sound effect): " + lastUnmatched)
                                    .setPositiveButton("OK", null).show();
                        }, 1500);
                    });
        content.addView(test);
        Button settings = new Button(activity);
        settings.setText("Android TTS settings");
        settings.setOnClickListener(v -> {
                        try { activity.startActivity(new Intent("com.android.settings.TTS_SETTINGS")); }
                        catch (Exception error) { status = "Open Text-to-speech in Android settings manually"; }
                    });
        content.addView(settings);
        ScrollView scroll = new ScrollView(activity);
        scroll.addView(content);
        new AlertDialog.Builder(activity).setTitle("Android system TTS").setView(scroll)
                .setNegativeButton("Close", null).show();
    }

    private static final class Pending {
        final String id = "waze-system-" + IDS.incrementAndGet();
        final Object player, callback, manager;
        final String url, key, text;
        final int generation;
        final int kind;
        final boolean ignoreMute, ignoreHardMute;
        final File file;
        boolean started;
        Pending(Object player, String url, String key, Object callback, String text, int generation,
                int kind, boolean ignoreMute, boolean ignoreHardMute, Object manager) {
            this.player = player; this.url = url; this.key = key; this.callback = callback;
            this.text = text; this.generation = generation;
            this.kind = kind; this.ignoreMute = ignoreMute; this.ignoreHardMute = ignoreHardMute; this.manager = manager;
            file = new File(context.getCacheDir(), id + ".wav");
        }
    }
}
