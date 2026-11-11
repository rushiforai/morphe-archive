package app.fakh.extension.linkedin;

import android.graphics.Color;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;

import app.fakh.extension.shared.GlassCapsule;
import app.fakh.extension.shared.GlassTabs;
import app.fakh.extension.shared.TabSlide;

/** Draws LinkedIn's bottom bar as a floating, translucent capsule, using the shared {@link GlassCapsule}. */
final class GlassNavigationBar {
    private static final int SIDE_MARGIN_DP = 12;
    private static final int INNER_PADDING_DP = 7;
    /** How far the pill stays in from the capsule's edges, and how far past its tab it reaches on either side. */
    private static final int PILL_INSET_DP = 4;
    private static final int PILL_GROW_DP = 4;
    private static final String ICON = "slim_notification_badge_icon";
    private static final String LABEL = "slim_notification_badge_label";

    private GlassNavigationBar() {
    }

    /** Replaces the background of the bar with the capsule, and removes what the app draws apart from it. */
    static void install(View bar, ViewGroup tabs) {
        Drawable background = tabs.getBackground();
        int color = background instanceof ColorDrawable ? ((ColorDrawable) background).getColor() : Color.DKGRAY;
        tabs.setBackground(null);
        // The app sets the visibility and alpha of these itself when the tab changes.
        for (String name : new String[]{"bb_slim_bottom_bar_shadow", "bottom_nav_indicator_view"}) {
            View view = NavigationBar.child(bar, name);
            if (view != null) view.setScaleY(0);
        }
        GlassCapsule.clearSystemBar(bar.getContext());
        bar.setElevation(0);
        float density = bar.getResources().getDisplayMetrics().density;
        Selection selection = new Selection(tabs, density);
        GlassCapsule capsule = new GlassCapsule(color, density, selection);
        // The selected tab takes the accent: the wallpaper's with Material You, LinkedIn blue without.
        selection.accent = app.fakh.extension.shared.MaterialYou.accent(bar.getContext(), Settings.materialYou(), 0xFF0A66C2, 0xFF70B5F9);
        // The pill takes the accent's wash with Material You, and stays neutral gray without it.
        if (app.fakh.extension.shared.MaterialYou.wallpaper(Settings.materialYou())) capsule.setAccent(selection.accent);
        selection.glass = capsule;
        bar.setBackground(capsule);
        capsule.setLiquid(Settings.liquidGlass());
        TabSlide.install(bar, capsule, false, TabSlide.children(tabs, tabs));
        // On a light theme the app paints both backgrounds again after the bar is shown, so the capsule goes back.
        bar.getViewTreeObserver().addOnPreDrawListener(() -> {
            if (bar.getBackground() != capsule) bar.setBackground(capsule);
            if (tabs.getBackground() != null) tabs.setBackground(null);
            // Selecting a tab redraws the tab, not the bar, so the pill behind the selected tab is refreshed here.
            selection.refreshSelection();
            return true;
        });
    }

    /** Gives the tabs equal shares of the capsule, and no press ripple: the pill already shows the tab. */
    static void arrangeTabs(ViewGroup tabs, int barWidth) {
        int count = tabs.getChildCount();
        if (count == 0 || barWidth <= 0) return;
        float density = tabs.getResources().getDisplayMetrics().density;
        int width = GlassTabs.tabWidth(barWidth - 2 * Math.round((SIDE_MARGIN_DP + INNER_PADDING_DP) * density), count, density);
        for (int i = 0; i < count; i++) {
            View tab = tabs.getChildAt(i);
            ViewGroup.LayoutParams params = tab.getLayoutParams();
            if (params.width != width) {
                params.width = width;
                tab.setLayoutParams(params);
            }
            if (tab.getBackground() != null) tab.setBackground(null);
        }
    }

    /**
     * Where the capsule and the pill behind the selected tab are, for the shared {@link GlassCapsule}: the capsule
     * wraps the tabs, which the row centers, and the pill slides to the tab that became selected.
     */
    private static final class Selection implements GlassCapsule.Layout {
        private final ViewGroup tabs;
        private final float density;
        private GlassCapsule glass;
        private int accent;
        private int selected = -1;
        /** Left edge of the tabs in the bar, set by {@link #capsule} for {@link #pill}. */
        private float left;
        /** The capsule's edges, set by {@link #capsule}, which the pill stays inside. */
        private float capsuleLeft;
        private float capsuleRight;

        Selection(ViewGroup tabs, float density) {
            this.tabs = tabs;
            this.density = density;
        }

        /** Redraws the capsule when another tab became the selected one. */
        void refreshSelection() {
            int now = -1;
            for (int i = 0; i < tabs.getChildCount() && now < 0; i++) {
                if (tabs.getChildAt(i).isSelected()) now = i;
            }
            // The tabs get their width after the first layout, so the pill follows them every time.
            if (now >= 0) glass.slider().select(tabs.getChildAt(now).getLeft(), tabs.getChildAt(now).getRight());
            if (now == selected) return;
            if (selected >= 0 && selected < tabs.getChildCount()) {
                for (int i = 0; i < tabs.getChildCount(); i++) {
                    if (i == selected || i == now) continue;
                    View tab = tabs.getChildAt(selected);
                    View like = tabs.getChildAt(i);
                    GlassCapsule.untint(NavigationBar.child(tab, ICON), NavigationBar.child(tab, LABEL),
                            NavigationBar.child(like, ICON), NavigationBar.child(like, LABEL));
                    break;
                }
            }
            if (now >= 0) {
                View tab = tabs.getChildAt(now);
                GlassCapsule.tint(NavigationBar.child(tab, ICON), NavigationBar.child(tab, LABEL), accent);
            }
            selected = now;
            glass.invalidateSelf();
        }

        @Override
        public boolean capsule(RectF out) {
            int count = tabs.getChildCount();
            if (count == 0) return false;
            View row = (View) tabs.getParent();
            float top = row.getTop() + tabs.getTop();
            left = row.getLeft() + tabs.getLeft();
            float padding = INNER_PADDING_DP * density;
            out.set(left + tabs.getChildAt(0).getLeft() - padding, top,
                    left + tabs.getChildAt(count - 1).getRight() + padding, top + tabs.getHeight());
            capsuleLeft = out.left;
            capsuleRight = out.right;
            return true;
        }

        @Override
        public boolean pill(RectF out) {
            if (selected < 0 || selected >= tabs.getChildCount() || !glass.slider().has()) return false;
            // A pill a little wider than the selected tab, with a thin rim of the capsule all around it.
            float inset = PILL_INSET_DP * density;
            float grow = PILL_GROW_DP * density;
            View row = (View) tabs.getParent();
            float top = row.getTop() + tabs.getTop();
            out.set(Math.max(capsuleLeft + inset, left + glass.slider().start() - grow), top + inset,
                    Math.min(capsuleRight - inset, left + glass.slider().end() + grow), top + tabs.getHeight() - inset);
            return true;
        }
    }
}
