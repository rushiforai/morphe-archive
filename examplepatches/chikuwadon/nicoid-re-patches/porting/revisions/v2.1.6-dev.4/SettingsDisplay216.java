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
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.ListView;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Display-only summaries. Never changes entry values, defaults or stored preferences. */
public final class SettingsDisplay216 {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<PreferenceActivity, Listener> LISTENERS = new WeakHashMap<>();

    private SettingsDisplay216() {}

    private static String tr(Context context, String ja, String en, String zh) {
        String language = PreferenceManager.getDefaultSharedPreferences(context).getString("app_lang", "-1");
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
            case "main_rotation": return tr(c,
                    "通常画面の向きと変更方法を設定します",
                    "Choose the orientation and rotation behavior of the main screen",
                    "設定主畫面的方向及旋轉方式");
            case "player_rotation": return tr(c,
                    "動画再生画面の向きと変更方法を設定します",
                    "Choose the orientation and rotation behavior of the playback screen",
                    "設定影片播放畫面的方向及旋轉方式");
            case "video_menu_options":
            case "video_menu_visible_items":
                return tr(c,
                    "長押し・三角メニューの表示項目と順番を変更します",
                    "Change the items and their order in the long-press and triangle menus",
                    "變更長按及三角形選單顯示的項目與順序");
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
        String key = list.getKey();
        // The fullscreen option is virtual: the original native choice is
        // intentionally stored as regular playback, while a separate flag
        // selects fullscreen. Do not overwrite the ListPreference's virtual
        // value with the native SharedPreferences value.
        if ("videolist_tap".equals(key) || "intent_type".equals(key)) {
            String flag = "videolist_tap".equals(key)
                    ? "nicoid_fullscreen_tap262" : "nicoid_fullscreen_link262";
            if (saved.getBoolean(flag, false)
                    || "nicoid_fullscreen262".equals(list.getValue())) {
                return tr(list.getContext(), "全画面再生", "Fullscreen playback", "全螢幕播放");
            }
        }
        String value = list.getValue();
        if (list.isPersistent()) {
            Object stored = saved.getAll().get(key);
            if (stored instanceof String) value = (String) stored;
        }
        if (value != null) {
            int index = list.findIndexOfValue(value);
            CharSequence[] entries = list.getEntries();
            if (index >= 0 && entries != null && index < entries.length
                    && entries[index] != null) return entries[index].toString();
        }
        CharSequence fallback = list.getEntry();
        return fallback == null ? "" : fallback.toString();
    }

    private static String current(SharedPreferences saved, Preference preference) {
        String key = preference.getKey();
        if (preference instanceof ListPreference)
            return entry(saved, (ListPreference)preference);
        if ("default_playback_speed".equals(key)) {
            float speed;
            try {
                speed = Float.parseFloat(saved.getString(key, "1.0"));
            } catch (RuntimeException invalid) {
                speed = 1.0f;
            }
            if (Float.isNaN(speed) || Float.isInfinite(speed)) speed = 1.0f;
            float selected = Math.max(0.1f, Math.min(3.0f, Math.round(speed * 20.0f) / 20.0f));
            String format = Math.round(selected * 100.0f) % 10 == 0 ? "%.1f×" : "%.2f×";
            return String.format(java.util.Locale.ROOT, format, selected);
        }
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
            String key = pref.getKey();
            boolean menu = "video_menu_options".equals(key)
                    || "video_menu_visible_items".equals(key);
            String choice = menu ? "" : current(saved, pref);
            String separator = tr(a, "：", ": ", "：");
            String summary = choice.isEmpty() ? description : choice + separator + description;
            // Never call setSummary on an unchanged preference: this runs
            // before a draw, and re-invalidating an identical row can loop.
            CharSequence old = pref.getSummary();
            if (old == null || !summary.contentEquals(old))
                pref.setSummary(summary);
        }
        if (pref instanceof PreferenceGroup) {
            PreferenceGroup group = (PreferenceGroup) pref;
            for (int i = 0; i < group.getPreferenceCount(); i++)
                visit(a, group.getPreference(i), saved);
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
        if (previous != null) previous.close(saved);
        Listener listener = new Listener(a);
        saved.registerOnSharedPreferenceChangeListener(listener);
        LISTENERS.put(a, listener);
        listener.attach();
        refresh(a);
    }

    private static final class Listener
            implements SharedPreferences.OnSharedPreferenceChangeListener,
                       ViewTreeObserver.OnPreDrawListener {
        private final WeakReference<PreferenceActivity> activity;
        private final WeakReference<ListView> list;
        private final WeakReference<ViewTreeObserver> observer;

        Listener(PreferenceActivity a) {
            activity = new WeakReference<>(a);
            ListView view = a.getListView();
            list = new WeakReference<>(view);
            observer = new WeakReference<>(view == null ? null : view.getViewTreeObserver());
        }

        void attach() {
            ViewTreeObserver tree = observer.get();
            if (tree != null && tree.isAlive()) tree.addOnPreDrawListener(this);
        }

        void close(SharedPreferences saved) {
            saved.unregisterOnSharedPreferenceChangeListener(this);
            ViewTreeObserver tree = observer.get();
            if (tree != null && tree.isAlive()) tree.removeOnPreDrawListener(this);
        }

        @Override public boolean onPreDraw() {
            PreferenceActivity a = activity.get();
            if (valid(a)) refresh(a);
            return true;
        }

        @Override public void onSharedPreferenceChanged(SharedPreferences saved, String key) {
            MAIN.post(() -> {
                PreferenceActivity a = activity.get();
                if (valid(a)) refresh(a);
                else close(saved);
            });
        }
    }
}
