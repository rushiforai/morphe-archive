package com.waze.gw;

import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.os.Build;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.view.GestureDetector;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * A draggable, HUD-styled floating SPEED-LIMIT sign for the main map screen.
 * Waze's native speedometer stays visible (this only adds a big speed-limit sign).
 * Drag to move; long-press to open the full HUD. Size + position persist in prefs.
 */
public class FloatSpeedo extends LinearLayout {

    private static volatile boolean nativeReportVisible;
    private static volatile java.lang.ref.WeakReference<FloatSpeedo> activeView =
            new java.lang.ref.WeakReference<FloatSpeedo>(null);

    private final TextView limit;
    private final LinearLayout speedoRow;
    private final TextView followingDistance;
    private GapGaugeView gapGauge;   // xADAS measured gap; null in the Settings preview
    private final FrameLayout limitStack;
    private final TextView minimumLimit;
    private final FrameLayout currentBadge;
    private final TextView currentSpeed;
    private final TextView currentUnit;
    private final ImageView avgSign;   // "cấm vượt" (no-passing) sign — only visible while inside an average-speed zone
    private final Handler h = new Handler(Looper.getMainLooper());
    private int lastSize = -1;
    private int lastLayoutStyle = -1;
    private int lastStyle3RingColor;
    private boolean minimumShown;
    private boolean averageZoneShown;
    private final boolean previewMode;

    /** "True" position desired by the user — only changed by drag, NEVER by resize-clamp. */
    public volatile int desiredX = -1, desiredY = -1;

    public FloatSpeedo(Context c) {
        this(c, false);
    }

    /** Static settings preview: same production views/layouts, without polling or drag handlers. */
    FloatSpeedo(Context c, boolean previewMode) {
        super(c);
        this.previewMode = previewMode;
        if (!previewMode) activeView = new java.lang.ref.WeakReference<FloatSpeedo>(this);
        setOrientation(VERTICAL);
        setGravity(Gravity.CENTER_HORIZONTAL);
        speedoRow = new LinearLayout(c);
        speedoRow.setOrientation(HORIZONTAL);
        speedoRow.setGravity(Gravity.CENTER_VERTICAL);
        addView(speedoRow, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        setPivotX(0f);
        setPivotY(0f);            // scale from the top-left (the drag anchor)
        int dia = dp(96);

        limitStack = new FrameLayout(c);
        limit = mkText(38, Color.BLACK, true);
        extraBold(limit);
        ModTypeface.applySpeed(limit);
        limit.setBackground(oval(0xFFFFFFFF, dp(10), 0xFFE2231A));
        limitStack.addView(limit, new FrameLayout.LayoutParams(dia, dia));

        // Blue minimum-speed sign overlapping the lower-right of the normal maximum-speed sign.
        int minDia = dp(58);
        minimumLimit = mkText(25, Color.WHITE, true);
        minimumLimit.setIncludeFontPadding(false);
        extraBold(minimumLimit);
        ModTypeface.applyGauge(minimumLimit);
        minimumLimit.setBackground(oval(0xFF0B4FB3, 0, 0xFF0B4FB3));
        minimumLimit.setVisibility(GONE);
        FrameLayout.LayoutParams minP = new FrameLayout.LayoutParams(minDia, minDia);
        minP.leftMargin = dp(60);
        minP.topMargin = dp(54);
        limitStack.addView(minimumLimit, minP);

        currentBadge = new FrameLayout(c);
        currentBadge.setClipChildren(false);
        currentBadge.setClipToPadding(false);
        currentSpeed = mkText(32, Color.WHITE, false);
        currentSpeed.setIncludeFontPadding(false);
        ModTypeface.applyGauge(currentSpeed);
        currentUnit = mkText(13, 0xFFD8DADF, false);
        currentUnit.setIncludeFontPadding(false);
        currentBadge.addView(currentSpeed);
        currentBadge.addView(currentUnit);
        limitStack.addView(currentBadge);
        speedoRow.addView(limitStack, new LinearLayout.LayoutParams(dia, dia));

        avgSign = new ImageView(c);
        avgSign.setVisibility(GONE);
        LinearLayout.LayoutParams ap = new LinearLayout.LayoutParams(dia, dia);
        ap.leftMargin = dp(6);
        speedoRow.addView(avgSign, ap);

        followingDistance = mkText(24, Color.WHITE, true);
        followingDistance.setIncludeFontPadding(false);
        followingDistance.setBackground(roundRect(0xE61B1F29, 10));
        followingDistance.setVisibility(GONE);
        LinearLayout.LayoutParams distanceParams = new LinearLayout.LayoutParams(dp(96), dp(38));
        distanceParams.topMargin = dp(6);
        addView(followingDistance, distanceParams);

        if (!previewMode) {
            gapGauge = new GapGaugeView(c, GapGaugeView.Surface.FLOAT, false, dp(112));
            gapGauge.setListener(new GapGaugeView.Listener() {
                @Override public void onVisibilityChanged(boolean visible) {
                    updateFollowingDistance();     // the advisory chip gives way to the measured gauge
                    postClampToDesired();
                }
            });
            LinearLayout.LayoutParams gaugeParams = new LinearLayout.LayoutParams(dp(112), dp(112));
            gaugeParams.topMargin = dp(6);
            addView(gapGauge, gaugeParams);
        }

        applyLayoutStyle(4, false, false);
        if (!previewMode) {
            setupTouch();
            tick.run();
        }
    }

    /** Feed deterministic sample values into the real widget used on the map. */
    void configurePreview(int style, int sizePercent, boolean boldSpeedSigns) {
        if (!previewMode) return;
        style = clampLayoutStyle(style);
        applyLayoutStyle(style, true, false);

        int lim = 90;
        int min = 60;
        int speed = 45;
        fitStableSpeed(limit, lim, 50f, 42f);
        applySpeedWeight(limit, boldSpeedSigns, 0.055f);
        limit.setText(String.valueOf(lim));
        LimitSign.apply(limit);
        fitStableSpeed(minimumLimit, min, 26f, 21f);
        applySpeedWeight(minimumLimit, false, 0f);   // JetBrains Mono Bold needs no extra outline
        minimumLimit.setText(String.valueOf(min));
        minimumLimit.setVisibility(VISIBLE);

        fitStableSpeed(currentSpeed, speed,
                style == 1 || style == 3 ? 40f : 30f,
                style == 1 ? 32f : (style == 3 ? 33f : 24f));
        currentSpeed.setText(String.valueOf(speed));
        currentSpeed.setTextColor(currentSpeedColor(style));
        currentUnit.setTextColor(0xFFD8DADF);
        currentUnit.setText(Units.speedUnit("Km/h"));
        if (style == 3) {
            lastStyle3RingColor = 0;
            applyStyle3Dial(false);
        }

        float scale = Math.max(0.8f, Math.min(2.2f, sizePercent / 100f));
        setScaleX(scale);
        setScaleY(scale);
        setVisibility(VISIBLE);
        requestLayout();
    }

    private final Runnable tick = new Runnable() {
        @Override
        public void run() {
            android.content.SharedPreferences preferences = getContext()
                    .getSharedPreferences("waze_hud_gw", Context.MODE_PRIVATE);
            boolean on = preferences.getBoolean("float_speedo", true);
            applyConfiguredVisibility(on);
            updateFollowingDistance();
            if (on) {
                int size = preferences.getInt("fs_size", 130);
                int layoutStyle = clampLayoutStyle(preferences.getInt("fs_layout", 4));
                boolean boldSpeedSigns = preferences.getBoolean(
                        "float_speed_sign_bold", true);
                if (size != lastSize) {
                    lastSize = size;
                    float sc = size / 100f;
                    setScaleX(sc);
                    setScaleY(sc);
                    postClampToDesired();
                }
                int lim = Gateway.hudLimit;
                fitStableSpeed(limit, lim, 50f, 42f);
                // The condensed font's narrow "1" becomes disproportionately heavy with the
                // normal outline. Use a lighter outline for 100/110/120 in the classic sign.
                applySpeedWeight(limit, boldSpeedSigns,
                        lim >= 100 ? 0.035f : 0.055f);
                limit.setText(lim >= 10 ? String.valueOf(lim) : "--");
                LimitSign.apply(limit);

                int min = Gateway.minimumSpeedLimit;
                boolean showMinimum = min >= 10 && min <= 160;
                boolean showAverageZone = Gateway.avgZone;
                if (layoutStyle != lastLayoutStyle
                        || showMinimum != minimumShown
                        || showAverageZone != averageZoneShown) {
                    lastLayoutStyle = layoutStyle;
                    minimumShown = showMinimum;
                    averageZoneShown = showAverageZone;
                    applyLayoutStyle(layoutStyle, showMinimum, showAverageZone);
                }
                applySpeedWeight(minimumLimit, false, 0f);
                if (showMinimum) {
                    fitStableSpeed(minimumLimit, min, 26f, 21f);
                    minimumLimit.setText(String.valueOf(min));
                }
                minimumLimit.setVisibility(showMinimum ? VISIBLE : GONE);

                int speed = Math.max(0, Gateway.hudSpeed);
                fitStableSpeed(currentSpeed, speed,
                        layoutStyle == 1 || layoutStyle == 3 ? 40f : 30f,
                        layoutStyle == 1 ? 32f : (layoutStyle == 3 ? 33f : 24f));
                currentSpeed.setText(String.valueOf(speed));
                boolean overspeed = lim >= 10 && speed > lim;
                currentSpeed.setTextColor(overspeed
                        ? 0xFFFF3B30 : currentSpeedColor(layoutStyle));
                currentUnit.setTextColor(overspeed && layoutStyle == 3
                        ? 0xFFFF6259 : 0xFFD8DADF);
                currentUnit.setText(Units.speedUnit("Km/h"));
                if (layoutStyle == 3) applyStyle3Dial(overspeed);

                if (showAverageZone) {                 // inside a "cấm vượt" zone -> show the no-passing sign
                    if (avgSign.getDrawable() == null) {
                        android.graphics.Bitmap b = Signs.pin(getContext(), "no_passing_in");
                        if (b != null) avgSign.setImageBitmap(b);
                    }
                    avgSign.setVisibility(VISIBLE);
                } else {
                    avgSign.setVisibility(GONE);
                }
            }
            h.postDelayed(this, 500);
        }
    };

    /** Keep the floating speed sign below Waze's report UI without changing its saved position. */
    static void setNativeReportVisible(boolean visible) {
        nativeReportVisible = visible;
        final FloatSpeedo view = activeView.get();
        if (view == null) return;
        view.post(new Runnable() {
            @Override public void run() {
                boolean enabled = view.getContext()
                        .getSharedPreferences("waze_hud_gw", Context.MODE_PRIVATE)
                        .getBoolean("float_speedo", true);
                view.applyConfiguredVisibility(enabled);
            }
        });
    }

    private void applyConfiguredVisibility(boolean enabled) {
        // INVISIBLE preserves the measured footprint and user position while allowing Waze's
        // report surface to own the screen. GONE remains reserved for the user's master toggle.
        setVisibility(!enabled ? GONE : (nativeReportVisible ? INVISIBLE : VISIBLE));
    }

    static void refreshFollowingDistance() {
        final FloatSpeedo view = activeView.get();
        if (view != null) view.post(new Runnable() {
            @Override public void run() { view.updateFollowingDistance(); }
        });
    }

    private void updateFollowingDistance() {
        // The advisory chip is for when xADAS is not measuring; the gauge replaces it otherwise.
        boolean gaugeShown = gapGauge != null && gapGauge.getVisibility() == VISIBLE;
        int metres = previewMode || gaugeShown ? 0 : Gateway.followingDistanceMetres();
        int visibility = metres > 0 ? VISIBLE : GONE;
        if (metres > 0) {
            String imperialGap = Units.imperialDistance(metres, true);
            followingDistance.setText(imperialGap != null ? imperialGap : metres + "M");
            followingDistance.setContentDescription(imperialGap != null
                    ? I18n.f("ui.recommended_following_distance_on_feet", Units.feet(metres))
                    : I18n.f("ui.recommended_following_distance_on", metres));
        }
        if (followingDistance.getVisibility() != visibility) {
            followingDistance.setVisibility(visibility);
            postClampToDesired();
        }
    }

    private int clampLayoutStyle(int style) {
        return style < 1 || style > 4 ? 4 : style;
    }

    /** Recompose the same live data into one of the four user-designed arrangements. */
    private void applyLayoutStyle(int style, boolean showMinimum, boolean showAverageZone) {
        style = clampLayoutStyle(style);
        limitStack.setClipChildren(false);
        limitStack.setClipToPadding(false);
        currentBadge.setVisibility(style == 4 ? GONE : VISIBLE);
        currentUnit.setVisibility(style == 1 || style == 3 ? VISIBLE : GONE);
        currentSpeed.setGravity(Gravity.CENTER);
        currentUnit.setGravity(Gravity.CENTER);

        int stackWidth;
        int stackHeight;
        if (style == 1) {
            // Keep the vertical card close to the 96dp sign. The minimum-speed badge may
            // occupy its own centered row so neither sign masks the other.
            stackWidth = 108;
            stackHeight = showMinimum ? 266 : 200;
            limitStack.setBackground(roundRect(0xE61B1F29, 54));
            setFrame(limit, 96, 96, 6, 6);
            setFrame(minimumLimit, 58, 58, 25, 108);
            setFrame(currentBadge, 96, 76, 6, showMinimum ? 178 : 118);
            setFrame(currentSpeed, 96, 50, 0, 0);
            setFrame(currentUnit, 96, 26, 0, 49);
            currentBadge.setBackground(null);
            setStableTextSize(currentSpeed, 40f);
            setStableTextSize(currentUnit, 16f);
        } else if (style == 2) {
            stackWidth = 133;
            stackHeight = showMinimum ? 122 : 106;
            limitStack.setBackground(null);
            setFrame(limit, 96, 96, 0, 10);
            setFrame(minimumLimit, 58, 58, 60, 64);
            setFrame(currentBadge, 58, 58, 75, 0);
            setFrame(currentSpeed, 58, 58, 0, 0);
            setFrame(currentUnit, 1, 1, 0, 0);
            GradientDrawable badge = oval(0xFFE1E5E9, 0, 0xFFE1E5E9);
            badge.setStroke(dp(2), 0xFF168DE2, dp(5), dp(3));
            currentBadge.setBackground(badge);
            setStableTextSize(currentSpeed, 30f);
        } else if (style == 3) {
            // Keep the two main dials visually grouped like VML: only a narrow gap
            // remains between them instead of almost half a dial of empty space.
            stackWidth = 200;
            // In an average-speed zone, the no-passing sign sits below the limit sign.
            // The cluster then grows into an L instead of extending into a very wide row.
            stackHeight = showAverageZone ? 200 : (showMinimum ? 114 : 96);
            limitStack.setBackground(null);
            setFrame(limit, 96, 96, 0, 0);
            setFrame(minimumLimit, 58, 58, 60, 54);
            setFrame(currentBadge, 96, 96, 104, 0);
            setFrame(currentSpeed, 96, 66, 0, 7);
            setFrame(currentUnit, 96, 22, 0, 67);
            lastStyle3RingColor = 0;
            applyStyle3Dial(false);
            setStableTextSize(currentSpeed, 40f);
            setStableTextSize(currentUnit, 13f);
        } else {
            stackWidth = showMinimum ? 120 : 96;
            stackHeight = showMinimum ? 114 : 96;
            limitStack.setBackground(null);
            setFrame(limit, 96, 96, 0, 0);
            setFrame(minimumLimit, 58, 58, 60, 54);
            setFrame(currentBadge, 1, 1, 0, 0);
        }

        placeAverageSign(style);

        // The optional blue minimum-speed badge is the foreground badge in every
        // composition. This matters in compact style 3, where it bridges the two dials.
        minimumLimit.bringToFront();

        LinearLayout.LayoutParams stackParams =
                (LinearLayout.LayoutParams) limitStack.getLayoutParams();
        stackParams.width = dp(stackWidth);
        stackParams.height = dp(stackHeight);
        limitStack.setLayoutParams(stackParams);
        requestLayout();
        postClampToDesired();
    }

    /** Preset 3 uses a compact L; all other presets preserve the original side placement. */
    private void placeAverageSign(int style) {
        ViewGroup parent = (ViewGroup) avgSign.getParent();
        if (style == 3) {
            if (parent != limitStack) {
                if (parent != null) parent.removeView(avgSign);
                limitStack.addView(avgSign);
            }
            setFrame(avgSign, 96, 96, 0, 104);
        } else {
            if (parent != speedoRow) {
                if (parent != null) parent.removeView(avgSign);
                speedoRow.addView(avgSign);
            }
            LinearLayout.LayoutParams params =
                    new LinearLayout.LayoutParams(dp(96), dp(96));
            params.leftMargin = dp(6);
            avgSign.setLayoutParams(params);
        }
    }

    private int currentSpeedColor(int style) {
        return style == 1 || style == 3 ? 0xFFFFFFFF : 0xFF17191D;
    }

    /** Dark VML-inspired dial with a neon state ring; red means the limit is exceeded. */
    private void applyStyle3Dial(boolean overspeed) {
        int ring = overspeed ? 0xFFFF3B30 : 0xFFA970FF;
        if (lastStyle3RingColor == ring) return;
        lastStyle3RingColor = ring;

        GradientDrawable glow = oval(overspeed ? 0x55FF3B30 : 0x559B5CFF,
                0, overspeed ? 0x55FF3B30 : 0x559B5CFF);
        GradientDrawable core = oval(0xFF121218, dp(4), ring);
        android.graphics.drawable.LayerDrawable dial =
                new android.graphics.drawable.LayerDrawable(
                        new android.graphics.drawable.Drawable[]{glow, core});
        int glowInset = dp(3);
        dial.setLayerInset(1, glowInset, glowInset, glowInset, glowInset);
        currentBadge.setBackground(dial);
    }

    private void setFrame(View view, int width, int height, int left, int top) {
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(dp(width), dp(height));
        params.leftMargin = dp(left);
        params.topMargin = dp(top);
        view.setLayoutParams(params);
    }

    private GradientDrawable roundRect(int fill, int radiusDp) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setShape(GradientDrawable.RECTANGLE);
        drawable.setColor(fill);
        drawable.setCornerRadius(dp(radiusDp));
        return drawable;
    }

    /** A style change alters the measured footprint; clamp once without overwriting saved drag. */
    private void postClampToDesired() {
        post(new Runnable() {
            @Override public void run() { clampToDesired(); }
        });
    }

    /**
     * Puts the widget at the user's desired spot, pulled inside the safe area. Never persists: only a drag
     * does, so a position chosen in landscape comes back when the device returns to landscape.
     * Run on every size, layout, inset and orientation change (Gateway's root listener calls it too).
     */
    void clampToDesired() {
        if (previewMode) return;
        ViewGroup.LayoutParams raw = getLayoutParams();
        if (!(raw instanceof FrameLayout.LayoutParams)) return;
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) raw;
        int[] clamped = clampXY(desiredX >= 0 ? desiredX : params.leftMargin,
                desiredY >= 0 ? desiredY : params.topMargin);
        if (params.leftMargin != clamped[0] || params.topMargin != clamped[1]
                || params.gravity != (Gravity.TOP | Gravity.START)) {
            params.gravity = Gravity.TOP | Gravity.START;
            params.leftMargin = clamped[0];
            params.topMargin = clamped[1];
            setLayoutParams(params);
        }
    }

    /**
     * Always take the natural size. WRAP_CONTENT under a FrameLayout margin is otherwise squeezed to the space
     * left of the margin, so near an edge getWidth() under-reports the real footprint and the clamp lets the
     * widget (and its average-speed sign) hang over the edge.
     */
    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (previewMode) {
            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
            return;
        }
        super.onMeasure(MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED),
                MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED));
    }

    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (!previewMode) postClampToDesired();
    }

    @Override
    public android.view.WindowInsets onApplyWindowInsets(android.view.WindowInsets insets) {
        if (!previewMode) postClampToDesired();
        return super.onApplyWindowInsets(insets);
    }

    @Override
    protected void onConfigurationChanged(android.content.res.Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (!previewMode) postClampToDesired();
    }

    private void setupTouch() {
        final GestureDetector gd = new GestureDetector(getContext(),
                new GestureDetector.SimpleOnGestureListener() {
                    @Override public void onLongPress(MotionEvent e) {
                        if (getContext().getSharedPreferences("waze_hud_gw", Context.MODE_PRIVATE)
                                .getBoolean("float_speedo_long_press_hud", true)) {
                            openHud();
                        }
                    }
                });
        final int slop = android.view.ViewConfiguration.get(getContext()).getScaledTouchSlop();
        setOnTouchListener(new OnTouchListener() {
            float dx, dy, downX, downY;
            boolean moved;
            @Override
            public boolean onTouch(View v, MotionEvent e) {
                gd.onTouchEvent(e);   // long-press -> open HUD
                ViewGroup.LayoutParams raw = getLayoutParams();
                if (!(raw instanceof FrameLayout.LayoutParams)) return true;
                FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) raw;
                switch (e.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        if (getParent() != null) getParent().requestDisallowInterceptTouchEvent(true);
                        downX = e.getRawX();
                        downY = e.getRawY();
                        moved = false;
                        dx = e.getRawX() - lp.leftMargin;
                        dy = e.getRawY() - lp.topMargin;
                        break;
                    case MotionEvent.ACTION_MOVE:
                        if (!moved && (Math.abs(e.getRawX() - downX) > slop
                                || Math.abs(e.getRawY() - downY) > slop)) moved = true;
                        if (moved) {                       // only a genuine drag repositions/saves
                            lp.gravity = Gravity.TOP | Gravity.START;
                            int[] xy = clampXY((int) (e.getRawX() - dx), (int) (e.getRawY() - dy));
                            lp.leftMargin = xy[0];
                            lp.topMargin = xy[1];
                            setLayoutParams(lp);
                            savePos(lp.leftMargin, lp.topMargin);
                        }
                        break;
                    case MotionEvent.ACTION_UP:
                    case MotionEvent.ACTION_CANCEL:
                        if (moved) savePos(lp.leftMargin, lp.topMargin);
                        break;
                }
                return true;
            }
        });
    }

    /** Clamp a target (x,y) so the (scaled) widget stays fully inside the safe area of the parent. */
    private int[] clampXY(int nx, int ny) {
        View parent = getParent() instanceof View ? (View) getParent() : null;
        if (parent != null && parent.getWidth() > 0 && getWidth() > 0) {
            Rect safe = safeBounds(parent);
            int vw = (int) Math.ceil(getWidth() * getScaleX());
            int vh = (int) Math.ceil(getHeight() * getScaleY());
            // A widget larger than the safe area stays pinned to its top-left corner instead of leaving it.
            nx = Math.max(safe.left, Math.min(nx, safe.right - vw));
            ny = Math.max(safe.top, Math.min(ny, safe.bottom - vh));
        } else {
            nx = Math.max(0, nx);
            ny = Math.max(0, ny);
        }
        return new int[]{nx, ny};
    }

    /**
     * The parent's area minus the visible system bars and the display cutout, in the parent's coordinates
     * (the parent need not start at the window origin, e.g. split screen or insets applied above it).
     */
    private Rect safeBounds(View parent) {
        Rect bounds = new Rect(0, 0, parent.getWidth(), parent.getHeight());
        try {
            android.view.WindowInsets insets = parent.getRootWindowInsets();
            View window = parent.getRootView();
            if (insets == null || window == null || window.getWidth() <= 0 || window.getHeight() <= 0) return bounds;
            int left, top, right, bottom;
            if (Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets bars = insets.getInsets(
                        android.view.WindowInsets.Type.systemBars() | android.view.WindowInsets.Type.displayCutout());
                left = bars.left; top = bars.top; right = bars.right; bottom = bars.bottom;
            } else {
                left = insets.getSystemWindowInsetLeft();
                top = insets.getSystemWindowInsetTop();
                right = insets.getSystemWindowInsetRight();
                bottom = insets.getSystemWindowInsetBottom();
                if (Build.VERSION.SDK_INT >= 28 && insets.getDisplayCutout() != null) {
                    android.view.DisplayCutout cutout = insets.getDisplayCutout();
                    left = Math.max(left, cutout.getSafeInsetLeft());
                    top = Math.max(top, cutout.getSafeInsetTop());
                    right = Math.max(right, cutout.getSafeInsetRight());
                    bottom = Math.max(bottom, cutout.getSafeInsetBottom());
                }
            }
            int[] origin = new int[2];
            parent.getLocationInWindow(origin);
            Rect safe = new Rect(
                    Math.max(bounds.left, left - origin[0]),
                    Math.max(bounds.top, top - origin[1]),
                    Math.min(bounds.right, window.getWidth() - right - origin[0]),
                    Math.min(bounds.bottom, window.getHeight() - bottom - origin[1]));
            if (safe.width() > 0 && safe.height() > 0) return safe;
        } catch (Throwable ignored) {
            // fall back to the plain parent bounds
        }
        return bounds;
    }

    private void savePos(int x, int y) {
        desiredX = x;
        desiredY = y;
        getContext().getSharedPreferences("waze_hud_gw", Context.MODE_PRIVATE)
                .edit().putInt("fs_x", x).putInt("fs_y", y).commit();
    }

    private void openHud() {
        try {
            Context c = getContext();
            Intent it = HudActivity.createIntent(c);
            it.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            c.startActivity(it);
        } catch (Throwable t) { /* ignore */ }
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        h.removeCallbacks(tick);
        if (activeView.get() == this) activeView.clear();
    }

    private TextView mkText(int sizeDp, int color, boolean bold) {
        TextView t = new TextView(getContext());
        setStableTextSize(t, sizeDp);
        t.setTextColor(color);
        t.setGravity(Gravity.CENTER);
        if (bold) t.setTypeface(Typeface.DEFAULT_BOLD);
        return t;
    }

    /**
     * FloatSpeedo frames are dimensioned in dp and the whole widget already follows fs_size.
     * Using TextView's default SP unit applies Android fontScale a second time, so Large text can
     * push the speed and unit outside their fixed frames. Keep this compact driving widget on the
     * same density scale as its geometry while leaving the rest of Waze's accessibility text alone.
     */
    private void setStableTextSize(TextView view, float sizeDp) {
        if (view == null) return;
        float targetPx = sizeDp * getResources().getDisplayMetrics().density;
        if (Math.abs(view.getTextSize() - targetPx) > 0.5f) {
            view.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, targetPx);
        }
    }

    private void fitStableSpeed(TextView view, int value, float shortDp, float threeDigitDp) {
        setStableTextSize(view, value >= 100 ? threeDigitDp : shortDp);
    }

    private void extraBold(TextView t) {
        t.setTypeface(Typeface.DEFAULT_BOLD);
        t.getPaint().setStyle(android.graphics.Paint.Style.FILL_AND_STROKE);
        t.getPaint().setStrokeWidth(t.getTextSize() * 0.055f);
    }

    private void applySpeedWeight(TextView text, boolean bold, float strokeRatio) {
        if (text == null) return;
        text.getPaint().setStyle(bold
                ? android.graphics.Paint.Style.FILL_AND_STROKE
                : android.graphics.Paint.Style.FILL);
        text.getPaint().setStrokeWidth(bold ? text.getTextSize() * strokeRatio : 0f);
        text.invalidate();
    }

    private GradientDrawable oval(int fill, int strokeW, int strokeColor) {
        GradientDrawable g = new GradientDrawable();
        g.setShape(GradientDrawable.OVAL);
        g.setColor(fill);
        g.setStroke(strokeW, strokeColor);
        return g;
    }

    private int dp(int v) {
        return (int) (v * getResources().getDisplayMetrics().density + 0.5f);
    }
}
