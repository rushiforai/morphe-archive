package app.southstar21.extension.instagram.liquidglass;

import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;

/**
 * Turns Instagram's full width tab bar into a floating pill and keeps it that way.
 * <p>
 * Instagram owns the tab bar and changes its background, height and padding at runtime
 * (Reels switches it to a dark bar, insets change on rotation). Instead of patching every
 * call site, the controller re-checks the bar on each pre-draw and re-applies its changes
 * whenever Instagram has overwritten them.
 * <p>
 * Like iOS, content runs under the system navigation bar and a blur fades in behind the pill
 * towards the bottom edge. Reels keeps its own layout and stops above the pill.
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
    private final int reelsTabId;
    /** Siblings whose bottom margin reserves room for the tab bar, and which we now manage. */
    private final java.util.WeakHashMap<View, Boolean> managedContent = new java.util.WeakHashMap<>();
    private final BackdropSampler sampler;
    /** Copies of videos playing under the bar, which the glass can't record (see SurfaceSnapshots). */
    private final SurfaceSnapshots snapshots;
    private final android.graphics.RectF snapshotRegion = new android.graphics.RectF();
    private final android.graphics.Rect sampleRect = new android.graphics.Rect();
    private final float density;
    /** Progressive blur behind the pill. Null if it can't be added. */
    private EdgeBlurView bottomBlur;
    /** Progressive blur under the Home and Explore headers. Null when switched off or in a preview. */
    private HeaderBlurController headerBlur;
    /** Frosted strip at the bottom of each reel on the Reels tab. Null when switched off or in a preview. */
    private ReelsBlur reelsBlur;
    /** The DM inbox's Instants stack, kept above the bar. Null in a preview. */
    private FloatingAboveBar instants;
    private final int[] location = new int[2];
    /** How far the bar's container stops short of the screen bottom for the navigation bar. */
    private int bottomInset;

    // Last values we applied, used to notice when Instagram overwrites them.
    private int baseHeight = -1;
    private int appliedHeight = Integer.MIN_VALUE;
    private int appliedPadLeft = -1, appliedPadTop = -1, appliedPadRight = -1, appliedPadBottom = -1;
    private int basePadLeft, basePadTop, basePadRight, basePadBottom;
    private int appliedForWidth = -1;
    /** The NavbarStyle version the geometry and shadow were last applied for. */
    private int appliedStyleVersion = -1;
    /** Driving a preview in the settings rather than Instagram's bar. */
    private boolean preview;
    /** This pre-draw changed a size or margin, so the frame about to be drawn is stale. */
    private boolean relaidOut;
    private int skippedFrames;
    private boolean barWasShown = true;
    private static final int MAX_SKIPPED_FRAMES = 2;
    /** The selected tab last frame, to notice a page switch. */
    private View lastTab;
    /** After a page switch, the videos under the bar aren't copied for this long. */
    private static final long SWITCH_COPY_PAUSE_MS = 300;
    /** How far above the pill the Reels strip (and the caption's bottom) starts, like iOS. */
    private static final int REELS_STRIP_ABOVE_PILL_DP = 26;

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
        this.lens = new LiquidGlassLens(bar.getContext(), bar, glass, density, styleSource);
        this.reelsTabId = bar.getResources().getIdentifier("clips_tab", "id", "com.instagram.android");
        this.sampler = new BackdropSampler(bar, glass::setBackdropLuminance);
        this.snapshots = new SurfaceSnapshots(bar);
        glass.setSnapshots(snapshots);
    }

    LiquidGlassLens lens() {
        return lens;
    }

    /** Installs on Instagram's bar: also routes the window's touches and samples the backdrop. */
    void install() {
        install(false);
    }

    /**
     * @param preview a preview in the settings: the caller routes touches to the lens itself,
     *                and the backdrop isn't sampled (the window behind is Instagram's)
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
        parent.addView(lens, parent.indexOfChild(bar) + 1, overlayLayoutParams(lens.extraTop));
        // In the southstar21 style the pressed drop swells past the bar's top and bottom.
        if (parent.getClipChildren()) parent.setClipChildren(false);
        if (parent instanceof FrameLayout) {
            bottomBlur = new EdgeBlurView(bar.getContext(), density);
            bottomBlur.setSnapshots(snapshots);
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

        if (!preview && LiquidGlassNavBarPatch.effect(LiquidGlassNavBarPatch.HEADER_BLUR)) {
            headerBlur = new HeaderBlurController(bar.getRootView(), density,
                    LiquidGlassNavBarPatch.effect(LiquidGlassNavBarPatch.GLASS_HEADER_BUTTONS));
        }

        if (!preview && LiquidGlassNavBarPatch.effect(LiquidGlassNavBarPatch.REELS_BLUR)
                && LiquidGlassNavBarPatch.BLUR_VIDEOS.get()) {
            ReelsBlur reels = new ReelsBlur(bar.getRootView(), density);
            if (reels.usable()) reelsBlur = reels;
        }

        if (!preview) {
            instants = new FloatingAboveBar(bar.getRootView(), bar.getResources().getIdentifier(
                    "direct_quick_snap_consumption_preview", "id", "com.instagram.android"));
        }

        android.view.Window window = BackdropSampler.windowOf(bar.getContext());
        if (window != null && !preview) TouchRouter.install(window, lens);

        bar.getViewTreeObserver().addOnPreDrawListener(this);
        bar.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View v) {
                v.getViewTreeObserver().addOnPreDrawListener(LiquidGlassController.this);
            }

            @Override
            public void onViewDetachedFromWindow(View v) {
                v.getViewTreeObserver().removeOnPreDrawListener(LiquidGlassController.this);
            }
        });
        enforce();
    }

    /** Layout params matching the bar's position, taller by {@code extraTop} (the lens centers itself). */
    private ViewGroup.LayoutParams overlayLayoutParams(int extraTop) {
        ViewGroup.LayoutParams barLp = bar.getLayoutParams();
        int height = barLp.height > 0 ? barLp.height + extraTop : ViewGroup.LayoutParams.WRAP_CONTENT;
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
        relaidOut = false;
        try {
            enforce();
            // A solid bar shows nothing of what's behind it: no copies, redraws or sampling for it.
            boolean solid = styleSource.get().solid;
            if (bar.getVisibility() == View.VISIBLE && !preview && !solid) {
                // Copy the videos under the bar, its glass and lens (which pokes out above it) and
                // the edge blur, down to the bottom of the screen.
                ViewGroup parent = (ViewGroup) bar.getParent();
                float top = bar.getTop() + bar.getTranslationY() - dp(100);
                snapshotRegion.set(bar.getLeft(), top, bar.getRight(), Math.max(top, parent.getHeight() + bottomInset));
                snapshots.update(snapshotRegion);
            }
            if (bar.getVisibility() == View.VISIBLE && !solid) {
                // Content behind the bar may have changed this frame. Invalidating during
                // pre-draw folds the redraw into the current frame instead of scheduling a new one.
                glass.invalidateSelf();
            }
            lens.sync();
            View tab = lens.selectedTabView();
            if (tab != lastTab) {
                boolean switched = lastTab != null && tab != null;
                lastTab = tab;
                if (switched && !preview) {
                    // A new page is coming in. Give it the frosted header on its first frame
                    // instead of up to a scan interval later (which popped it in and dropped a
                    // frame), and keep video copies off the render thread while it draws.
                    if (headerBlur != null) headerBlur.rescanSoon();
                    SurfaceSnapshots.pauseCopies(SWITCH_COPY_PAUSE_MS);
                }
            }
            if (headerBlur != null) {
                try {
                    boolean shown = isBarShown();
                    if (shown && !barWasShown) headerBlur.rescanSoon();
                    barWasShown = shown;
                    if (headerBlur.onPreDraw(isDark())) relaidOut = true;
                } catch (Throwable t) {
                    // Keep the bar working if the header can't be handled.
                    headerBlur = null;
                    android.util.Log.e(LiquidGlassNavBarPatch.TAG, "Disabling the header blur", t);
                }
            }
            if (reelsBlur != null) {
                try {
                    boolean on = !solid && isBarShown() && isReelsSelected();
                    ViewGroup parent = (ViewGroup) bar.getParent();
                    parent.getLocationInWindow(location);
                    // A little above the pill, from its layout position: the bar shrinking while
                    // scrolling mustn't move the strip or the caption above it.
                    int stripTop = location[1] + bar.getTop() + Math.round(glass.getPill().top) - dp(REELS_STRIP_ABOVE_PILL_DP);
                    reelsBlur.onPreDraw(on, stripTop);
                } catch (Throwable t) {
                    reelsBlur = null;
                    android.util.Log.e(LiquidGlassNavBarPatch.TAG, "Disabling the Reels blur", t);
                }
            }
            if (bar.getVisibility() == View.VISIBLE && !preview && !solid) {
                glass.getPill().round(sampleRect);
                sampler.maybeSample(sampleRect, dp(20));
            }
        } catch (Throwable t) {
            bar.getViewTreeObserver().removeOnPreDrawListener(this);
            android.util.Log.e(LiquidGlassNavBarPatch.TAG, "Disabling liquid glass", t);
        }
        // A frame drawn now would still show the old layout: the reel's video blanks and the
        // feed and reel swap back and forth while it opens or closes. Skip it and draw once the
        // new layout is in. The cap keeps a fight with Instagram from stalling drawing.
        if (relaidOut && skippedFrames < MAX_SKIPPED_FRAMES) {
            skippedFrames++;
            return false;
        }
        skippedFrames = 0;
        return true;
    }

    private void enforce() {
        if (bar.getBackground() != glass) {
            captureForeignBackground();
            bar.setBackground(glass);
        }

        glass.setDark(isDark());
        glass.setOverMedia(previewOverMedia != null ? previewOverMedia
                : reelsBlurShown() && LiquidGlassNavBarPatch.REELS_CLEAR_GLASS.get());

        if (shadow != null && shadow.getAlpha() != 0f) shadow.setAlpha(0f);

        stripNativeTabHighlights();
        updateSystemBarInsets();
        enforceGeometry();
        enforceContentMargins();
        enforceEdgeBlurs();
        enforceFloating();
    }

    /** Keeps what Instagram pins to a page's bottom corner clear of the bar and its blur. */
    private void enforceFloating() {
        if (instants == null) return;
        int limit = FloatingAboveBar.NO_LIMIT;
        if (isBarShown()) {
            // Where the blur above the pill starts, in layout positions (the bar shrinking while
            // scrolling mustn't move what sits above it); a little into its faint top edge.
            ViewGroup parent = (ViewGroup) bar.getParent();
            parent.getLocationInWindow(location);
            int top = bottomBlur != null ? bottomBlur.getTop() : bar.getTop() - dp(36);
            limit = location[1] + top + dp(8);
        }
        if (instants.enforce(limit)) relaidOut = true;
    }

    /**
     * Instagram stops its main panel above the navigation bar. Measure that gap (0 where the
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
            relaidOut = true;
        }
        bottomBlur.setDark(dark);
        // A solid bar has no glass, and no blur along the bottom either.
        NavbarStyle style = styleSource.get();
        // On Reels each reel brings its own strip, which scrolls with it.
        setShown(bottomBlur, barShown && !style.solid && !style.demoVideoHole && !reelsBlurShown());
    }

    private static void setShown(View v, boolean shown) {
        int visibility = shown ? View.VISIBLE : View.GONE;
        if (v.getVisibility() != visibility) v.setVisibility(visibility);
        if (shown) v.invalidate();
    }

    /**
     * Instagram's newer floating tab bar (rolled out server side, so not on every device) gives
     * each tab a StateListDrawable background: a rounded grey capsule when selected, transparent
     * otherwise. The lens already draws the selection, so that capsule would show up as a second
     * pill inside ours. Instagram re-applies it on layout changes, hence the per-frame check.
     */
    private void stripNativeTabHighlights() {
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            if (child.getBackground() instanceof android.graphics.drawable.StateListDrawable) {
                child.setBackground(null);
            }
        }
    }

    /**
     * Instagram swaps the bar background to signal its color scheme (e.g. black on Reels).
     * Keep the color as a hint for the glass tint, then put our drawable back.
     */
    private void captureForeignBackground() {
        Drawable bg = bar.getBackground();
        if (bg == null || bg == glass) return;
        glass.setHostColorHint(bg instanceof ColorDrawable ? ((ColorDrawable) bg).getColor() : null);
    }

    /** Clearer glass over Reels or not, for the settings preview; null to follow Instagram. */
    void forceOverMedia(Boolean overMedia) {
        previewOverMedia = overMedia;
    }

    private Boolean previewOverMedia;

    /** Light or dark regardless of Instagram, for the settings preview; null to follow Instagram. */
    void forceDark(Boolean dark) {
        forcedDark = dark;
        bar.invalidate();
    }

    private Boolean forcedDark;

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

        // Instagram changed the padding itself (e.g. new insets): take its values as the new base.
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
        // A height we didn't set is Instagram's own: the base everything is added to.
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
                relaidOut = true;

                ViewGroup.LayoutParams lensLp = lens.getLayoutParams();
                lensLp.height = appliedHeight + lens.extraTop;
                lens.setLayoutParams(lensLp);
                relaidOut = true;
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
        relaidOut = true;
        bar.invalidateOutline();
    }

    /**
     * Reels draws its username, caption and buttons right above the tab bar, so they must not
     * end up behind the pill. Everywhere else content scrolls underneath the glass.
     */
    private boolean contentBehindBar() {
        return extendContent && (!isReelsSelected() || reelsBlurShown());
    }

    /** Reels runs behind the bar with a frosted strip per reel (see ReelsBlur). */
    private boolean reelsBlurShown() {
        return reelsBlur != null && !styleSource.get().solid && isReelsSelected();
    }

    /** False while Instagram hides the bar (gone, collapsed or slid off screen). */
    private boolean isBarShown() {
        return bar.getVisibility() == View.VISIBLE && bar.getHeight() > 0
                && bar.getTranslationY() < bar.getHeight();
    }

    private boolean isReelsSelected() {
        if (reelsTabId == 0) return false;
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            if (child.getId() == reelsTabId) return child.isSelected() || child.isActivated();
        }
        return false;
    }


    /**
     * Siblings under the bar (the main container, and the ViewPager2 holding the feed) stop
     * at the top of the tab bar with a bottom margin equal to its height, some set in XML and
     * some in code. Drop those margins so content scrolls underneath the glass, or grow them
     * to the taller floating bar where content must stay clear of it.
     */
    private void enforceContentMargins() {
        if (baseHeight <= 0) return;
        int target = contentMarginTarget();
        ViewGroup parent = (ViewGroup) bar.getParent();
        int barIndex = parent.indexOfChild(bar);
        for (int i = 0; i < barIndex; i++) {
            View child = parent.getChildAt(i);
            if (child == shadow || child instanceof EdgeBlurView) continue;
            if (!(child.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) continue;
            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) child.getLayoutParams();
            // Only take over the tab bar margin, leave other margins Instagram may set alone.
            if (lp.bottomMargin == baseHeight && managedContent.put(child, Boolean.TRUE) == null) {
                child.addOnLayoutChangeListener(marginKeeper);
            }
            if (!managedContent.containsKey(child)) continue;
            if (lp.bottomMargin != target) {
                lp.bottomMargin = target;
                child.setLayoutParams(lp);
                relaidOut = true;
            }
            clipWhileBarHidden(child);
        }
    }

    /**
     * The bottom margin managed content should have. Content behind the bar also runs on under
     * the navigation bar. Full screen viewers (a reel opened from the feed, a DM or a profile)
     * hide the bar: then nothing needs room for it and the content must stop above the
     * navigation bar again, or the reel's comment box ends up under the gesture pill.
     */
    private int contentMarginTarget() {
        return !isBarShown() ? 0 : contentBehindBar() ? -bottomInset : appliedHeight;
    }

    /**
     * Instagram puts the tab bar margin back on its page container at every tab switch. Caught
     * at pre-draw, the fix needs a new layout and the switch's first frame is thrown away.
     * Caught here, while the page is being laid out, Android runs a second layout pass before
     * drawing, so the new page shows in its first frame. Pre-draw stays as the fallback.
     */
    private final View.OnLayoutChangeListener marginKeeper = (v, left, top, right, bottom,
                                                             oldLeft, oldTop, oldRight, oldBottom) -> {
        if (preview || baseHeight <= 0 || !managedContent.containsKey(v)) return;
        if (!(v.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return;
        ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) v.getLayoutParams();
        int target = contentMarginTarget();
        if (lp.bottomMargin == target) return;
        lp.bottomMargin = target;
        v.setLayoutParams(lp);
    };

    /**
     * Opening a reel from the feed hides the bar at once and takes the feed out of the layout,
     * but Instagram keeps drawing the feed (a disappearing child) at its old size while the reel
     * slides over it. That old size runs on under the navigation bar, and with its parents no
     * longer clipping, the feed and its frosted header showed under the gesture pill and in the
     * status bar until the slide ended. While the bar is hidden nothing runs edge to edge, so
     * clip the content to its own bounds, as it is without the patch.
     */
    private void clipWhileBarHidden(View child) {
        if (!isBarShown()) {
            android.graphics.Rect clip = child.getClipBounds();
            if (clip == null || clip.left != 0 || clip.top != 0
                    || clip.right != child.getWidth() || clip.bottom != child.getHeight()) {
                child.setClipBounds(new android.graphics.Rect(0, 0, child.getWidth(), child.getHeight()));
            }
        } else if (child.getClipBounds() != null) {
            child.setClipBounds(null);
        }
    }

    private int dp(int value) {
        return Math.round(value * density);
    }
}
