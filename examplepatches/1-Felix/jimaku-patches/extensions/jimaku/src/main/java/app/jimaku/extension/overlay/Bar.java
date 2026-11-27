package app.jimaku.extension.overlay;

import android.animation.ValueAnimator;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Shader;
import android.os.SystemClock;

import app.jimaku.extension.jobs.FillRoute;
import app.jimaku.extension.jobs.Glide;
import app.jimaku.extension.jobs.TimeLeft;

/**
 * The extension's thin progress bar, drawn into a view: white at 70% on a white track at 18%, with
 * round ends, as {@code styles.ts} draws the control's bar and the message's. It fills along a glide by
 * the ported {@link FillRoute}, with a band of light crossing the filled part, or sweeps across where
 * how far the work has come can't be estimated. Where Android's animator duration scale is off, the
 * counterpart of reduced motion, it stands where the glide has it and moves on at the next read.
 */
final class Bar {
    private static final int TRACK = 0x2EFFFFFF;
    private static final int FILL = 0xB3FFFFFF;
    private static final int SCAN = 0xFFFFFFFF;
    private static final long LIGHT_MILLIS = 1600;
    private static final long SCAN_MILLIS = 1400;

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();
    private final Path clip = new Path();
    private final float lightWidth;
    private LinearGradient light;
    private Glide glide;
    private FillRoute route;
    private boolean scan;

    /** {@code lightWidth}: the band of light's width in px, 44 px in the message and 12 px under the control in the extension. */
    Bar(float lightWidth) {
        this.lightWidth = lightWidth;
    }

    /** Fills along {@code next} from where the last glide has it by now, or not at all for null. */
    void setGlide(Glide next) {
        if (next == glide) return;
        route = next != null ? FillRoute.of(glide, next, System.currentTimeMillis()) : null;
        glide = next;
    }

    /** Sweeps across instead, for work whose progress can't be estimated. */
    void setScan(boolean value) {
        scan = value;
    }

    boolean shown() {
        return glide != null || scan;
    }

    /** Draws the bar into {@code left}..{@code right} from {@code top}; true while it moves and wants another frame. */
    boolean draw(Canvas canvas, float left, float top, float right, float height) {
        if (!shown()) return false;
        float radius = height / 2;
        paint.setShader(null);
        paint.setColor(TRACK);
        rect.set(left, top, right, top + height);
        canvas.drawRoundRect(rect, radius, radius, paint);
        boolean moving = ValueAnimator.areAnimatorsEnabled();
        if (glide == null) return moving && sweep(canvas, left, top, right, height, radius);

        double now = System.currentTimeMillis();
        double share = moving ? route.at(now) : TimeLeft.standing(glide, now);
        float width = (float) (Math.max(0, Math.min(1, share)) * (right - left));
        if (width <= 0) return moving;
        paint.setColor(FILL);
        rect.set(left, top, left + width, top + height);
        canvas.drawRoundRect(rect, radius, radius, paint);
        if (!moving) return false;

        // The band of light runs from before the fill's start to its end, clipped to the fill.
        float phase = (SystemClock.uptimeMillis() % LIGHT_MILLIS) / (float) LIGHT_MILLIS;
        float x = left - lightWidth + (width + lightWidth) * phase;
        if (light == null) {
            light = new LinearGradient(0, 0, lightWidth, 0, new int[]{0x00FFFFFF, 0xFFFFFFFF, 0x00FFFFFF}, null, Shader.TileMode.CLAMP);
        }
        canvas.save();
        clip.reset();
        clip.addRoundRect(rect, radius, radius, Path.Direction.CW);
        canvas.clipPath(clip);
        canvas.translate(x, 0);
        paint.setShader(light);
        canvas.drawRect(0, top, lightWidth, top + height, paint);
        paint.setShader(null);
        canvas.restore();
        return true;
    }

    /** The sweep: the bar grows across the track from its left end, then its tail runs out at the right. */
    private boolean sweep(Canvas canvas, float left, float top, float right, float height, float radius) {
        float t = (SystemClock.uptimeMillis() % SCAN_MILLIS) / (float) SCAN_MILLIS;
        float full = right - left;
        float from, to;
        if (t < 0.5f) {
            from = left;
            to = left + full * easeInOut(t * 2);
        } else {
            from = left + full * easeInOut((t - 0.5f) * 2);
            to = right;
        }
        paint.setColor(SCAN);
        rect.set(from, top, to, top + height);
        if (to > from) canvas.drawRoundRect(rect, radius, radius, paint);
        return true;
    }

    /** CSS's ease-in-out, near enough for a bar a few pixels high. */
    private static float easeInOut(float t) {
        return (float) (0.5 - Math.cos(Math.PI * t) / 2);
    }
}
