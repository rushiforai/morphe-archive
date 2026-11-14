package app.fakh.extension.smartlife;

import android.content.Context;
import android.graphics.RectF;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TabHost;
import android.widget.TabWidget;

import app.fakh.extension.shared.GlassCapsule;
import app.fakh.extension.shared.GlassTabs;
import app.fakh.extension.shared.TabSlide;

/**
 * Draws the bottom bar of Smart Life, Tuya Smart and BARDI (a {@link TabWidget} in the app's tab host) as a floating,
 * translucent capsule with the shared {@link GlassCapsule}. The icons and labels keep the app's own colors, and the
 * pill behind the selected tab stays neutral.
 */
public final class GlassNavigationBar {
    private static final int SIDE_MARGIN_DP = 12;
    private static final int BOTTOM_MARGIN_DP = 6;
    /** Space between the capsule and the AI ask bar above it. */
    private static final int AI_BAR_GAP_DP = 6;
    /** How opaque the AI ask bar's glass is, like the cards'. */
    private static final float AI_BAR_FILL_ALPHA = 0.92f;
    /** Room above and below the capsule for its shadow, which the bar's bounds would cut off. */
    private static final int SHADOW_DP = 1;
    /** How far the pill stays in from the capsule's edges, and how far past its tab it reaches on either side. */
    private static final int INNER_PADDING_DP = 8;
    private static final int PILL_INSET_DP = 3;
    private static final int PILL_GROW_DP = 4;

    private GlassNavigationBar() {
    }

    /**
     * Injected after the tab host adds a tab; only the first call installs the capsule.
     *
     * @param host the app's tab host
     */
    public static void install(TabHost host) {
        if (!Switches.liquidGlass(host.getContext())) return;
        TabWidget widget = host.getTabWidget();
        if (widget == null || widget.getBackground() instanceof GlassCapsule) return;
        Context context = host.getContext();
        float density = context.getResources().getDisplayMetrics().density;
        Selection selection = new Selection(widget, density);
        GlassCapsule capsule = new GlassCapsule(GlassCards.tint(context), density, selection);
        selection.glass = capsule;
        capsule.setShadowRings(3);
        capsule.setBevel(true);

        // The divider line above the bar has no place on a floating capsule.
        int divider = context.getResources().getIdentifier("tab_divider", "id", context.getPackageName());
        View line = divider == 0 ? null : host.findViewById(divider);
        if (line != null) line.setScaleY(0);

        // The bar keeps the app's height: its theme sets the height again on every layout, so a taller bar would
        // never settle. Only the bottom margin changes, which lifts the capsule off the screen's edge.
        ViewGroup.LayoutParams params = widget.getLayoutParams();
        if (params instanceof FrameLayout.LayoutParams) {
            ((FrameLayout.LayoutParams) params).bottomMargin = Math.round(BOTTOM_MARGIN_DP * density);
            widget.setLayoutParams(params);
        }
        // The capsule's shadow reaches past the bar's bounds.
        if (widget.getParent() instanceof ViewGroup) ((ViewGroup) widget.getParent()).setClipChildren(false);
        GlassCapsule.clearSystemBar(context);
        widget.setBackground(capsule);
        TabSlide.install(widget, capsule, false, TabSlide.children(widget, widget));
        // The AI ask bar sits right on top of where the app's bar was; it moves up as far as the capsule was lifted,
        // plus a gap, so it doesn't cover the capsule's top edge. The app adds it after the tabs.
        int aiBar = context.getResources().getIdentifier("hometab_hey_entry_host", "id", context.getPackageName());
        float lift = -(BOTTOM_MARGIN_DP + AI_BAR_GAP_DP) * density;
        widget.getViewTreeObserver().addOnPreDrawListener(() -> {
            if (widget.getBackground() != capsule) widget.setBackground(capsule);
            selection.arrange();
            selection.refresh();
            View ask = aiBar == 0 ? null : widget.getRootView().findViewById(aiBar);
            if (ask != null) {
                if (ask.getTranslationY() != lift) ask.setTranslationY(lift);
                glassAiBar(ask, density);
            }
            return true;
        });
    }

    /**
     * Draws the AI ask bar's pill as the same glass as the capsule under it. The app draws the pill as a CardView; its
     * background becomes a glass capsule with no halo, as the app's own shadow layout already shades around it.
     */
    private static void glassAiBar(View ask, float density) {
        int id = ask.getResources().getIdentifier("layoutAiBar", "id", ask.getContext().getPackageName());
        View pill = id == 0 ? null : ask.findViewById(id);
        if (pill == null || pill.getBackground() instanceof GlassCapsule) return;
        GlassCapsule glass = new GlassCapsule(GlassCards.tint(pill.getContext()), density, new GlassCapsule.Layout() {
            @Override
            public boolean capsule(RectF out) {
                out.set(0, 0, pill.getWidth(), pill.getHeight());
                return out.width() > 0;
            }

            @Override
            public boolean pill(RectF out) {
                return false;
            }
        }, AI_BAR_FILL_ALPHA);
        glass.setShadowRings(0);
        glass.setBevel(true);
        pill.setBackground(glass);
    }

    /** Where the capsule and the pill behind the selected tab are, for the shared {@link GlassCapsule}. */
    private static final class Selection implements GlassCapsule.Layout {
        private final TabWidget widget;
        private final float density;
        private GlassCapsule glass;

        Selection(TabWidget widget, float density) {
            this.widget = widget;
            this.density = density;
        }

        /** Centers the tabs with at most 96 dp each, so the capsule follows the number of tabs. */
        void arrange() {
            int count = widget.getChildCount();
            if (count == 0 || widget.getWidth() == 0) return;
            int side = GlassTabs.sidePadding(widget.getWidth(), count, 0, Math.round(SIDE_MARGIN_DP * density), density);
            if (widget.getPaddingLeft() != side || widget.getPaddingRight() != side) {
                widget.setPadding(side, widget.getPaddingTop(), side, widget.getPaddingBottom());
            }
        }

        /** Moves the pill to the selected tab; the tabs get their final width only after the first layout. */
        void refresh() {
            for (int i = 0; i < widget.getChildCount(); i++) {
                View tab = widget.getChildAt(i);
                if (tab.isSelected()) {
                    glass.slider().select(tab.getLeft(), tab.getRight());
                    return;
                }
            }
        }

        @Override
        public boolean capsule(RectF out) {
            int count = widget.getChildCount();
            if (count == 0) return false;
            float shadow = SHADOW_DP * density;
            out.set(widget.getChildAt(0).getLeft(), shadow, widget.getChildAt(count - 1).getRight(),
                    widget.getHeight() - shadow);
            out.inset(-Math.min(INNER_PADDING_DP * density, widget.getPaddingLeft()), 0);
            return out.width() > 0;
        }

        @Override
        public boolean pill(RectF out) {
            if (!glass.slider().has()) return false;
            float inset = (SHADOW_DP + PILL_INSET_DP) * density;
            float grow = PILL_GROW_DP * density;
            out.set(glass.slider().start() - grow, inset, glass.slider().end() + grow, widget.getHeight() - inset);
            return true;
        }
    }
}
