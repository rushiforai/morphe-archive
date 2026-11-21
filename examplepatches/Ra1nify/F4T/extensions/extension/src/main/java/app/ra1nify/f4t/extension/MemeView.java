package app.ra1nify.f4t.extension;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.view.View;

/** Canvas-drawn meme; extensions carry no drawables. */
final class MemeView extends View {
    private final Paint textPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF smileOval = new RectF();

    private ValueAnimator animator;
    private float phase;

    MemeView(Context context) {
        super(context);
        textPaint.setColor(Color.WHITE);
        textPaint.setTypeface(Typeface.create("serif", Typeface.NORMAL));
        textPaint.setTextAlign(Paint.Align.CENTER);

        strokePaint.setColor(Color.WHITE);
        strokePaint.setStyle(Paint.Style.STROKE);
        strokePaint.setStrokeCap(Paint.Cap.ROUND);
        strokePaint.setStrokeWidth(dp(2f));
    }

    void startAnimating() {
        if (animator != null) return;
        animator = ValueAnimator.ofFloat(0f, (float) (Math.PI * 2));
        animator.setDuration(1600L);
        animator.setRepeatCount(ValueAnimator.INFINITE);
        animator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
            @Override
            public void onAnimationUpdate(ValueAnimator animation) {
                phase = (float) animation.getAnimatedValue();
                invalidate();
            }
        });
        animator.start();
    }

    void stopAnimating() {
        if (animator != null) {
            animator.cancel();
            animator = null;
        }
    }

    @Override
    protected void onDetachedFromWindow() {
        stopAnimating();
        super.onDetachedFromWindow();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);

        final float width = getWidth();
        final float height = getHeight();
        if (width <= 0f || height <= 0f) return;

        textPaint.setTextSize(height * 0.105f);
        canvas.drawText("if u bought it,", width / 2f, height * 0.17f, textPaint);

        textPaint.setTextSize(height * 0.205f);
        canvas.drawText("you are an idiot", width / 2f, height * 0.42f, textPaint);

        final float radius = height * 0.125f;
        final float baseY = height * 0.74f;
        final float bob = (float) Math.sin(phase) * height * 0.012f;
        final float[] centersX = {width * 0.25f, width * 0.5f, width * 0.75f};
        for (int i = 0; i < centersX.length; i++) {
            final float wobble = (float) Math.sin(phase + i * 1.2f) * height * 0.02f;
            drawSmiley(canvas, centersX[i] + wobble, baseY + bob, radius);
        }
    }

    private void drawSmiley(Canvas canvas, float cx, float cy, float radius) {
        canvas.drawCircle(cx, cy, radius, strokePaint);

        final float eyeRadius = radius * 0.11f;
        canvas.drawCircle(cx - radius * 0.34f, cy - radius * 0.26f, eyeRadius, strokePaint);
        canvas.drawCircle(cx + radius * 0.34f, cy - radius * 0.26f, eyeRadius, strokePaint);

        smileOval.set(cx - radius * 0.56f, cy - radius * 0.34f, cx + radius * 0.56f, cy + radius * 0.62f);
        canvas.drawArc(smileOval, 22f, 136f, false, strokePaint);
    }

    private float dp(float value) {
        return value * getResources().getDisplayMetrics().density;
    }
}
