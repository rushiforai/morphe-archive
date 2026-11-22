package e.e.a;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Display-only summaries. Never changes entry values, defaults or stored preferences. */
public final class SettingsDisplay216 {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<PreferenceActivity, Listener> LISTENERS = new WeakHashMap<>();
    private static final WeakHashMap<Preference, Boolean> WRAPPED = new WeakHashMap<>();

    private SettingsDisplay216() {}

    private static String tr(Context context, String ja, String en, String zh) {
        String language = PreferenceManager.getDefaultSharedPreferences(context).getString("app_lang", "0");
        if ("1".equals(language)) return en;
        if ("2".equals(language)) return zh;
        if ("-1".equals(language)) {
            String system = java.util.Locale.getDefault().getLanguage();
            return "zh".equals(system) ? zh : "ja".equals(system) ? ja : en;
        }
        return ja;
    }

    private static String description(Preference pref) {
        String key = pref.getKey();
        if (key == null) return null;
        String title = pref.getTitle() == null ? "" : pref.getTitle().toString();
        Context c = pref.getContext();
        switch (key) {
            case "videolist_tap": return tr(c,
                    "動画一覧をタップしたときの操作を設定します",
                    "Choose what happens when a video in a list is tapped",
                    "設定點選影片清單項目時的操作");
            case "intent_type": return tr(c,
                    "外部リンクから動画を開くときの再生方法を設定します",
                    "Choose how videos opened from external links are played",
                    "設定從外部連結開啟影片時的播放方式");
            case "quality_mode": return tr(c,
                    "動画を再生するときの画質を設定します",
                    "Choose video quality during playback",
                    "設定影片播放時的畫質");
            case "mobile_quality_mode": return tr(c,
                    "モバイル通信で動画を再生するときの画質を設定します",
                    "Choose video quality when using mobile data",
                    "設定使用行動數據播放影片時的畫質");
            case "default_playback_speed": return tr(c,
                    "動画再生時に適用する初期速度を設定します",
                    "Choose the default speed when a video starts playing",
                    "設定影片開始播放時使用的預設速度");
            case "show_watch_progress": return tr(c,
                    "サムネイルに視聴済みの位置を表示するか設定します",
                    "Choose whether to show watch progress on thumbnails",
                    "設定是否在縮圖上顯示觀看進度");
            case "startup_screen": return tr(c,
                    "アプリ起動時に表示する画面を設定します",
                    "Choose the screen shown when the app starts",
                    "設定應用程式啟動時顯示的畫面");
            case "local_watch_history_limit": return tr(c,
                    "本体に保存する視聴履歴の最大件数を設定します",
                    "Choose the maximum number of watch-history items saved on this device",
                    "設定此裝置儲存的觀看紀錄筆數上限");
            case "comment_fps": return tr(c,
                    "画面に表示するコメントの描画フレームレートを設定します",
                    "Choose the drawing frame rate for on-screen comments",
                    "設定畫面留言的繪製影格率");
            default:
                if (title.contains("バックグラウンド再生の表示")
                        || title.contains("Background playback display")
                        || title.contains("背景播放") && (title.contains("顯示") || title.contains("显示")))
                    return tr(c,
                        "バックグラウンド再生中の操作部の表示方法を設定します",
                        "Choose how playback controls appear during background playback",
                        "設定背景播放時控制介面的顯示方式");
                return null;
        }
    }

    private static boolean valid(PreferenceActivity a) {
        return a != null && !a.isFinishing() && !a.isDestroyed();
    }

    private static String entry(SharedPreferences saved, ListPreference list) {
        String current = list.getValue();
        String key = list.getKey();
        Object raw = saved.getAll().get(key);
        if (raw instanceof String) current = (String) raw;
        if (current != null) {
            int index = list.findIndexOfValue(current);
            CharSequence[] values = list.getEntries();
            if (index >= 0 && values != null && index < values.length && values[index] != null)
                return values[index].toString();
        }
        CharSequence fallback = list.getEntry();
        return fallback == null ? "" : fallback.toString();
    }

    private static String current(SharedPreferences saved, Preference preference) {
        String key = preference.getKey();
        if (preference instanceof ListPreference)
            return entry(saved, (ListPreference)preference);
        if ("show_watch_progress".equals(key) && preference instanceof CheckBoxPreference) {
            boolean checked = saved.getBoolean(key, ((CheckBoxPreference)preference).isChecked());
            return tr(preference.getContext(), checked ? "ON" : "OFF",
                    checked ? "On" : "Off", checked ? "開啟" : "關閉");
        }
        if ("local_watch_history_limit".equals(key)) {
            int value = saved.getInt(key, 0);
            if (value == 0) return tr(preference.getContext(), "従来の設定", "Original setting", "原始設定");
            if (value < 0) return tr(preference.getContext(), "無制限", "Unlimited", "不設上限");
            return value + tr(preference.getContext(), "件", " entries", " 筆");
        }
        return "";
    }

    private static void visit(PreferenceActivity a, Preference pref, SharedPreferences saved) {
        String description = description(pref);
        if (description != null) {
            String choice = current(saved, pref);
            String separator = tr(a, "：", ": ", "：");
            pref.setSummary((choice.isEmpty() ? "" : choice + separator) + description);
            if (pref instanceof ListPreference && !WRAPPED.containsKey(pref)) {
                ListPreference list = (ListPreference) pref;
                Preference.OnPreferenceChangeListener previous = list.getOnPreferenceChangeListener();
                WRAPPED.put(pref, Boolean.TRUE);
                list.setOnPreferenceChangeListener((changed, selection) -> {
                    boolean accepted = previous == null || previous.onPreferenceChange(changed, selection);
                    if (accepted) {
                        String requested = String.valueOf(selection);
                        if (list.findIndexOfValue(requested) >= 0)
                            list.setValue(requested);
                    }
                    MAIN.post(() -> { if (valid(a)) refresh(a); });
                    return accepted;
                });
            }
        }
        if (pref instanceof PreferenceGroup) {
            PreferenceGroup group = (PreferenceGroup) pref;
            for (int i=0; i<group.getPreferenceCount(); i++) visit(a, group.getPreference(i), saved);
        }
    }

    private static void refresh(PreferenceActivity a) {
        if (!valid(a) || a.getPreferenceScreen() == null) return;
        visit(a, a.getPreferenceScreen(), PreferenceManager.getDefaultSharedPreferences(a));
    }

    public static void install(PreferenceActivity a) {
        if (!valid(a)) return;
        SharedPreferences saved = PreferenceManager.getDefaultSharedPreferences(a);
        Listener previous = LISTENERS.remove(a);
        if (previous != null) saved.unregisterOnSharedPreferenceChangeListener(previous);
        Listener listener = new Listener(a);
        saved.registerOnSharedPreferenceChangeListener(listener);
        LISTENERS.put(a, listener);
        refresh(a);
    }

    private static final class Listener implements SharedPreferences.OnSharedPreferenceChangeListener {
        private final WeakReference<PreferenceActivity> activity;
        Listener(PreferenceActivity a) { activity = new WeakReference<>(a); }
        @Override public void onSharedPreferenceChanged(SharedPreferences saved, String key) {
            MAIN.post(() -> {
                PreferenceActivity a = activity.get();
                if (valid(a)) refresh(a);
                else saved.unregisterOnSharedPreferenceChangeListener(this);
            });
        }
    }
}
