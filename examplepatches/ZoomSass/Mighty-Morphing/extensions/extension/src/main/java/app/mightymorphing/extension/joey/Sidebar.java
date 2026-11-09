package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.PorterDuff;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.FrameLayout;
import android.widget.ImageView;
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
 * Hides and reorders optional left-drawer sections, and restyles the drawer
 * while Modern UI is on. Account, My profile, Settings and the subreddit list
 * are never hideable.
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
            int id = activity.getResources().getIdentifier(
                    "home_left_drawer_recycler_view", "id", activity.getPackageName());
            View view = activity.findViewById(id);
            if (view == null || !view.getClass().getName().contains("RecyclerView")) return;
            if (ModernUi.isModernUiEnabled(activity)) paintChrome(activity, view);
            List<String> names = new ArrayList<>(hidden(activity));
            Collections.sort(names);
            String now = names.toString() + getOrder(activity).toString();
            if (now.equals(shown)) return;
            Object service = Class.forName("ua.b").getMethod("A").invoke(null);
            List<?> list = (List<?>) service.getClass().getMethod("z").invoke(service);
            Object adapter = view.getClass().getMethod("getAdapter").invoke(view);
            if (adapter == null) return;
            adapter.getClass().getMethod("T1", List.class).invoke(adapter, list);
            shown = now;
            Log.i("Sidebar", "showing " + now);
        } catch (Throwable t) {
            Log.w("Sidebar", "refresh failed", t);
        }
    }

    private static void paintChrome(Activity activity, View recycler) {
        chrome(recycler, activity);
        recycler.post(() -> {
            if (!(recycler instanceof ViewGroup)) return;
            ViewGroup group = (ViewGroup) recycler;
            for (int i = 0; i < group.getChildCount(); i++) paint(group.getChildAt(i));
        });
    }

    private static void chromeFrom(View item) {
        View node = item;
        int recyclerId = id(item, "home_left_drawer_recycler_view");
        while (node != null && recyclerId != 0 && node.getId() != recyclerId) {
            node = node.getParent() instanceof View ? (View) node.getParent() : null;
        }
        if (node == null) node = item;
        chrome(node, activityOf(item.getContext()));
    }

    private static void chrome(View recycler, Activity activity) {
        if (recycler == null) return;
        Context context = recycler.getContext();
        if (!ModernUi.isModernUiEnabled(context)) return;
        ModernUi.Palette palette = ModernUi.getPalette(context);
        paintSurface(recycler, palette.canvas);
        View parent = recycler.getParent() instanceof View ? (View) recycler.getParent() : null;
        if (parent != null) {
            paintSurface(parent, palette.canvas);
            if (parent instanceof ViewGroup) hideDrawerFab((ViewGroup) parent);
        }
        if (activity != null) {
            View fab = activity.findViewById(activity.getResources().getIdentifier(
                    "navigation_fab", "id", activity.getPackageName()));
            if (fab != null) keepGone(fab);
        }
    }

    private static void hideDrawerFab(ViewGroup parent) {
        int fabId = id(parent, "navigation_fab");
        for (int i = 0; i < parent.getChildCount(); i++) {
            View child = parent.getChildAt(i);
            if (child.getClass().getName().contains("FloatingActionButton")
                    || (fabId != 0 && child.getId() == fabId)) {
                keepGone(child);
            }
        }
    }

    private static void keepGone(View fab) {
        fab.setVisibility(View.GONE);
        fab.setClickable(false);
        int key = fab.getId();
        if (key == 0) return;
        if (fab.getTag(key) instanceof Boolean) return;
        fab.setTag(key, Boolean.TRUE);
        fab.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
            if (v.getVisibility() != View.GONE) v.setVisibility(View.GONE);
        });
    }

    private static void paintSurface(View view, int color) {
        if (view == null) return;
        view.setBackgroundColor(color);
        view.setElevation(0f);
        useCanvasToken(view);
    }

    private static void useCanvasToken(View view) {
        try {
            Field field = view.getClass().getDeclaredField("b");
            field.setAccessible(true);
            Object attr = field.get(view);
            if (attr == null) return;
            Field token = attr.getClass().getDeclaredField("a");
            token.setAccessible(true);
            if (token.getInt(attr) == 11) token.setInt(attr, 12);
        } catch (Throwable ignored) {
        }
    }

    private static Activity activityOf(Context context) {
        while (context instanceof android.content.ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((android.content.ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    /** Joey's bind entry for every left-drawer row. */
    public static void schedule(Object holder) {
        try {
            View item = (View) holder.getClass().getField("itemView").get(holder);
            if (item == null || !ModernUi.isModernUiEnabled(item.getContext())) return;
            item.post(() -> {
                try {
                    paint(item);
                } catch (Throwable t) {
                    Log.w("Sidebar", "paint", t);
                }
            });
        } catch (Throwable ignored) {
        }
    }

    public static void apply(List<?> items) {
        if (items == null || items.isEmpty()) return;
        try {
            Context ctx = context();
            Set<String> hidden = hidden(ctx);
            List<String> order = getOrder(ctx);

            if (ctx != null && ModernUi.isModernUiEnabled(ctx)) {
                Iterator<?> dividers = items.iterator();
                while (dividers.hasNext()) {
                    Object item = dividers.next();
                    if (item != null && "va.a".equals(item.getClass().getName())) dividers.remove();
                }
            }

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

    private static void paint(View item) {
        if (item == null) return;
        Context context = item.getContext();
        if (!ModernUi.isModernUiEnabled(context)) return;
        ModernUi.Palette palette = ModernUi.getPalette(context);
        fill(item, palette.canvas);
        chromeFrom(item);

        View divider = id(item, "divider_item_view") == item.getId() ? item : find(item, "divider_item_view");
        if (divider != null) {
            divider.setVisibility(View.GONE);
            ViewGroup.LayoutParams lp = divider.getLayoutParams();
            if (lp != null) {
                lp.height = 0;
                divider.setLayoutParams(lp);
            }
            return;
        }

        if (find(item, "drawer_top") != null || id(item, "drawer_top") == item.getId()) {
            paintAccount(item, palette);
            return;
        }

        View search = find(item, "subreddit_entry_editText");
        if (search != null) {
            paintSearch(item, palette);
            return;
        }

        paintRow(item, palette);
    }

    private static void paintAccount(View item, ModernUi.Palette palette) {
        float density = item.getResources().getDisplayMetrics().density;
        View top = id(item, "drawer_top") == item.getId() ? item : find(item, "drawer_top");
        if (top == null) top = item;
        hide(find(item, "drawer_image"));
        View bubble = find(item, "give_food_container");
        hide(bubble);
        if (bubble != null && bubble.getParent() instanceof View) hide((View) bubble.getParent());
        hide(find(item, "top_heading"));

        int height = Math.round(56 * density);
        fill(top, palette.canvas);
        top.setMinimumHeight(0);
        ViewGroup.LayoutParams topLp = top.getLayoutParams();
        if (topLp != null) {
            topLp.height = height;
            top.setLayoutParams(topLp);
        }
        top.setPadding(Math.round(16 * density), 0, Math.round(12 * density), 0);
        if (top.getParent() instanceof View) {
            View parent = (View) top.getParent();
            ViewGroup.LayoutParams parentLp = parent.getLayoutParams();
            if (parentLp != null && parentLp.height > height) {
                parentLp.height = height;
                parent.setLayoutParams(parentLp);
            }
        }

        View nameView = find(item, "currentusername");
        if (!(nameView instanceof TextView)) return;
        TextView name = (TextView) nameView;
        name.setTextSize(18);
        name.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        name.setTextColor(palette.onSurface);
        name.setShadowLayer(0, 0, 0, 0);
        name.setPadding(0, 0, Math.round(8 * density), 0);
        CharSequence raw = name.getText();
        String label = raw == null ? "" : raw.toString().trim();
        if (label.isEmpty()) label = "Account";

        if (name.getParent() instanceof ViewGroup) {
            ViewGroup row = (ViewGroup) name.getParent();
            ViewGroup.LayoutParams rowLp = row.getLayoutParams();
            if (rowLp != null) {
                rowLp.width = ViewGroup.LayoutParams.MATCH_PARENT;
                rowLp.height = ViewGroup.LayoutParams.MATCH_PARENT;
                if (rowLp instanceof FrameLayout.LayoutParams) {
                    FrameLayout.LayoutParams fl = (FrameLayout.LayoutParams) rowLp;
                    fl.gravity = Gravity.CENTER_VERTICAL;
                    fl.setMargins(0, 0, 0, 0);
                }
                row.setLayoutParams(rowLp);
            }
            row.setPadding(0, 0, 0, 0);
            paintMark(row, name, label, palette, density);
        }

        View arrow = find(item, "drawer_top_drop_down_arrow");
        if (arrow != null) {
            int chip = Math.round(32 * density);
            ViewGroup.LayoutParams arrowLp = arrow.getLayoutParams();
            if (arrowLp != null) {
                arrowLp.width = chip;
                arrowLp.height = chip;
                if (arrowLp instanceof ViewGroup.MarginLayoutParams) {
                    ((ViewGroup.MarginLayoutParams) arrowLp).setMargins(0, 0, 0, 0);
                }
                arrow.setLayoutParams(arrowLp);
            }
            GradientDrawable pill = new GradientDrawable();
            pill.setColor(palette.containerHigh);
            pill.setCornerRadius(chip / 2f);
            arrow.setBackground(pill);
            int inset = Math.round(6 * density);
            arrow.setPadding(inset, inset, inset, inset);
            if (arrow instanceof ImageView) {
                ((ImageView) arrow).setColorFilter(palette.accent, PorterDuff.Mode.SRC_IN);
            }
            arrow.setContentDescription("Switch account");
        }
    }

    private static void paintMark(ViewGroup row, TextView name, String label,
                                 ModernUi.Palette palette, float density) {
        TextView mark = (TextView) row.findViewWithTag("morphe_user_mark");
        if (mark == null) {
            mark = new TextView(name.getContext());
            mark.setTag("morphe_user_mark");
            mark.setGravity(Gravity.CENTER);
            mark.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            mark.setTextSize(16);
            int size = Math.round(40 * density);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(size, size);
            lp.rightMargin = Math.round(12 * density);
            lp.gravity = Gravity.CENTER_VERTICAL;
            int at = 0;
            for (int i = 0; i < row.getChildCount(); i++) {
                if (row.getChildAt(i) == name) {
                    at = i;
                    break;
                }
            }
            row.addView(mark, at, lp);
        }
        GradientDrawable circle = new GradientDrawable();
        circle.setShape(GradientDrawable.OVAL);
        circle.setColor(palette.containerHigh);
        mark.setBackground(circle);
        mark.setTextColor(palette.accent);
        mark.setText(label.isEmpty() ? "A" : label.substring(0, 1).toUpperCase());
    }

    private static void paintSearch(View item, ModernUi.Palette palette) {
        float density = item.getResources().getDisplayMetrics().density;
        fill(item, palette.canvas);
        View field = find(item, "subreddits");
        if (field == null) field = item;
        fill(field, palette.canvas);
        field.setPadding(0, 0, 0, 0);
        ViewGroup.LayoutParams lp = field.getLayoutParams();
        if (lp instanceof ViewGroup.MarginLayoutParams) {
            ((ViewGroup.MarginLayoutParams) lp).setMargins(0, 0, 0, 0);
            field.setLayoutParams(lp);
        }
        View input = find(item, "subreddit_entry_editText");
        if (input instanceof TextView) {
            TextView edit = (TextView) input;
            edit.setTextSize(14);
            edit.setTextColor(palette.onSurface);
            edit.setHintTextColor(palette.onSurfaceVariant);
            int start = Math.round(16 * density);
            edit.setPadding(start, 0, Math.round(8 * density), 0);
            edit.setBackground(null);
        }
        tint(find(item, "subreddit_edit_drawer"), palette.onSurfaceVariant);
        tint(find(item, "subreddit_entry_clear"), palette.onSurfaceVariant);
    }

    private static void fill(View view, int color) {
        if (view == null) return;
        view.setBackgroundColor(color);
        view.setElevation(0f);
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof TextView || child instanceof ImageView) continue;
            if ("morphe_user_mark".equals(child.getTag())) continue;
            String type = child.getClass().getName();
            if (type.contains("ConfigViews") || type.contains("CRecyler") || child instanceof ViewGroup) {
                fill(child, color);
            }
        }
    }

    private static void hide(View view) {
        if (view == null) return;
        view.setVisibility(View.GONE);
        ViewGroup.LayoutParams lp = view.getLayoutParams();
        if (lp instanceof ViewGroup.MarginLayoutParams) {
            ((ViewGroup.MarginLayoutParams) lp).setMargins(0, 0, 0, 0);
        }
        if (lp != null) {
            lp.width = 0;
            lp.height = 0;
            view.setLayoutParams(lp);
        }
    }

    private static void paintRow(View item, ModernUi.Palette palette) {
        fill(item, palette.canvas);
        tint(find(item, "left_drawer_item_icon"), palette.onSurfaceVariant);
        tint(find(item, "left_drawer_expandible_item_icon"), palette.onSurfaceVariant);
        tint(find(item, "left_drawer_expandible_item_arrow"), palette.onSurfaceVariant);
        View label = find(item, "left_drawer_item_textview");
        if (label instanceof TextView) ((TextView) label).setTextColor(palette.onSurface);
        label = find(item, "left_drawer_expandible_item_label");
        if (label instanceof TextView) ((TextView) label).setTextColor(palette.onSurface);
        label = find(item, "left_drawer_subitem_textview");
        if (label instanceof TextView) ((TextView) label).setTextColor(palette.onSurfaceVariant);
        label = find(item, "accountname");
        if (label instanceof TextView) ((TextView) label).setTextColor(palette.onSurface);
        tint(find(item, "remove"), palette.onSurfaceVariant);
    }

    private static void tint(View view, int color) {
        if (view instanceof ImageView && !view.getClass().getName().contains("RoundedImageView")) {
            ((ImageView) view).setColorFilter(color, PorterDuff.Mode.SRC_IN);
        }
    }

    private static View find(View item, String name) {
        int found = id(item, name);
        return found == 0 ? null : item.findViewById(found);
    }

    private static int id(View view, String name) {
        return view.getResources().getIdentifier(name, "id", view.getContext().getPackageName());
    }

    static void show(Activity activity) {
        LinearLayout page = MorpheDialog.page(activity, "Sidebar",
                "Untick an entry to hide it, or drag the handle to change the order. Go to includes bookmarks. Apply and restart for changes to take effect. Account, My profile, Settings and subreddit list remain untouched.");

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
                line.addView(DragOrder.handle(activity, rowsContainer, (from, to) -> {
                    Collections.swap(order, from, to);
                    saveOrder(activity, order);
                    return true;
                }));

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

    public static List<String> optionalRailKeys(Context context) {
        List<String> keys = new ArrayList<>();
        Set<String> hidden = hidden(context);
        for (String id : getOrder(context)) {
            if (!hidden.contains(id)) keys.add(id);
        }
        return keys;
    }

    private static Set<String> hidden(Context context) {
        if (context == null) context = context();
        if (context == null) return new HashSet<>();
        Set<String> stored = prefs(context).getStringSet(KEY_HIDDEN, null);
        return stored == null ? new HashSet<>() : stored;
    }
}
