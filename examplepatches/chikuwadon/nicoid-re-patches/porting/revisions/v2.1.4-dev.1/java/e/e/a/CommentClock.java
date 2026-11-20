package e.e.a;

import android.os.SystemClock;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.WeakHashMap;

/** Samples position, speed and play state from the same provider for each render pass. */
public final class CommentClock {
    private static final WeakHashMap<Object, State> STATES = new WeakHashMap<>();
    private static final Object[] NO_ARGS = new Object[0];
    private static final Sample UNAVAILABLE = new Sample();

    static final class Sample {
        int position;
        float rate = 1f;
        boolean playing;
    }

    private static final class State {
        final CommentClockRules clock = new CommentClockRules();
        final Sample sample = new Sample();
        final Field provider, video;
        final Method position, playing, rate;
        volatile float speed = 1f;

        State(Object view) throws ReflectiveOperationException {
            provider = view.getClass().getField("e.e.a.u".equals(view.getClass().getName()) ? "D" : "E");
            Class<?> type = provider.getType();
            position = type.getMethod("a");
            playing = type.getMethod("c");
            video = type.getField("a");
            rate = video.getType().getMethod("getPlaybackSpeed");
        }

        float rate(Object source) throws ReflectiveOperationException {
            Object player = source == null ? null : video.get(source);
            return player == null ? speed : ((Number) rate.invoke(player, NO_ARGS)).floatValue();
        }
    }

    private static State state(Object view) throws ReflectiveOperationException {
        synchronized (STATES) {
            State state = STATES.get(view);
            if (state == null) {
                state = new State(view);
                STATES.put(view, state);
            }
            return state;
        }
    }

    static Sample frameSample(Object view) {
        try {
            return state(view).sample;
        } catch (Exception unavailable) {
            return UNAVAILABLE;
        }
    }

    // Only the render thread updates this sample, before either lane placement or drawing.
    static Sample capture(Object view, long now) {
        Sample sample = UNAVAILABLE;
        try {
            State state = state(view);
            sample = state.sample;
            sample.playing = false;
            Object source = state.provider.get(view);
            if (source == null) return sample;
            float rate = state.rate(source);
            long raw = ((Number) state.position.invoke(source, NO_ARGS)).longValue();
            boolean playing = (Boolean) state.playing.invoke(source, NO_ARGS);
            sample.position = state.clock.position(raw, playing, rate, now);
            sample.rate = rate;
            sample.playing = playing;
        } catch (Exception unavailable) {
            // Keep the last position across a provider handoff and pause extrapolation.
        }
        return sample;
    }

    public static void speed(Object view, float speed) {
        try {
            state(view).speed = speed;
        } catch (Exception unavailable) {
            Log.w("nicoid-clock", "Speed binding failed", unavailable);
        }
    }

    public static int position(Object view) {
        try {
            State state = state(view);
            Object source = state.provider.get(view);
            if (source == null) return 0;
            float rate = state.rate(source);
            long raw = ((Number) state.position.invoke(source, NO_ARGS)).longValue();
            boolean playing = (Boolean) state.playing.invoke(source, NO_ARGS);
            return state.clock.position(raw, playing, rate, SystemClock.elapsedRealtime());
        } catch (Exception unavailable) {
            return 0;
        }
    }

    public static float rate(Object view) {
        try {
            State state = state(view);
            return state.rate(state.provider.get(view));
        } catch (Exception unavailable) {
            return 1f;
        }
    }

    public static boolean playing(Object view) {
        try {
            State state = state(view);
            Object source = state.provider.get(view);
            return source != null && (Boolean) state.playing.invoke(source, NO_ARGS);
        } catch (Exception unavailable) {
            return false;
        }
    }
}
