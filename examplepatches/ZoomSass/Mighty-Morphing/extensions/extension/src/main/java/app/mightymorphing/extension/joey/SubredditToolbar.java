package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
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
    private static final String KEY_BAR = "subreddit_toolbar_bar";

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
    };

    private SubredditToolbar() {
    }

    public static void apply(Activity activity, Menu menu) {
        try {
            if (activity == null || menu == null) return;
            ModernUi.applyMenuTheme(activity);
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

            int budget = ModernUi.toolbarIconBudget(activity);
            Set<String> pinned = getPinned(activity);
            Set<Integer> onBar = new HashSet<>();
            if (budget >= 0) {
                int kept = 0;
                for (String idName : order) {
                    if (kept >= budget || hidden.contains(idName)) continue;
                    String[] def = findDef(idName);
                    if (def == null || def[2] == null) continue;
                    if (pinned != null && !pinned.contains(idName)) continue;
                    int resId = activity.getResources().getIdentifier(idName, "id", pkg);
                    if (resId == 0) continue;
                    onBar.add(resId);
                    kept++;
                }
            }

            int size = menu.size();
            for (int i = 0; i < size; i++) {
                MenuItem item = menu.getItem(i);
                if (item == null) continue;
                int itemId = item.getItemId();
                if (!rankById.containsKey(itemId)) continue;

                boolean isVisible = !hiddenIds.contains(itemId);
                if (ModernUi.isModernUiEnabled(activity)) {
                    int layoutId = activity.getResources().getIdentifier(
                            "menu_post_layout", "id", pkg);
                    if (layoutId != 0 && itemId == layoutId) isVisible = false;
                }
                item.setVisible(isVisible);

                if (isVisible) {
                    String idName = nameFor(itemId, activity, pkg);
                    boolean wantsBar = iconCapableIds.contains(itemId)
                            && (pinned == null || pinned.contains(idName));
                    if (budget < 0 && wantsBar) {
                        item.setShowAsAction(MenuItem.SHOW_AS_ACTION_IF_ROOM);
                    } else if (budget >= 0 && onBar.contains(itemId)) {
                        item.setShowAsAction(MenuItem.SHOW_AS_ACTION_ALWAYS);
                    } else {
                        item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
                    }
                }
            }

            reorderMenuBuilder(menu, rankById);
            View decor = activity.getWindow() == null ? null : activity.getWindow().getDecorView();
            if (decor != null) decor.post(() -> bindModernThemeItem(activity, menu, pkg));
            else bindModernThemeItem(activity, menu, pkg);
        } catch (Throwable ignored) {
        }
    }

    /** Theme in the overflow menu opens the Modern list, not Joey's Default / Dark picker. */
    private static void bindModernThemeItem(Activity activity, Menu menu, String pkg) {
        int themeId = activity.getResources().getIdentifier("menu_theme", "id", pkg);
        if (themeId == 0) return;
        MenuItem theme = menu.findItem(themeId);
        if (theme == null) return;
        if (!ModernUi.isModernUiEnabled(activity)) {
            theme.setOnMenuItemClickListener(null);
            return;
        }
        theme.setOnMenuItemClickListener(item -> {
            activity.closeOptionsMenu();
            ModernUi.showAccentPicker(activity);
            return true;
        });
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
        LinearLayout page = MorpheDialog.page(activity, "Subreddit bar",
                "Drag the handle to change the order. Pin an item to put it in the overflow menu.");

        Set<String> hidden = new HashSet<>(getHidden(activity));
        Set<String> pinned = new HashSet<>();
        Set<String> storedPins = getPinned(activity);
        List<String> order = new ArrayList<>(getOrder(activity));
        if (storedPins == null) {
            for (String[] def : ITEMS) {
                if (def[2] != null) pinned.add(def[0]);
            }
        } else {
            pinned.addAll(storedPins);
        }

        FrameLayout stage = new FrameLayout(activity);
        stage.setClipChildren(true);
        int[] width = new int[]{BarPreview.widthIndex(activity)};
        Runnable paint = () -> {
            LinearLayout host = new LinearLayout(activity);
            host.setOrientation(LinearLayout.VERTICAL);
            drawBar(activity, host, BarPreview.slots(activity, width[0]), order, hidden, pinned);
            BarPreview.show(activity, stage, host);
        };
        page.addView(BarPreview.widthRow(activity, width, paint));
        page.addView(stage);

        LinearLayout rowsContainer = new LinearLayout(activity);
        rowsContainer.setOrientation(LinearLayout.VERTICAL);
        int accent = MorpheDialog.accent(activity);
        int text = MorpheDialog.text(activity);
        int sub = MorpheDialog.sub(activity);

        Runnable[] rebuildRef = new Runnable[1];
        rebuildRef[0] = () -> {
            rowsContainer.removeAllViews();
            List<String> visible = new ArrayList<>();
            for (String idName : order) {
                if ("menu_post_layout".equals(idName) && ModernUi.isModernUiEnabled(activity)) continue;
                if (findDef(idName) != null) visible.add(idName);
            }
            Set<String> onBar = new HashSet<>();
            for (String idName : visible) {
                String[] def = findDef(idName);
                if (def != null && def[2] != null && pinned.contains(idName) && !hidden.contains(idName)) {
                    onBar.add(idName);
                }
            }
            for (String idName : visible) {
                String[] def = findDef(idName);
                boolean iconItem = def[2] != null;
                boolean bar = onBar.contains(idName);
                LinearLayout line = new LinearLayout(activity);
                line.setOrientation(LinearLayout.HORIZONTAL);
                line.setGravity(Gravity.CENTER_VERTICAL);
                line.setTag(idName);
                line.setMinimumHeight(Math.round(48 * activity.getResources().getDisplayMetrics().density));
                TextView label = new TextView(activity);
                label.setText(def[1]);
                label.setTextColor(text);
                label.setTextSize(15);
                line.addView(label, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
                if (iconItem) {
                    TextView overflow = MorpheDialog.action(activity, "Overflow", MorpheDialog.TEXT);
                    MorpheDialog.setFilled(activity, overflow, !bar);
                    overflow.setOnClickListener(v -> {
                        boolean nextBar = !onBar.contains(idName);
                        hidden.remove(idName);
                        if (nextBar) {
                            pinned.add(idName);
                            onBar.add(idName);
                        } else {
                            pinned.remove(idName);
                            onBar.remove(idName);
                        }
                        saveHidden(activity, hidden);
                        savePinned(activity, pinned);
                        saveOrder(activity, order);
                        rebuildRef[0].run();
                        refreshHomeMenu();
                    });
                    LinearLayout.LayoutParams gap = new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    gap.leftMargin = Math.round(12 * activity.getResources().getDisplayMetrics().density);
                    line.addView(overflow, gap);
                }
                line.addView(DragOrder.handle(activity, rowsContainer, (from, to) -> {
                    if (from < 0 || to < 0 || from >= rowsContainer.getChildCount() || to >= rowsContainer.getChildCount()) return false;
                    int ia = order.indexOf(String.valueOf(rowsContainer.getChildAt(from).getTag()));
                    int ib = order.indexOf(String.valueOf(rowsContainer.getChildAt(to).getTag()));
                    if (ia < 0 || ib < 0) return false;
                    Collections.swap(order, ia, ib);
                    saveOrder(activity, order);
                    paint.run();
                    return true;
                }));
                rowsContainer.addView(line);
            }
            paint.run();
        };
        rebuildRef[0].run();

        page.addView(BarPreview.options(activity, rowsContainer));
        TextView reset = MorpheDialog.action(activity, "Reset", MorpheDialog.SUB);
        TextView done = MorpheDialog.action(activity, "Done", MorpheDialog.SUB);
        TextView apply = MorpheDialog.action(activity, "Apply and restart", MorpheDialog.GOLD);
        page.addView(MorpheDialog.actions(activity, reset, done, apply));

        AlertDialog dialog = MorpheDialog.show(activity, page, 960);
        reset.setOnClickListener(v -> {
            hidden.clear();
            pinned.clear();
            order.clear();
            for (String[] def : ITEMS) {
                order.add(def[0]);
                if (def[2] != null) pinned.add(def[0]);
            }
            saveHidden(activity, hidden);
            savePinned(activity, pinned);
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

    private static boolean canNudge(List<String> sequence, String id, Set<String> onBar, int dir) {
        int index = sequence.indexOf(id);
        int next = index + dir;
        if (index < 0 || next < 0 || next >= sequence.size()) return false;
        return onBar.contains(id) == onBar.contains(sequence.get(next));
    }

    private static int pinMode(String id, boolean icon, Set<String> hidden, Set<String> pinned) {
        if (hidden.contains(id)) return 0;
        if (icon && pinned.contains(id)) return 2;
        return 1;
    }

    private static void cycle(String id, boolean icon, Set<String> hidden, Set<String> pinned) {
        if (hidden.contains(id)) {
            hidden.remove(id);
            if (icon) pinned.add(id);
            else pinned.remove(id);
            return;
        }
        if (icon && pinned.contains(id)) {
            pinned.remove(id);
            return;
        }
        hidden.add(id);
        pinned.remove(id);
    }

    private static void drawBar(Activity activity, LinearLayout host, int slots, List<String> order,
                                Set<String> hidden, Set<String> pinned) {
        float density = activity.getResources().getDisplayMetrics().density;
        int text = MorpheDialog.text(activity);
        LinearLayout bar = new LinearLayout(activity);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setMinimumHeight(Math.round(52 * density));
        int pad = Math.round(12 * density);
        LinearLayout chip = new LinearLayout(activity);
        chip.setGravity(Gravity.CENTER_VERTICAL);
        chip.setPadding(pad, Math.round(6 * density), pad, Math.round(6 * density));
        GradientDrawable outline = new GradientDrawable();
        outline.setCornerRadius(10 * density);
        outline.setStroke(Math.round(density), text);
        chip.setBackground(outline);
        chip.addView(BarPreview.icon(activity, "sort", text, 18));
        TextView hot = new TextView(activity);
        hot.setText("Hot");
        hot.setTextColor(text);
        hot.setTextSize(14);
        hot.setPadding(0, 0, Math.round(4 * density), 0);
        chip.addView(hot);
        LinearLayout.LayoutParams chipLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        chipLp.leftMargin = pad;
        bar.addView(chip, chipLp);
        bar.addView(new View(activity), new LinearLayout.LayoutParams(0, 1, 1f));
        int room = Math.max(1, slots);
        int used = 0;
        List<String[]> lines = new ArrayList<>();
        for (String id : order) {
            String[] def = findDef(id);
            if (def == null || hidden.contains(id)) continue;
            if ("menu_post_layout".equals(id) && ModernUi.isModernUiEnabled(activity)) continue;
            boolean onBar = def[2] != null && pinned.contains(id);
            boolean caret = "menu_image_style".equals(id) || "menu_theme".equals(id);
            if (!onBar) lines.add(new String[]{def[1], "", caret ? "caret" : ""});
            else if (used >= room) lines.add(new String[]{def[1], "", ""});
            else {
                used++;
                bar.addView(BarPreview.icon(activity, def[2], text, 22));
            }
        }
        bar.addView(BarPreview.icon(activity, "abc_ic_menu_overflow_material", text, 22));
        host.addView(bar);
        if (!lines.isEmpty()) {
            LinearLayout sheet = BarPreview.menu(activity, lines);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.gravity = Gravity.END;
            lp.rightMargin = pad;
            lp.bottomMargin = pad;
            sheet.setLayoutParams(lp);
            host.addView(sheet);
        }
        host.setBackgroundColor(BarPreview.canvas(activity));
    }

    private static String nameFor(int itemId, Activity activity, String pkg) {
        for (String[] def : ITEMS) {
            int resId = activity.getResources().getIdentifier(def[0], "id", pkg);
            if (resId == itemId) return def[0];
        }
        return "";
    }

    private static Set<String> getPinned(Context context) {
        if (!prefs(context).contains(KEY_BAR)) return null;
        Set<String> result = new HashSet<>();
        String raw = prefs(context).getString(KEY_BAR, "");
        try {
            JSONArray arr = new JSONArray(raw);
            for (int i = 0; i < arr.length(); i++) result.add(arr.optString(i, ""));
        } catch (Throwable ignored) {
        }
        return result;
    }

    private static void savePinned(Context context, Set<String> pinned) {
        JSONArray arr = new JSONArray();
        for (String id : pinned) arr.put(id);
        prefs(context).edit().putString(KEY_BAR, arr.toString()).apply();
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
