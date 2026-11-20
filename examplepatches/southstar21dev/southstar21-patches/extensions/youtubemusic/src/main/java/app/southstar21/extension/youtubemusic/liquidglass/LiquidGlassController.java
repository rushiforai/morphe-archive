package app.southstar21.extension.youtubemusic.liquidglass;

import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;

/**
 * Turns YouTube Music's full width tab bar into a floating pill and keeps it that way.
 * <p>
 * The bar is YouTube Music's {@code pivot_bar}, a Material TabLayout. Its vertical padding grows
 * to the pill's height (WatchWhileLayout measures the bar, so the mini player moves up with
 * it), and its tab strip is inset from the sides, since TabLayout stretches the strip across
 * the whole bar whatever the bar's own side padding. YouTube Music can re-apply its own padding
 * and background at runtime (insets change on rotation), so the controller re-checks the bar on
 * each pre-draw and re-applies its changes whenever YouTube Music has overwritten them.
 * <p>
 * The content runs on under the bar through the patch's hook in WatchWhileLayout.onMeasure.
 */
final class LiquidGlassController implements ViewTreeObserver.OnPreDrawListener {
    // The bar's height, margins and tab inset come from NavbarStyle.

    /** On tablets and landscape the pill stops growing at this width. */
    private static final int MAX_PILL_WIDTH_DP = 520;

    private final ViewGroup bar;
    private final NavbarStyle.Source styleSource;
    private final View shadow;
    private final LiquidGlassDrawable glass;
    private final LiquidGlassLens lens;
    private final StripTabs tabs;
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

    // Last values we applied, used to notice when YouTube Music overwrites them.
    private int basePadLeft, basePadTop, basePadRight, basePadBottom;
    private int appliedForWidth = -1;
    private int appliedForTabsHeight = -1;
    /** The NavbarStyle version the geometry and shadow were last applied for. */
    private int appliedStyleVersion = -1;
    /** Driving a preview in the settings rather than YouTube Music's bar. */
    private boolean preview;

    LiquidGlassController(ViewGroup bar, View shadow, boolean extendContent) {
        this(bar, shadow, extendContent, NavbarStyle::get);
    }

    /** @param styleSource where the bar's look comes from: the settings, or a demo's values */
    LiquidGlassController(ViewGroup bar, View shadow, boolean extendContent, NavbarStyle.Source styleSource) {
        this.styleSource = styleSource;
        this.bar = bar;
        this.shadow = shadow;
        this.density = bar.getResources().getDisplayMetrics().density;
        this.glass = new LiquidGlassDrawable(bar, density, styleSource);
        this.tabs = new StripTabs(bar);
        this.lens = new LiquidGlassLens(bar.getContext(), bar, tabs, glass, density, styleSource);
    }

    /** The glass won't show {@code view} (it stays on screen). */
    void excludeFromGlass(View view) {
        glass.exclude(view);
    }

    LiquidGlassLens lens() {
        return lens;
    }

    /** Installs on YouTube Music's bar: also routes the window's touches and samples the backdrop. */
    void install() {
        install(false);
    }

    /**
     * @param preview a preview in the settings: the caller routes touches to the lens itself,
     *                and the backdrop isn't sampled (the window behind is YouTube Music's)
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
        enforce(true);
    }

    private final ViewTreeObserver.OnGlobalLayoutListener layoutListener = () -> layoutChanged = true;

    /** Layout params matching the bar's position, taller by {@code extraTop} (the lens centers itself). */
    private ViewGroup.LayoutParams overlayLayoutParams(int extraTop) {
        ViewGroup.LayoutParams barLp = bar.getLayoutParams();
        int height = barLp.height > 0 ? barLp.height + extraTop : Math.max(0, bar.getHeight()) + extraTop;
        // Copy the bar's params (gravity included) through their own copy constructor, so the
        // lens sits where the bar does.
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

    /** Frames skipped in a row because the bar had to be laid out again (see onPreDraw). */
    private int skippedFrames;
    @Override
    public boolean onPreDraw() {
        try {
            boolean wasRequested = bar.isLayoutRequested();
            // Redraw the glass only when what's behind it can have changed: during and just after
            // a touch (scrolls, flings), after a layout pass, and once a second for anything else
            // (images loading). Redrawing every frame schedules another frame each time, so the
            // app never stopped drawing. (YouTube Music redraws on its own while the mini
            // player's title scrolls; the glass needn't follow every one of those frames.)
            long now = android.os.SystemClock.uptimeMillis();
            boolean refresh = layoutChanged || Interaction.recent(now) || now - lastRefresh > 1000;
            enforce(refresh);
            if (refresh) {
                layoutChanged = false;
                lastRefresh = now;
                if (bar.getVisibility() == View.VISIBLE) glass.invalidateSelf();
            }
            tabs.update();
            enforceStripPadding();
            lens.sync(refresh);
            // YouTube Music re-applies its own padding (or rebuilds the tabs) when switching tabs.
            // Putting ours back asks for a new layout, but this frame would still be drawn with
            // YouTube Music's: a flash of a full width, squashed bar. Skip it and draw after the
            // layout instead (a few frames at most, so a fight can never freeze the app).
            ViewGroup strip = tabs.strip();
            boolean relayout = (!wasRequested && bar.isLayoutRequested())
                    || (strip != null && strip.isLayoutRequested());
            if (relayout && !dockMoved && skippedFrames < 3) {
                skippedFrames++;
                return false;
            }
            skippedFrames = 0;
        } catch (Throwable t) {
            bar.getViewTreeObserver().removeOnPreDrawListener(this);
            android.util.Log.e(LiquidGlassNavBarPatch.TAG, "Disabling liquid glass", t);
        }
        return true;
    }

    private void enforce(boolean refresh) {
        if (bar.getBackground() != glass) {
            captureForeignBackground();
            bar.setBackground(glass);
        }

        glass.setDark(isDark());

        if (shadow != null && shadow.getAlpha() != 0f) shadow.setAlpha(0f);

        updateSystemBarInsets();
        enforceGeometry();
        enforceDock();
        enforceStripPadding();
        enforceEdgeBlurs(refresh);
    }

    /**
     * YouTube Music stops its main panel above the navigation bar. Measure that gap (0 where the
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

    private void enforceEdgeBlurs(boolean refresh) {
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
        // YouTube Music slides the bar down (then hides it) as the full player opens: fade the
        // blur out along with it rather than dropping it the moment the bar goes.
        float slid = bar.getHeight() > 0 ? bar.getTranslationY() / bar.getHeight() : 0f;
        float alpha = Math.max(0f, Math.min(1f, 1f - slid));
        if (bottomBlur.getAlpha() != alpha) bottomBlur.setAlpha(alpha);
        int visibility = barShown && alpha > 0f ? View.VISIBLE : View.GONE;
        if (bottomBlur.getVisibility() != visibility) bottomBlur.setVisibility(visibility);
        // Like the glass: re-recording what's behind it every frame kept the app drawing.
        if (barShown && refresh) bottomBlur.invalidate();
    }

    /**
     * Keep a background YouTube Music sets as a hint for the glass tint, then put our drawable back.
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

    /** YouTube Music is dark whatever the system theme. */
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

    /** 0 = the bar spans the row, 1 = it makes room for the docked player on its right. */
    private float dockProgress;
    /** The bar's margin changed in this pre-draw: its new layout is one frame behind, which is fine. */
    private boolean dockMoved;

    /**
     * Narrows the bar from the right while a mini player is on screen (see {@link Dock}),
     * easing a step each frame. The bar moves with a right margin rather than the pill's
     * insets, so the docked player's touches never land on the bar.
     */
    private void enforceDock() {
        dockMoved = false;
        float target = Dock.resting && Dock.playerShown && Dock.rightInset >= 0 ? 1f : 0f;
        if (dockProgress != target && (bar.getVisibility() != View.VISIBLE || bar.getTranslationY() != 0f)) {
            // Nobody sees the bar move while it's hidden or sliding: change it in one step
            // rather than a relayout every frame.
            dockProgress = target;
        } else if (dockProgress != target) {
            dockProgress += (target - dockProgress) * 0.3f;
            if (Math.abs(target - dockProgress) < 0.01f) dockProgress = target;
            else bar.postInvalidateOnAnimation();
        }
        int margin = Math.round(dockProgress * dp(Dock.WIDTH_DP + Dock.GAP_DP));
        if (setRightMargin(bar, margin)) dockMoved = true;
        setRightMargin(lens, margin);
        // The edge blur sits above the player: keep it off the docked capsule.
        if (bottomBlur != null) {
            if (Dock.capsuleShown && bottomBlur.getHeight() > 0) {
                // The capsule wherever it is now: it rises out of the blur as the player opens.
                bottomBlur.getLocationOnScreen(location);
                bottomBlur.setHole(Dock.capsule.left - location[0], Dock.capsule.top - location[1],
                        Dock.capsule.right - location[0], Dock.capsule.bottom - location[1]);
            } else {
                bottomBlur.setHole(0, 0, 0, 0);
            }
        }
    }

    private static boolean setRightMargin(View view, int margin) {
        ViewGroup.LayoutParams lp = view.getLayoutParams();
        if (!(lp instanceof ViewGroup.MarginLayoutParams)) return false;
        ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) lp;
        if (mlp.rightMargin == margin) return false;
        mlp.rightMargin = margin;
        view.setLayoutParams(mlp);
        return true;
    }

    private void enforceGeometry() {
        // The whole row's width: the bar's own shrinks while the player is docked.
        int width = ((View) bar.getParent()).getWidth();
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

        // The bar's own padding is YouTube Music's (the navigation bar below it), and it re-applies
        // it all the time (every half second or so on the Search tab). Never touch it: the pill
        // is made from the strip's padding instead (see enforceStripPadding), and only follows
        // the bar's padding here.
        if (bar.getPaddingLeft() != basePadLeft || bar.getPaddingRight() != basePadRight
                || bar.getPaddingBottom() != basePadBottom) {
            basePadLeft = bar.getPaddingLeft();
            basePadTop = bar.getPaddingTop();
            basePadRight = bar.getPaddingRight();
            basePadBottom = bar.getPaddingBottom();
            appliedForWidth = -1;
        }
        Dock.barPadTop = basePadTop;

        // Keep the lens as tall as the bar plus its overhang.
        ViewGroup.LayoutParams lensLp = lens.getLayoutParams();
        int wantLens = bar.getHeight() + lens.extraTop;
        if (lensLp != null && bar.getHeight() > 0 && lensLp.height != wantLens) {
            lensLp.height = wantLens;
            lens.setLayoutParams(lensLp);
        }

        // The strip's padding grows the pill from the tabs' own height (48dp) to the chosen one.
        ViewGroup strip = tabs.strip();
        int tabsHeight = strip != null && strip.getChildCount() > 0 && strip.getChildAt(0).getHeight() > 0
                ? strip.getChildAt(0).getHeight() : dp(48);
        if (appliedForWidth == width && appliedForTabsHeight == tabsHeight) return;
        appliedForWidth = width;
        appliedForTabsHeight = tabsHeight;

        int gap = dp(style.bottomGapDp);
        int grow = Math.max(0, dp(style.heightDp) - tabsHeight);

        int side = dp(style.sideMarginDp);
        int maxPill = dp(MAX_PILL_WIDTH_DP);
        int usable = width - basePadLeft - basePadRight;
        if (usable - 2 * side > maxPill) side = (usable - maxPill) / 2;
        int inner = dp(style.tabInsetDp);
        // The docked player ends where the full width pill would.
        Dock.rightInset = basePadRight + side;
        Dock.leftInset = basePadLeft + side;

        stripLeft = stripRight = side + inner;
        stripTop = grow / 2;
        stripBottom = grow - grow / 2 + gap;

        glass.setPillInsets(basePadLeft + side, basePadTop, basePadRight + side, basePadBottom + gap);
        bar.invalidateOutline();
    }

    /** The strip's padding: the pill's height and side insets (-1 until the bar is measured). */
    private int stripLeft = -1, stripTop, stripRight, stripBottom;

    /**
     * The tab strip (TabLayout's only child) carries the pill: its side padding insets the
     * tabs (TabLayout stretches the strip across the bar whatever the bar's padding), and its
     * top and bottom padding grow the bar, which WatchWhileLayout measures, so the mini player
     * moves up with it. TabLayout only resets the strip's padding when it changes mode.
     */
    private void enforceStripPadding() {
        ViewGroup strip = tabs.strip();
        if (strip == null || stripLeft < 0) return;
        if (strip.getPaddingLeft() != stripLeft || strip.getPaddingTop() != stripTop
                || strip.getPaddingRight() != stripRight || strip.getPaddingBottom() != stripBottom) {
            strip.setPadding(stripLeft, stripTop, stripRight, stripBottom);
        }
    }

    private int dp(int value) {
        return Math.round(value * density);
    }
}
