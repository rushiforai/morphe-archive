package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * Hides optional left-drawer sections. Account, My profile, Settings and the subreddit list are not listed.
 */
public final class Sidebar {
    private static final String KEY = "sidebar_hidden";
    private static String shown;

    public static void refresh(Activity activity) {
        try {
            List<String> names = new ArrayList<>(hidden(activity));
            Collections.sort(names);
            String now = names.toString();
            if (now.equals(shown)) return;
            Object service = Class.forName("ua.b").getMethod("A").invoke(null);
            List<?> list = (List<?>) service.getClass().getMethod("z").invoke(service);
            int id = activity.getResources().getIdentifier(
                    "home_left_drawer_recycler_view", "id", activity.getPackageName());
            android.view.View view = activity.findViewById(id);
            if (view == null || !view.getClass().getName().contains("RecyclerView")) return;
            Object adapter = view.getClass().getMethod("getAdapter").invoke(view);
            if (adapter == null) return;
            adapter.getClass().getMethod("T1", List.class).invoke(adapter, list);
            shown = now;
            Log.i("Sidebar", "showing " + now);
        } catch (Throwable t) {
            Log.w("Sidebar", "refresh failed", t);
        }
    }

    private static final String[][] ENTRIES = {
            {"mail", "Mail"},
            {"chat", "Chat"},
            {"go_to", "Go to"},
            {"favorites", "Favorites"},
            {"following_users", "Followed users"},
            {"multireddits", "Multireddits"},
            {"original_content", "Original content"},
            {"share_joey", "Share Joey"},
            {"remove_ad", "Remove ads"},
            {"report_bug", "Report a bug"},
    };

    private Sidebar() {
    }

    public static void apply(List<?> items) {
        if (items == null || items.isEmpty()) return;
        try {
            Set<String> hidden = hidden(context());
            if (hidden.isEmpty()) return;
            Iterator<?> it = items.iterator();
            while (it.hasNext()) {
                String key = key(it.next());
                if (key != null && hidden.contains(key)) it.remove();
            }
        } catch (Throwable ignored) {
        }
    }

    static void show(Activity activity) {
        LinearLayout page = MorpheDialog.page(activity, "Sidebar",
                "Untick an entry to hide it. Go to includes bookmarks. Apply and restart for the sidebar to update. Account, My profile, Settings and the subreddit list stay.");
        Set<String> hidden = new HashSet<>(hidden(activity));
        java.util.List<View> cells = new java.util.ArrayList<>();
        for (String[] entry : ENTRIES) {
            CheckBox box = MorpheDialog.check(activity, entry[1], !hidden.contains(entry[0]), null);
            box.setOnCheckedChangeListener((CompoundButton view, boolean checked) -> {
                if (checked) hidden.remove(entry[0]);
                else hidden.add(entry[0]);
                activity.getSharedPreferences("mighty_morphing", Context.MODE_PRIVATE)
                        .edit()
                        .putStringSet(KEY, new HashSet<>(hidden))
                        .commit();
            });
            cells.add(box);
        }
        LinearLayout rows = new LinearLayout(activity);
        rows.setOrientation(LinearLayout.VERTICAL);
        MorpheDialog.addGrid(rows, cells);
        page.addView(MorpheDialog.scroller(activity, rows));
        TextView done = MorpheDialog.action(activity, "Done", MorpheDialog.SUB);
        TextView apply = MorpheDialog.action(activity, "Apply and restart", MorpheDialog.GOLD);
        page.addView(MorpheDialog.actions(activity, done, apply));
        AlertDialog dialog = MorpheDialog.show(activity, page);
        done.setOnClickListener(v -> dialog.dismiss());
        apply.setOnClickListener(v -> restart(activity));
    }

    private static void restart(Activity activity) {
        android.content.Intent launch = activity.getPackageManager().getLaunchIntentForPackage(activity.getPackageName());
        if (launch != null) {
            launch.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK | android.content.Intent.FLAG_ACTIVITY_CLEAR_TASK);
            activity.startActivity(launch);
        }
        activity.finishAffinity();
        android.os.Process.killProcess(android.os.Process.myPid());
    }

    private static String key(Object item) {
        if (item == null) return null;
        String type = item.getClass().getName();
        if ("va.d".equals(type) || "va.e".equals(type)) return enumName(item);
        return null;
    }

    private static String enumName(Object item) {
        try {
            Field field = item.getClass().getDeclaredField("i");
            field.setAccessible(true);
            Object value = field.get(item);
            if (value instanceof Enum) return ((Enum<?>) value).name();
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static Context context() {
        try {
            Object app = Class.forName("o.o.joey.MyApplication").getMethod("p").invoke(null);
            if (app instanceof Context) return (Context) app;
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static Set<String> hidden(Context context) {
        if (context == null) return new HashSet<>();
        Set<String> stored = context.getSharedPreferences("mighty_morphing", Context.MODE_PRIVATE)
                .getStringSet(KEY, null);
        return stored == null ? new HashSet<>() : stored;
    }
}
