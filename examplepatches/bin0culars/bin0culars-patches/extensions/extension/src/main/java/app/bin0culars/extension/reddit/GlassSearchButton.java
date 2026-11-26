package app.bin0culars.extension.reddit;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.OvalShape;
import android.os.Build;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewParent;
import android.view.WindowInsets;
import android.widget.FrameLayout;

public final class GlassSearchButton extends View {

    private final Paint circlePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint edgePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint iconPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path clipPath = new Path();
    private final int[] windowLocation = new int[2];

    private LinearGradient edgeShader;
    private int cachedEdgeHeight = -1;
    private boolean cachedEdgeDark;
    private int navBarInsetPx;
    private int shadowMarginPx;
    private int cachedRippleMargin = -1;

    public GlassSearchButton(Context context) {
        super(context);
        setContentDescription("Search");
        setClickable(true);
        setFocusable(true);

        circlePaint.setStyle(Paint.Style.FILL);
        edgePaint.setStyle(Paint.Style.STROKE);
        iconPaint.setStyle(Paint.Style.STROKE);
        iconPaint.setStrokeCap(Paint.Cap.ROUND);

        setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                int m = shadowMarginPx;
                outline.setOval(m, m, Math.max(m, view.getWidth() - m), Math.max(m, view.getHeight() - m));
            }
        });

        shadowMarginPx = GlassStyle.searchButtonMarginPx();
        updateClipAndRipple(shadowMarginPx);

        setOnClickListener(v -> GlassSearch.invokeSearchAction());
    }

    private void updateClipAndRipple(int margin) {
        if (margin == cachedRippleMargin) {
            return;
        }
        cachedRippleMargin = margin;
        setClipToOutline(margin == 0);
        invalidateOutline();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            ShapeDrawable mask = new ShapeDrawable(new OvalShape());
            Drawable maskLayer = margin > 0 ? new InsetDrawable(mask, margin) : mask;
            setForeground(new RippleDrawable(ColorStateList.valueOf(0x33888888), null, maskLayer));
        }
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        WindowInsets rootInsets = getRootWindowInsets();
        if (rootInsets != null) {
            readBottomInset(rootInsets);
            updateLayoutParams();
        }
        requestApplyInsets();
    }

    @Override
    public WindowInsets onApplyWindowInsets(WindowInsets insets) {
        readBottomInset(insets);
        updateLayoutParams();
        return super.onApplyWindowInsets(insets);
    }

    @Override
    protected void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        GlassSearch.onConfigurationChanged();
    }

    private void readBottomInset(WindowInsets insets) {
        if (insets == null) {
            return;
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            navBarInsetPx = insets.getInsets(WindowInsets.Type.navigationBars()).bottom;
        } else {
            navBarInsetPx = insets.getSystemWindowInsetBottom();
        }
    }

    void updateLayoutParams() {
        ViewGroup.LayoutParams rawLp = getLayoutParams();
        if (!(rawLp instanceof FrameLayout.LayoutParams)) {
            return;
        }
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) rawLp;
        int margin = GlassStyle.searchButtonMarginPx();
        shadowMarginPx = margin;
        updateClipAndRipple(margin);

        int diameter = Math.round(GlassNavPatch.capsuleHeightPx());
        int viewSize = diameter + (2 * margin);
        ViewParent parent = getParent();
        float parentWidth = (parent instanceof View && ((View) parent).getWidth() > 0)
                ? ((View) parent).getWidth()
                : getResources().getDisplayMetrics().widthPixels;
        int endMargin = Math.round(GlassNavPatch.capsuleSideGapPx(parentWidth)) - margin;
        float density = GlassNavPatch.getDensity();
        int capsuleOffset = Math.round(
                (GlassNavPatch.BAR_ROW_HEIGHT_DP * density - GlassNavPatch.capsuleHeightPx()) / 2f);
        int bottomMargin = Math.max(0, navBarInsetPx + capsuleOffset + GlassBlur.liftPx()) - margin;

        if (lp.width != viewSize
                || lp.height != viewSize
                || lp.gravity != (Gravity.BOTTOM | Gravity.END)
                || lp.bottomMargin != bottomMargin
                || lp.getMarginEnd() != endMargin) {
            lp.width = viewSize;
            lp.height = viewSize;
            lp.gravity = Gravity.BOTTOM | Gravity.END;
            lp.bottomMargin = bottomMargin;
            lp.setMarginEnd(endMargin);
            setLayoutParams(lp);
        }
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (shadowMarginPx > 0 && event.getActionMasked() == MotionEvent.ACTION_DOWN) {
            float cx = getWidth() / 2f;
            float cy = getHeight() / 2f;
            float radius = Math.min(getWidth(), getHeight()) / 2f - shadowMarginPx;
            float dx = event.getX() - cx;
            float dy = event.getY() - cy;
            if ((dx * dx) + (dy * dy) > radius * radius) {
                return false;
            }
        }
        return super.onTouchEvent(event);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        int w = getWidth();
        int h = getHeight();
        if (w <= 0 || h <= 0) {
            return;
        }
        int expectedMargin = GlassStyle.searchButtonMarginPx();
        if (expectedMargin != shadowMarginPx) {
            post(this::updateLayoutParams);
        }
        int margin = shadowMarginPx;
        float diameter = Math.min(w, h) - (2f * margin);
        if (diameter <= 0f) {
            return;
        }
        float left = (w - diameter) / 2f;
        float top = (h - diameter) / 2f;
        float cx = w / 2f;
        float cy = h / 2f;
        float radius = diameter / 2f;
        float density = GlassNavPatch.getDensity();
        boolean isDark = GlassNavPatch.glassIsDark();

        GlassStyle.drawShadow(canvas, left, top, diameter, diameter, radius);

        try {
            if (GlassBlur.blurActive()
                    && canvas.isHardwareAccelerated()
                    && GlassBlur.current != null
                    && GlassBlur.hasBarBounds()) {
                GlassBlur.setSearchButton(this);
                getLocationInWindow(windowLocation);
                float leftInContent = windowLocation[0] + left;
                float topInContent = GlassBlur.barTop;
                GlassBlur.recordSearchBlur(leftInContent, topInContent, diameter);
                RenderNode blur = GlassBlur.searchBlurNode;
                if (blur != null && blur.hasDisplayList()) {
                    int m = (int) Math.ceil(GlassBlur.blurRadiusPx());
                    canvas.save();
                    try {
                        clipPath.reset();
                        clipPath.addCircle(cx, cy, radius, Path.Direction.CW);
                        canvas.clipPath(clipPath);
                        canvas.translate(left - m, top - m);
                        canvas.drawRenderNode(blur);
                    } finally {
                        canvas.restore();
                    }
                }
            }
        } catch (Throwable ignored) {
        }

        circlePaint.setColor((int) (GlassNavPatch.getCapsuleColor() >>> 32));
        canvas.drawCircle(cx, cy, radius, circlePaint);

        if (GlassStyle.isClear()) {
            if (GlassBlur.blurActive()) {
                float strokeWidth = GlassBlur.EDGE_DP * density;
                edgePaint.setStrokeWidth(strokeWidth);
                if (edgeShader == null || cachedEdgeHeight != h || cachedEdgeDark != isDark) {
                    int colorStart = isDark ? 0x40FFFFFF : 0xB3FFFFFF;
                    int colorEnd = isDark ? 0x0DFFFFFF : 0x14000000;
                    edgeShader = new LinearGradient(0f, 0f, 0f, h, colorStart, colorEnd, Shader.TileMode.CLAMP);
                    edgePaint.setShader(edgeShader);
                    cachedEdgeHeight = h;
                    cachedEdgeDark = isDark;
                }
                canvas.drawCircle(cx, cy, Math.max(0f, radius - strokeWidth / 2f), edgePaint);
            }
        } else {
            GlassStyle.drawOutline(canvas, left, top, diameter, diameter, radius);
        }

        iconPaint.setColor(isDark ? Color.WHITE : Color.BLACK);
        iconPaint.setStrokeWidth(2.0f * density);
        float lensRadius = 7.0f * density;
        float lensCx = cx - 2.0f * density;
        float lensCy = cy - 2.0f * density;
        canvas.drawCircle(lensCx, lensCy, lensRadius, iconPaint);
        float offset = lensRadius * 0.70710678f;
        canvas.drawLine(lensCx + offset, lensCy + offset, cx + 9.0f * density, cy + 9.0f * density, iconPaint);
    }
}
