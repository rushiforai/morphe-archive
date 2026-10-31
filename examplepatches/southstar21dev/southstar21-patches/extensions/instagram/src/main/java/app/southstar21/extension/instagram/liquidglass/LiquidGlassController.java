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
 * towards the bottom edge. On Reels the video fills the whole screen ({@link ReelsFullBleed}).
 */
final class LiquidGlassController implements ViewTreeObserver.OnPreDrawListener {
    /** Gap between the pill and the bottom of the screen / nav bar. */
    private static final int BOTTOM_GAP_DP = 8;
    /** Extra height so the pill matches iOS Instagram's ~60pt (Instagram Android's bar is 48dp). */
    private static final int GROW_DP = 12;
    /** Gap between the pill and the screen edges, ~5% of the width like iOS Instagram. */
    private static final int SIDE_GAP_DP = 20;
    /** Space between the pill edge and the outermost tab icons. */
    private static final int INNER_PADDING_DP = 6;
    /** On tablets and landscape the pill stops growing at this width. */
    private static final int MAX_PILL_WIDTH_DP = 520;

    private final ViewGroup bar;
    private final View shadow;
    private final boolean extendContent;
    private final LiquidGlassDrawable glass;
    private final LiquidGlassLens lens;
    private final HeaderGlassController headers;
    private final int reelsTabId;
    /** Siblings whose bottom margin reserves room for the tab bar, and which we now manage. */
    private final java.util.WeakHashMap<View, Boolean> managedContent = new java.util.WeakHashMap<>();
    private final BackdropSampler sampler;
    private final android.graphics.Rect sampleRect = new android.graphics.Rect();
    private final float density;
    /** Progressive blur behind the pill. Null if it can't be added. */
    private EdgeBlurView bottomBlur;
    private final ReelsFullBleed reels;
    private final int[] location = new int[2];
    /** How far the bar's container stops short of the screen bottom for the navigation bar. */
    private int bottomInset;

    // Last values we applied, used to notice when Instagram overwrites them.
    private int baseHeight = -1;
    private int appliedHeight = Integer.MIN_VALUE;
    private int appliedPadLeft = -1, appliedPadTop = -1, appliedPadRight = -1, appliedPadBottom = -1;
    private int basePadLeft, basePadTop, basePadRight, basePadBottom;
    private int appliedForWidth = -1;

    LiquidGlassController(ViewGroup bar, View shadow,
                          int blurRadiusDp, int refractionPercent, boolean extendContent) {
        this.bar = bar;
        this.shadow = shadow;
        this.extendContent = extendContent;
        this.density = bar.getResources().getDisplayMetrics().density;
        this.glass = new LiquidGlassDrawable(bar, density, blurRadiusDp, refractionPercent);
        this.lens = new LiquidGlassLens(bar.getContext(), bar, glass, density);
        this.headers = LiquidGlassNavBarPatch.HEADER_GLASS.get()
                ? new HeaderGlassController(bar.getRootView(), density)
                : null;
        this.reelsTabId = bar.getResources().getIdentifier("clips_tab", "id", "com.instagram.android");
        this.sampler = new BackdropSampler(bar, glass::setBackdropLuminance);
        this.reels = new ReelsFullBleed((ViewGroup) bar.getParent());
    }

    void install() {
        basePadLeft = bar.getPaddingLeft();
        basePadTop = bar.getPaddingTop();
        basePadRight = bar.getPaddingRight();
        basePadBottom = bar.getPaddingBottom();

        captureForeignBackground();
        bar.setBackground(glass);
        bar.setClipToPadding(false);

        ViewGroup parent = (ViewGroup) bar.getParent();
        parent.addView(lens, parent.indexOfChild(bar) + 1, overlayLayoutParams(lens.extraTop));
        if (parent instanceof FrameLayout) {
            bottomBlur = new EdgeBlurView(bar.getContext(), density, false);
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
                            Math.round(pill.right), Math.round(pill.bottom), pill.height() / 2f);
                    outline.setAlpha(0.5f);
                }
            });
            bar.setElevation(dp(3));
            // Keep the lens above the now-elevated bar, without a shadow of its own.
            lens.setOutlineProvider(null);
            lens.setElevation(dp(3) + 0.1f);
        }

        android.view.Window window = BackdropSampler.windowOf(bar.getContext());
        if (window != null) TouchRouter.install(window, lens);

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

    /** Layout params matching the bar's position, extended upwards by {@code extraTop}. */
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
        try {
            enforce();
            if (bar.getVisibility() == View.VISIBLE) {
                // Content behind the bar may have changed this frame. Invalidating during
                // pre-draw folds the redraw into the current frame instead of scheduling a new one.
                glass.invalidateSelf();
            }
            lens.sync();
            if (headers != null) {
                headers.setDark(glassDarkForHeaders());
                headers.onPreDraw();
            }
            if (bar.getVisibility() == View.VISIBLE) {
                glass.getPill().round(sampleRect);
                sampler.maybeSample(sampleRect, dp(20));
            }
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
        reels.update(bar.getVisibility() == View.VISIBLE && isReelsSelected());
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
     * Instagram swaps the bar background to signal its color scheme (e.g. black on Reels).
     * Keep the color as a hint for the glass tint, then put our drawable back.
     */
    private void captureForeignBackground() {
        Drawable bg = bar.getBackground();
        if (bg == null || bg == glass) return;
        glass.setHostColorHint(bg instanceof ColorDrawable ? ((ColorDrawable) bg).getColor() : null);
    }

    /** Headers follow the app theme; the Reels color hint only applies to the tab bar. */
    private boolean glassDarkForHeaders() {
        int mode = bar.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return mode == Configuration.UI_MODE_NIGHT_YES;
    }

    private boolean isDark() {
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

        int gap = dp(BOTTOM_GAP_DP);
        int grow = dp(GROW_DP);
        ViewGroup.LayoutParams lp = bar.getLayoutParams();
        if (lp != null && lp.height > 0 && lp.height != appliedHeight) {
            baseHeight = lp.height;
            lp.height += gap + grow;
            appliedHeight = lp.height;
            bar.setLayoutParams(lp);

            ViewGroup.LayoutParams lensLp = lens.getLayoutParams();
            lensLp.height = appliedHeight + lens.extraTop;
            lens.setLayoutParams(lensLp);
        }

        if (appliedForWidth == width) return;

        int side = dp(SIDE_GAP_DP);
        int maxPill = dp(MAX_PILL_WIDTH_DP);
        int usable = width - basePadLeft - basePadRight;
        if (usable - 2 * side > maxPill) side = (usable - maxPill) / 2;

        int inner = dp(INNER_PADDING_DP);
        appliedPadLeft = basePadLeft + side + inner;
        appliedPadTop = basePadTop + grow / 2;
        appliedPadRight = basePadRight + side + inner;
        appliedPadBottom = basePadBottom + gap + (grow - grow / 2);
        appliedForWidth = width;

        glass.setPillInsets(basePadLeft + side, basePadRight + side, basePadBottom + gap);
        bar.setPadding(appliedPadLeft, appliedPadTop, appliedPadRight, appliedPadBottom);
        bar.invalidateOutline();
    }

    /**
     * Reels draws its username, caption and buttons right above the tab bar, so they must not
     * end up behind the pill. Everywhere else content scrolls underneath the glass.
     */
    private boolean contentBehindBar() {
        return extendContent && !isReelsSelected();
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
        // Content behind the bar also runs on under the navigation bar.
        int target = contentBehindBar() ? -bottomInset : appliedHeight;
        ViewGroup parent = (ViewGroup) bar.getParent();
        int barIndex = parent.indexOfChild(bar);
        for (int i = 0; i < barIndex; i++) {
            View child = parent.getChildAt(i);
            if (child == shadow || child instanceof EdgeBlurView) continue;
            if (!(child.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) continue;
            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) child.getLayoutParams();
            // Only take over the tab bar margin, leave other margins Instagram may set alone.
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
