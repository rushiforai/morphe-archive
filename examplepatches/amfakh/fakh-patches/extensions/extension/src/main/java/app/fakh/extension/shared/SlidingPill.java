package app.fakh.extension.shared;

import android.animation.ValueAnimator;

/**
 * The position of the pill behind the selected tab of a {@link GlassCapsule} bar along the bar, across a bottom bar
 * or down a side rail. It springs to a new tab instead of jumping, a little past it and back, and swells slightly while
 * it moves. A finger can also carry it ({@link #drag}) until it lets go ({@link #release}). The app tells it where the
 * selected tab is; {@link GlassCapsule.Layout#pill} asks where the pill is right now.
 */
public final class SlidingPill {
    /** How long the spring runs before the pill rests on its tab. */
    private static final long SPRING_MS = 600;
    /** How long the swell lasts: the first part of the spring, where the pill covers most of the way. */
    private static final long SWELL_MS = 260;
    /** One swing of the spring in 0.4 s, about what iOS springs use, in radians a second. */
    private static final double SPRING_SPEED = 2 * Math.PI / 0.4;
    /** How much of each swing the spring loses: this much carries the pill about 7 percent past its tab. */
    private static final double SPRING_DAMPING = 0.65;
    /** How much larger the pill is mid-slide and under a finger. */
    private static final float SWELL = 0.08f;

    private final Runnable redraw;
    private float fromStart;
    private float fromEnd;
    private float toStart;
    private float toEnd;
    private float progress = 1;
    /** Milliseconds into the slide under way. */
    private long elapsed = SPRING_MS;
    /** The swell the slide started from, above 1 when a finger let go of the pill. */
    private float swellFrom = 1;
    /** Whether a finger is carrying the pill, centered on {@link #dragCenter}. */
    private boolean dragging;
    private float dragCenter;
    /** Where the middle of the pill was as the finger took it. */
    private float dragFrom;
    private ValueAnimator slide;

    /** @param redraw called on every frame of a slide, to repaint the bar */
    public SlidingPill(Runnable redraw) {
        this.redraw = redraw;
    }

    /** Moves the pill to the tab spanning {@code start} to {@code end}: it jumps the first time and springs after. */
    public void select(float start, float end) {
        if (start == toStart && end == toEnd) return;
        boolean moving = has() && !dragging;
        fromStart = start();
        fromEnd = end();
        toStart = start;
        toEnd = end;
        if (moving) {
            spring(1);
        } else {
            stop();
            redraw.run();
        }
    }

    /**
     * Puts the middle of the pill at {@code center}, as wide as the selected tab, while a finger carries it. The first
     * call springs the pill over from where it was, as a finger can start on any tab.
     */
    public void drag(float center) {
        if (!has()) return;
        dragCenter = center;
        if (dragging) {
            redraw.run();
            return;
        }
        dragFrom = center();
        dragging = true;
        spring(1);
    }

    /** The finger let go: the pill springs from where it is to the selected tab. */
    public void release() {
        if (!dragging) return;
        fromStart = start();
        fromEnd = end();
        dragging = false;
        spring(1 + SWELL);
    }

    /** Whether a tab has been selected yet. */
    public boolean has() {
        return toEnd > toStart;
    }

    /** The leading edge of the pill now: left on a bottom bar, top on a rail. */
    public float start() {
        if (dragging) return dragNow() - (toEnd - toStart) / 2;
        return progress == 1 ? toStart : fromStart + (toStart - fromStart) * progress;
    }

    /** The trailing edge of the pill now. */
    public float end() {
        if (dragging) return dragNow() + (toEnd - toStart) / 2;
        return progress == 1 ? toEnd : fromEnd + (toEnd - fromEnd) * progress;
    }

    /** The middle of a dragged pill now: on its way from where it was to the finger, then on the finger. */
    private float dragNow() {
        return progress == 1 ? dragCenter : dragFrom + (dragCenter - dragFrom) * progress;
    }

    /** The middle of the pill now. */
    public float center() {
        return (start() + end()) / 2;
    }

    /** How much larger than its tab the pill is drawn: a little while it slides and under a finger, else 1. */
    public float swell() {
        if (dragging) return 1 + SWELL;
        if (elapsed >= SWELL_MS) return 1;
        float t = (float) elapsed / SWELL_MS;
        return Math.max(1 + SWELL * (float) Math.sin(Math.PI * t), 1 + (swellFrom - 1) * (1 - t));
    }

    /** Starts the spring from the current {@code from} edges to the {@code to} edges, swelling from {@code swell}. */
    private void spring(float swell) {
        stop();
        swellFrom = swell;
        progress = 0;
        elapsed = 0;
        // The animator runs linearly, as the clock of the spring: its interpolated fraction would already be the
        // spring's way, past 1 at the overshoot. With the phone's animations off it ends at once and the pill lands
        // in one frame.
        slide = ValueAnimator.ofFloat(0, 1).setDuration(SPRING_MS);
        slide.setInterpolator(null);
        slide.addUpdateListener(a -> {
            float time = (float) a.getAnimatedValue();
            elapsed = time >= 1 ? SPRING_MS : (long) (time * SPRING_MS);
            progress = springAt(elapsed);
            redraw.run();
        });
        slide.start();
    }

    private void stop() {
        if (slide != null) slide.cancel();
        slide = null;
        progress = 1;
        elapsed = SPRING_MS;
        swellFrom = 1;
    }

    /**
     * How far a damped spring started {@code ms} ago has got from 0 to 1: a little over 1 and back, and exactly 1
     * once {@link #SPRING_MS} has passed.
     */
    private static float springAt(long ms) {
        if (ms >= SPRING_MS) return 1;
        if (ms <= 0) return 0;
        double t = ms / 1000d;
        double fade = SPRING_DAMPING * SPRING_SPEED;
        double swing = SPRING_SPEED * Math.sqrt(1 - SPRING_DAMPING * SPRING_DAMPING);
        return (float) (1 - Math.exp(-fade * t) * (Math.cos(swing * t) + fade / swing * Math.sin(swing * t)));
    }
}
