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
 * Content can run under the system navigation bar. The glass blurs only inside the pill; the
 * surrounding screen stays clear. Reels keeps its own layout and stops above the pill unless asked
 * to run behind it.
 */
final class LiquidGlassController implements ViewTreeObserver.OnPreDrawListener {
    // The bar's height, margins and tab inset come from NavbarStyle (the Customize page).

    /** On tablets and landscape the pill stops growing at this width. */
    private static final int MAX_PILL_WIDTH_DP = 520;
    /** Space between a reel's raised controls and the top of the pill. */
    private static final int REELS_LIFT_GAP_DP = 8;

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
    /** Keeps a reel's caption, buttons and seek bar above the pill while Reels run behind it. */
    private final ReelsLift reelsLift;
    /** Copies of videos playing under the bar, which the glass can't record (see SurfaceSnapshots). */
    private final SurfaceSnapshots snapshots;
    private final android.graphics.RectF snapshotRegion = new android.graphics.RectF();
    private final android.graphics.Rect sampleRect = new android.graphics.Rect();
    private final float density;
    /** Coordinates used to account for the navigation inset. */
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

    LiquidGlassController(ViewGroup bar, View shadow, boolean extendContent) {
        this(bar, shadow, extendContent, () -> NavbarStyle.forTab(selectedTabIndex(bar)));
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
        this.reelsLift = new ReelsLift(bar, density);
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

        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.S) {
            // Soft system shadow cast by the pill outline. The glass is opaque on 12+, so the
            // shadow can't show through it (on older versions the tint is translucent: skip).
            bar.setOutlineProvider(new android.view.ViewOutlineProvider() {
                @Override
                public void getOutline(View view, android.graphics.Outline outline) {
                    android.graphics.RectF pill = glass.getPill();
                    outline.setRoundRect(Math.round(pill.left), Math.round(pill.top),
                            Math.round(pill.right), Math.round(pill.bottom), glass.cornerRadius());
                    NavbarStyle style = styleSource.get();
                    // A see-through bar would show its own shadow through itself: none there.
                    outline.setAlpha(style.barStyle == NavbarStyle.STYLE_TRANSPARENT
                            ? 0f : Math.min(1f, style.shadow));
                }
            });
            // Elevation (and the lens above it) is set from the Shadow setting in enforceGeometry().
            lens.setOutlineProvider(null);
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
        try {
            enforce();
            if (bar.getVisibility() == View.VISIBLE && !preview) {
                // Copy videos behind the bar and its lens, which can poke out above the bar.
                float top = bar.getTop() + bar.getTranslationY() - dp(100);
                float bottom = bar.getBottom() + bar.getTranslationY() + dp(12);
                snapshotRegion.set(bar.getLeft(), top, bar.getRight(), Math.max(top, bottom));
                snapshots.update(snapshotRegion);
            }
            if (bar.getVisibility() == View.VISIBLE) {
                // Content behind the bar may have changed this frame. Invalidating during
                // pre-draw folds the redraw into the current frame instead of scheduling a new one.
                glass.invalidateSelf();
            }
            lens.sync();
            liftReels();
            if (bar.getVisibility() == View.VISIBLE && !preview) {
                glass.getPill().round(sampleRect);
                sampler.maybeSample(sampleRect, dp(20));
            }
        } catch (Throwable t) {
            bar.getViewTreeObserver().removeOnPreDrawListener(this);
            android.util.Log.e(LiquidGlassNavBarPatch.TAG, "Disabling liquid glass", t);
        }
        return true;
    }

    /**
     * With Reels running behind the pill, the video fills the screen under the glass, so the reel's
     * author, caption, buttons and seek bar are raised to end just above the pill's top. They follow
     * the pill when Vertical position or the Reels bottom gap moves it, and the seek bar takes the
     * Reel seek bar position setting on top.
     */
    private void liftReels() {
        boolean active = !preview && bar.getVisibility() == View.VISIBLE && isReelsSelected() && contentBehindBar();
        float pillTop = 0f;
        if (active) {
            bar.getLocationInWindow(location);
            pillTop = location[1] + glass.getPill().top;
        }
        reelsLift.apply(bar, active, pillTop, REELS_LIFT_GAP_DP, LiquidGlassNavBarPatch.reelSeekBarOffsetDp());
    }

    private void enforce() {
        if (bar.getBackground() != glass) {
            captureForeignBackground();
            bar.setBackground(glass);
        }

        glass.setDark(isDark());

        if (shadow != null && shadow.getAlpha() != 0f) shadow.setAlpha(0f);

        stripNativeTabHighlights();
        updateSystemBarInsets();
        enforceGeometry();
        enforceContentMargins();
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

    /** Light or dark regardless of Instagram, for the settings preview; null to follow Instagram. */
    void forceDark(Boolean dark) {
        forcedDark = dark;
        bar.invalidate();
    }

    private Boolean forcedDark;

    /**
     * Light or dark from what Instagram shows, not from the app's mode. Instagram colors its own tab icons, black on
     * a light bar and white on a dark one, and a bar of the other kind put black icons on dark glass. So the icons
     * decide first ({@link #iconsLight()}), then the color Instagram gave the bar, then the app's mode.
     */
    private boolean isDark() {
        if (forcedDark != null) return forcedDark;
        Boolean light = preview ? null : iconsLight();
        if (light != null) return light;
        Integer hint = glass.getHostColorHint();
        if (hint != null && Color.alpha(hint) > 0x80) {
            return luminance(hint) < 0.4f;
        }
        int mode = bar.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return mode == Configuration.UI_MODE_NIGHT_YES;
    }

    /** How often the tab icons' color is read again, in ms. */
    private static final long ICON_CHECK_MS = 400;
    /** The size the icons are drawn at to read their color, in pixels. */
    private static final int ICON_SAMPLE_PX = 24;
    private long iconsCheckedAt;
    private Boolean iconsLightNow;
    private android.graphics.Bitmap iconSample;

    /**
     * Whether Instagram's tab icons are drawn light (white, for a dark bar), dark (black, for a light bar), or
     * null when that can't be told. Read from up to three icons drawn small, leaving out the profile picture,
     * at most once every {@link #ICON_CHECK_MS}.
     */
    private Boolean iconsLight() {
        long now = android.os.SystemClock.uptimeMillis();
        if (iconsCheckedAt != 0 && now - iconsCheckedAt < ICON_CHECK_MS) return iconsLightNow;
        iconsCheckedAt = now;
        try {
            float[] sum = new float[2];
            int read = 0;
            for (int i = 0; i < bar.getChildCount() && read < 3; i++) {
                View tab = bar.getChildAt(i);
                if (tab.getVisibility() != View.VISIBLE || tabIndexByName(tab) == 4) continue;
                android.widget.ImageView icon = firstIcon(tab, 3);
                if (icon != null && sampleIcon(icon, sum)) read++;
            }
            if (read == 0 || sum[1] <= 0f) {
                iconsLightNow = null;
            } else {
                float average = sum[0] / sum[1];
                iconsLightNow = average > 0.6f ? Boolean.TRUE : average < 0.35f ? Boolean.FALSE : null;
            }
        } catch (Throwable t) {
            iconsLightNow = null;
        }
        return iconsLightNow;
    }

    /** The first shown ImageView at most [depth] levels into [view] that isn't a round profile picture. */
    private static android.widget.ImageView firstIcon(View view, int depth) {
        if (view.getVisibility() != View.VISIBLE || view.getWidth() <= 0 || view.getHeight() <= 0) return null;
        if (view instanceof android.widget.ImageView) {
            android.widget.ImageView image = (android.widget.ImageView) view;
            String name = view.getClass().getName().toLowerCase(java.util.Locale.ROOT);
            if (image.getDrawable() == null || name.contains("avatar") || name.contains("circular")) return null;
            return image;
        }
        if (depth <= 0 || !(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            android.widget.ImageView found = firstIcon(group.getChildAt(i), depth - 1);
            if (found != null) return found;
        }
        return null;
    }

    /** Draws [icon] small and adds its drawn pixels' luminance and weight to [sum]; false when nothing drew. */
    private boolean sampleIcon(android.widget.ImageView icon, float[] sum) {
        if (iconSample == null) {
            iconSample = android.graphics.Bitmap.createBitmap(ICON_SAMPLE_PX, ICON_SAMPLE_PX, android.graphics.Bitmap.Config.ARGB_8888);
        }
        iconSample.eraseColor(Color.TRANSPARENT);
        android.graphics.Canvas canvas = new android.graphics.Canvas(iconSample);
        canvas.scale(ICON_SAMPLE_PX / (float) icon.getWidth(), ICON_SAMPLE_PX / (float) icon.getHeight());
        icon.getDrawable().draw(canvas);
        float weight = 0f, light = 0f;
        for (int y = 0; y < ICON_SAMPLE_PX; y++) {
            for (int x = 0; x < ICON_SAMPLE_PX; x++) {
                int pixel = iconSample.getPixel(x, y);
                int alpha = Color.alpha(pixel);
                if (alpha < 0x80) continue;
                float a = alpha / 255f;
                weight += a;
                light += a * luminance(pixel);
            }
        }
        if (weight < 4f) return false;
        sum[0] += light;
        sum[1] += weight;
        return true;
    }

    private static float luminance(int color) {
        return (0.2126f * Color.red(color) + 0.7152f * Color.green(color)
                + 0.0722f * Color.blue(color)) / 255f;
    }

    private void enforceGeometry() {
        int width = bar.getWidth();
        if (width <= 0) return;
        NavbarStyle style = styleSource.get();
        // The settings preview and Instagram's real tab bar use the same saved position.
        // Positive values lift the pill clear of Reel controls; negative values lower it.
        float verticalOffset = -dp(style.verticalPositionDp);
        if (bar.getTranslationY() != verticalOffset) bar.setTranslationY(verticalOffset);
        if (style.version != appliedStyleVersion) {
            appliedStyleVersion = style.version;
            appliedForWidth = -1;
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.S) {
                // 3dp at the default 50%; the lens stays just above the bar.
                float elevation = style.barStyle == NavbarStyle.STYLE_TRANSPARENT
                        ? 0f : 6f * density * style.shadow;
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

                ViewGroup.LayoutParams lensLp = lens.getLayoutParams();
                lensLp.height = appliedHeight + lens.extraTop;
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

    /**
     * Reels draws its username, caption and buttons right above the tab bar, so they must not
     * end up behind the pill. Everywhere else content scrolls underneath the glass.
     */
    private boolean contentBehindBar() {
        return extendContent && (!isReelsSelected() || LiquidGlassNavBarPatch.reelsBehindBar());
    }

    private boolean isReelsSelected() {
        if (reelsTabId == 0) return false;
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            if (child.getId() == reelsTabId) return child.isSelected() || child.isActivated();
        }
        return false;
    }

    /** Instagram's five bottom tabs follow the same Home, Reels, Messages, Explore, Profile order as the preview. */
    private static int selectedTabIndex(ViewGroup bar) {
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            if (child.getVisibility() == View.VISIBLE && (child.isSelected() || child.isActivated())) {
                int byName = tabIndexByName(child);
                return byName >= 0 ? byName : Math.max(0, Math.min(4, i));
            }
        }
        return 0;
    }

    /** Prefer Instagram's resource ID; fall back to the five-tab order used by the live preview. */
    private static int tabIndexByName(View tab) {
        if (tab.getId() == View.NO_ID) return -1;
        try {
            String name = tab.getResources().getResourceEntryName(tab.getId()).toLowerCase(java.util.Locale.ROOT);
            if (name.contains("clips") || name.contains("reel")) return 1;
            if (name.contains("direct") || name.contains("message") || name.contains("inbox")) return 2;
            if (name.contains("search") || name.contains("explore")) return 3;
            if (name.contains("profile")) return 4;
            if (name.contains("home") || name.contains("feed")) return 0;
        } catch (android.content.res.Resources.NotFoundException ignored) {
            // The preview's generated tabs have no Instagram resource IDs.
        }
        return -1;
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
        int target = contentBehindBar() ? -bottomInset
                : Math.max(0, appliedHeight + dp(styleSource.get().verticalPositionDp));
        ViewGroup parent = (ViewGroup) bar.getParent();
        int barIndex = parent.indexOfChild(bar);
        for (int i = 0; i < barIndex; i++) {
            View child = parent.getChildAt(i);
            if (child == shadow) continue;
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