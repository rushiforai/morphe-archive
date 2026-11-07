package app.fakh.extension.linkedin;

import android.animation.ValueAnimator;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.DecelerateInterpolator;

import app.fakh.extension.shared.GlassCapsule;

/** Draws LinkedIn's bottom bar as a floating, translucent capsule, using the shared {@link GlassCapsule}. */
final class GlassNavigationBar {
    private static final int SIDE_MARGIN_DP = 12;
    private static final int INNER_PADDING_DP = 14;
    /** The widest a tab gets, so the capsule stays compact on a wide screen. */
    private static final int MAX_TAB_DP = 96;

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
        selection.glass = capsule;
        bar.setBackground(capsule);
        // On a light theme the app paints both backgrounds again after the bar is shown, so the capsule goes back.
        bar.getViewTreeObserver().addOnPreDrawListener(() -> {
            if (bar.getBackground() != capsule) bar.setBackground(capsule);
            if (tabs.getBackground() != null) tabs.setBackground(null);
            // Selecting a tab redraws the tab, not the bar, so the pill behind the selected tab is refreshed here.
            selection.refreshSelection();
            return true;
        });
    }

    /** Gives the tabs equal shares of the capsule, and a ripple that stays inside the tab. */
    static void arrangeTabs(ViewGroup tabs, int barWidth) {
        int count = tabs.getChildCount();
        if (count == 0 || barWidth <= 0) return;
        float density = tabs.getResources().getDisplayMetrics().density;
        int width = Math.min((barWidth - 2 * Math.round((SIDE_MARGIN_DP + INNER_PADDING_DP) * density)) / count,
                Math.round(MAX_TAB_DP * density));
        for (int i = 0; i < count; i++) {
            View tab = tabs.getChildAt(i);
            ViewGroup.LayoutParams params = tab.getLayoutParams();
            if (params.width != width) {
                params.width = width;
                tab.setLayoutParams(params);
            }
            if (!(tab.getBackground() instanceof TabRipple)) tab.setBackground(new TabRipple());
        }
    }

    /** A ripple that stays inside its tab, as a pill, where LinkedIn's own one spreads past the capsule. */
    private static final class TabRipple extends RippleDrawable {
        TabRipple() {
            super(ColorStateList.valueOf(0x33808080), null, mask());
        }

        private static Drawable mask() {
            GradientDrawable mask = new GradientDrawable();
            mask.setColor(Color.WHITE);
            mask.setCornerRadius(Float.MAX_VALUE);
            return mask;
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
        private int selected = -1;
        /** Where the pill was drawn last (in the tabs' coordinates), and how far it is on its way to the selected tab. */
        private float lastLeft;
        private float lastRight;
        private float fromLeft;
        private float fromRight;
        private float progress = 1;
        private ValueAnimator slide;
        /** Left edge of the tabs in the bar, set by {@link #capsule} for {@link #pill}. */
        private float left;

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
            if (now == selected) return;
            boolean moving = selected >= 0 && now >= 0 && lastRight > lastLeft;
            selected = now;
            if (slide != null) slide.cancel();
            if (moving) {
                // The pill slides from where it is to the new tab.
                fromLeft = lastLeft;
                fromRight = lastRight;
                progress = 0;
                slide = ValueAnimator.ofFloat(0, 1).setDuration(260);
                slide.setInterpolator(new DecelerateInterpolator());
                slide.addUpdateListener(a -> {
                    progress = (float) a.getAnimatedValue();
                    glass.invalidateSelf();
                });
                slide.start();
            } else {
                progress = 1;
            }
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
            return true;
        }

        @Override
        public boolean pill(RectF out) {
            if (selected < 0 || selected >= tabs.getChildCount()) return false;
            // A pill behind the selected tab, inset from the capsule so a thin rim of it stays around the pill.
            View tab = tabs.getChildAt(selected);
            float inset = 5 * density;
            lastLeft = fromLeft + (tab.getLeft() - fromLeft) * progress;
            lastRight = fromRight + (tab.getRight() - fromRight) * progress;
            if (progress >= 1) {
                lastLeft = tab.getLeft();
                lastRight = tab.getRight();
            }
            View row = (View) tabs.getParent();
            float top = row.getTop() + tabs.getTop();
            out.set(left + lastLeft + inset, top + inset, left + lastRight - inset, top + tabs.getHeight() - inset);
            return true;
        }
    }
}
