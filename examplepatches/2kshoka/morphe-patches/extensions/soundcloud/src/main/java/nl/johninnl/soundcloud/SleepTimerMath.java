package nl.johninnl.soundcloud;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * Pure logic of the circular sleep timer selector. No Android classes are used here, so every
 * rule below can be (and was) tested on a plain JVM.
 *
 * Model: the handle's position is one continuous angle "total", in degrees, measured clockwise
 * from 12 o'clock and never wrapped. 6 degrees = 1 minute, so one full turn is 60 minutes and
 * the value is not reset at 60: 45 minutes + one more turn = 105 minutes.
 */
final class SleepTimerMath {
    static final double DEGREES_PER_MINUTE = 6.0;
    static final int MIN_MINUTES = 1;
    /** Technical upper bound (about 69 days) that only exists to keep the arithmetic safe. */
    static final int MAX_MINUTES = 99_999;
    static final double MIN_DEGREES = MIN_MINUTES * DEGREES_PER_MINUTE;
    static final double MAX_DEGREES = MAX_MINUTES * DEGREES_PER_MINUTE;

    static double positiveMod(double value, double modulus) {
        double r = value % modulus;
        return r < 0 ? r + modulus : r;
    }

    /** Shortest signed rotation equivalent to the given one, in (-180, 180]. */
    static double normalizeDelta(double degrees) {
        double d = degrees % 360.0;
        if (d > 180.0) d -= 360.0;
        else if (d <= -180.0) d += 360.0;
        return d;
    }

    /** Angle of a point relative to the dial centre: 12 o'clock = 0, clockwise, y grows downwards. */
    static double angleOf(double dx, double dy) {
        return positiveMod(Math.toDegrees(Math.atan2(dx, -dy)), 360.0);
    }

    static double clampDegrees(double degrees) {
        return Math.max(MIN_DEGREES, Math.min(MAX_DEGREES, degrees));
    }

    /** Rounds half up, so the shown value and the snapping target always agree. */
    static int minutesOf(double degrees) {
        double minutes = Math.floor(clampDegrees(degrees) / DEGREES_PER_MINUTE + 0.5);
        return (int) Math.max(MIN_MINUTES, Math.min(MAX_MINUTES, minutes));
    }

    static double degreesOf(int minutes) {
        return clampDegrees(minutes * DEGREES_PER_MINUTE);
    }

    /** Whole-minute angle nearest to the given one. */
    static double snapDegrees(double degrees) {
        return degreesOf(minutesOf(degrees));
    }

    /**
     * The angle that points at the finger and is nearest to the current total, so touching
     * the ring never changes the number of turns by itself.
     */
    static double nearestTotal(double currentTotal, double fingerAngle) {
        double onRing = positiveMod(currentTotal, 360.0);
        return clampDegrees(currentTotal + normalizeDelta(fingerAngle - onRing));
    }

    /** Sweep of the arc that is drawn on the ring, in (0, 360], and how many full turns lie behind it. */
    static double sweepOf(double total) {
        if (total <= 0) return 0;
        int turnsBehind = (int) Math.ceil(total / 360.0) - 1;
        return total - turnsBehind * 360.0;
    }

    static int turnsBehind(double total) {
        return total <= 0 ? 0 : (int) Math.ceil(total / 360.0) - 1;
    }

    /** Follows the finger by deltas, so any number of turns in both directions is supported. */
    static final class Drag {
        double total = MIN_DEGREES;
        private double lastFinger;

        void down(double fingerAngle) {
            total = nearestTotal(total, fingerAngle);
            lastFinger = fingerAngle;
        }

        void move(double fingerAngle) {
            total = clampDegrees(total + normalizeDelta(fingerAngle - lastFinger));
            lastFinger = fingerAngle;
        }
    }

    /** Angular velocity over the last ~100 ms of the gesture, in degrees per second. */
    static final class Velocity {
        private static final int CAPACITY = 12;
        private static final long WINDOW_MS = 100;
        private static final long STALE_MS = 80;
        private final long[] times = new long[CAPACITY];
        private final double[] angles = new double[CAPACITY];
        private int count;
        private int next;

        void clear() {
            count = 0;
            next = 0;
        }

        void add(long timeMs, double totalDegrees) {
            times[next] = timeMs;
            angles[next] = totalDegrees;
            next = (next + 1) % CAPACITY;
            if (count < CAPACITY) count++;
        }

        double perSecond(long nowMs) {
            if (count < 2) return 0;
            int newest = (next - 1 + CAPACITY) % CAPACITY;
            if (nowMs - times[newest] > STALE_MS) return 0; // the finger rested before lifting
            int oldest = newest;
            for (int i = 1; i < count; i++) {
                int idx = (newest - i + CAPACITY) % CAPACITY;
                if (times[newest] - times[idx] > WINDOW_MS) break;
                oldest = idx;
            }
            long dt = times[newest] - times[oldest];
            if (dt <= 0) return 0;
            return (angles[newest] - angles[oldest]) / dt * 1000.0;
        }
    }

    /** Exponential decay of the angular velocity after the finger is lifted. */
    static final class Inertia {
        static final double DECAY_PER_SECOND = 3.2;
        static final double MIN_SPEED = 18.0;
        static final double MAX_SPEED = 5000.0;
        private double velocity;

        void start(double degreesPerSecond) {
            velocity = Math.max(-MAX_SPEED, Math.min(MAX_SPEED, degreesPerSecond));
            if (Math.abs(velocity) < MIN_SPEED) velocity = 0;
        }

        boolean active() {
            return Math.abs(velocity) >= MIN_SPEED;
        }

        void stop() {
            velocity = 0;
        }

        /** Advances by dt seconds and returns how many degrees the handle moves. */
        double step(double dtSeconds) {
            double k = Math.exp(-DECAY_PER_SECOND * dtSeconds);
            double delta = velocity * (1.0 - k) / DECAY_PER_SECOND;
            velocity *= k;
            if (Math.abs(velocity) < MIN_SPEED) velocity = 0;
            return delta;
        }
    }

    // ---- text ----------------------------------------------------------------------------

    /** "45 мин", "2 ч", "1 ч 45 мин". */
    static String formatMinutes(int minutes) {
        if (minutes < 60) return minutes + " мин";
        int hours = minutes / 60;
        int rest = minutes % 60;
        return rest == 0 ? hours + " ч" : hours + " ч " + rest + " мин";
    }

    /** Countdown clock: "05:03" or "1:05:03". Rounds up so it never shows 00:00 while running. */
    static String formatClock(long millis) {
        long seconds = Math.max(0, (millis + 999) / 1000);
        long h = seconds / 3600;
        long m = (seconds % 3600) / 60;
        long s = seconds % 60;
        return h > 0
            ? String.format(Locale.ROOT, "%d:%02d:%02d", h, m, s)
            : String.format(Locale.ROOT, "%02d:%02d", m, s);
    }

    // ---- favourites ------------------------------------------------------------------------

    /** Stored form is a comma separated list; bad or out-of-range entries are dropped. */
    static List<Integer> parseFavorites(String raw) {
        List<Integer> result = new ArrayList<>();
        if (raw == null || raw.isEmpty()) return result;
        for (String part : raw.split(",")) {
            try {
                int value = Integer.parseInt(part.trim());
                if (value >= MIN_MINUTES && value <= MAX_MINUTES && !result.contains(value)) result.add(value);
            } catch (NumberFormatException ignored) {
                // skip garbage
            }
        }
        Collections.sort(result);
        return result;
    }

    static String serializeFavorites(List<Integer> favorites) {
        StringBuilder sb = new StringBuilder();
        for (int value : favorites) {
            if (sb.length() > 0) sb.append(',');
            sb.append(value);
        }
        return sb.toString();
    }

    /** Adds in ascending order. Returns false for a duplicate or an invalid value. */
    static boolean addFavorite(List<Integer> favorites, int minutes) {
        if (minutes < MIN_MINUTES || minutes > MAX_MINUTES || favorites.contains(minutes)) return false;
        favorites.add(minutes);
        Collections.sort(favorites);
        return true;
    }

    static boolean removeFavorite(List<Integer> favorites, int minutes) {
        return favorites.remove(Integer.valueOf(minutes));
    }

    private SleepTimerMath() {}
}
