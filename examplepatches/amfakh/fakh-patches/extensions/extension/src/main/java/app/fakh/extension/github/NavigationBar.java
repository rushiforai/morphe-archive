package app.fakh.extension.github;

import android.app.Activity;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.RectF;
import android.view.View;
import android.view.ViewGroup;

import app.fakh.extension.shared.GlassCapsule;

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

    private static final int SIDE_MARGIN_DP = 12;
    private static final int INNER_PADDING_DP = 14;
    private static final int VERTICAL_MARGIN_DP = 6;
    /** More see-through than the default, so the feed behind the bar is visible. */
    private static final float FILL_ALPHA = 0.5f;
    /** Height of the tabs when they have no label; with a label the bar keeps the height the app gives it. */
    private static final int ICON_ONLY_HEIGHT_DP = 56;

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
        if (capsule != null) capsule.setColor(barColor);
        return 0L;
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
                out.set(SIDE_MARGIN_DP * density, bar.getPaddingTop(), bar.getWidth() - SIDE_MARGIN_DP * density,
                        bar.getHeight() - bar.getPaddingBottom());
                return out.height() > 0;
            }

            @Override
            public boolean pill(RectF out) {
                return false;
            }
        }, FILL_ALPHA);
        bar.setBackground(capsule);
        // The bar floats over the screen like a glass bar should: the screen above it reaches down behind it.
        bar.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
            if (!(v.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) || v.getHeight() == 0) return;
            ViewGroup.MarginLayoutParams params = (ViewGroup.MarginLayoutParams) v.getLayoutParams();
            if (params.topMargin == -v.getHeight()) return;
            params.topMargin = -v.getHeight();
            v.setLayoutParams(params);
        });
        // The lists of the screen scroll behind the bar; their last item has to be able to come out above it.
        View host = activity.findViewById(activity.getResources().getIdentifier(
                "nav_host_fragment", "id", activity.getPackageName()));
        if (host != null) {
            host.getViewTreeObserver().addOnGlobalLayoutListener(() -> padScrollers(host, host.getHeight(), bar.getHeight()));
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
     * @param hostHeight height of the nav host, to tell a whole-screen ComposeView from a small one
     */
    private static void padScrollers(View root, int hostHeight, int barHeight) {
        if (barHeight <= 0) return;
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
        for (int i = 0; i < group.getChildCount(); i++) padScrollers(group.getChildAt(i), hostHeight, barHeight);
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
                return false;
            }
        }, FILL_ALPHA);
        bar.setBackground(capsule);
    }

    private static boolean glass() {
        return MaterialYou.flag(GLASS);
    }
}
