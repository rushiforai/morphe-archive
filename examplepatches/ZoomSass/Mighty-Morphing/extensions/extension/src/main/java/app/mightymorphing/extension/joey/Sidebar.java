package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
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
import java.lang.reflect.Method;
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
            int fabId = id(recycler, "navigation_fab");
            View fab = fabId == 0 ? null : activity.findViewById(fabId);
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
        // Every drawer row paints this once it is bound, so a surface that is already right is left alone.
        android.graphics.drawable.Drawable now = view.getBackground();
        if (!(now instanceof android.graphics.drawable.ColorDrawable)
                || ((android.graphics.drawable.ColorDrawable) now).getColor() != color) {
            view.setBackgroundColor(color);
        }
        if (view.getElevation() != 0f) view.setElevation(0f);
        useCanvasToken(view);
    }

    /** Joey's themed view keeps a colour token in field b.a. The two fields are found once per class. */
    private static final java.util.Map<Class<?>, Field[]> TOKEN_FIELDS = new java.util.HashMap<>();
    private static final Field[] NO_TOKEN = new Field[0];

    private static void useCanvasToken(View view) {
        try {
            Field[] fields = TOKEN_FIELDS.get(view.getClass());
            if (fields == null) {
                try {
                    Field field = view.getClass().getDeclaredField("b");
                    field.setAccessible(true);
                    Object attr = field.get(view);
                    if (attr == null) return;
                    Field token = attr.getClass().getDeclaredField("a");
                    token.setAccessible(true);
                    fields = new Field[]{field, token};
                } catch (Throwable t) {
                    fields = NO_TOKEN;
                }
                TOKEN_FIELDS.put(view.getClass(), fields);
            }
            if (fields.length == 0) return;
            Object attr = fields[0].get(view);
            if (attr == null) return;
            if (fields[1].getInt(attr) == 11) fields[1].setInt(attr, 12);
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

    /** Paints one drawer row again after the seasonal picture has been chosen. */
    static void repaint(View item) {
        if (item == null || !ModernUi.isModernUiEnabled(item.getContext())) return;
        paintWhenStill(item);
    }

    /** Joey's bind entry for every left-drawer row. */
    public static void schedule(Object holder) {
        try {
            View item = (View) holder.getClass().getField("itemView").get(holder);
            if (item == null || !ModernUi.isModernUiEnabled(item.getContext())) return;
            // Colour only. It never lays out, so it is safe while the list is moving.
            // Without it a row bound mid-scroll shows Joey's lighter surface until idle.
            try {
                fill(item, ModernUi.getPalette(item.getContext()).canvas);
            } catch (Throwable t) {
                Log.w("Sidebar", "fill", t);
            }
            item.post(() -> paintWhenStill(item));
        } catch (Throwable ignored) {
        }
    }

    /**
     * Painting asks the list to lay out. Doing that while it is moving cancels the
     * scroll, so the banner cannot leave the screen the way it does in classic.
     */
    private static void paintWhenStill(View item) {
        if (item == null || !item.isAttachedToWindow()) return;
        View list = drawerList(item);
        if (list != null && scrollState(list) != 0) {
            // One wait per row. A row bound mid-scroll used to post again for every request.
            if (item.getTag(WAITING) == null) {
                item.setTag(WAITING, Boolean.TRUE);
                item.post(() -> {
                    item.setTag(WAITING, null);
                    paintWhenStill(item);
                });
            }
            return;
        }
        try {
            paint(item);
        } catch (Throwable t) {
            Log.w("Sidebar", "paint", t);
        }
    }

    private static final int WAITING = 0x4d4d5753;
    private static Method sScrollState;

    private static int scrollState(View list) {
        try {
            if (sScrollState == null) sScrollState = list.getClass().getMethod("getScrollState");
            Object state = sScrollState.invoke(list);
            if (state instanceof Integer) return (Integer) state;
        } catch (Throwable ignored) {
        }
        return 0;
    }

    private static View drawerList(View item) {
        int listId = id(item, "home_left_drawer_recycler_view");
        View node = item;
        while (node != null && (listId == 0 || node.getId() != listId)) {
            node = node.getParent() instanceof View ? (View) node.getParent() : null;
        }
        return node;
    }

    public static void apply(List<?> items) {
        if (items == null || items.isEmpty()) return;
        try {
            Context ctx = context();
            Set<String> hidden = hidden(ctx);
            List<String> order = getOrder(ctx);

            // Dividers stay in the list. Classic scrolls the one above the search
            // field to the top. Paint collapses them, so they take no space.

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
            if (isDrawerFooter(item)) {
                keepFooter(item, divider);
                return;
            }
            // The divider just above the search row keeps 1px, drawn transparent. Joey's
            // tap-to-top snaps that divider to the top. While it is still the first visible
            // row, FlexibleAdapter does not make the search row sticky. Sticking moves the
            // search field into an overlay, which loses focus and closes the keyboard.
            // Classic works because this divider is 2px there.
            if (divider.getVisibility() != View.VISIBLE) divider.setVisibility(View.VISIBLE);
            boolean guard = isAboveSearch(item);
            float alpha = guard ? 0f : 1f;
            if (divider.getAlpha() != alpha) divider.setAlpha(alpha);
            heightIfChanged(divider, guard ? 1 : 0);
            return;
        }

        if (find(item, "drawer_top") != null || id(item, "drawer_top") == item.getId()) {
            paintAccount(item, palette);
            diagnoseDrawer(item);
            return;
        }

        View search = find(item, "subreddit_entry_editText");
        if (search != null) {
            paintSearch(item, palette);
            return;
        }

        paintRow(item, palette);
    }

    private static int sDiagRuns;

    /**
     * Temporary diagnostic for the gap under the header when the banner is hidden.
     * Logs (tag MorpheDrawer) the first rows of the drawer list and the views around it,
     * three times per process: now, after 700ms and after 2000ms.
     */
    private static void diagnoseDrawer(View item) {
        if (sDiagRuns >= 3) return;
        sDiagRuns++;
        long[] delays = {0L, 700L, 2000L};
        final int run = sDiagRuns;
        item.postDelayed(() -> {
            try {
                dumpDrawer(item, run);
            } catch (Throwable t) {
                Log.w("MorpheDrawer", "dump", t);
            }
        }, delays[run - 1]);
    }

    private static void dumpDrawer(View item, int run) throws Exception {
        float d = item.getResources().getDisplayMetrics().density;
        View list = drawerList(item);
        Log.w("MorpheDrawer", "run " + run + " density " + d + " banner "
                + SeasonalBanner.showsPicture(item.getContext()) + " list "
                + (list == null ? "null" : list.getClass().getName() + " h=" + list.getHeight()
                + " padTop=" + list.getPaddingTop() + " top=" + list.getTop()
                + " clip=" + (list instanceof ViewGroup && ((ViewGroup) list).getClipToPadding())));
        if (!(list instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) list;
        Object adapter = list.getClass().getMethod("getAdapter").invoke(list);
        java.lang.reflect.Method type = adapter == null ? null
                : adapter.getClass().getMethod("getItemViewType", int.class);
        Log.w("MorpheDrawer", "children " + group.getChildCount() + " adapterItems "
                + (adapter == null ? -1 : adapter.getClass().getMethod("getItemCount").invoke(adapter)));
        int n = Math.min(8, group.getChildCount());
        for (int i = 0; i < n; i++) {
            View c = group.getChildAt(i);
            Object pos = list.getClass().getMethod("getChildAdapterPosition", View.class).invoke(list, c);
            Object vt = (type != null && pos instanceof Integer && (Integer) pos >= 0)
                    ? type.invoke(adapter, (Integer) pos) : null;
            ViewGroup.LayoutParams lp = c.getLayoutParams();
            Log.w("MorpheDrawer", "row " + i + " pos=" + pos + " type=" + vt + " "
                    + c.getClass().getSimpleName() + " top=" + c.getTop() + " h=" + c.getHeight()
                    + " dp=" + Math.round(c.getHeight() / d) + " lp.h=" + (lp == null ? "?" : lp.height)
                    + " vis=" + c.getVisibility() + " minH=" + c.getMinimumHeight()
                    + " kids=" + (c instanceof ViewGroup ? ((ViewGroup) c).getChildCount() : 0));
        }
        View parent = (View) list.getParent();
        if (parent instanceof ViewGroup) {
            ViewGroup pg = (ViewGroup) parent;
            for (int i = 0; i < pg.getChildCount(); i++) {
                View s = pg.getChildAt(i);
                Log.w("MorpheDrawer", "sibling " + i + " " + s.getClass().getName() + " top=" + s.getTop()
                        + " h=" + s.getHeight() + " dp=" + Math.round(s.getHeight() / d)
                        + " vis=" + s.getVisibility() + " isList=" + (s == list));
            }
        }
    }

    /**
     * Joey ends the drawer list with a tall blank row. Classic scrolls the banner away
     * into that room, so Modern leaves it alone instead of collapsing it with the hairlines.
     */
    private static boolean isDrawerFooter(View item) {
        try {
            View list = drawerList(item);
            if (list == null) return false;
            Object pos = list.getClass().getMethod("getChildAdapterPosition", View.class).invoke(list, item);
            Object adapter = list.getClass().getMethod("getAdapter").invoke(list);
            if (adapter == null || !(pos instanceof Integer)) return false;
            Object count = adapter.getClass().getMethod("getItemCount").invoke(adapter);
            return count instanceof Integer && (Integer) pos >= 0 && (Integer) pos == (Integer) count - 1;
        } catch (Throwable t) {
            return false;
        }
    }

    /** True for the divider row directly above the search row (the next item has another view type). */
    private static boolean isAboveSearch(View item) {
        try {
            View list = drawerList(item);
            if (list == null) return false;
            Object pos = list.getClass().getMethod("getChildAdapterPosition", View.class).invoke(list, item);
            Object adapter = list.getClass().getMethod("getAdapter").invoke(list);
            if (adapter == null || !(pos instanceof Integer) || (Integer) pos < 0) return false;
            int p = (Integer) pos;
            int count = (Integer) adapter.getClass().getMethod("getItemCount").invoke(adapter);
            if (p + 1 >= count - 1) return false;
            java.lang.reflect.Method type = adapter.getClass().getMethod("getItemViewType", int.class);
            Object mine = type.invoke(adapter, p);
            Object next = type.invoke(adapter, p + 1);
            if (mine == null || mine.equals(next)) return false;
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /** Puts back a footer that an earlier paint may have collapsed on a recycled row. */
    private static void keepFooter(View item, View divider) {
        if (item.getVisibility() != View.VISIBLE) item.setVisibility(View.VISIBLE);
        if (divider != item && divider.getVisibility() != View.VISIBLE) divider.setVisibility(View.VISIBLE);
        if (divider.getAlpha() != 1f) divider.setAlpha(1f);
        ViewGroup.LayoutParams lp = item.getLayoutParams();
        View list = drawerList(item);
        if (lp != null && lp.height == 0 && list != null && list.getHeight() > 0) {
            lp.height = list.getHeight() * 47 / 100;
            item.setLayoutParams(lp);
        }
    }

    private static void paintAccount(View item, ModernUi.Palette palette) {
        float density = item.getResources().getDisplayMetrics().density;
        View top = id(item, "drawer_top") == item.getId() ? item : find(item, "drawer_top");
        if (top == null) top = item;
        boolean bird = SeasonalBanner.isEnabled()
                ? SeasonalBanner.showsPicture(item.getContext())
                : ModernUi.sidebarBird(item.getContext());
        View image = find(item, "drawer_image");
        if (bird) showBird(image);
        else hide(image);
        View bubble = find(item, "give_food_container");
        hide(bubble);
        if (bubble != null && bubble.getParent() instanceof View) hide((View) bubble.getParent());
        hide(find(item, "top_heading"));

        int height = Math.round((bird ? 168 : 56) * density);
        if (bird) {
            top.setBackgroundColor(palette.canvas);
            top.setElevation(0f);
        } else {
            fill(top, palette.canvas);
        }
        top.setElevation(0f);
        top.setMinimumHeight(0);
        heightIfChanged(top, height);
        // Joey wraps the header in a FrameLayout row that keeps the 168dp the banner had.
        // Sizing only the child left that wrapper tall, a blank gap under a hidden banner.
        if (item != top) heightIfChanged(item, height);
        if (bird) top.setPadding(0, 0, 0, 0);
        else top.setPadding(Math.round(16 * density), 0, Math.round(12 * density), 0);

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
            View mark = row.findViewWithTag("morphe_user_mark");
            layoutRow(row, bird);
            row.setPadding(bird ? Math.round(12 * density) : 0, bird ? Math.round(8 * density) : 0,
                    bird ? Math.round(8 * density) : 0, bird ? Math.round(8 * density) : 0);
            if (bird) {
                row.setBackgroundColor(Color.argb(102,
                        Color.red(palette.container),
                        Color.green(palette.container),
                        Color.blue(palette.container)));
                if (mark != null) mark.setVisibility(View.GONE);
            } else {
                row.setBackground(null);
                if (mark != null) mark.setVisibility(View.VISIBLE);
                paintMark(row, name, label, palette, density);
            }
        }

        View arrow = find(item, "drawer_top_drop_down_arrow");
        if (arrow != null) {
            int chip = Math.round(32 * density);
            sizeIfChanged(arrow, chip, chip);
            clearMargins(arrow);
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
        clearMargins(field);
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
        // Runs for the whole row on every bind, including mid-scroll, so a colour already set is kept
        // instead of making a new drawable and redrawing for it.
        android.graphics.drawable.Drawable now = view.getBackground();
        if (!(now instanceof android.graphics.drawable.ColorDrawable)
                || ((android.graphics.drawable.ColorDrawable) now).getColor() != color) {
            view.setBackgroundColor(color);
        }
        if (view.getElevation() != 0f) view.setElevation(0f);
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

    /** Joey's own bird, in the original header slot, with no extra tint. */
    private static void showBird(View image) {
        if (image == null) return;
        image.setVisibility(View.VISIBLE);
        ViewGroup.LayoutParams shown = image.getLayoutParams();
        if (shown != null && (shown.width == 0 || shown.height == 0)) {
            shown.width = ViewGroup.LayoutParams.MATCH_PARENT;
            shown.height = ViewGroup.LayoutParams.MATCH_PARENT;
            image.setLayoutParams(shown);
        }
        if (image instanceof ImageView) {
            ImageView view = (ImageView) image;
            view.setColorFilter(null);
            view.setScaleType(ImageView.ScaleType.FIT_CENTER);
            view.setAdjustViewBounds(false);
        }
    }

    private static void hide(View view) {
        if (view == null) return;
        ViewGroup.LayoutParams lp = view.getLayoutParams();
        boolean clear = marginsClear(lp);
        boolean sized = lp != null && lp.width == 0 && lp.height == 0;
        if (view.getVisibility() == View.GONE && sized && clear) return;
        view.setVisibility(View.GONE);
        if (!clear && lp instanceof ViewGroup.MarginLayoutParams) {
            ((ViewGroup.MarginLayoutParams) lp).setMargins(0, 0, 0, 0);
        }
        if (lp != null && !sized) {
            lp.width = 0;
            lp.height = 0;
        }
        if (lp != null && (!sized || !clear)) view.setLayoutParams(lp);
    }

    /** A repeated paint must not request layout, or Joey's drawer scroll is cancelled. */
    private static void heightIfChanged(View view, int height) {
        if (view == null) return;
        ViewGroup.LayoutParams lp = view.getLayoutParams();
        if (lp == null || lp.height == height) return;
        lp.height = height;
        view.setLayoutParams(lp);
    }

    private static void sizeIfChanged(View view, int width, int height) {
        if (view == null) return;
        ViewGroup.LayoutParams lp = view.getLayoutParams();
        if (lp == null || (lp.width == width && lp.height == height)) return;
        lp.width = width;
        lp.height = height;
        view.setLayoutParams(lp);
    }

    private static void clearMargins(View view) {
        if (view == null) return;
        ViewGroup.LayoutParams lp = view.getLayoutParams();
        if (marginsClear(lp) || !(lp instanceof ViewGroup.MarginLayoutParams)) return;
        ((ViewGroup.MarginLayoutParams) lp).setMargins(0, 0, 0, 0);
        view.setLayoutParams(lp);
    }

    private static boolean marginsClear(ViewGroup.LayoutParams lp) {
        if (!(lp instanceof ViewGroup.MarginLayoutParams)) return true;
        ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams) lp;
        return margins.leftMargin == 0 && margins.topMargin == 0
                && margins.rightMargin == 0 && margins.bottomMargin == 0;
    }

    private static void layoutRow(ViewGroup row, boolean bird) {
        ViewGroup.LayoutParams lp = row.getLayoutParams();
        if (lp == null) return;
        int height = bird ? ViewGroup.LayoutParams.WRAP_CONTENT : ViewGroup.LayoutParams.MATCH_PARENT;
        int gravity = bird ? Gravity.BOTTOM : Gravity.CENTER_VERTICAL;
        boolean changed = lp.width != ViewGroup.LayoutParams.MATCH_PARENT || lp.height != height;
        if (lp.width != ViewGroup.LayoutParams.MATCH_PARENT) lp.width = ViewGroup.LayoutParams.MATCH_PARENT;
        if (lp.height != height) lp.height = height;
        if (lp instanceof FrameLayout.LayoutParams) {
            FrameLayout.LayoutParams frame = (FrameLayout.LayoutParams) lp;
            if (frame.gravity != gravity || !marginsClear(frame)) {
                frame.gravity = gravity;
                frame.setMargins(0, 0, 0, 0);
                changed = true;
            }
        }
        if (changed) row.setLayoutParams(lp);
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

    private static final Map<String, Integer> IDS = new HashMap<>();

    private static int id(View view, String name) {
        Integer cached = IDS.get(name);
        if (cached != null) return cached;
        int found = view.getResources().getIdentifier(name, "id", view.getContext().getPackageName());
        IDS.put(name, found);
        return found;
    }

    static void show(Activity activity) {
        Set<String> hidden = new HashSet<>(hidden(activity));
        List<List<String>> zones = ZoneEditor.lists(2);
        for (String id : getOrder(activity)) {
            if (findDef(id) == null) continue;
            zones.get(hidden.contains(id) ? 1 : 0).add(id);
        }
        FrameLayout stage = new FrameLayout(activity);
        stage.setClipChildren(true);
        Runnable paint = () -> {
            LinearLayout host = new LinearLayout(activity);
            host.setOrientation(LinearLayout.VERTICAL);
            drawDrawer(activity, host, zones.get(0));
            BarPreview.show(activity, stage, host);
        };
        Runnable save = () -> {
            List<String> all = new ArrayList<>(zones.get(0));
            all.addAll(zones.get(1));
            saveHidden(activity, new HashSet<>(zones.get(1)));
            saveOrder(activity, all);
            paint.run();
        };
        ZoneEditor editor = new ZoneEditor(activity,
                new String[]{"In the sidebar", "Hidden"},
                new String[]{"Drag an entry here", "Drag an entry here to hide it"},
                zones, (id, zone) -> true,
                new ZoneEditor.Look() {
                    @Override
                    public String label(String id) {
                        String[] def = findDef(id);
                        return def == null ? id : def[1];
                    }

                    @Override
                    public String icon(String id) {
                        return null;
                    }
                }, save);
        TextView reset = MorpheDialog.action(activity, "Reset", MorpheDialog.SUB);
        TextView done = MorpheDialog.action(activity, "Done", MorpheDialog.SUB);
        TextView apply = MorpheDialog.action(activity, "Apply and restart", MorpheDialog.GOLD);
        LinearLayout page = ZoneEditor.screen(activity, "Sidebar",
                "Drag the handle to reorder an entry, or to move it between the sidebar and hidden. Go to includes bookmarks. Apply and restart for changes to take effect. Account, My profile, Settings and the subreddit list stay as they are.",
                stage, editor, reset, done, apply);
        android.app.Dialog dialog = MorpheDialog.showFull(activity, page, 640, null);
        page.post(paint);
        reset.setOnClickListener(v -> {
            for (List<String> zone : zones) zone.clear();
            for (String[] def : ENTRIES) zones.get(0).add(def[0]);
            save.run();
            editor.rebuild();
        });
        done.setOnClickListener(v -> dialog.dismiss());
        apply.setOnClickListener(v -> restart(activity));
    }

    /** The drawer's entries in order, between Joey's own fixed rows. Scrolls inside a short frame. */
    private static void drawDrawer(Activity activity, LinearLayout host, List<String> shown) {
        float density = activity.getResources().getDisplayMetrics().density;
        int text = MorpheDialog.text(activity);
        int sub = MorpheDialog.sub(activity);
        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setPadding(Math.round(14 * density), Math.round(6 * density), Math.round(14 * density), Math.round(6 * density));
        column.addView(drawerRow(activity, "My profile", sub, density));
        for (String id : shown) {
            String[] def = findDef(id);
            if (def != null) column.addView(drawerRow(activity, def[1], text, density));
        }
        column.addView(drawerRow(activity, "Settings", sub, density));
        android.widget.ScrollView frame = new android.widget.ScrollView(activity);
        frame.addView(column);
        host.addView(frame, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                Math.round(170 * density)));
        host.setBackgroundColor(BarPreview.canvas(activity));
    }

    private static TextView drawerRow(Activity activity, String label, int color, float density) {
        TextView row = new TextView(activity);
        row.setText(label);
        row.setTextColor(color);
        row.setTextSize(14);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(Math.round(32 * density));
        return row;
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
        return ModernUi.getContext();
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
