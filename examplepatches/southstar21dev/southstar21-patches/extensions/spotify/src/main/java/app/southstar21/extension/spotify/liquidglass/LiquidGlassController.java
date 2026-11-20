package app.southstar21.extension.spotify.liquidglass;

import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;

/**
 * Turns Spotify's full width tab bar into a floating pill and keeps it that way.
 * <p>
 * The bar is Spotify's {@code navigation_bar} container, a Compose host whose padding the
 * controller grows to inset the tabs into the pill. Spotify can re-apply its own padding and
 * background at runtime (insets change on rotation), so the controller re-checks the bar on
 * each pre-draw and re-applies its changes whenever Spotify has overwritten them.
 * <p>
 * Spotify's content already runs under the bar, behind its own dark gradient.
 */
final class LiquidGlassController implements ViewTreeObserver.OnPreDrawListener {
    // The bar's height, margins and tab inset come from NavbarStyle (the Customize page).

    /** On tablets and landscape the pill stops growing at this width. */
    private static final int MAX_PILL_WIDTH_DP = 520;

    private final ViewGroup bar;
    private final NavbarStyle.Source styleSource;
    private final View shadow;
    private final boolean extendContent;
    private final LiquidGlassDrawable glass;
    private final LiquidGlassLens lens;
    private final Tabs tabs;
    /** Siblings whose bottom margin reserves room for the tab bar, and which we now manage. */
    private final java.util.WeakHashMap<View, Boolean> managedContent = new java.util.WeakHashMap<>();
    /** Copies of videos playing under the bar, which the glass can't record (see SurfaceSnapshots). */
    /** When the glass was last redrawn for what's behind it (uptime ms). */
    private long lastRefresh;
    /** A layout pass happened: what's behind the bar may have moved. */
    private boolean layoutChanged = true;
    private final float density;
    /** Progressive blur behind the pill. Null if it can't be added. */
    private EdgeBlurView bottomBlur;
    private final int[] location = new int[2];
    /** How far the bar's container stops short of the screen bottom for the navigation bar. */
    private int bottomInset;

    // Last values we applied, used to notice when Spotify overwrites them.
    private int baseHeight = -1;
    private int appliedHeight = Integer.MIN_VALUE;
    private int appliedPadLeft = -1, appliedPadTop = -1, appliedPadRight = -1, appliedPadBottom = -1;
    private int basePadLeft, basePadTop, basePadRight, basePadBottom;
    private int appliedForWidth = -1;
    /** The NavbarStyle version the geometry and shadow were last applied for. */
    private int appliedStyleVersion = -1;
    /** Driving a preview in the settings rather than Spotify's bar. */
    private boolean preview;

    LiquidGlassController(ViewGroup bar, View shadow, boolean extendContent) {
        this(bar, shadow, extendContent, NavbarStyle::get);
    }

    /** @param styleSource where the bar's look comes from: the settings, or a demo's values */
    LiquidGlassController(ViewGroup bar, View shadow, boolean extendContent, NavbarStyle.Source styleSource) {
        this.styleSource = styleSource;
        this.bar = bar;
        this.shadow = shadow;
        this.extendContent = extendContent;
        this.density = bar.getResources().getDisplayMetrics().density;
        this.glass = new LiquidGlassDrawable(bar, density, styleSource);
        this.tabs = new ComposeTabs(bar);
        this.lens = new LiquidGlassLens(bar.getContext(), bar, tabs, glass, density, styleSource);
    }

    /** The glass won't show {@code view} (it stays on screen). */
    void excludeFromGlass(View view) {
        glass.exclude(view);
    }

    LiquidGlassLens lens() {
        return lens;
    }

    /** Installs on Spotify's bar: also routes the window's touches and samples the backdrop. */
    void install() {
        install(false);
    }

    /**
     * @param preview a preview in the settings: the caller routes touches to the lens itself,
     *                and the backdrop isn't sampled (the window behind is Spotify's)
     */
    void install(boolean preview) {
        this.preview = preview;
        basePadLeft = bar.getPaddingLeft();
        basePadTop = bar.getPaddingTop();
        basePadRight = bar.getPaddingRight();
        basePadBottom = bar.getPaddingBottom();

        captureForeignBackground();
        bar.setBackground(glass);
        bar.setClipToPadding(false);

        ViewGroup parent = (ViewGroup) bar.getParent();
        // Spotify's MainLayout clones itself into a ConstraintSet, which throws on a child
        // without an id.
        if (lens.getId() == View.NO_ID) lens.setId(View.generateViewId());
        parent.addView(lens, parent.indexOfChild(bar) + 1, overlayLayoutParams(lens.extraTop));
        // In the southstar21 style the pressed drop swells past the bar's top and bottom.
        if (parent.getClipChildren()) parent.setClipChildren(false);
        if (parent instanceof FrameLayout) {
            bottomBlur = new EdgeBlurView(bar.getContext(), density);
            parent.addView(bottomBlur, parent.indexOfChild(bar),
                    new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, android.view.Gravity.BOTTOM));
        }

        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.S) {
            // Soft system shadow cast by the pill outline. The glass is opaque on 12+, so the
            // shadow can't show through it (on older versions the tint is translucent: skip).
            bar.setOutlineProvider(new android.view.ViewOutlineProvider() {
                @Override
                public void getOutline(View view, android.graphics.Outline outline) {
                    android.graphics.RectF pill = glass.getPill();
                    outline.setRoundRect(Math.round(pill.left), Math.round(pill.top),
                            Math.round(pill.right), Math.round(pill.bottom), glass.cornerRadius());
                    outline.setAlpha(Math.min(1f, styleSource.get().shadow));
                }
            });
            // Elevation (and the lens above it) is set from the Shadow setting in enforceGeometry().
            lens.setOutlineProvider(null);
        }

        android.view.Window window = BackdropSampler.windowOf(bar.getContext());
        if (window != null && !preview) TouchRouter.install(window, lens);

        bar.getViewTreeObserver().addOnPreDrawListener(this);
        bar.getViewTreeObserver().addOnGlobalLayoutListener(layoutListener);
        bar.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View v) {
                v.getViewTreeObserver().addOnPreDrawListener(LiquidGlassController.this);
                v.getViewTreeObserver().addOnGlobalLayoutListener(layoutListener);
            }

            @Override
            public void onViewDetachedFromWindow(View v) {
                v.getViewTreeObserver().removeOnPreDrawListener(LiquidGlassController.this);
            }
        });
        enforce();
    }

    private final ViewTreeObserver.OnGlobalLayoutListener layoutListener = () -> layoutChanged = true;

    /** Layout params matching the bar's position, taller by {@code extraTop} (the lens centers itself). */
    private ViewGroup.LayoutParams overlayLayoutParams(int extraTop) {
        ViewGroup.LayoutParams barLp = bar.getLayoutParams();
        int height = barLp.height > 0 ? barLp.height + extraTop : Math.max(0, bar.getHeight()) + extraTop;
        // Spotify's MainLayout is a ConstraintLayout: copy the bar's params with their
        // constraints through their own copy constructor, so the lens sits where the bar does.
        try {
            ViewGroup.LayoutParams lp = barLp.getClass().getConstructor(barLp.getClass()).newInstance(barLp);
            lp.height = height;
            return lp;
        } catch (Throwable ignored) {
            // Fall through to the generic copies.
        }
        if (barLp instanceof FrameLayout.LayoutParams) {
            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams((FrameLayout.LayoutParams) barLp);
            lp.height = height;
            return lp;
        }
        if (barLp instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams lp = new ViewGroup.MarginLayoutParams((ViewGroup.MarginLayoutParams) barLp);
            lp.height = height;
            return lp;
        }
        return new ViewGroup.LayoutParams(barLp.width, height);
    }

    @Override
    public boolean onPreDraw() {
        try {
            enforce();
            // Redraw the glass only when what's behind it can have changed: during and just after
            // a touch (scrolls, flings), after a layout pass, and once a second for anything else
            // (images loading). Redrawing every frame schedules another frame each time, so the
            // app never stopped drawing.
            long now = android.os.SystemClock.uptimeMillis();
            boolean refresh = layoutChanged || Interaction.recent(now) || now - lastRefresh > 1000;
            if (refresh) {
                layoutChanged = false;
                lastRefresh = now;
                if (bar.getVisibility() == View.VISIBLE) glass.invalidateSelf();
            }
            tabs.update();
            lens.sync(refresh);
        } catch (Throwable t) {
            bar.getViewTreeObserver().removeOnPreDrawListener(this);
            android.util.Log.e(LiquidGlassNavBarPatch.TAG, "Disabling liquid glass", t);
        }
        return true;
    }

    private void enforce() {
        if (bar.getBackground() != glass) {
            captureForeignBackground();
            bar.setBackground(glass);
        }

        glass.setDark(isDark());

        if (shadow != null && shadow.getAlpha() != 0f) shadow.setAlpha(0f);

        updateSystemBarInsets();
        enforceGeometry();
        enforceContentMargins();
        enforceEdgeBlurs();
    }

    /**
     * Spotify stops its main panel above the navigation bar. Measure that gap (0 where the
     * window itself already stops there).
     */
    private void updateSystemBarInsets() {
        ViewGroup parent = (ViewGroup) bar.getParent();
        android.view.WindowInsets insets = bar.getRootWindowInsets();
        if (insets == null || parent.getHeight() == 0) return;
        int navBottom = android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.R
                ? insets.getInsets(android.view.WindowInsets.Type.navigationBars()).bottom
                : insets.getSystemWindowInsetBottom();
        parent.getLocationInWindow(location);
        int slack = dp(4);
        int bottom = bar.getRootView().getHeight() - (location[1] + parent.getHeight());
        int newBottom = navBottom > 0 && bottom > 0 && bottom <= navBottom + slack ? bottom : 0;
        if (newBottom > 0 && newBottom != bottomInset) unclipBelow(parent);
        bottomInset = newBottom;
    }

    /** Lets the bar's container draw below its parents' bounds, down to the screen bottom. */
    private void unclipBelow(ViewGroup view) {
        int screenBottom = view.getRootView().getHeight();
        for (android.view.ViewParent p = view; p instanceof ViewGroup; p = p.getParent()) {
            ViewGroup g = (ViewGroup) p;
            if (g.getClipChildren()) g.setClipChildren(false);
            if (g.getClipToPadding()) g.setClipToPadding(false);
            g.getLocationInWindow(location);
            if (location[1] + g.getHeight() >= screenBottom) break;
        }
    }

    private void enforceEdgeBlurs() {
        if (bottomBlur == null) return;
        boolean barShown = bar.getVisibility() == View.VISIBLE && bar.getHeight() > 0;
        boolean dark = isDark();
        int height = bar.getHeight() + bottomInset + bottomBlur.extraTop;
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) bottomBlur.getLayoutParams();
        if (lp.height != height || lp.bottomMargin != -bottomInset) {
            lp.height = height;
            lp.bottomMargin = -bottomInset;
            bottomBlur.setLayoutParams(lp);
        }
        bottomBlur.setDark(dark);
        setShown(bottomBlur, barShown);
    }

    private static void setShown(View v, boolean shown) {
        int visibility = shown ? View.VISIBLE : View.GONE;
        if (v.getVisibility() != visibility) v.setVisibility(visibility);
        if (shown) v.invalidate();
    }

    /**
     * Keep a background Spotify sets as a hint for the glass tint, then put our drawable back.
     */
    private void captureForeignBackground() {
        Drawable bg = bar.getBackground();
        if (bg == null || bg == glass) return;
        glass.setHostColorHint(bg instanceof ColorDrawable ? ((ColorDrawable) bg).getColor() : null);
    }

    /** Light or dark regardless of the app; null to follow the system theme. */
    void forceDark(Boolean dark) {
        forcedDark = dark;
        bar.invalidate();
    }

    /** Spotify is dark whatever the system theme. */
    private Boolean forcedDark = Boolean.TRUE;

    private boolean isDark() {
        if (forcedDark != null) return forcedDark;
        Integer hint = glass.getHostColorHint();
        if (hint != null && Color.alpha(hint) > 0x80) {
            return luminance(hint) < 0.4f;
        }
        int mode = bar.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return mode == Configuration.UI_MODE_NIGHT_YES;
    }

    private static float luminance(int color) {
        return (0.2126f * Color.red(color) + 0.7152f * Color.green(color)
                + 0.0722f * Color.blue(color)) / 255f;
    }

    private void enforceGeometry() {
        int width = bar.getWidth();
        if (width <= 0) return;
        NavbarStyle style = styleSource.get();
        if (style.version != appliedStyleVersion) {
            appliedStyleVersion = style.version;
            appliedForWidth = -1;
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.S) {
                // 3dp at the default 50%; the lens stays just above the bar.
                float elevation = 6f * density * style.shadow;
                bar.setElevation(elevation);
                lens.setElevation(elevation + 0.1f);
                bar.invalidateOutline();
            }
        }

        // Spotify changed the padding itself (e.g. new insets): take its values as the new base.
        if (bar.getPaddingLeft() != appliedPadLeft || bar.getPaddingTop() != appliedPadTop
                || bar.getPaddingRight() != appliedPadRight || bar.getPaddingBottom() != appliedPadBottom) {
            if (appliedPadLeft != -1) {
                basePadLeft = bar.getPaddingLeft();
                basePadTop = bar.getPaddingTop();
                basePadRight = bar.getPaddingRight();
                basePadBottom = bar.getPaddingBottom();
            }
            appliedForWidth = -1;
        }

        int gap = dp(style.bottomGapDp);
        ViewGroup.LayoutParams lp = bar.getLayoutParams();
        // A height we didn't set is Spotify's own: the base everything is added to.
        if (lp != null && lp.height > 0 && lp.height != appliedHeight) baseHeight = lp.height;
        // Grow the bar until the pill (the bar less its bottom padding) is the chosen height. A
        // bar that wraps its content grows through the padding alone, from Android's 48dp.
        int pillBase = baseHeight > 0 ? baseHeight - basePadBottom : dp(48);
        int grow = Math.max(0, dp(style.heightDp) - pillBase);
        if (lp != null && lp.height > 0) {
            int want = baseHeight + gap + grow;
            if (lp.height != want) {
                lp.height = want;
                appliedHeight = want;
                bar.setLayoutParams(lp);

                ViewGroup.LayoutParams lensLp = lens.getLayoutParams();
                lensLp.height = appliedHeight + lens.extraTop;
                lens.setLayoutParams(lensLp);
            }
        }

        if (lp != null && lp.height <= 0) {
            // A bar that wraps its content: keep the lens as tall as the bar plus its overhang.
            ViewGroup.LayoutParams lensLp = lens.getLayoutParams();
            int want = bar.getHeight() + lens.extraTop;
            if (lensLp != null && bar.getHeight() > 0 && lensLp.height != want) {
                lensLp.height = want;
                lens.setLayoutParams(lensLp);
            }
        }

        if (appliedForWidth == width) return;

        int side = dp(style.sideMarginDp);
        int maxPill = dp(MAX_PILL_WIDTH_DP);
        int usable = width - basePadLeft - basePadRight;
        if (usable - 2 * side > maxPill) side = (usable - maxPill) / 2;

        int inner = dp(style.tabInsetDp);
        appliedPadLeft = basePadLeft + side + inner;
        appliedPadTop = basePadTop + grow / 2;
        appliedPadRight = basePadRight + side + inner;
        appliedPadBottom = basePadBottom + gap + (grow - grow / 2);
        appliedForWidth = width;

        glass.setPillInsets(basePadLeft + side, basePadRight + side, basePadBottom + gap);
        bar.setPadding(appliedPadLeft, appliedPadTop, appliedPadRight, appliedPadBottom);
        bar.invalidateOutline();
    }

    private boolean contentBehindBar() {
        return extendContent;
    }

    /**
     * Siblings under the bar (the main container, and the ViewPager2 holding the feed) stop
     * at the top of the tab bar with a bottom margin equal to its height, some set in XML and
     * some in code. Drop those margins so content scrolls underneath the glass, or grow them
     * to the taller floating bar where content must stay clear of it.
     */
    private void enforceContentMargins() {
        if (baseHeight <= 0) return;
        // Content behind the bar also runs on under the navigation bar.
        int target = contentBehindBar() ? -bottomInset : appliedHeight;
        ViewGroup parent = (ViewGroup) bar.getParent();
        int barIndex = parent.indexOfChild(bar);
        for (int i = 0; i < barIndex; i++) {
            View child = parent.getChildAt(i);
            if (child == shadow || child instanceof EdgeBlurView) continue;
            if (!(child.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) continue;
            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) child.getLayoutParams();
            // Only take over the tab bar margin, leave other margins Spotify may set alone.
            if (lp.bottomMargin == baseHeight) managedContent.put(child, Boolean.TRUE);
            if (!managedContent.containsKey(child)) continue;
            if (lp.bottomMargin != target) {
                lp.bottomMargin = target;
                child.setLayoutParams(lp);
            }
        }
    }

    private int dp(int value) {
        return Math.round(value * density);
    }
}
