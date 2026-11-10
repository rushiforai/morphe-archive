package app.fakh.extension.jira;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.RectF;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

import app.fakh.extension.shared.GlassCapsule;

/**
 * Draws Jira's bottom bar (a Material 3 BottomNavigationView) as a floating, translucent capsule with the shared
 * {@link GlassCapsule}. The bar's own active indicator is hidden and the capsule's pill slides in its place.
 */
public final class GlassNavigationBar {
    private static final int SIDE_MARGIN_DP = 8;
    private static final int VERTICAL_MARGIN_DP = 6;
    private static final int PILL_WIDTH_DP = 64;
    private static final int PILL_HEIGHT_DP = 32;
    /** Space between the capsule's edge and the first and last tab, so a long label such as "Notifications" fits. */
    private static final int INNER_PADDING_DP = 8;
    private static final float LABEL_SP = 10f;
    /** Space above and below the pill when the labels are hidden. */
    private static final int NO_LABEL_PADDING_DP = 14;
    /** Distance between the capsule and the bar's bottom edge when the labels are hidden. */
    private static final int NO_LABEL_BOTTOM_MARGIN_DP = 10;
    /** How opaque the capsule is; the page shows through the rest. */
    private static final float FILL_ALPHA = 0.8f;

    private GlassNavigationBar() {
    }

    /**
     * Injected at the end of the bar's constructor: waits until the bar has its tabs, then puts the capsule behind
     * them.
     *
     * @param view the FoldableBottomNav being built
     */
    public static void install(final View view) {
        view.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
            private Selection selection;

            @Override
            public boolean onPreDraw() {
                if (selection == null) {
                    if (!(view instanceof ViewGroup) || ((ViewGroup) view).getChildCount() == 0) return true;
                    selection = new Selection(view);
                    selection.attach();
                }
                // When the bar had to change its tabs or width, the frame is skipped and laid out again first: the
                // selection animation makes the library show every tab and label again, which would flash full size.
                return !selection.refresh();
            }
        });
    }

    /** The id of a view the Material library gives its bar items, or 0. */
    private static int id(View bar, String name) {
        return bar.getResources().getIdentifier(name, "id", bar.getContext().getPackageName());
    }

    /** The surface color of the current theme, which the capsule's translucent fill starts from. */
    private static int surface(Context context) {
        boolean night = (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        for (String name : new String[] {"colorSurfaceContainer", "colorSurface"}) {
            int attr = context.getResources().getIdentifier(name, "attr", context.getPackageName());
            TypedValue value = new TypedValue();
            if (attr != 0 && context.getTheme().resolveAttribute(attr, value, true)
                    && value.type >= TypedValue.TYPE_FIRST_COLOR_INT && value.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                return value.data;
            }
        }
        return night ? 0xFF1F1F1F : 0xFFFFFFFF;
    }

    /**
     * Where the capsule and the pill are, for the shared {@link GlassCapsule}: the capsule wraps the tab row, and the
     * pill sits where the bar's own indicator would, on the selected tab.
     */
    private static final class Selection implements GlassCapsule.Layout {
        private final View bar;
        private final float density;
        private final int accent;
        private GlassCapsule glass;
        private int selected = -1;
        private long lastUnclip;
        private boolean menuApplied;
        /** Set when a pass changed the tabs or the width, so the frame has to be laid out again. */
        private boolean relaid;
        /** The capsule's left and right edges in the bar, around the visible tabs. */
        private float spanLeft;
        private float spanRight;
        /** True when the tabs put the label beside the icon, as the bar does in landscape. */
        private boolean sideBySide;

        Selection(View bar) {
            this.bar = bar;
            this.density = bar.getResources().getDisplayMetrics().density;
            this.accent = app.fakh.extension.shared.MaterialYou.accent(bar.getContext(), MaterialYou.materialYou(bar.getContext()), 0xFF1868DB, 0xFF669DF1);
        }

        /** Replaces the bar's background with the capsule. */
        void attach() {
            glass = new GlassCapsule(surface(bar.getContext()), density, this, FILL_ALPHA);
            glass.setAccent(accent);
            GlassCapsule.clearSystemBar(bar.getContext());
            bar.setElevation(0);
            // The screen animates layout changes of its children (animateLayoutChanges), so every time the library
            // resets the tabs the bar would animate from its full size back to the fitted one.
            if (bar.getParent() instanceof ViewGroup) ((ViewGroup) bar.getParent()).setLayoutTransition(null);
            // The capsule's shadow reaches past the bar, so the screen must not clip it to the bar's bounds.
            for (View v = bar; v.getParent() instanceof ViewGroup && v != bar.getRootView(); v = (View) v.getParent()) {
                ((ViewGroup) v.getParent()).setClipChildren(false);
                if (!(v.getParent() instanceof View)) break;
            }
            int sides = Math.round((SIDE_MARGIN_DP + INNER_PADDING_DP) * density);
            bar.setPadding(bar.getPaddingLeft() + sides, bar.getPaddingTop(), bar.getPaddingRight() + sides, bar.getPaddingBottom());
            bar.setBackground(glass);
        }

        /** The row of tabs, which is the bar's first child. */
        private ViewGroup tabs() {
            View first = ((ViewGroup) bar).getChildAt(0);
            return first instanceof ViewGroup ? (ViewGroup) first : null;
        }

        /**
         * The pages leave room for the bar by padding their containers, which clips the content at the padding. The
         * containers stop clipping, so the content runs on behind the translucent capsule; the padding stays, so the
         * last item can still be scrolled above it.
         */
        private void unclip(View view, int minPadding) {
            if (!(view instanceof ViewGroup)) return;
            ViewGroup group = (ViewGroup) view;
            if (group.getPaddingBottom() >= minPadding && group.getClipToPadding()) group.setClipToPadding(false);
            for (int i = 0; i < group.getChildCount(); i++) unclip(group.getChildAt(i), minPadding);
        }

        /** Keeps the capsule on the bar, hides the app's indicator, and follows the selected tab. */
        boolean refresh() {
            ViewGroup tabs = tabs();
            if (tabs == null || tabs.getChildCount() == 0) return false;
            relaid = false;
            if (!menuApplied) hideTabsInMenu();
            if (bar.getBackground() != glass) bar.setBackground(glass);
            // The pages change with the tab, so their containers are visited again every half second.
            long tick = android.os.SystemClock.uptimeMillis();
            if (tick - lastUnclip > 500 && bar.getParent() instanceof View) {
                lastUnclip = tick;
                unclip(((View) bar.getParent()).findViewById(id(bar, "mainVp")), Math.round(bar.getHeight() * 0.6f));
            }
            int icon = id(bar, "navigation_bar_item_icon_view");
            int large = id(bar, "navigation_bar_item_large_label_view");
            int small = id(bar, "navigation_bar_item_small_label_view");
            int indicator = id(bar, "navigation_bar_item_active_indicator_view");
            int now = -1;
            for (int i = 0; i < tabs.getChildCount(); i++) {
                View tab = tabs.getChildAt(i);
                View name = tab.findViewById(large);
                CharSequence title = name instanceof android.widget.TextView ? ((android.widget.TextView) name).getText() : null;
                int visibility = MaterialYou.tabShown(bar.getContext(), title) ? View.VISIBLE : View.GONE;
                if (tab.getVisibility() != visibility) {
                    tab.setVisibility(visibility);
                    relaid = true;
                }
                View own = tab.findViewById(indicator);
                if (own != null) {
                    own.setBackground(null);
                    own.setAlpha(0f);
                }
                if (tab.isSelected()) now = i;
                for (int label : new int[] {large, small}) {
                    View text = tab.findViewById(label);
                    if (text instanceof android.widget.TextView && MaterialYou.hideTabLabels(bar.getContext())) {
                        // Made invisible and one pixel tall instead of GONE: the library shows the labels again
                        // whenever a tab is selected, which would make the bar jump to its labeled height.
                        android.widget.TextView hidden = (android.widget.TextView) text;
                        if (hidden.getTextSize() != 1f) hidden.setTextSize(TypedValue.COMPLEX_UNIT_PX, 1f);
                        if (hidden.getAlpha() != 0f) hidden.setAlpha(0f);
                        continue;
                    }
                    if (text instanceof android.widget.TextView
                            && ((android.widget.TextView) text).getTextSize() != LABEL_SP * bar.getResources().getDisplayMetrics().scaledDensity) {
                        ((android.widget.TextView) text).setTextSize(TypedValue.COMPLEX_UNIT_SP, LABEL_SP);
                    }
                }
            }
            // The expressive bar puts the label beside the icon in landscape and under it in portrait.
            sideBySide = !MaterialYou.hideTabLabels(bar.getContext())
                    && bar.getResources().getConfiguration().orientation == android.content.res.Configuration.ORIENTATION_LANDSCAPE;
            alignTabs(tabs, indicator);
            fitWidth(tabs, large, icon);
            if (now >= 0) {
                View tab = tabs.getChildAt(now);
                if (sideBySide) {
                    glass.slider().select(offset(tab, 0) + 4 * density, offset(tab, 0) + tab.getWidth() - 4 * density);
                } else {
                    float center = offset(tab, 0) + tab.getWidth() / 2f;
                    float half = Math.min(PILL_WIDTH_DP * density, tab.getWidth()) / 2f;
                    glass.slider().select(center - half, center + half);
                }
            }
            if (now == selected) return relaid;
            if (selected >= 0 && selected < tabs.getChildCount() && tabs.getChildCount() > 2) {
                for (int i = 0; i < tabs.getChildCount(); i++) {
                    if (i == selected || i == now) continue;
                    View tab = tabs.getChildAt(selected);
                    View like = tabs.getChildAt(i);
                    GlassCapsule.untint(tab.findViewById(icon), tab.findViewById(large), like.findViewById(icon), like.findViewById(large));
                    GlassCapsule.untint(tab.findViewById(icon), tab.findViewById(small), like.findViewById(icon), like.findViewById(small));
                    break;
                }
            }
            // Deselected icons take the color of their own label, so they match it whatever the theme made of them.
            for (int i = 0; i < tabs.getChildCount(); i++) {
                if (i == now) continue;
                View own = tabs.getChildAt(i).findViewById(icon);
                View name = tabs.getChildAt(i).findViewById(large);
                if (own instanceof android.widget.ImageView && name instanceof android.widget.TextView) {
                    ((android.widget.ImageView) own).setColorFilter(new android.graphics.PorterDuffColorFilter(
                            ((android.widget.TextView) name).getCurrentTextColor(), android.graphics.PorterDuff.Mode.SRC_IN));
                }
            }
            if (now >= 0) {
                View tab = tabs.getChildAt(now);
                GlassCapsule.tint(tab.findViewById(icon), tab.findViewById(large), accent);
                GlassCapsule.tint(tab.findViewById(icon), tab.findViewById(small), accent);
            }
            selected = now;
            glass.invalidateSelf();
            return relaid;
        }

        /**
         * Makes the bar as wide as its visible tabs need, centered, and no wider than the screen: a tab is as wide as
         * its label (or the pill when labels are hidden), so fewer tabs give a shorter capsule.
         */
        private void fitWidth(ViewGroup tabs, int large, int icon) {
            boolean labels = !MaterialYou.hideTabLabels(bar.getContext());
            float widest = PILL_WIDTH_DP * density;
            for (int i = 0; i < tabs.getChildCount(); i++) {
                View tab = tabs.getChildAt(i);
                if (tab.getVisibility() == View.GONE) continue;
                View name = tab.findViewById(large);
                if (labels && name instanceof android.widget.TextView) {
                    android.widget.TextView text = (android.widget.TextView) name;
                    View iconView = tab.findViewById(icon);
                    // Beside the icon the label also needs the icon's width and the tab's side padding.
                    float extra = sideBySide ? (iconView != null && iconView.getWidth() > 0 ? iconView.getWidth() : 24 * density) + 64 * density : 12 * density;
                    widest = Math.max(widest, text.getPaint().measureText(text.getText().toString()) + extra);
                }
            }
            // The bar divides its width over its visible tabs, so each tab gets the width of the widest.
            int visibleTabs = 0;
            for (int i = 0; i < tabs.getChildCount(); i++) {
                if (tabs.getChildAt(i).getVisibility() != View.GONE) visibleTabs++;
            }
            int sides = Math.round((SIDE_MARGIN_DP + INNER_PADDING_DP) * density);
            int screen = bar.getResources().getDisplayMetrics().widthPixels;
            int width = Math.min(screen, Math.round(Math.max(visibleTabs, 1) * widest) + 2 * sides);
            ViewGroup.LayoutParams params = bar.getLayoutParams();
            if (params != null && params.width != width) {
                params.width = width;
                bar.setLayoutParams(params);
                relaid = true;
            }
            // The capsule wraps the visible tabs only; the bar is moved so that the capsule is centered.
            float left = Float.MAX_VALUE;
            float right = 0;
            for (int i = 0; i < tabs.getChildCount(); i++) {
                View tab = tabs.getChildAt(i);
                if (tab.getVisibility() == View.GONE) continue;
                left = Math.min(left, offset(tab, 0));
                right = Math.max(right, offset(tab, 0) + tab.getWidth());
            }
            if (right <= left) return;
            float shift = (screen - (right - left + 2 * INNER_PADDING_DP * density)) / 2f - (left - INNER_PADDING_DP * density);
            if (Math.abs(bar.getTranslationX() - shift) > 0.5f) bar.setTranslationX(shift);
            spanLeft = left - INNER_PADDING_DP * density;
            spanRight = right + INNER_PADDING_DP * density;
        }

        /**
         * Hides the tabs the user switched off in the bar's menu, where the library keeps their visibility. Setting
         * it on the tab views instead is undone every time a tab is selected, and the library then animates the bar
         * from the full-size layout back to the fitted one.
         */
        private void hideTabsInMenu() {
            menuApplied = true;
            try {
                for (Class<?> type = bar.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
                    for (java.lang.reflect.Method method : type.getDeclaredMethods()) {
                        if (method.getParameterTypes().length != 0 || method.getReturnType() != android.view.Menu.class) continue;
                        method.setAccessible(true);
                        android.view.Menu menu = (android.view.Menu) method.invoke(bar);
                        for (int i = 0; i < menu.size(); i++) {
                            android.view.MenuItem item = menu.getItem(i);
                            boolean shown = MaterialYou.tabShown(bar.getContext(), item.getTitle());
                            if (item.isVisible() != shown) item.setVisible(shown);
                        }
                        return;
                    }
                }
            } catch (ReflectiveOperationException | RuntimeException ignored) {
            }
        }

        /** The vertical center of the pill when the labels are hidden: a fixed distance above the bottom of the bar. */
        private float noLabelCenter() {
            float half = (PILL_HEIGHT_DP / 2f + NO_LABEL_PADDING_DP) * density;
            return bar.getHeight() - bar.getPaddingBottom() - NO_LABEL_BOTTOM_MARGIN_DP * density - half;
        }

        /** Without labels the icons are moved down to the capsule, which sits a set distance above the bar's bottom. */
        private void alignTabs(ViewGroup tabs, int indicator) {
            float shift = 0;
            if (MaterialYou.hideTabLabels(bar.getContext())) {
                for (int i = 0; i < tabs.getChildCount(); i++) {
                    View tab = tabs.getChildAt(i);
                    View own = tab.findViewById(indicator);
                    if (tab.getVisibility() != View.GONE && own != null && own.getHeight() > 0) {
                        shift = noLabelCenter() - (offset(own, 1) + own.getHeight() / 2f);
                        break;
                    }
                }
            }
            if (Math.abs(tabs.getTranslationY() - shift) > 0.5f) tabs.setTranslationY(shift);
        }

        /** The x of a view's left edge (axis 0) or top edge (axis 1) in the bar. */
        private float offset(View view, int axis) {
            float sum = 0;
            for (View v = view; v != null && v != bar; v = v.getParent() instanceof View ? (View) v.getParent() : null) {
                sum += axis == 0 ? v.getLeft() : v.getTop();
            }
            return sum;
        }

        @Override
        public boolean capsule(RectF out) {
            ViewGroup tabs = tabs();
            if (tabs == null || tabs.getChildCount() == 0 || bar.getWidth() == 0 || spanRight <= spanLeft) return false;
            float top = tabs.getTop() + VERTICAL_MARGIN_DP * density;
            float bottom = tabs.getBottom() - VERTICAL_MARGIN_DP * density;
            if (MaterialYou.hideTabLabels(bar.getContext())) {
                // Without labels the capsule wraps the icons: the pill's height plus the same space above and below.
                float half = (PILL_HEIGHT_DP / 2f + NO_LABEL_PADDING_DP) * density;
                top = noLabelCenter() - half;
                bottom = noLabelCenter() + half;
            }
            out.set(spanLeft, top, spanRight, bottom);
            return true;
        }

        @Override
        public boolean pill(RectF out) {
            ViewGroup tabs = tabs();
            if (tabs == null || selected < 0 || selected >= tabs.getChildCount() || !glass.slider().has()) return false;
            View tab = tabs.getChildAt(selected);
            View indicator = tab.findViewById(id(bar, "navigation_bar_item_active_indicator_view"));
            float centerY;
            float half = PILL_HEIGHT_DP * density / 2f;
            if (MaterialYou.hideTabLabels(bar.getContext())) {
                centerY = noLabelCenter();
            } else if (indicator != null && indicator.getHeight() > 0) {
                centerY = offset(indicator, 1) + indicator.getHeight() / 2f;
                if (sideBySide) half = indicator.getHeight() / 2f;
            } else {
                centerY = offset(tab, 1) + tab.getPaddingTop() + PILL_HEIGHT_DP * density / 2f;
            }
            out.set(glass.slider().start(), centerY - half, glass.slider().end(), centerY + half);
            return true;
        }
    }
}
