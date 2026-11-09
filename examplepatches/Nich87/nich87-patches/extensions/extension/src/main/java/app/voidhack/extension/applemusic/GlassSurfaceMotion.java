package app.voidhack.extension.applemusic;

import android.animation.ValueAnimator;
import android.view.Choreographer;
import android.view.View;

final class GlassSurfaceMotion implements Choreographer.FrameCallback {
    private final View view;
    private final GlassDrawable material;
    private final GlassSpring engagement = new GlassSpring(400f, 0.72f, 0.001f);
    private final GlassSpring parallax = new GlassSpring(320f, 0.82f, 0.001f);
    private final int[] location = new int[2];
    private final float restingX;
    private final float restingScaleX;
    private final float restingScaleY;
    private boolean pressed;
    private boolean hovered;
    private boolean framePosted;
    private long previousFrame;

    GlassSurfaceMotion(View view, GlassDrawable material) {
        this.view = view;
        this.material = material;
        restingX = view.getTranslationX();
        restingScaleX = view.getScaleX();
        restingScaleY = view.getScaleY();
    }

    void press(float rawX) {
        pressed = true;
        engagement.target = 1f;
        move(rawX);
    }

    void move(float rawX) {
        view.getLocationOnScreen(location);
        float x = (rawX - location[0]) / view.getScaleX();
        parallax.target = Math.max(-1f, Math.min(1f, x * 2f / Math.max(1, view.getWidth()) - 1f));
        scheduleFrame();
    }

    void hover(boolean hovering) {
        if (hovered == hovering) return;
        hovered = hovering;
        engagement.target = pressed ? 1f : hovered ? 0.6f : 0f;
        scheduleFrame();
    }

    void release() {
        pressed = false;
        engagement.target = hovered ? 0.6f : 0f;
        parallax.target = 0f;
        scheduleFrame();
    }

    void stop() {
        Choreographer.getInstance().removeFrameCallback(this);
        framePosted = false;
        previousFrame = 0;
        pressed = hovered = false;
        engagement.snap(0f);
        parallax.snap(0f);
        publish();
    }

    private void scheduleFrame() {
        if (!ValueAnimator.areAnimatorsEnabled()) {
            engagement.snap(engagement.target);
            parallax.snap(0f);
            publish();
        } else if (!framePosted && view.isAttachedToWindow()) {
            framePosted = true;
            Choreographer.getInstance().postFrameCallback(this);
        }
    }

    @Override public void doFrame(long frameTimeNanos) {
        framePosted = false;
        float dt = previousFrame == 0 ? 1f / 120f : Math.min(0.032f, (frameTimeNanos - previousFrame) / 1_000_000_000f);
        previousFrame = frameTimeNanos;
        boolean moving = engagement.advance(dt);
        moving |= parallax.advance(dt);
        publish();
        if (moving) scheduleFrame();
        else previousFrame = 0;
    }

    private void publish() {
        material.engagement = Math.max(0f, Math.min(1f, engagement.value));
        material.parallax = Math.max(-1f, Math.min(1f, parallax.value));
        float expansion = ValueAnimator.areAnimatorsEnabled() ? material.engagement : 0f;
        view.setScaleX(restingScaleX * (1f + 0.018f * expansion));
        view.setScaleY(restingScaleY * (1f + 0.06f * expansion));
        view.setTranslationX(restingX + material.parallax * 6f * material.density);
        material.invalidateSelf();
        if (view.getParent() instanceof View) ((View) view.getParent()).invalidate();
    }
}
