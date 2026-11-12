package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.widget.ListView;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;

public final class NicoliveEntry {
    private static final String POPUP_SERVICE = "com.sauzask.nicoid.NicoidPopupViewService";

    private static final String OPEN_LIVE = "menu_nicolive";

    public static String[] gestureActions(String[] existing) {
        for (int index = 0; index < existing.length; index++) {
            if ("menu_shorts".equals(existing[index])) {
                String[] actions = new String[existing.length + 1];
                int insert = index + 1;
                System.arraycopy(existing, 0, actions, 0, insert);
                actions[insert] = OPEN_LIVE;
                System.arraycopy(existing, insert, actions, insert + 1, existing.length - insert);
                return actions;
            }
        }
        throw new IllegalStateException("Missing Shorts gesture");
    }

    public static String gestureName(Context context, String action) {
        if (!OPEN_LIVE.equals(action)) return null;
        return PanelUi.tr(context, "ニコ生を開く", "Open Niconico Live", "開啟 Nico 生放送");
    }

    public static boolean performGesture(Activity activity, String action) {
        if (!OPEN_LIVE.equals(action)) return false;
        activity.startActivity(new Intent(activity, NicoliveActivity.class));
        return true;
    }

    public static void beforeVideo() {
        NicoliveService live = NicoliveService.active;
        if (live == null || live.stopped) return;
        if (Looper.myLooper() == Looper.getMainLooper()) {
            live.stopPlayback();
        } else {
            new Handler(Looper.getMainLooper()).post(live::stopPlayback);
        }
    }

    static void beforeLive(Context context) {
        stopRetainedVideo();
        context.stopService(new Intent().setClassName(context, POPUP_SERVICE));
        try {
            Field field = PlaybackSession.class.getDeclaredField("SESSIONS");
            field.setAccessible(true);
            Object sessions = field.get(null);
            if (sessions instanceof Map) {
                for (Object owner : new ArrayList<>(((Map<?, ?>) sessions).keySet())) {
                    if (owner == null) continue;
                    String videoField = owner.getClass().getName().contains("Popup") ? "e" : "a0";
                    try {
                        Object video = readField(owner, videoField);
                        if (video != null) video.getClass().getMethod("pause").invoke(video);
                    } catch (ReflectiveOperationException failure) {
                        Log.w("Nicolive", "Could not pause the previous video", failure);
                    }
                }
            }
        } catch (ReflectiveOperationException failure) {
            Log.w("Nicolive", "Could not find previous video sessions", failure);
        }
    }

    private static void stopRetainedVideo() {
        // v1.11.1 retains the original decoder independently of the notification service.
        try {
            Class<?> retained = Class.forName("e.e.a.RetainedPlayback137");
            synchronized (retained) {
                Field current = retained.getDeclaredField("current");
                current.setAccessible(true);
                Object session = current.get(null);
                if (session == null) return;
                try {
                    Object player = readField(session, "player");
                    if (player != null) player.getClass().getMethod("pause").invoke(player);
                } finally {
                    Method finish = retained.getDeclaredMethod("finish", current.getType(), boolean.class);
                    finish.setAccessible(true);
                    finish.invoke(null, session, true);
                }
            }
        } catch (ReflectiveOperationException failure) {
            Log.w("Nicolive", "Could not close the retained video session", failure);
        }
    }

    private static Object readField(Object owner, String name) throws ReflectiveOperationException {
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(owner);
            } catch (NoSuchFieldException missing) {
                if (type.getSuperclass() == null) throw missing;
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static final String SHOW_LIVE = "show_nicolive_menu";
    private static final Map<Activity, Boolean> menuState = new WeakHashMap<>();

    private static boolean showLive(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean(SHOW_LIVE, true);
    }

    public static void settings(PreferenceActivity activity, PreferenceGroup other) {
        if (activity == null || other == null) return;
        ThumbnailCorners.settings(activity, other);
        if (Build.VERSION.SDK_INT < 28 || activity.findPreference(SHOW_LIVE) != null) return;
        Preference shorts = other.findPreference("show_shorts_menu");
        int order = shorts == null ? other.getPreferenceCount() : shorts.getOrder() + 1;
        ArrayList<Preference> later = new ArrayList<>();
        for (int index = 0; index < other.getPreferenceCount(); index++) {
            Preference row = other.getPreference(index);
            if (row.getOrder() >= order && row.getOrder() < Integer.MAX_VALUE) later.add(row);
        }
        for (Preference row : later) row.setOrder(row.getOrder() + 1);
        CheckBoxPreference live = new CheckBoxPreference(activity);
        live.setKey(SHOW_LIVE);
        live.setDefaultValue(true);
        live.setOrder(order);
        live.setTitle(PanelUi.tr(activity, "サイドバーにニコ生を表示", "Show Niconico Live in the sidebar", "在側邊選單顯示 Nico 生放送"));
        live.setSummary(PanelUi.tr(activity, "ショートの下にニコ生の入口を表示します",
                "Show the Niconico Live entry below Shorts.", "在短片下方顯示 Nico 生放送入口"));
        other.addPreference(live);
    }

    public static void refreshMenu(Activity activity) {
        Boolean prior = menuState.get(activity);
        if (prior == null || prior == showLive(activity)) return;
        int id = activity.getResources().getIdentifier("menu_listview", "id", activity.getPackageName());
        ListView menu = activity.findViewById(id);
        if (menu == null) return;
        try {
            Class.forName("com.sauzask.nicoid.NicoidTopActivity")
                    .getMethod("a", Context.class, ListView.class).invoke(null, activity, menu);
        } catch (ReflectiveOperationException failure) {
            Log.w("Nicolive", "Could not refresh the sidebar", failure);
        }
    }

    public static void addMenu(Context context, ArrayList<Map<String, Object>> items) {
        if (Build.VERSION.SDK_INT < 28) return;
        boolean visible = showLive(context);
        if (context instanceof Activity) menuState.put((Activity) context, visible);
        items.removeIf(row -> row != null && "nicoid_live".equals(row.get("id")));
        if (!visible) return;
        int position = Math.min(1, items.size());
        for (int index = 0; index < items.size(); index++) {
            Map<String, Object> row = items.get(index);
            if (row == null) continue;
            Object intent = row.get("intent");
            if ("ショート".equals(row.get("title")) || intent instanceof Intent
                    && "nicoid-re://shorts".equals(((Intent) intent).getDataString())) {
                position = index + 1;
                break;
            }
        }
        boolean japanese = NicoliveUi.ja(context);
        Map<String, Object> item = new HashMap<>();
        item.put("title", japanese ? "ニコ生 (β)" : "Niconico Live (β)");
        item.put("subtitle", japanese ? "ニコ生の視聴" : "Watch Niconico Live");
        item.put("islabel", false);
        item.put("type", 0);
        item.put("id", "nicoid_live");
        item.put("intent", new Intent(context, NicoliveActivity.class));
        items.add(position, item);
    }
}
