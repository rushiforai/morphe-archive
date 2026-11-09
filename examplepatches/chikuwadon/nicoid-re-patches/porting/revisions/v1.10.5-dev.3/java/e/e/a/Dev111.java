package e.e.a;

import android.app.Activity;
import android.app.Service;
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
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.ScrollView;
import java.lang.ref.Reference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import org.json.JSONObject;

/** Development-only lifecycle and tab fixes; does not modify the published v1.10.1 payload. */
public final class Dev111 {
    private static final String SCROLL = "nicoid_restore_tab_scroll";
    private static final String RESUME = "nicoid_app_resume_playback";
    private static final String SAVED = "nicoid_tab_scroll111_";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Object, Boolean> INITIAL = new WeakHashMap<>();
    private static final Map<Activity, Map<String, Position>> VIEWS = new WeakHashMap<>();
    private static final Map<PreferenceActivity, SharedPreferences.OnSharedPreferenceChangeListener> SETTINGS_LISTENERS = new WeakHashMap<>();
    private static boolean leftApp;

    private Dev111() { }

    private static SharedPreferences prefs(Context c) {
        return PreferenceManager.getDefaultSharedPreferences(c);
    }
    private static int language(Context c) {
        String setting = prefs(c).getString("app_lang", "0");
        if ("-1".equals(setting)) {
            String system = java.util.Locale.getDefault().getLanguage();
            return "zh".equals(system) ? 2 : "ja".equals(system) ? 0 : 1;
        }
        return "2".equals(setting) ? 2 : "1".equals(setting) ? 1 : 0;
    }
    private static String tr(Context c, String ja, String en, String zh) {
        int lang = language(c);
        return lang == 2 ? zh : lang == 1 ? en : ja;
    }
    private static Field field(Class<?> type, String name) throws Exception {
        for (Class<?> cls = type; cls != null; cls = cls.getSuperclass()) {
            try {
                Field f = cls.getDeclaredField(name);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(name);
    }
    private static Object get(Object owner, String name) throws Exception {
        return field(owner.getClass(), name).get(owner);
    }

    /** A confirmed background transition is consumed only when the Service is ready. */
    public static synchronized void left() { leftApp = true; }
    private static int resumeAttempt;
    public static void resumed(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
        synchronized (Dev111.class) { if (!leftApp) return; }
        SharedPreferences settings = prefs(activity);
        if (!"background".equals(settings.getString("app_switch_playback", "none"))
                || !"normal".equals(settings.getString(RESUME, "background"))) {
            synchronized (Dev111.class) { leftApp = false; resumeAttempt = 0; }
            return;
        }
        if ("com.sauzask.nicoid.NicoidVideoActivity".equals(activity.getClass().getName())) return;
        // AppSwitchGuard may resume a list before its retained background Service
        // becomes ready. Keep the intent alive until the Service is available.
        final java.lang.ref.WeakReference<Activity> target = new java.lang.ref.WeakReference<>(activity);
        resumeCheck(target);
    }
    private static void resumeCheck(java.lang.ref.WeakReference<Activity> target) {
        Activity activity = target.get();
        if (activity == null || activity.isDestroyed() || activity.isFinishing()) return;
        synchronized (Dev111.class) { if (!leftApp) return; }
        try {
            Class<?> ownerClass = Class.forName("e.e.a.PlaybackReturn");
            Reference<?> active = (Reference<?>) field(ownerClass, "active").get(null);
            Object service = active == null ? null : active.get();
            boolean ready = service instanceof Service;
            if (ready) {
                String video = String.valueOf(get(service, "f"));
                ready = video.matches("(?:sm|nm|so|ss)?[0-9]+")
                        && field(service.getClass(), "o0").getBoolean(null)
                        && field(service.getClass(), "p0").getBoolean(null);
            }
            if (ready) {
                synchronized (Dev111.class) { leftApp = false; resumeAttempt = 0; }
                Dev115.seamlessReturn(service);
                return;
            }
        } catch (Exception error) {
            android.util.Log.w("nicoid-return", "Waiting for stable background player", error);
        }
        int count;
        synchronized (Dev111.class) { count = ++resumeAttempt; if (count >= 20) { leftApp = false; resumeAttempt = 0; } }
        if (count < 20) MAIN.postDelayed(() -> resumeCheck(target), 150);
    }

    public static void settings(PreferenceActivity activity) {
        Preference groupItem = activity.findPreference("setting_whole");
        if (!(groupItem instanceof PreferenceGroup)) return;
        PreferenceGroup group = (PreferenceGroup) groupItem;
        if (activity.findPreference(SCROLL) == null) {
            CheckBoxPreference p = new CheckBoxPreference(activity);
            p.setKey(SCROLL);
            p.setTitle(tr(activity,"タブのスクロール位置を復元","Restore tab scroll positions","還原分頁捲動位置"));
            p.setSummary(tr(activity, "アプリ再起動後も各タブのスクロール位置を復元します。",
                    "Restore tab scroll positions after relaunching the app.","重新啟動應用程式後還原分頁的捲動位置。"));
            p.setDefaultValue(Boolean.TRUE);
            group.addPreference(p);
        }
        if (activity.findPreference(RESUME) == null) {
            ListPreference p = new ListPreference(activity);
            p.setKey(RESUME);
            p.setTitle(tr(activity,"アプリ復帰時の動作","When returning to the app","返回應用程式時的動作"));
            p.setEntries(new CharSequence[]{
                tr(activity,"バックグラウンド再生を継続","Keep background playback","繼續背景播放"),
                tr(activity,"通常再生に戻る","Return to normal playback","返回一般播放")});
            p.setEntryValues(new CharSequence[]{"background","normal"});
            p.setDefaultValue("background");
            group.addPreference(p);
        }
        Dev112.exitSettings(activity);
        StorageDiagnostics112.install(activity);
        LegacyCacheCleanup113.install(activity);
        Dev115.cacheSettings(activity);
        Dev116.settings(activity);
        Dev119.installSettings(activity);
        final Preference returnPreference = activity.findPreference(RESUME);
        final SharedPreferences shared = prefs(activity);
        updateSummaries(activity);
        if (returnPreference instanceof ListPreference) {
            ((ListPreference)returnPreference).setOnPreferenceChangeListener((preference, newValue) -> {
                int index = ((ListPreference)preference).findIndexOfValue(String.valueOf(newValue));
                if (index >= 0) preference.setSummary(((ListPreference)preference).getEntries()[index]);
                return true;
            });
        }
        SharedPreferences.OnSharedPreferenceChangeListener previous = SETTINGS_LISTENERS.remove(activity);
        if (previous != null) shared.unregisterOnSharedPreferenceChangeListener(previous);
        java.lang.ref.WeakReference<PreferenceActivity> weak = new java.lang.ref.WeakReference<>(activity);
        SharedPreferences.OnSharedPreferenceChangeListener listener = (preferences, key) -> {
            if (!RESUME.equals(key) && !"app_switch_playback".equals(key) && !"custom_palette_enabled".equals(key)) return;
            MAIN.post(() -> {
                PreferenceActivity current = weak.get();
                if (current != null && !current.isFinishing() && !current.isDestroyed()) {
                    updateSummaries(current);
                }
            });
        };
        shared.registerOnSharedPreferenceChangeListener(listener);
        SETTINGS_LISTENERS.put(activity, listener);
        // Reorder all direct siblings once, after the other setting installers.
        String[] desired={
            "app_theme", "custom_palette", "multiple_video_tabs", "startup_screen",
            "list_gestures_enabled", "videolist_tap", "intent_type", "app_switch_playback",
            RESUME, "back_playback", Dev119.KEY, Dev112.CONFIRM_EXIT,
            "tab_swipe_animation", "tab_switch_animation", "tab_animation_enabled",
            SCROLL, "show_watch_progress", "video_menu_options", "main_rotation",
            "player_rotation", "display_mode", "play_mode"
        };
        ArrayList<Preference> all = new ArrayList<>();
        for(int i=0;i<group.getPreferenceCount();i++) all.add(group.getPreference(i));
        ArrayList<Preference> sorted = new ArrayList<>();
        for(String key:desired) for(Preference p:all) if(key.equals(p.getKey())&&!sorted.contains(p)) sorted.add(p);
        for(Preference p:all) if(!sorted.contains(p)) sorted.add(p);
        boolean changed=false;
        for(int i=0;i<sorted.size();i++) if(sorted.get(i)!=all.get(i)) {changed=true;break;}
        if(changed) {
            for(Preference p:all) group.removePreference(p);
            for(int i=0;i<sorted.size();i++) {Preference p=sorted.get(i);p.setOrder(i*10);group.addPreference(p);}
        } else for(int i=0;i<sorted.size();i++) sorted.get(i).setOrder(i*10);
    }

    private static void updateSummaries(PreferenceActivity activity) {
        SharedPreferences shared = prefs(activity);
        Preference returnPreference = activity.findPreference(RESUME);
        if (returnPreference instanceof ListPreference) {
            ListPreference list = (ListPreference) returnPreference;
            int index = list.findIndexOfValue(shared.getString(RESUME, "background"));
            if (index >= 0) list.setSummary(list.getEntries()[index]);
            list.setEnabled("background".equals(shared.getString("app_switch_playback", "none")));
        }
        Preference customPreference = activity.findPreference("custom_palette");
        if (customPreference != null) {
            boolean on = shared.getBoolean("custom_palette_enabled", false);
            customPreference.setSummary((on ? "ON" : "OFF") + "：" + tr(activity,
                "アクセントカラーや背景、文字などの色を個別に設定します。",
                "Set accent, background, text and other colors individually.",
                "個別設定強調色、背景、文字等顏色。"));
        }
    }

    /** Keep intra-session tab switching unchanged when restart restoration is disabled. */
    public static void loadedTabs(Object model, Context context) {
        if (model == null || context == null || prefs(context).getBoolean(SCROLL, true)) return;
        try {
            for (Object tab : (Iterable<?>) get(model, "tabs")) {
                field(tab.getClass(), "position").setInt(tab, 0);
                field(tab.getClass(), "top").setInt(tab, 0);
            }
        } catch (Exception error) {
            android.util.Log.w("nicoid-tabs", "Could not clear persisted scroll position", error);
        }
    }

    /** The initial tab already existed before the normal tab-activation callback. */
    public static void initialTab(Object host) {
        if (INITIAL.containsKey(host)) return;
        INITIAL.put(host, Boolean.TRUE);
        try {
            Activity activity = (Activity) get(host, "a");
            if (!prefs(activity).getBoolean(SCROLL, true)) return;
            Object fragment = get(host, "current");
            if (fragment == null) return;
            Class<?> multi = Class.forName("e.e.a.MultiTabs227");
            Method data = multi.getDeclaredMethod("data");
            data.setAccessible(true);
            Object model = data.invoke(null);
            Method find = model.getClass().getDeclaredMethod("find", String.class);
            find.setAccessible(true);
            Object tab = find.invoke(model, (String) get(host, "currentId"));
            if (tab == null || ((Integer) get(tab, "position")) == 0
                    && ((Integer) get(tab, "top")) == 0) return;
            Method restore = host.getClass().getDeclaredMethod("restoreScroll", Object.class, tab.getClass());
            restore.setAccessible(true);
            restore.invoke(host, fragment, tab);
            // Do not clamp to the last currently loaded row; that silently
            // rewrites a deep position while pagination is still in progress.
            final Object view = get(fragment, "b0");
            if (view instanceof ListView)
                Dev112.restoreList((ListView)view, (Integer)get(tab,"position"), (Integer)get(tab,"top"));
        } catch (Exception error) {
            android.util.Log.w("nicoid-tabs", "Initial scroll restoration skipped", error);
        }
    }

    static final class Position {
        int index, top, scroll;
        String folder;
        boolean list;
        String json() {
            JSONObject result = new JSONObject();
            try {
                result.put("index", index).put("top", top).put("scroll", scroll)
                      .put("list", list).put("folder", folder == null ? JSONObject.NULL : folder);
            } catch (Exception ignored) { }
            return result.toString();
        }
        static Position parse(String text) {
            try {
                JSONObject j = new JSONObject(text);
                Position p = new Position();
                p.index = Math.max(0, j.optInt("index"));
                p.top = j.optInt("top");
                p.scroll = Math.max(0, j.optInt("scroll"));
                p.list = j.optBoolean("list");
                p.folder = j.isNull("folder") ? null : j.optString("folder", null);
                return p;
            } catch (Exception ignored) { return null; }
        }
    }
    private static String key(Activity a) {
        String id = a.getIntent().getStringExtra("nicoid_saved_tab_id");
        return id == null || id.length() > 100 ? a.getClass().getName() : id;
    }
    private static View root(Activity a) {
        try {
            Object value = get(a, "y");
            return value instanceof View ? (View) value : null;
        } catch (Exception ignored) { return null; }
    }
    private static <T extends View> T find(View root, Class<T> type) {
        if (root == null) return null;
        if (type.isInstance(root)) return type.cast(root);
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                T child = find(group.getChildAt(i), type);
                if (child != null) return child;
            }
        }
        return null;
    }
    private static Object playlistPage(Activity activity) {
        try {
            Class<?> type = Class.forName("e.e.a.LocalPlaylists");
            Map<?, ?> pages = (Map<?, ?>) field(type, "PAGES").get(null);
            return pages.get(activity);
        } catch (Exception ignored) { return null; }
    }
    private static Position getPosition(Activity activity) {
        Map<String, Position> map = VIEWS.get(activity);
        Position p = map == null ? null : map.get(key(activity));
        if (p == null && prefs(activity).getBoolean(SCROLL, true)) {
            p = Position.parse(prefs(activity).getString(SAVED + key(activity), "{}"));
        }
        return p;
    }

    /** Called before changing the current tab's Intent. */
    public static void capturePage(Activity activity) {
        if (activity == null || activity.isFinishing()) return;
        View content = root(activity);
        if (content == null) return;
        Position p = new Position();
        ListView list = find(content, ListView.class);
        ScrollView scroll = list == null ? find(content, ScrollView.class) : null;
        if (list == null && scroll == null) return;
        if (list != null) {
            p.list = true;
            p.index = list.getFirstVisiblePosition();
            View first = list.getChildAt(0);
            p.top = first == null ? 0 : first.getTop();
        } else p.scroll = scroll.getScrollY();
        if (activity.getIntent().getBooleanExtra("nicoid_local_playlists", false)) {
            Object page = playlistPage(activity);
            try { if (page != null) p.folder = (String) get(page, "folder"); }
            catch (Exception ignored) { }
        }
        Map<String, Position> map = VIEWS.get(activity);
        if (map == null) {
            map = new java.util.HashMap<>();
            VIEWS.put(activity, map);
        }
        map.put(key(activity), p);
        if (prefs(activity).getBoolean(SCROLL, true)) {
            prefs(activity).edit().putString(SAVED + key(activity), p.json()).apply();
        }
    }

    /** Reopen the previously visited playlist folder after a process restart. */
    public static void preparePlaylist(Activity activity) {
        if (!activity.getIntent().getBooleanExtra("nicoid_local_playlists", false)
                || !prefs(activity).getBoolean(SCROLL, true)) return;
        if (activity.getIntent().hasExtra("nicoid_playlist_folder")) return;
        Position p = getPosition(activity);
        if (p != null && p.folder != null) activity.getIntent().putExtra("nicoid_playlist_folder", p.folder);
    }

    public static void enteredPage(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
        boolean playlist = activity.getIntent().getBooleanExtra("nicoid_local_playlists", false);
        if (playlist) {
            // Refresh the same cached playlist page after a different tab modified storage.
            try {
                Class.forName("e.e.a.LocalPlaylists").getMethod("show", Context.class).invoke(null, activity);
            } catch (Exception error) {
                android.util.Log.w("nicoid-playlist", "Cached page refresh skipped", error);
            }
        }
        final Position saved = getPosition(activity);
        final View content = root(activity);
        if (content == null || saved == null) return;
        if (playlist) {
            Object page = playlistPage(activity);
            try {
                String folder = page == null ? null : (String) get(page, "folder");
                if (saved.folder == null ? folder != null : !saved.folder.equals(folder)) return;
            } catch (Exception ignored) { return; }
        }
        final ListView list = find(content, ListView.class);
        final ScrollView scroll = list == null ? find(content, ScrollView.class) : null;
        if (list != null && saved.list) {
            Dev112.restoreList(list, saved.index, saved.top);
        } else if (scroll != null && !saved.list) {
            scroll.post(() -> scroll.scrollTo(0, saved.scroll));
        }
    }

    /** Called on the main thread after a successful serialized playlist commit.
     * The currently visible playlist refreshes even when the write finishes
     * after the user has already switched back from another tab. */
    public static void playlistsChanged() {
        try {
            Class<?> type = Class.forName("e.e.a.LocalPlaylists");
            Map<?, ?> pages = (Map<?, ?>) field(type, "PAGES").get(null);
            ArrayList<Activity> visible = new ArrayList<>();
            for (Object entry : pages.keySet()) {
                if (!(entry instanceof Activity)) continue;
                Activity activity = (Activity) entry;
                if (!activity.isFinishing() && !activity.isDestroyed()
                        && activity.getIntent().getBooleanExtra("nicoid_local_playlists", false)) {
                    visible.add(activity);
                }
            }
            for (Activity activity : visible) {
                capturePage(activity);
                enteredPage(activity);
            }
        } catch (Exception error) {
            android.util.Log.w("nicoid-playlist", "Playlist change notification skipped", error);
        }
    }

    /** Explicitly call after an Activity resumes; also refresh cached playlist Activities. */
    public static void pageResumed(Activity a) {
        enteredPage(a);
    }
}
