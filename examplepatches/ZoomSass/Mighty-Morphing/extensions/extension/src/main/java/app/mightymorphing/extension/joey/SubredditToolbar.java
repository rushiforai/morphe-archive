package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.json.JSONArray;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Show, hide, and reorder items in the subreddit / home toolbar and overflow menu.
 */
public final class SubredditToolbar {
    private static final String PREFS = "mighty_morphing";
    private static final String KEY_HIDDEN = "subreddit_toolbar_hidden";
    private static final String KEY_ORDER = "subreddit_toolbar_order";

    // {idName, label, drawableName (or null if overflow-only)}
    private static final String[][] ITEMS = {
            {"exhibition", "Media cards", "slideshow"},
            {"refresh", "Refresh", "refresh"},
            {"sort", "Sort by", "sort"},
            {"search", "Search", "search"},
            {"shuffle", "Shuffle", "shuffle"},
            {"menu_post_layout", "Post layout", null},
            {"menu_image_style", "Image style", null},
            {"menu_theme", "Theme", null},
            {"menu_filter_posts", "Filter out posts", null},
            {"sidebar", "Sidebar", null},
            {"report", "Report", null},
    };

    private SubredditToolbar() {
    }

    public static void apply(Activity activity, Menu menu) {
        try {
            if (activity == null || menu == null) return;
            String actName = activity.getClass().getName();
            if (!actName.endsWith(".HomeActivity") && !actName.endsWith(".SubredditActivity")) {
                return;
            }

            String pkg = activity.getPackageName();
            Set<String> hidden = getHidden(activity);
            List<String> order = getOrder(activity);

            Map<Integer, Integer> rankById = new HashMap<>();
            Set<Integer> iconCapableIds = new HashSet<>();
            Set<Integer> hiddenIds = new HashSet<>();

            for (int i = 0; i < order.size(); i++) {
                String idName = order.get(i);
                int resId = activity.getResources().getIdentifier(idName, "id", pkg);
                if (resId == 0) continue;
                rankById.put(resId, i);
                if (hidden.contains(idName)) {
                    hiddenIds.add(resId);
                }
            }

            for (String[] def : ITEMS) {
                if (def[2] != null) {
                    int resId = activity.getResources().getIdentifier(def[0], "id", pkg);
                    if (resId != 0) iconCapableIds.add(resId);
                }
            }

            int size = menu.size();
            for (int i = 0; i < size; i++) {
                MenuItem item = menu.getItem(i);
                if (item == null) continue;
                int itemId = item.getItemId();
                if (!rankById.containsKey(itemId)) continue;

                boolean isVisible = !hiddenIds.contains(itemId);
                item.setVisible(isVisible);

                if (isVisible) {
                    if (iconCapableIds.contains(itemId)) {
                        item.setShowAsAction(MenuItem.SHOW_AS_ACTION_IF_ROOM);
                    } else {
                        item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
                    }
                }
            }

            reorderMenuBuilder(menu, rankById);
        } catch (Throwable ignored) {
        }
    }

    @SuppressWarnings("unchecked")
    private static void reorderMenuBuilder(Menu menu, Map<Integer, Integer> rankById) {
        try {
            Class<?> menuBuilderClass = Class.forName("androidx.appcompat.view.menu.g");
            if (!menuBuilderClass.isInstance(menu)) return;

            Field mItemsField = menuBuilderClass.getDeclaredField("mItems");
            mItemsField.setAccessible(true);
            List<Object> mItems = (List<Object>) mItemsField.get(menu);
            if (mItems == null || mItems.size() <= 1) return;

            Class<?> menuItemImplClass = Class.forName("androidx.appcompat.view.menu.i");
            Field cField = menuItemImplClass.getDeclaredField("c");
            Field dField = menuItemImplClass.getDeclaredField("d");
            cField.setAccessible(true);
            dField.setAccessible(true);

            Map<Object, Integer> originalIndex = new HashMap<>();
            for (int i = 0; i < mItems.size(); i++) {
                originalIndex.put(mItems.get(i), i);
            }

            Collections.sort(mItems, (a, b) -> {
                int idA = (a instanceof MenuItem) ? ((MenuItem) a).getItemId() : 0;
                int idB = (b instanceof MenuItem) ? ((MenuItem) b).getItemId() : 0;
                Integer rankA = rankById.get(idA);
                Integer rankB = rankById.get(idB);
                if (rankA != null && rankB != null) {
                    return Integer.compare(rankA, rankB);
                }
                if (rankA != null) return -1;
                if (rankB != null) return 1;
                Integer origA = originalIndex.get(a);
                Integer origB = originalIndex.get(b);
                return Integer.compare(origA != null ? origA : 0, origB != null ? origB : 0);
            });

            for (int i = 0; i < mItems.size(); i++) {
                Object item = mItems.get(i);
                if (menuItemImplClass.isInstance(item)) {
                    int orderVal = i + 1;
                    cField.setInt(item, orderVal);
                    dField.setInt(item, orderVal);
                }
            }

            Method onItemsChanged = menuBuilderClass.getMethod("onItemsChanged", boolean.class);
            onItemsChanged.invoke(menu, true);
        } catch (Throwable ignored) {
        }
    }

    static void show(Activity activity) {
        LinearLayout page = MorpheDialog.page(activity, "Subreddit toolbar",
                "Untick an item to hide it, or use the arrows to change priority order. The top 3 visible icon items appear on the top bar; the rest appear in the 3-dot overflow menu.");

        Set<String> hidden = new HashSet<>(getHidden(activity));
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

                CheckBox box = MorpheDialog.check(activity, def[1], !hidden.contains(idName), def[2]);
                box.setOnCheckedChangeListener((buttonView, checked) -> {
                    if (checked) hidden.remove(idName);
                    else hidden.add(idName);
                    saveHidden(activity, hidden);
                    refreshHomeMenu();
                });
                line.addView(box, new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

                TextView upBtn = arrowButton(activity, "▲", index > 0);
                if (index > 0) {
                    upBtn.setOnClickListener(v -> {
                        Collections.swap(order, index, index - 1);
                        saveOrder(activity, order);
                        rebuildRef[0].run();
                        refreshHomeMenu();
                    });
                }
                line.addView(upBtn);

                TextView downBtn = arrowButton(activity, "▼", index < order.size() - 1);
                if (index < order.size() - 1) {
                    downBtn.setOnClickListener(v -> {
                        Collections.swap(order, index, index + 1);
                        saveOrder(activity, order);
                        rebuildRef[0].run();
                        refreshHomeMenu();
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
            for (String[] def : ITEMS) order.add(def[0]);
            saveHidden(activity, hidden);
            saveOrder(activity, order);
            rebuildRef[0].run();
            refreshHomeMenu();
        });
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

    private static TextView arrowButton(Activity activity, String symbol, boolean enabled) {
        float density = activity.getResources().getDisplayMetrics().density;
        TextView btn = new TextView(activity);
        btn.setText(symbol);
        btn.setTextSize(16);
        btn.setTextColor(enabled ? MorpheDialog.GOLD : MorpheDialog.SUB);
        btn.setAlpha(enabled ? 1.0f : 0.3f);
        btn.setGravity(Gravity.CENTER);
        int padH = Math.round(12 * density);
        int padV = Math.round(8 * density);
        btn.setPadding(padH, padV, padH, padV);
        btn.setEnabled(enabled);
        btn.setClickable(enabled);
        btn.setFocusable(enabled);
        return btn;
    }

    private static void refreshHomeMenu() {
        try {
            Object currentActivity = Class.forName("o.o.joey.MyApplication").getMethod("n").invoke(null);
            if (currentActivity instanceof Activity) {
                ((Activity) currentActivity).invalidateOptionsMenu();
            }
        } catch (Throwable ignored) {
        }
    }

    private static String[] findDef(String idName) {
        for (String[] def : ITEMS) {
            if (def[0].equals(idName)) return def;
        }
        return null;
    }

    private static Set<String> getHidden(Context context) {
        Set<String> stored = prefs(context).getStringSet(KEY_HIDDEN, null);
        return stored == null ? new HashSet<>() : new HashSet<>(stored);
    }

    private static void saveHidden(Context context, Set<String> hidden) {
        prefs(context).edit().putStringSet(KEY_HIDDEN, new HashSet<>(hidden)).commit();
    }

    private static List<String> getOrder(Context context) {
        List<String> result = new ArrayList<>();
        String raw = prefs(context).getString(KEY_ORDER, null);
        if (raw != null && !raw.isEmpty()) {
            try {
                JSONArray arr = new JSONArray(raw);
                for (int i = 0; i < arr.length(); i++) {
                    String id = arr.optString(i, "");
                    if (findDef(id) != null && !result.contains(id)) {
                        result.add(id);
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        for (String[] def : ITEMS) {
            if (!result.contains(def[0])) {
                result.add(def[0]);
            }
        }
        return result;
    }

    private static void saveOrder(Context context, List<String> order) {
        JSONArray arr = new JSONArray();
        for (String id : order) {
            arr.put(id);
        }
        prefs(context).edit().putString(KEY_ORDER, arr.toString()).commit();
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }
}
