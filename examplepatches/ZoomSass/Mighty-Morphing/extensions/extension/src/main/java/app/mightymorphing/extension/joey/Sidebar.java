package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.json.JSONArray;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Hides and reorders optional left-drawer sections.
 * Account, My profile, Settings and the subreddit list are never hideable.
 */
public final class Sidebar {
    private static final String PREFS = "mighty_morphing";
    private static final String KEY_HIDDEN = "sidebar_hidden";
    private static final String KEY_ORDER = "sidebar_order";
    private static String shown;

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

    public static void refresh(Activity activity) {
        try {
            List<String> names = new ArrayList<>(hidden(activity));
            Collections.sort(names);
            String now = names.toString() + getOrder(activity).toString();
            if (now.equals(shown)) return;
            Object service = Class.forName("ua.b").getMethod("A").invoke(null);
            List<?> list = (List<?>) service.getClass().getMethod("z").invoke(service);
            int id = activity.getResources().getIdentifier(
                    "home_left_drawer_recycler_view", "id", activity.getPackageName());
            View view = activity.findViewById(id);
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

    public static void apply(List<?> items) {
        if (items == null || items.isEmpty()) return;
        try {
            Context ctx = context();
            Set<String> hidden = hidden(ctx);
            List<String> order = getOrder(ctx);

            // Filter hidden items
            if (!hidden.isEmpty()) {
                Iterator<?> it = items.iterator();
                while (it.hasNext()) {
                    String key = key(it.next());
                    if (key != null && hidden.contains(key)) it.remove();
                }
            }

            // Reorder reorderable items based on user's custom order
            Map<String, Integer> rankByKey = new HashMap<>();
            for (int i = 0; i < order.size(); i++) {
                rankByKey.put(order.get(i), i);
            }

            // Extract items that belong to ENTRIES and reorder them in place
            List<Object> reorderable = new ArrayList<>();
            List<Integer> positions = new ArrayList<>();
            for (int i = 0; i < items.size(); i++) {
                Object item = items.get(i);
                String k = key(item);
                if (k != null && rankByKey.containsKey(k)) {
                    reorderable.add(item);
                    positions.add(i);
                }
            }

            if (!reorderable.isEmpty()) {
                Collections.sort(reorderable, (o1, o2) -> {
                    int r1 = rankByKey.getOrDefault(key(o1), Integer.MAX_VALUE);
                    int r2 = rankByKey.getOrDefault(key(o2), Integer.MAX_VALUE);
                    return Integer.compare(r1, r2);
                });

                @SuppressWarnings("unchecked")
                List<Object> rawList = (List<Object>) items;
                for (int i = 0; i < positions.size(); i++) {
                    rawList.set(positions.get(i), reorderable.get(i));
                }
            }
        } catch (Throwable ignored) {
        }
    }

    static void show(Activity activity) {
        LinearLayout page = MorpheDialog.page(activity, "Sidebar",
                "Untick an entry to hide it, or use arrows to change order. Go to includes bookmarks. Apply and restart for changes to take effect. Account, My profile, Settings and subreddit list remain untouched.");

        Set<String> hidden = new HashSet<>(hidden(activity));
        List<String> order = new ArrayList<>(getOrder(activity));

        LinearLayout rowsContainer = new LinearLayout(activity);
        rowsContainer.setOrientation(LinearLayout.VERTICAL);

        Runnable[] rebuildRef = new Runnable[1];
        rebuildRef[0] = () -> {
            rowsContainer.removeAllViews();
            float density = activity.getResources().getDisplayMetrics().density;
            for (int i = 0; i < order.size(); i++) {
                final int index = i;
                final String idName = order.get(i);
                String[] def = findDef(idName);
                if (def == null) continue;

                LinearLayout line = new LinearLayout(activity);
                line.setOrientation(LinearLayout.HORIZONTAL);
                line.setGravity(Gravity.CENTER_VERTICAL);
                line.setMinimumHeight(Math.round(44 * density));

                CheckBox box = MorpheDialog.check(activity, def[1], !hidden.contains(idName), null);
                box.setOnCheckedChangeListener((buttonView, checked) -> {
                    if (checked) hidden.remove(idName);
                    else hidden.add(idName);
                    saveHidden(activity, hidden);
                });
                line.addView(box, new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

                TextView upBtn = arrowButton(activity, "▲", index > 0);
                if (index > 0) {
                    upBtn.setOnClickListener(v -> {
                        Collections.swap(order, index, index - 1);
                        saveOrder(activity, order);
                        rebuildRef[0].run();
                    });
                }
                line.addView(upBtn);

                TextView downBtn = arrowButton(activity, "▼", index < order.size() - 1);
                if (index < order.size() - 1) {
                    downBtn.setOnClickListener(v -> {
                        Collections.swap(order, index, index + 1);
                        saveOrder(activity, order);
                        rebuildRef[0].run();
                    });
                }
                line.addView(downBtn);

                rowsContainer.addView(line);
            }
        };
        rebuildRef[0].run();

        page.addView(MorpheDialog.scroller(activity, rowsContainer));
        TextView reset = MorpheDialog.action(activity, "Reset", MorpheDialog.SUB);
        TextView done = MorpheDialog.action(activity, "Done", MorpheDialog.SUB);
        TextView apply = MorpheDialog.action(activity, "Apply and restart", MorpheDialog.GOLD);
        page.addView(MorpheDialog.actions(activity, reset, done, apply));

        AlertDialog dialog = MorpheDialog.show(activity, page);
        reset.setOnClickListener(v -> {
            hidden.clear();
            order.clear();
            for (String[] def : ENTRIES) order.add(def[0]);
            saveHidden(activity, hidden);
            saveOrder(activity, order);
            rebuildRef[0].run();
        });
        done.setOnClickListener(v -> dialog.dismiss());
        apply.setOnClickListener(v -> restart(activity));
    }

    private static String[] findDef(String key) {
        for (String[] def : ENTRIES) {
            if (def[0].equals(key)) return def;
        }
        return null;
    }

    private static TextView arrowButton(Activity activity, String symbol, boolean enabled) {
        float density = activity.getResources().getDisplayMetrics().density;
        TextView btn = new TextView(activity);
        btn.setText(symbol);
        btn.setTextSize(16);
        btn.setTextColor(enabled ? MorpheDialog.GOLD : MorpheDialog.SUB);
        btn.setAlpha(enabled ? 1.0f : 0.3f);
        btn.setGravity(Gravity.CENTER);
        btn.setClickable(enabled);
        btn.setFocusable(enabled);
        int padH = Math.round(12 * density);
        int padV = Math.round(8 * density);
        btn.setPadding(padH, padV, padH, padV);
        return btn;
    }

    private static List<String> getOrder(Context context) {
        List<String> list = new ArrayList<>();
        if (context == null) context = context();
        if (context != null) {
            String raw = prefs(context).getString(KEY_ORDER, null);
            if (raw != null && !raw.isEmpty()) {
                try {
                    JSONArray arr = new JSONArray(raw);
                    for (int i = 0; i < arr.length(); i++) {
                        String id = arr.optString(i, "");
                        if (!id.isEmpty() && findDef(id) != null && !list.contains(id)) {
                            list.add(id);
                        }
                    }
                } catch (Throwable ignored) {
                }
            }
        }
        for (String[] def : ENTRIES) {
            if (!list.contains(def[0])) {
                list.add(def[0]);
            }
        }
        return list;
    }

    private static void saveOrder(Context context, List<String> order) {
        if (context == null || order == null) return;
        JSONArray arr = new JSONArray();
        for (String id : order) arr.put(id);
        prefs(context).edit().putString(KEY_ORDER, arr.toString()).apply();
    }

    private static void saveHidden(Context context, Set<String> hidden) {
        if (context == null || hidden == null) return;
        prefs(context).edit().putStringSet(KEY_HIDDEN, new HashSet<>(hidden)).apply();
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

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static Set<String> hidden(Context context) {
        if (context == null) context = context();
        if (context == null) return new HashSet<>();
        Set<String> stored = prefs(context).getStringSet(KEY_HIDDEN, null);
        return stored == null ? new HashSet<>() : stored;
    }
}
