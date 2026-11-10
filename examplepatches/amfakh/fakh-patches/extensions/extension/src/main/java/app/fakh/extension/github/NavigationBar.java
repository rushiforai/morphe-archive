package app.fakh.extension.github;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.RectF;
import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;

import app.fakh.extension.shared.GlassCapsule;
import app.fakh.extension.shared.GlassTabs;
import app.fakh.extension.shared.SlidingPill;
import app.fakh.extension.shared.AppRuntime;

/**
 * Shapes GitHub's bottom bar, a Compose NavigationBar inside the {@code navigation_bar} ComposeView: whether its
 * tabs show a label, and the glass look, drawn by the shared {@link GlassCapsule} behind the ComposeView while the
 * Compose container turns transparent. Both are read from the settings.
 */
@SuppressWarnings("unused")
public final class NavigationBar {
    public static final String GLASS = "fakh_glass_navbar";
    public static final String HIDE_LABELS = "fakh_hide_nav_labels";
    private static final float LANDSCAPE_HEIGHT_DP = 272f;
    public static final String NAV_RIGHT = "fakh_nav_right";
    /** Prefix of the switch that hides each tab, which {@link ChoiceSheets} sets from the tab sheet. */
    static final String HIDE_TAB = "fakh_hide_tab_";
    /** The name of the label of the Home tab. */
    static final String HOME_TAB = "menu_home";
    /** Every tab the app lists, before the hidden ones are dropped, for the sheet. */
    static List<Object> allTabs = new ArrayList<>();

    private static final int SIDE_MARGIN_DP = 12;
    private static final int INNER_PADDING_DP = 14;
    private static final int VERTICAL_MARGIN_DP = 6;
    /** Opaque enough to hide the text behind the bar, as on LinkedIn. */
    private static final float FILL_ALPHA = 0.85f;
    /** Height of the tabs when they have no label; with a label the bar keeps the height the app gives it. */
    private static final int ICON_ONLY_HEIGHT_DP = 56;
    /** Space the bar keeps between its tabs. */
    private static final int TAB_GAP_DP = 8;
    /** How many tabs the bar shows, from the tab list; 0 until the app lists them. */
    private static int tabCount;
    private static final int PILL_WIDTH_DP = 64;
    private static final int PILL_HEIGHT_DP = 32;
    /** Where the pill starts below the top of a tab that has a label. */
    private static final int LABEL_PILL_TOP_DP = 12;
    /** The rail's tabs are 56dp squares, 4dp apart, centered in the rail; its pill is 56dp by 32dp. */
    private static final int RAIL_TAB_DP = 56;
    private static final int RAIL_GAP_DP = 4;

    /** The icon composable of each tab of the portrait bar, in the order the tabs first appeared: it stays the same for a tab. */
    private static final java.util.List<Object> tabIcons = new java.util.ArrayList<>();
    /** Whether a tab was drawn since the last time the pill was placed. */
    private static boolean drawn;
    /** Which of the tabs of the portrait bar is selected. */
    private static int selectedIndex = -1;
    /** The pill behind the selected tab, or null while the bar is not glass. */
    private static SlidingPill slider;
    private static View pillBar;
    /** Whether the bar is the landscape rail, whose pill slides from top to bottom. */
    private static boolean vertical;
    /** The color of the app's own indicator, which the pill takes; 0 until the portrait bar is drawn. */
    private static int indicator;

    /** The color of the page behind the bar, which the capsule takes so it blends in; 0 until it is read. */
    private static int pageColor;

    /** The container color the bar had before it turned transparent. */
    private static int barColor = Color.DKGRAY;
    private static GlassCapsule capsule;

    private NavigationBar() {
    }

    /** Injected before the call that draws a tab: its label composable, or null while labels are hidden. */
    public static Object label(Object label) {
        return MaterialYou.flag(HIDE_LABELS) ? null : label;
    }

    /**
     * Injected at the start of the NavigationBar composable: the container color, which is transparent while the
     * glass look is on so the capsule behind the ComposeView shows through.
     *
     * @param color the container color as a packed Compose Color
     * @return the color to draw
     */
    public static long containerColor(long color) {
        if (!glass()) return color;
        barColor = (int) (color >>> 32);
        if (capsule != null && pageColor == 0) capsule.setColor(barColor);
        return 0L;
    }

    /**
     * Injected before each tab is drawn. A tab is told apart by its icon, the same object every time it is drawn, so
     * the position of the selected one is known even when only some of the tabs are drawn again. The label is the
     * accessibility action of the selected tab, not its text. The pill behind the selected tab is drawn by the
     * capsule, which slides it between tabs.
     */
    public static void tab(boolean selected, Object onClick, Object icon, Object modifier, Object onLongClick, String label) {
        if (slider == null || pillBar == null || icon == null || !glass()) return;
        int index = tabIcons.indexOf(icon);
        if (index < 0) {
            if (tabIcons.size() >= 8) tabIcons.clear();
            tabIcons.add(icon);
            index = tabIcons.indexOf(icon);
        }
        if (!drawn) pillBar.post(NavigationBar::finishDraw);
        drawn = true;
        if (selected) selectedIndex = index;
    }

    /** Injected before each tab of the landscape rail is drawn, which takes no label. */
    public static void railTab(boolean selected, Object onClick, Object icon) {
        tab(selected, onClick, icon, null, null, null);
    }

    /** Places the pill once the tabs of a frame are drawn. */
    private static void finishDraw() {
        drawn = false;
        syncPill();
    }

    /** The indicator the app draws behind the selected tab: none where the capsule draws its own pill. */
    public static long indicatorColor(long color) {
        if (slider == null || !glass()) return color;
        if (color != 0L && (int) (color >>> 32) != indicator) {
            indicator = (int) (color >>> 32);
            if (capsule != null) capsule.setPillColor(indicator);
        }
        return 0L;
    }

    /**
     * Moves the pill to the selected tab: on the portrait bar the tabs share its padded width, 8dp apart; on the
     * rail they are stacked in its middle.
     */
    private static void syncPill() {
        View bar = pillBar;
        int count = tabIcons.size();
        int index = selectedIndex;
        if (slider == null || bar == null || count == 0 || index < 0) return;
        float density = bar.getResources().getDisplayMetrics().density;
        if (vertical) {
            float step = (RAIL_TAB_DP + RAIL_GAP_DP) * density;
            float top = (bar.getHeight() - count * step + RAIL_GAP_DP * density) / 2 + index * step;
            slider.select(top, top + RAIL_TAB_DP * density);
            return;
        }
        float gap = 8 * density;
        float region = bar.getWidth() - bar.getPaddingLeft() - bar.getPaddingRight();
        if (region <= 0) return;
        float width = (region - gap * (count - 1)) / count;
        float left = bar.getPaddingLeft() + index * (width + gap);
        slider.select(left, left + width);
    }

    /** The color of the background the landscape rail draws behind itself: none while the bar is glass. */
    public static long railBackground(long color) {
        return glass() ? 0L : color;
    }

    /** Called when an activity comes to the front: gives its bottom bar the capsule. */
    static void install(Activity activity) {
        boolean glass = glass();
        boolean right = MaterialYou.flag(NAV_RIGHT);
        if (!glass && !right) return;
        boolean portrait = activity.getResources().getConfiguration().orientation == Configuration.ORIENTATION_PORTRAIT;
        View bar = activity.findViewById(activity.getResources().getIdentifier(
                "navigation_bar", "id", activity.getPackageName()));
        if (bar == null || bar.getTag(bar.getId()) != null) return;
        bar.setTag(bar.getId(), Boolean.TRUE);
        if (!portrait) {
            slider = null;
            pillBar = null;
            if (right) moveRight(activity, bar);
            if (glass) installLandscapeGlass(activity, bar);
            return;
        }
        if (!glass) return;
        float density = bar.getResources().getDisplayMetrics().density;
        int side = Math.round((SIDE_MARGIN_DP + INNER_PADDING_DP) * density);
        int vertical = Math.round(VERTICAL_MARGIN_DP * density);
        bar.setPadding(side, vertical, side, vertical);
        if (MaterialYou.flag(HIDE_LABELS)) {
            // The tabs are at least 80dp tall; a bar that is shorter clamps them.
            ViewGroup.LayoutParams params = bar.getLayoutParams();
            params.height = Math.round(ICON_ONLY_HEIGHT_DP * density) + 2 * vertical;
            bar.setLayoutParams(params);
        }
        GlassCapsule.clearSystemBar(activity);
        capsule = new GlassCapsule(barColor, density, new GlassCapsule.Layout() {
            @Override
            public boolean capsule(RectF out) {
                // The padding of the bar is the margin around the tabs, so the capsule hugs them.
                out.set(bar.getPaddingLeft() - INNER_PADDING_DP * density, bar.getPaddingTop(),
                        bar.getWidth() - bar.getPaddingRight() + INNER_PADDING_DP * density,
                        bar.getHeight() - bar.getPaddingBottom());
                return out.height() > 0;
            }

            @Override
            public boolean pill(RectF out) {
                if (slider == null || !slider.has()) return false;
                // As the app's own indicator: 64dp by 32dp around the icon, which sits at the top of a tab with a
                // label and in the middle of one without.
                float center = (slider.start() + slider.end()) / 2;
                float half = Math.min(PILL_WIDTH_DP * density, slider.end() - slider.start()) / 2;
                float top = MaterialYou.flag(HIDE_LABELS)
                        ? (bar.getPaddingTop() + bar.getHeight() - bar.getPaddingBottom() - PILL_HEIGHT_DP * density) / 2
                        : bar.getPaddingTop() + LABEL_PILL_TOP_DP * density;
                out.set(center - half, top, center + half, top + PILL_HEIGHT_DP * density);
                return true;
            }
        }, FILL_ALPHA);
        bar.setBackground(capsule);
        startPill(bar, false);
        matchPage(activity);
        // The bar floats over the screen like a glass bar should: the screen above it reaches down behind it.
        bar.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
            if (!(v.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) || v.getHeight() == 0) return;
            ViewGroup.MarginLayoutParams params = (ViewGroup.MarginLayoutParams) v.getLayoutParams();
            fitWidth(v);
            syncPill();
            if (params.topMargin == -v.getHeight()) return;
            params.topMargin = -v.getHeight();
            v.setLayoutParams(params);
        });
        // The lists of the screen scroll behind the bar; their last item has to be able to come out above it.
        View host = activity.findViewById(activity.getResources().getIdentifier(
                "nav_host_fragment", "id", activity.getPackageName()));
        if (host != null) {
            host.getViewTreeObserver().addOnGlobalLayoutListener(() -> padScrollers(host, host, bar.getHeight()));
        }
    }

    /** Whether the view is a scrolling list: a framework one, or an androidx RecyclerView or NestedScrollView. */
    private static boolean isScroller(View view) {
        if (view instanceof android.widget.ScrollView || view instanceof android.widget.AbsListView) return true;
        for (Class<?> type = view.getClass(); type != null; type = type.getSuperclass()) {
            String name = type.getName();
            if (name.equals("androidx.recyclerview.widget.RecyclerView")
                    || name.equals("androidx.core.widget.NestedScrollView")) return true;
        }
        return false;
    }

    /** Whether the view is the ComposeView of a whole screen, as opposed to a small one inside a row. */
    private static boolean isScreenCompose(View view, int hostHeight) {
        return view.getClass().getName().equals("androidx.compose.ui.platform.ComposeView")
                && hostHeight > 0 && view.getHeight() >= hostHeight * 0.8f;
    }

    /** Whether the view is a short, visible one whose bottom edge is the bottom edge of the host: a pinned button or bar. */
    private static boolean isBottomAnchored(View view, View host) {
        if (view.getVisibility() != View.VISIBLE || view.getHeight() == 0 || view.getHeight() >= host.getHeight() * 0.4f
                || isScroller(view)) return false;
        int bottom = view.getHeight();
        for (View v = view; v != host; v = (View) v.getParent()) {
            bottom += v.getTop();
            if (!(v.getParent() instanceof View)) return false;
        }
        return Math.abs(bottom - host.getHeight()) <= 4 * host.getResources().getDisplayMetrics().density;
    }

    /** Sets the part of a view's bottom padding that belongs to the bar, keeping the padding the app gave it. */
    private static void addBottomPadding(ViewGroup view, int extra) {
        Integer added = (Integer) view.getTag(PADDED);
        if (added != null && added == extra) return;
        int own = view.getPaddingBottom() - (added == null ? 0 : added);
        view.setClipToPadding(false);
        view.setPadding(view.getPaddingLeft(), view.getPaddingTop(), view.getPaddingRight(), own + extra);
        view.setTag(PADDED, extra);
    }

    /** Tag of a scroller that already has the bar's height added to its bottom padding, with that height. */
    private static final int PADDED = 0x46616b68;

    /**
     * Keeps the bottom padding of every scrolling list under {@code root} at its own padding plus the height of
     * the bar, so the content stops above the bar and does not clip when it scrolls behind it. The height follows
     * the bar, which is shorter without labels.
     *
     * @param host the nav host, to tell a whole-screen ComposeView from a small one and to find what is pinned to its bottom
     */
    private static void padScrollers(View root, View host, int barHeight) {
        if (barHeight <= 0) return;
        int hostHeight = host.getHeight();
        if (isScroller(root)) {
            addBottomPadding((ViewGroup) root, barHeight);
            return;
        }
        if (isScreenCompose(root, hostHeight)) {
            // A Compose list cannot take padding inside itself, so the whole screen is padded from outside: its
            // content, and buttons such as the floating one, stay above the bar and the feed ends in a cut there.
            addBottomPadding((ViewGroup) root, barHeight);
            return;
        }
        if (!(root instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (isBottomAnchored(child, host)) {
                // A button or bar pinned to the bottom of the screen would sit behind the glass bar.
                child.setTranslationY(-barHeight);
            } else {
                padScrollers(child, host, barHeight);
            }
        }
    }

    /**
     * Landscape: moves the rail from the left edge to the right one. The rail sits at the start of a
     * ConstraintLayout and the nav host fills the rest, so translating the rail to the far edge and the host
     * by the rail's width the other way swaps them without touching the (obfuscated) constraint fields.
     */
    private static void moveRight(Activity activity, View bar) {
        View host = activity.findViewById(activity.getResources().getIdentifier(
                "nav_host_fragment", "id", activity.getPackageName()));
        if (host == null || !(bar.getParent() instanceof View)) return;
        View parent = (View) bar.getParent();
        View.OnLayoutChangeListener listener = (v, l, t, r, b, ol, ot, or, ob) -> {
            int width = bar.getWidth();
            bar.setTranslationX(parent.getWidth() - bar.getLeft() - width);
            host.setTranslationX(-width);
        };
        bar.addOnLayoutChangeListener(listener);
        host.addOnLayoutChangeListener(listener);
    }

    /** Landscape: the same capsule, upright around the rail's tabs. */
    private static void installLandscapeGlass(Activity activity, View bar) {
        float density = bar.getResources().getDisplayMetrics().density;
        // The rail is 80dp wide on its own; the capsule hugs it and is only as tall as the four tabs.
        bar.setPadding(0, 0, 0, 0);
        GlassCapsule.clearSystemBar(activity);
        capsule = new GlassCapsule(barColor, density, new GlassCapsule.Layout() {
            @Override
            public boolean capsule(RectF out) {
                float height = Math.min(bar.getHeight() - 2 * VERTICAL_MARGIN_DP * density, LANDSCAPE_HEIGHT_DP * density);
                float top = (bar.getHeight() - height) / 2f;
                out.set(8 * density, top, bar.getWidth() - 8 * density, top + height);
                return out.width() > 0 && out.height() > 0;
            }

            @Override
            public boolean pill(RectF out) {
                if (slider == null || !slider.has()) return false;
                float center = (slider.start() + slider.end()) / 2;
                float half = RAIL_TAB_DP * density / 2;
                float x = bar.getWidth() / 2f;
                out.set(x - half, center - PILL_HEIGHT_DP * density / 2, x + half, center + PILL_HEIGHT_DP * density / 2);
                return true;
            }
        }, FILL_ALPHA);
        bar.setBackground(capsule);
        startPill(bar, true);
        bar.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> syncPill());
        matchPage(activity);
    }

    /** Gives a new bar its pill, which takes the color of the app's own indicator once it is known. */
    private static void startPill(View bar, boolean rail) {
        if (indicator != 0) capsule.setPillColor(indicator);
        tabIcons.clear();
        drawn = false;
        selectedIndex = -1;
        vertical = rail;
        slider = capsule.slider();
        pillBar = bar;
        syncPill();
    }

    /**
     * Gives the capsule the color of the page: the nav host is drawn once and a pixel of its left edge, where
     * screens keep a margin, is read. The container color of the bar is a darker surface that would turn the
     * capsule gray.
     */
    private static void matchPage(Activity activity) {
        View host = activity.findViewById(activity.getResources().getIdentifier(
                "nav_host_fragment", "id", activity.getPackageName()));
        if (host == null) return;
        host.getViewTreeObserver().addOnGlobalLayoutListener(new android.view.ViewTreeObserver.OnGlobalLayoutListener() {
            @Override
            public void onGlobalLayout() {
                if (host.getWidth() == 0 || host.getHeight() == 0) return;
                host.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                host.postDelayed(() -> {
                    android.graphics.Bitmap bitmap = android.graphics.Bitmap.createBitmap(
                            host.getWidth(), host.getHeight(), android.graphics.Bitmap.Config.ARGB_8888);
                    host.draw(new android.graphics.Canvas(bitmap));
                    int color = bitmap.getPixel(2, bitmap.getHeight() / 2);
                    if (Color.alpha(color) == 255 && capsule != null) {
                        pageColor = color;
                        capsule.setColor(color);
                    }
                }, 600);
            }
        });
    }

    private static boolean glass() {
        return MaterialYou.flag(GLASS);
    }

    /**
     * Injected at the return of the method that lists the tabs of the bar, which both the bar and the start tab
     * read: drops the tabs switched off in the sheet, and keeps them all when none would be left.
     */
    public static List<Object> tabs(List<Object> tabs) {
        allTabs = new ArrayList<>(tabs);
        List<Object> shown = new ArrayList<>();
        for (Object tab : tabs) {
            if (!hidden(labelName(tab))) shown.add(tab);
        }
        List<Object> result = shown.isEmpty() ? tabs : shown;
        tabCount = result.size();
        return result;
    }

    /**
     * Pads the portrait bar so its tabs are at most {@link GlassTabs#MAX_TAB_DP} wide and centered, as on LinkedIn: the
     * capsule hugs the padding, so fewer tabs give a shorter capsule. Changes the padding only when it moves, since
     * setting it lays the bar out again.
     */
    private static void fitWidth(View bar) {
        int count = tabCount > 0 ? tabCount : tabIcons.size();
        if (count == 0 || bar.getWidth() == 0) return;
        float density = bar.getResources().getDisplayMetrics().density;
        int side = GlassTabs.sidePadding(bar.getWidth(), count, Math.round(TAB_GAP_DP * density),
                Math.round((SIDE_MARGIN_DP + INNER_PADDING_DP) * density), density);
        if (bar.getPaddingLeft() != side || bar.getPaddingRight() != side) {
            bar.setPadding(side, bar.getPaddingTop(), side, bar.getPaddingBottom());
        }
    }

    /** Whether the user switched the tab named [name] off; the Home tab never is, as the app starts on it. */
    static boolean hidden(String name) {
        return !HOME_TAB.equals(name) && MaterialYou.flag(HIDE_TAB + name);
    }

    /**
     * The label of a tab, as a string resource id. The tab keeps it in one of its int fields, next to its icons,
     * so it is the one that names a string; 0 when none does.
     */
    static int labelId(Object tab) {
        Context context = AppRuntime.application();
        if (context == null) return 0;
        for (Class<?> type = tab.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (field.getType() != int.class || Modifier.isStatic(field.getModifiers())) continue;
                try {
                    field.setAccessible(true);
                    int id = field.getInt(tab);
                    if (id != 0 && "string".equals(context.getResources().getResourceTypeName(id))) return id;
                } catch (ReflectiveOperationException | Resources.NotFoundException ignored) {
                }
            }
        }
        return 0;
    }

    /** The resource name of a tab's label, such as menu_home, which names its setting across app versions. */
    static String labelName(Object tab) {
        int id = labelId(tab);
        Context context = AppRuntime.application();
        return id == 0 || context == null ? String.valueOf(tab) : context.getResources().getResourceEntryName(id);
    }
}
