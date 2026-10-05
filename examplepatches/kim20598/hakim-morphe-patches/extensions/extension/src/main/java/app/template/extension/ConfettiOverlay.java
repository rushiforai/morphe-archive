package app.template.extension;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import java.util.Random;

/**
 * The real "confetti pops and falls" spectacle for the Confetti reveal style. A genuine fall
 * needs travel distance the (fairly short) ratings row can't offer from inside its own bounds —
 * a {@link View}'s {@code onDraw} can never paint past its own edges — so this adds a temporary,
 * touch-transparent, full-size overlay to the activity's content root instead, positioned so the
 * burst originates from the row, then removes itself once the animation finishes.
 */
final class ConfettiOverlay {

    private static final long DURATION_MS = 900L;

    private ConfettiOverlay() {}

    static void burst(View anchor, int[] palette) {
        try {
            Activity activity = activityOf(anchor.getContext());
            if (activity == null) return;
            ViewGroup root = activity.findViewById(android.R.id.content);
            if (root == null) return;

            int[] anchorLoc = new int[2];
            anchor.getLocationInWindow(anchorLoc);
            int[] rootLoc = new int[2];
            root.getLocationInWindow(rootLoc);
            float originX = anchorLoc[0] - rootLoc[0] + anchor.getWidth() / 2f;
            float originY = anchorLoc[1] - rootLoc[1] + anchor.getHeight() / 2f;

            final Burst burst = new Burst(root.getContext(), palette, originX, originY);
            root.addView(burst, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            burst.start(new Runnable() {
                @Override public void run() {
                    ViewGroup parent = (ViewGroup) burst.getParent();
                    if (parent != null) parent.removeView(burst);
                }
            });
        } catch (Throwable ignored) {
        }
    }

    private static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return context instanceof Activity ? (Activity) context : null;
    }

    /** Full-screen (of the content root), touch-transparent particle burst from one origin point. */
    private static final class Burst extends View {
        private static final int COUNT = 140;

        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final Random rnd = new Random();
        private final float density;
        private final float originX, originY;
        private final int[] color = new int[COUNT];
        private final float[] size = new float[COUNT];
        private final float[] vx = new float[COUNT];
        private final float[] vy = new float[COUNT];
        private final float[] rotation = new float[COUNT];
        private final float[] spin = new float[COUNT];

        private float t;

        Burst(Context c, int[] palette, float originX, float originY) {
            super(c);
            this.density = c.getResources().getDisplayMetrics().density;
            this.originX = originX;
            this.originY = originY;
            setClickable(false);

            for (int i = 0; i < COUNT; i++) {
                color[i] = palette[rnd.nextInt(palette.length)];
                size[i] = dp(2.5f + rnd.nextFloat() * 3f);
                double angle = rnd.nextDouble() * Math.PI * 2.0;
                float speed = dp(3f + rnd.nextFloat() * 7f);
                vx[i] = (float) Math.cos(angle) * speed;
                vy[i] = (float) Math.sin(angle) * speed - dp(4f); // slight upward kick before falling
                rotation[i] = rnd.nextFloat() * 360f;
                spin[i] = (rnd.nextFloat() - 0.5f) * 14f;
            }
        }

        void start(final Runnable onDone) {
            ValueAnimator animator = ValueAnimator.ofFloat(0f, 1f);
            animator.setDuration(DURATION_MS);
            animator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
                @Override public void onAnimationUpdate(ValueAnimator a) {
                    t = (float) a.getAnimatedValue();
                    invalidate();
                }
            });
            animator.addListener(new AnimatorListenerAdapter() {
                @Override public void onAnimationEnd(Animator a) {
                    onDone.run();
                }
            });
            animator.start();
        }

        @Override protected void onDraw(Canvas canvas) {
            float gravity = dp(22f);
            for (int i = 0; i < COUNT; i++) {
                float time = t * (DURATION_MS / 1000f);
                float x = originX + vx[i] * time * 60f;
                float y = originY + vy[i] * time * 60f + 0.5f * gravity * time * time * 60f;
                float rot = rotation[i] + spin[i] * t * 60f;
                int alpha = (int) (255 * (1f - smoothstep(0.6f, 1f, t)));

                paint.setColor(color[i]);
                paint.setAlpha(clamp(alpha, 0, 255));
                float s = size[i];
                canvas.save();
                canvas.rotate(rot, x, y);
                rect.set(x - s, y - s * 0.6f, x + s, y + s * 0.6f);
                canvas.drawRect(rect, paint);
                canvas.restore();
            }
        }

        private float dp(float v) {
            return v * density;
        }

        private static float smoothstep(float lo, float hi, float v) {
            float x = clamp01((v - lo) / (hi - lo));
            return x * x * (3f - 2f * x);
        }

        private static float clamp01(float v) {
            return v < 0f ? 0f : (v > 1f ? 1f : v);
        }

        private static int clamp(int v, int lo, int hi) {
            return v < lo ? lo : (v > hi ? hi : v);
        }
    }
}
