package app.badfella.extension.linkedin;

import android.graphics.Color;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;

/** Draws LinkedIn's bottom bar as a floating, translucent capsule, using the {@link GlassCapsule}. */
final class GlassNavigationBar {
    private static final int SIDE_MARGIN_DP = 12;
    private static final int INNER_PADDING_DP = 7;
    /** Room the capsule leaves above and below the tabs, so the icons sit in the middle of it. */
    private static final int CAPSULE_ROOM_DP = 6;
    /** Room the floating capsule leaves under itself, on top of the system navigation bar. */
    private static final int FLOATING_MARGIN_DP = 10;
    /** How far the pill behind the selected tab is inset from the capsule. */
    private static final int PILL_INSET_DP = 4;
    private static final int PILL_GROW_DP = 4;
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
        // The room the capsule floats in is the bar's own padding, and its shadow reaches into it.
        if (bar instanceof ViewGroup) {
            ((ViewGroup) bar).setClipToPadding(false);
            ((ViewGroup) bar).setClipChildren(false);
        }
        float density = bar.getResources().getDisplayMetrics().density;
        Selection selection = new Selection(bar, tabs, density);
        GlassCapsule capsule = new GlassCapsule(color, density, selection);
        selection.glass = capsule;
        bar.setBackground(capsule);
        // On a light theme the app paints both backgrounds again after the bar is shown, so the capsule goes back.
        bar.getViewTreeObserver().addOnPreDrawListener(() -> {
            if (bar.getBackground() != capsule) bar.setBackground(capsule);
            if (tabs.getBackground() != null) tabs.setBackground(null);
            // Selecting a tab redraws the tab, not the bar, so the pill behind the selected tab is refreshed here.
            selection.refreshSelection();
            selection.floatOverSystemBar();
            return true;
        });
    }

    /** Gives the tabs equal shares of the capsule, and no press ripple: the selection pill provides feedback. */
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
            if (tab.getBackground() != null) tab.setBackground(null);
            if (tab.getForeground() != null) tab.setForeground(null);
        }
    }

    /**
     * Where the capsule and the pill behind the selected tab are, for the {@link GlassCapsule}: the capsule
     * wraps the tabs and the room above and below them, which the row centers, and the pill slides to the tab that
     * became selected. The bar is also padded so the capsule floats clear of the system navigation bar.
     */
    private static final class Selection implements GlassCapsule.Layout {
        private final View bar;
        private final ViewGroup tabs;
        private final float density;
        /** The bar's own padding, taken before the floating room was added to it. */
        private final int[] own = new int[4];
        /** The padding this last gave the bar, so a change by the app can be told apart from its own. */
        private final int[] given = {-1, -1, -1, -1};
        private GlassCapsule glass;
        private int selected = -1;
        /** The capsule's edges in the bar, set by {@link #capsule} for {@link #pill}. */
        private float left;
        private float top;
        private float bottom;
        private float capsuleLeft;
        private float capsuleRight;

        Selection(View bar, ViewGroup tabs, float density) {
            this.bar = bar;
            this.tabs = tabs;
            this.density = density;
        }

        /** Redraws the capsule when another tab became the selected one. */
        void refreshSelection() {
            int now = -1;
            for (int i = 0; i < tabs.getChildCount() && now < 0; i++) {
                if (tabs.getChildAt(i).isSelected()) now = i;
            }
            if (now >= 0) {
                View tab = tabs.getChildAt(now);
                glass.slider().select(tab.getLeft(), tab.getRight());
            }
            if (now == selected) return;
            selected = now;
            glass.invalidateSelf();
        }

        /**
         * Pads the bar so the capsule floats above the system navigation bar: the bar keeps its own padding, and the
         * room the capsule needs above and below the tabs, the floating margin and whatever the tab row is still
         * short of clearing the navigation bar are added to it. The row already clear of the bar, as on a phone
         * whose app is inset from the system bars, only gets the capsule's room and the margin.
         */
        void floatOverSystemBar() {
            int height = tabs.getHeight();
            if (height <= 0 || bar.getHeight() <= 0) return;
            // A padding that is not the one this gave the bar was set by the app, and becomes the new starting point.
            if (bar.getPaddingLeft() != given[0] || bar.getPaddingTop() != given[1]
                    || bar.getPaddingRight() != given[2] || bar.getPaddingBottom() != given[3]) {
                own[0] = bar.getPaddingLeft();
                own[1] = bar.getPaddingTop();
                own[2] = bar.getPaddingRight();
                own[3] = bar.getPaddingBottom();
            }
            int room = Math.round(CAPSULE_ROOM_DP * density);
            int margin = Math.round(FLOATING_MARGIN_DP * density);
            // How much of the window is below the bar, which the system navigation bar overlays: 0 on a bar that
            // runs to the bottom edge of the screen. The slide that hides the bar does not move its layout.
            int[] at = new int[2];
            bar.getLocationInWindow(at);
            int below = Math.round(bar.getRootView().getHeight()
                    - (at[1] - bar.getTranslationY() + bar.getHeight()));
            int under = room + Math.max(0, navigationBar() - below + margin - own[3]);
            int above = own[1] + room;
            int down = own[3] + under;
            if (bar.getPaddingTop() != above || bar.getPaddingBottom() != down) {
                bar.setPadding(own[0], above, own[2], down);
            }
            given[0] = own[0];
            given[1] = above;
            given[2] = own[2];
            given[3] = down;
        }

        /** The height of the system navigation bar over the window's bottom edge, or 0 when the phone has none. */
        private int navigationBar() {
            WindowInsets insets = bar.getRootWindowInsets();
            // The stable inset is the navigation bar without the keyboard. LinkedIn runs on Android 10 and newer.
            if (insets == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) return 0;
            return insets.getStableInsetBottom();
        }

        @Override
        public boolean capsule(RectF out) {
            int count = tabs.getChildCount();
            if (count == 0) return false;
            View row = (View) tabs.getParent();
            float room = Math.round(CAPSULE_ROOM_DP * density);
            left = row.getLeft() + tabs.getLeft();
            top = row.getTop() + tabs.getTop() - room;
            bottom = top + tabs.getHeight() + 2 * room;
            float padding = INNER_PADDING_DP * density;
            capsuleLeft = left + tabs.getChildAt(0).getLeft() - padding;
            capsuleRight = left + tabs.getChildAt(count - 1).getRight() + padding;
            out.set(capsuleLeft, top, capsuleRight, bottom);
            return true;
        }

        @Override
        public boolean pill(RectF out) {
            if (selected < 0 || selected >= tabs.getChildCount() || !glass.slider().has()) return false;
            float inset = PILL_INSET_DP * density;
            float grow = PILL_GROW_DP * density;
            out.set(Math.max(capsuleLeft + inset, left + glass.slider().start() - grow), top + inset,
                    Math.min(capsuleRight - inset, left + glass.slider().end() + grow), bottom - inset);
            return true;
        }
    }
}
