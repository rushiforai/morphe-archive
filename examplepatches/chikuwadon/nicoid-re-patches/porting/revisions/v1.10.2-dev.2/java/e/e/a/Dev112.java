package e.e.a;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.preference.CheckBoxPreference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.widget.ListView;
import android.os.Handler;
import android.os.Looper;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.function.Consumer;
import org.json.JSONArray;
import org.json.JSONObject;

/** Conservative dev-only hooks for vertical gestures, back navigation and local playlists. */
public final class Dev112 {
    static final String CONFIRM_EXIT = "nicoid_confirm_exit";
    private static final Map<Object, Float> VERTICAL_TURN = new WeakHashMap<>();
    private Dev112() {}

    static Field field(Class<?> type, String name) throws Exception {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try { Field f = c.getDeclaredField(name); f.setAccessible(true); return f; }
            catch (NoSuchFieldException ignored) {}
        }
        throw new NoSuchFieldException(name);
    }
    static Object get(Object object, String name) throws Exception {
        return field(object.getClass(), name).get(object);
    }
    static Object staticCall(String className, String name, Class<?>[] args, Object... values) throws Exception {
        Method m = Class.forName(className).getDeclaredMethod(name, args);
        m.setAccessible(true);
        return m.invoke(null, values);
    }
    static String tr(Context c, String ja, String en, String zh) {
        String lang = PreferenceManager.getDefaultSharedPreferences(c).getString("app_lang", "0");
        if ("-1".equals(lang)) lang = java.util.Locale.getDefault().getLanguage();
        return "1".equals(lang) || "en".equals(lang) ? en : "2".equals(lang) || "zh".equals(lang) ? zh : ja;
    }
    static AlertDialog.Builder builder(Activity a) {
        try { return (AlertDialog.Builder)staticCall("e.e.a.UiDialogs", "builder", new Class<?>[]{Context.class}, a); }
        catch (Exception ignored) { return new AlertDialog.Builder(a); }
    }
    static void show(AlertDialog d) {
        try { staticCall("e.e.a.UiDialogs", "show", new Class<?>[]{AlertDialog.class}, d); }
        catch (Exception ignored) { d.show(); }
    }

    /** Requiring extra movement *after* a second vertical stroke prevents a small scroll wobble from claiming a gesture. */
    public static boolean verticalTurnReady(Object state, MotionEvent event, float density) {
        try {
            Object rules = get(state, "rules");
            String p = (String)get(rules, "pattern");
            if (p == null || p.length() != 2 || (p.charAt(0) != 'U' && p.charAt(0) != 'D')
                    || (p.charAt(1) != 'U' && p.charAt(1) != 'D')) {
                VERTICAL_TURN.remove(state);
                return true;
            }
            float y = event.getRawY() / Math.max(0.5f, density);
            Float start = VERTICAL_TURN.get(state);
            if (start == null) { VERTICAL_TURN.put(state, y); return false; }
            float base = ((Number)get(rules, "distance")).floatValue();
            if (Math.abs(y - start) < Math.max(20f, base * 0.85f)) return false;
            VERTICAL_TURN.remove(state);
            return true;
        } catch (Exception error) {
            android.util.Log.w("nicoid-gesture", "Vertical threshold fallback", error);
            return true;
        }
    }

    /** Wait for real adapter data rather than silently clamping saved positions to the last partial page. */
    public static void restoreList(ListView list, int index, int top) {
        if (list == null || index < 0) return;
        final java.lang.ref.WeakReference<ListView> weak = new java.lang.ref.WeakReference<>(list);
        Handler main = new Handler(Looper.getMainLooper());
        main.post(new Runnable() {
            int attempts;
            public void run() {
                ListView target = weak.get();
                if (target == null || ++attempts > 90) return;
                int count = target.getCount();
                if (count > index && target.getHeight() > 0) {
                    target.setSelectionFromTop(index, top);
                    return;
                }
                main.postDelayed(this, attempts < 15 ? 150 : 300);
            }
        });
    }

    public static void exitSettings(PreferenceActivity a) {
        android.preference.Preference candidate = a.findPreference("setting_whole");
        if (!(candidate instanceof PreferenceGroup)) return;
        PreferenceGroup general = (PreferenceGroup)candidate;
        if (general == null || a.findPreference(CONFIRM_EXIT) != null) return;
        CheckBoxPreference choice = new CheckBoxPreference(a);
        choice.setKey(CONFIRM_EXIT);
        choice.setTitle(tr(a, "アプリ終了時に確認する", "Confirm before exiting app", "退出應用程式時確認"));
        choice.setSummary(tr(a, "戻るキーでアプリを終了する際に確認ダイアログを表示します。",
                "Show a confirmation dialog when Back exits the app.", "返回鍵退出應用程式時顯示確認對話框。"));
        choice.setDefaultValue(false);
        general.addPreference(choice);
    }

    /** Do not pop other Activities merely because an unrelated tab was used previously. */
    public static boolean back(Activity a) {
        if (a == null || a.isFinishing() || a.isDestroyed()) return false;
        try {
            if (!Boolean.TRUE.equals(staticCall("e.e.a.MultiTabs227", "enabled", new Class<?>[]{}))) return false;
            if (!Boolean.TRUE.equals(staticCall("e.e.a.TabRoutes228", "supported", new Class<?>[]{Activity.class}, a))) return false;
            boolean playlist = a.getIntent().getBooleanExtra("nicoid_local_playlists", false);
            if (playlist && Boolean.TRUE.equals(staticCall("e.e.a.LocalPlaylists", "back", new Class<?>[]{Activity.class}, a)))
                return true;
            if (!PreferenceManager.getDefaultSharedPreferences(a).getBoolean(CONFIRM_EXIT, false)) {
                exit(a);
                return true;
            }
            AlertDialog dialog = builder(a)
                    .setTitle(tr(a, "アプリを終了しますか？", "Exit the app?", "要退出應用程式嗎？"))
                    .setNegativeButton(tr(a, "キャンセル", "Cancel", "取消"), null)
                    .setPositiveButton(tr(a, "終了", "Exit", "退出"), (d, w) -> exit(a)).create();
            show(dialog);
            return true;
        } catch (Exception ex) {
            android.util.Log.w("nicoid-tabs", "Back routing fallback", ex);
            return false;
        }
    }
    static void exit(Activity a) {
        if (a.isFinishing()) return;
        try { a.finishAffinity(); } catch (RuntimeException error) { a.finish(); }
    }

    /** Custom long-press action uses the existing native action model for both popup and standard dialogs. */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void playlistMenu(Activity a, Object videoRow, Menu menu, List actions, int order) {
        if (a == null || !a.getIntent().getBooleanExtra("nicoid_local_playlists", false)) return;
        try {
            Object page = page(a);
            if (page == null || get(page, "folder") == null) return;  // Folder entries, not root catalog.
            String uri = value(videoRow, "videourl");
            JSONObject video = findVideo(page, uri);
            if (video == null) return;
            String id = video.optString("id", "");
            if (id.isEmpty()) return;
            MenuItem item = menu.findItem(18102);
            if (item == null) return;
            String moveText = tr(a,"別のプレイリストに移動", "Move to another playlist", "移至其他播放清單");
            item.setTitle(moveText);
            Runnable move = () -> moveVideo(a, id);
            item.setOnMenuItemClickListener(m -> { move.run(); return true; });
            int index = -1;
            for (int n = 0; n < actions.size(); n++) {
                Object action = actions.get(n);
                if (((Number)get(action, "id")).intValue() == 18102) { index = n; break; }
            }
            if (index < 0) return;
            Constructor<?> ctor = Class.forName("e.e.a.ListActions$Action").getDeclaredConstructor(MenuItem.class, Runnable.class);
            ctor.setAccessible(true);
            actions.set(index, ctor.newInstance(item, move));
            String removeText = tr(a,"プレイリストから削除", "Remove from playlist", "從播放清單移除");
            MenuItem removeItem = menu.add(0, 18105, order + 1, removeText);
            Runnable remove = () -> confirmRemove(a, id);
            removeItem.setOnMenuItemClickListener(m -> { remove.run(); return true; });
            actions.add(index + 1, ctor.newInstance(removeItem, remove));
        } catch (Exception error) {
            android.util.Log.w("nicoid-playlist", "Playlist menu customization skipped", error);
        }
    }
    private static Object page(Activity a) throws Exception {
        Class<?> type = Class.forName("e.e.a.LocalPlaylists");
        Map<?,?> map = (Map<?,?>)field(type, "PAGES").get(null);
        return map.get(a);
    }
    private static String value(Object row, String key) throws Exception {
        return String.valueOf(staticCall("e.e.a.ListActions", "value",
                new Class<?>[]{Object.class, String.class}, row, key));
    }
    private static JSONObject findVideo(Object page, String uri) throws Exception {
        List<?> videos = (List<?>)get(page, "visible");
        for (Object obj : videos) if (obj instanceof JSONObject) {
            JSONObject video = (JSONObject)obj;
            if (uri.equals(video.optString("url"))) return video;
        }
        return null;
    }
    private static void confirmRemove(Activity a, String id) {
        show(builder(a).setTitle(tr(a,"プレイリストから削除しますか？", "Remove from playlist?", "要從播放清單移除嗎？"))
                .setMessage(tr(a,"プレイリストの登録のみを削除します。動画やキャッシュは削除されません。",
                        "Only the playlist entry will be removed. The video and cache are kept.",
                        "只移除播放清單項目，影片與快取會保留。"))
                .setNegativeButton(tr(a,"キャンセル", "Cancel", "取消"), null)
                .setPositiveButton(tr(a,"削除", "Remove", "移除"), (dialog, which) -> edit(a, id, null)).create());
    }
    private static void moveVideo(Activity a, String id) {
        try {
            Object page = page(a);
            String from = (String)get(page, "folder");
            Class<?> owner = Class.forName("e.e.a.LocalPlaylists");
            Class<?>[] args = {Context.class, String.class, Consumer.class};
            Method choose = owner.getDeclaredMethod("choose", args);
            choose.setAccessible(true);
            choose.invoke(null, a, from, (Consumer<String>)(to -> {
                if (to != null && !to.equals(from)) edit(a, id, to);
            }));
        } catch (Exception error) {
            android.util.Log.w("nicoid-playlist", "Playlist move dialog failed", error);
        }
    }
    /** One serialized, atomic edit. Move deletes a target duplicate and removes the source entry. */
    private static void edit(Activity a, String id, String to) {
        try {
            Class<?> owner = Class.forName("e.e.a.LocalPlaylists");
            Class<?> editType = Class.forName("e.e.a.LocalPlaylists$Edit");
            Object edit = Proxy.newProxyInstance(editType.getClassLoader(), new Class<?>[]{editType},
                    (proxy, method, args) -> {
                        if (method.getDeclaringClass() == Object.class) return method.invoke(thisObject(), args);
                        if (args != null && args.length == 1) {
                            Object model = args[0];
                            Set<String> ids = Collections.singleton(id);
                            if (to == null) model.getClass().getMethod("delete", Set.class).invoke(model, ids);
                            else model.getClass().getMethod("move", Set.class, String.class).invoke(model, ids, to);
                        }
                        return null;
                    });
            Method change = owner.getDeclaredMethod("change", Context.class, editType, Consumer.class);
            change.setAccessible(true);
            change.invoke(null, a, edit, (Consumer<Boolean>)(ok -> {
                if (!Boolean.TRUE.equals(ok)) return;
                try { owner.getMethod("show", Context.class).invoke(null, a); }
                catch (Exception ignored) { }
            }));
        } catch (Exception error) {
            android.util.Log.w("nicoid-playlist", "Playlist edit failed", error);
        }
    }
    private static Object thisObject() { return new Object(); }
}
