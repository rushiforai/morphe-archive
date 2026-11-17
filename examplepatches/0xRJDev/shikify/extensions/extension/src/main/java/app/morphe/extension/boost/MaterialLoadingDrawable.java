package app.morphe.extension.boost;

import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.AttributeSet;
import android.util.TypedValue;
import org.xmlpull.v1.XmlPullParser;

public final class MaterialLoadingDrawable extends Drawable implements Animatable {
    private static final int SIZE_DP = 48;
    private static final long CYCLE_DURATION_MS = 7 * 650;
    private static final long NANOS_PER_MILLISECOND = 1000000;
    private static final long CLOCK_ORIGIN_NANOS = 1000000000;
    private static final int OPAQUE_ALPHA = 255;
    private final ValueAnimator animator = ValueAnimator.ofFloat(0, 1);
    private MaterialLoadingIndicator indicator;
    private int size = SIZE_DP;
    private int alpha = OPAQUE_ALPHA;
    private boolean animationRequested;

    public MaterialLoadingDrawable() {
        animator.setDuration(CYCLE_DURATION_MS);
        animator.setRepeatCount(ValueAnimator.INFINITE);
        animator.addUpdateListener(animation -> invalidateSelf());
    }

    public MaterialLoadingDrawable(Context context) {
        this();
        size = Math.round(SIZE_DP * context.getResources().getDisplayMetrics().density);
        indicator = new MaterialLoadingIndicator(
                MaterialYouTweaks.color(context, "colorPrimary", android.R.attr.colorAccent));
    }

    @Override
    public void inflate(Resources resources, XmlPullParser parser, AttributeSet attributes, Resources.Theme theme) {
        size = Math.round(SIZE_DP * resources.getDisplayMetrics().density);
        if (theme == null) {
            theme = resources.newTheme();
            theme.applyStyle(android.R.style.Theme_Material, true);
        }
        TypedValue color = new TypedValue();
        int primary = resources.getIdentifier("colorPrimary", "attr", "com.rubenmayayo.reddit");
        if (!theme.resolveAttribute(primary, color, true)) {
            theme.resolveAttribute(android.R.attr.colorAccent, color, true);
        }
        indicator = new MaterialLoadingIndicator(color.resourceId == 0 ? color.data
                : resources.getColor(color.resourceId, theme));
    }

    @Override
    public void draw(Canvas canvas) {
        if (indicator == null) {
            return;
        }
        Rect bounds = getBounds();
        long now = CLOCK_ORIGIN_NANOS + animator.getCurrentPlayTime() * NANOS_PER_MILLISECOND;
        indicator.draw(canvas, bounds.exactCenterX(), bounds.exactCenterY(),
                Math.min(bounds.width(), bounds.height()), alpha, isRunning() && animationsEnabled(), 1, 1, now);
    }

    @Override
    public void start() {
        animationRequested = true;
        if (!animationsEnabled()) {
            invalidateSelf();
            return;
        }
        if (isVisible() && !animator.isStarted()) {
            resetIndicator();
            animator.start();
        }
    }

    private static boolean animationsEnabled() {
        return Build.VERSION.SDK_INT < 26 || ValueAnimator.areAnimatorsEnabled();
    }

    @Override
    public void stop() {
        animationRequested = false;
        cancelAnimation();
    }

    private void cancelAnimation() {
        animator.cancel();
        resetIndicator();
    }

    private void resetIndicator() {
        if (indicator != null) {
            indicator.reset();
        }
    }

    @Override
    public boolean isRunning() {
        return animator.isStarted();
    }

    @Override
    public boolean setVisible(boolean visible, boolean restart) {
        boolean changed = super.setVisible(visible, restart);
        if (!visible) {
            cancelAnimation();
        } else if (animationRequested) {
            start();
        }
        return changed;
    }

    @Override
    public void setAlpha(int alpha) {
        this.alpha = alpha;
        invalidateSelf();
    }

    @Override
    public int getAlpha() {
        return alpha;
    }

    @Override
    public void setColorFilter(ColorFilter filter) {
        if (indicator != null) {
            indicator.setColorFilter(filter);
            invalidateSelf();
        }
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }

    @Override
    public int getIntrinsicWidth() {
        return size;
    }

    @Override
    public int getIntrinsicHeight() {
        return size;
    }
}
