package app.bin0culars.extension.reddit;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Shader;
import android.os.Build;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;

public final class GlassStatusFade extends View {

    private static final float EXTRA_FADE_DP = 12f;

    private final Paint paint = new Paint();

    private LinearGradient shader;
    private int cachedHeight = -1;
    private int cachedRgb = -1;
    private int cachedInset = -1;
    private int statusBarInsetPx;
    private boolean hasWindowInsets;

    public GlassStatusFade(Context context) {
        super(context);
        setClickable(false);
        setFocusable(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        WindowInsets rootInsets = getRootWindowInsets();
        if (rootInsets != null) {
            readTopInset(rootInsets);
            updateLayoutParams();
        }
        requestApplyInsets();
    }

    @Override
    public WindowInsets onApplyWindowInsets(WindowInsets insets) {
        readTopInset(insets);
        updateLayoutParams();
        return super.onApplyWindowInsets(insets);
    }

    private void readTopInset(WindowInsets insets) {
        if (insets == null) {
            return;
        }
        hasWindowInsets = true;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            statusBarInsetPx = insets.getInsets(WindowInsets.Type.statusBars()).top;
        } else {
            statusBarInsetPx = insets.getSystemWindowInsetTop();
        }
    }

    private int effectiveStatusBarInsetPx() {
        if (statusBarInsetPx > 0 || hasWindowInsets) {
            return statusBarInsetPx;
        }
        try {
            int resId = Resources.getSystem().getIdentifier("status_bar_height", "dimen", "android");
            if (resId > 0) {
                return getResources().getDimensionPixelSize(resId);
            }
        } catch (Throwable ignored) {
        }
        return 0;
    }

    void updateLayoutParams() {
        ViewGroup.LayoutParams rawLp = getLayoutParams();
        if (!(rawLp instanceof FrameLayout.LayoutParams)) {
            return;
        }
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) rawLp;
        int inset = effectiveStatusBarInsetPx();
        int targetHeight = Math.max(0, inset + Math.round(EXTRA_FADE_DP * GlassNavPatch.getDensity()));
        if (lp.width != FrameLayout.LayoutParams.MATCH_PARENT
                || lp.height != targetHeight
                || lp.gravity != Gravity.TOP) {
            lp.width = FrameLayout.LayoutParams.MATCH_PARENT;
            lp.height = targetHeight;
            lp.gravity = Gravity.TOP;
            setLayoutParams(lp);
        }
    }

    private static int pageArgb() {
        int c = (int) (GlassNavPatch.lastPageColor >>> 32);
        if (c == 0) {
            return GlassNavPatch.isDarkTheme() ? 0xFF000000 : 0xFFFFFFFF;
        }
        return c | 0xFF000000;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        int w = getWidth();
        int h = getHeight();
        if (w <= 0 || h <= 0) {
            return;
        }
        int inset = effectiveStatusBarInsetPx();
        int rgb = pageArgb() & 0x00FFFFFF;
        if (shader == null || cachedHeight != h || cachedRgb != rgb || cachedInset != inset) {
            int topColor = 0xE6000000 | rgb;
            int midColor = 0x80000000 | rgb;
            float midStop = (inset > 0 && inset < h)
                    ? Math.min(0.85f, (inset * 0.85f) / h)
                    : 0.5f;
            shader = new LinearGradient(
                    0f, 0f, 0f, h,
                    new int[] {topColor, midColor, rgb},
                    new float[] {0f, midStop, 1f},
                    Shader.TileMode.CLAMP);
            paint.setShader(shader);
            cachedHeight = h;
            cachedRgb = rgb;
            cachedInset = inset;
        }
        canvas.drawRect(0f, 0f, w, h, paint);
    }
}
