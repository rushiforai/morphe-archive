package io.github.sabopura.morphe.extension.twitch.ui;

import android.animation.ValueAnimator;
import android.util.Log;
import android.view.Choreographer;
import android.view.View;

/** Per-frame driving of the ported springs, parked whenever nothing moves. */
final class Motion {
    private Motion() {
    }

    /** False when the system setting "remove animations" is on. */
    static boolean enabled() {
        return ValueAnimator.areAnimatorsEnabled();
    }

    interface Step {
        /** Advances by {@code seconds}; returns true while there is more to do. */
        boolean frame(float seconds, long nowMs);

        /** Jumps straight to the end state, for when animations are removed. */
        void snap();
    }

    static final class Loop implements Choreographer.FrameCallback {
        private final View host;
        private final Step step;
        private boolean running;
        private long lastNanos;

        Loop(View host, Step step) {
            this.host = host;
            this.step = step;
        }

        void start() {
            if (!enabled()) {
                stop();
                step.snap();
                host.invalidate();
                return;
            }
            if (running) return;
            running = true;
            lastNanos = 0;
            Choreographer.getInstance().postFrameCallback(this);
        }

        void stop() {
            if (!running) return;
            running = false;
            Choreographer.getInstance().removeFrameCallback(this);
        }

        @Override
        public void doFrame(long nanos) {
            if (!running) return;
            float seconds = lastNanos == 0 ? 1 / 60f : Math.min(.05f, (nanos - lastNanos) / 1e9f);
            lastNanos = nanos;
            boolean more;
            try {
                more = step.frame(seconds, nanos / 1000000L);
                host.invalidate();
            } catch (RuntimeException e) {
                Log.w("SabopuraTwitch", "Animation stopped: " + e);
                more = false;
            }
            if (more) Choreographer.getInstance().postFrameCallback(this);
            else running = false;
        }
    }
}
