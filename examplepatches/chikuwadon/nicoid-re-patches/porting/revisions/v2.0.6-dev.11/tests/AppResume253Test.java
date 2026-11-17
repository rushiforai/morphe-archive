package e.e.a;

import android.app.Service;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Handler;
import android.preference.ListPreference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import com.sauzask.nicoid.NicoidVideoActivity;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public final class AppResume253Test {
    private static final String KEY = "nicoid_app_resume_playback";
    private static final String MODE = "app_switch_playback";
    private static final String FULL = "nicoid_fullscreen262";
    private static final String FLAG = "nicoid_fullscreen_resume262";

    public static final class Player {
        public long getDuration() { return 120000; }
        public boolean isPlaying() { return true; }
    }

    public static final class PlaybackService extends Service {
        public final Player e = new Player();
    }

    private static final class Preferences implements SharedPreferences {
        final Map<String, Object> values = new HashMap<>();
        final List<OnSharedPreferenceChangeListener> listeners = new ArrayList<>();
        public String getString(String key, String fallback) {
            return (String) values.getOrDefault(key, fallback);
        }
        public boolean getBoolean(String key, boolean fallback) {
            return (Boolean) values.getOrDefault(key, fallback);
        }
        public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {
            listeners.add(listener);
        }
        public Editor edit() {
            return new Editor() {
                final Map<String, Object> updates = new HashMap<>();
                public Editor putString(String key, String value) { updates.put(key, value); return this; }
                public Editor putBoolean(String key, boolean value) { updates.put(key, value); return this; }
                public void apply() {
                    values.putAll(updates);
                    for (String key : updates.keySet()) {
                        for (OnSharedPreferenceChangeListener listener : listeners) {
                            listener.onSharedPreferenceChanged(Preferences.this, key);
                        }
                    }
                }
            };
        }
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private static void select(ListPreference row, String value) {
        check(!row.listener.change(row, value), "manual storage must consume native persistence");
        Handler.drain();
    }

    private static void resume(PreferenceActivity activity) {
        AppResume253.left(activity);
        check(AppResume253.resumed(activity), "foreground transition consumed");
        check(!AppResume253.resumed(activity), "transition consumed only once");
        Handler.drain();
    }

    public static void main(String[] args) {
        Preferences stored = new Preferences();
        PreferenceManager.stored = stored;
        PreferenceActivity activity = new PreferenceActivity();
        AppResume253.install(activity);
        ListPreference row = new ListPreference();
        activity.row = row;
        // Simulate the dev.10 broken arrays followed by the late native installer.
        row.labels = new CharSequence[]{"Keep", "Normal"};
        row.codes = new CharSequence[]{"background", "normal", FULL};
        stored.edit().putString(MODE, "background").apply();
        Handler.drain();
        check(row.enabled && row.labels.length == 3 && row.codes.length == 3, "pair all 3 labels and values");
        check(row.labels[2].equals("全画面再生に戻る"), "Japanese label");
        check(row.value.equals("background"), "original default");
        check(!row.persistent, "native preference persistence disabled");

        PlaybackService owner = new PlaybackService();
        PlaybackReturn.active = new java.lang.ref.WeakReference<>(owner);
        for (String mode : new String[]{"background", "popup"}) {
            stored.edit().putString(MODE, mode).apply();
            Handler.drain();
            String keep = mode.equals("background") ? "バックグラウンド再生を継続" : "ポップアップ再生を継続";
            check(row.enabled && row.labels[0].equals(keep), "keep label for " + mode);
            select(row, FULL);
            check(stored.getString(KEY, "").equals("normal") && stored.getBoolean(FLAG, false), "legacy storage");
            activity.row = new ListPreference();
            row = activity.row;
            AppResume253.install(activity);
            check(row.value.equals(FULL) && row.summary.toString().startsWith("全画面再生に戻る"), "reopen setting");

            Dev115.calls = 0;
            Dev115.rejectFirst = true;
            resume(activity);
            check(Dev115.calls == 2, "retry after a rejected launch");
            check(Dev115.returned.getBooleanExtra("isFullScreen", false), "fullscreen Intent");
            check(Dev115.returned.getBooleanExtra("isLandscape", false), "landscape Intent");
            check(Dev115.returned.getBooleanExtra("nicoid_fullscreen_handoff208", false), "native handoff");
            check(!Dev115.returned.getBooleanExtra("nicoid_portrait_restore", true), "no later portrait reset");
            check(!Dev115.unrelated.getBooleanExtra("isFullScreen", false), "other owner unaffected");
            Intent later = new Intent();
            AppResume253.prepareReturn(owner, later);
            check(!later.getBooleanExtra("isFullScreen", false), "manual return unaffected");

            NicoidVideoActivity existing = new NicoidVideoActivity();
            AppResume253.left(existing);
            check(AppResume253.resumed(existing) && PlayerGestures219.fullscreen, "existing player fullscreen");
            check(Dev115.calls == 2, "existing player reused");

            Dev115.rejectFirst = false;
            select(row, "normal");
            check(!stored.getBoolean(FLAG, true), "normal clears fullscreen flag");
            resume(activity);
            check(!Dev115.returned.getBooleanExtra("isFullScreen", false), "normal handoff");
            check(Dev115.returned.getBooleanExtra("nicoid_portrait_restore", false), "keep normal orientation");
            int callsBeforeKeep = Dev115.calls;
            select(row, "background");
            resume(activity);
            check(Dev115.calls == callsBeforeKeep, "keep playback leaves service alone");
        }

        select(row, FULL);
        for (String[] language : new String[][]{
                 {"en", "Return to fullscreen playback"}, {"zh", "返回全螢幕播放"}}) {
            PanelUi.language = language[0];
            stored.edit().putString("app_lang", language[0]).apply();
            Handler.drain();
            check(row.labels[2].equals(language[1]), "localized label");
            check(row.value.equals(FULL) && row.summary.toString().startsWith(language[1]), "localized summary");
        }
        stored.edit().putString(MODE, "none").apply();
        Handler.drain();
        check(!row.enabled, "disable when app-switch playback is disabled");
        System.out.println("PASS: resume choices, persistence, locale, same-player/fullscreen handoff and normal/keep regressions");
    }
}
