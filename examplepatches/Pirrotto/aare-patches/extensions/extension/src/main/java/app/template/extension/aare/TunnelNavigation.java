package app.template.extension.aare;

import android.location.Location;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.SystemClock;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.List;

/**
 * Keeps the position moving in tunnels. With "Use the car's GPS", AARE gives the phone the car's GPS
 * fix; in a tunnel the car has no fix and the position stops (or the car repeats the last one), so
 * the navigation app stops too. Meanwhile the car still sends its speed, compass and gyroscope:
 * from the last good fix this estimates where the car is (dead reckoning), once a second, until the
 * GPS is back.
 *
 * Heading: the car's compass while it changes, else the last heading turned by the gyroscope's yaw
 * rate. The gyroscope's sign is learned from the GPS while driving, as cars mount it differently.
 */
public final class TunnelNavigation {
    private static final String TAG = "AareTunnel";
    public static final String KEY = PatchSettings.TUNNEL_NAVIGATION;

    /** No new GPS position for this long while moving: the estimate starts. */
    private static final long STALE_MS = 2500;
    // Limits (5 km, 5 minutes of driving) and honest accuracy: TunnelMath. Other apps get this
    // position too, so past the limits the estimate stops and the position stays put.
    private static final float MOVING_MPS = 2f;

    private static WeakReference<Object> feed = new WeakReference<>(null);
    private static Handler worker;

    // Last real fix.
    private static Location lastFix;
    private static long lastFixAt;
    private static long lastMovedAt;

    // The estimate.
    private static Location estimate;
    private static double travelledM;
    private static long movingMs;
    private static float startAccuracy;
    private static boolean limitLogged;
    private static double bearing = Double.NaN;
    private static long estimateAt;
    private static final ThreadLocal<Boolean> pushingOurs = new ThreadLocal<>();

    // Gyroscope sign, learned from GPS bearings: sum of yaw-rate × bearing-rate.
    private static double gyroCorrelation;
    private static Location previousFix;

    private TunnelNavigation() {
    }

    // region Hook

    /**
     * Called at the start of PhoneLocationFeed.push(car fix). Returns true to drop the fix: a repeat
     * of the last position while the estimate runs (some cars send it in tunnels).
     */
    public static boolean onPush(Object locationFeed, Location fix) {
        try {
            if (pushingOurs.get() != null) return false; // our estimate, on its way
            if (!PatchSettings.isEnabled(null, KEY)) return false;
            feed = new WeakReference<>(locationFeed);
            ensureWorker();
            long now = SystemClock.elapsedRealtime();

            boolean sameSpot = lastFix != null && fix.distanceTo(lastFix) < 1f;
            switch (TunnelMath.fixAction(sameSpot, moving(), estimate != null)) {
                case DROP: return true; // the car's stale fix: keep the estimate going
                case PASS: return false; // no GPS yet, no estimate yet: as without the feature
                default: break;
            }

            learnGyroSign(fix);
            carCompass(); // follows the compass outside tunnels too, to tell when it freezes
            if (estimate != null) Log.i(TAG, "GPS back after " + (now - lastFixAt) / 1000 + " s, " + (int) fix.distanceTo(estimate) + " m from the estimate");
            lastFix = new Location(fix);
            lastFixAt = now;
            if (!sameSpot) lastMovedAt = now;
            estimate = null;
            if (fix.hasBearing() && fix.hasSpeed() && fix.getSpeed() > MOVING_MPS) bearing = fix.getBearing();
            return false;
        } catch (Throwable t) {
            Log.w(TAG, "onPush", t);
            return false;
        }
    }

    // endregion

    // region Estimate

    private static synchronized void ensureWorker() {
        if (worker != null) return;
        HandlerThread thread = new HandlerThread("aare-tunnel");
        thread.start();
        worker = new Handler(thread.getLooper());
        worker.post(TunnelNavigation::tick);
    }

    private static void tick() {
        try {
            step();
        } catch (Throwable t) {
            Log.w(TAG, "tick", t);
        }
        worker.postDelayed(TunnelNavigation::tick, 1000);
    }

    private static void step() {
        Object f = feed.get();
        if (f == null || lastFix == null) return;
        long now = SystemClock.elapsedRealtime();
        long sinceFix = now - Math.max(lastFixAt, lastMovedAt);
        if (sinceFix < STALE_MS) return;
        Float speed = carSpeed();
        if (speed == null || !connected()) return;

        if (estimate == null) {
            estimate = new Location(lastFix);
            estimateAt = lastMovedAt;
            travelledM = 0;
            movingMs = 0;
            limitLogged = false;
            startAccuracy = lastFix.hasAccuracy() ? lastFix.getAccuracy() : 10f;
            if (Double.isNaN(bearing) && lastFix.hasBearing()) bearing = lastFix.getBearing();
            Log.i(TAG, "no GPS while moving: estimating from the last fix");
        }
        if (Double.isNaN(bearing)) return;

        double dt = (now - estimateAt) / 1000.0;
        estimateAt = now;
        if (dt <= 0 || dt > 5) return;

        // Heading: compass when the car updates it, else turn by the gyroscope.
        Float compass = carCompass();
        Float yaw = carYawRate();
        if (compass != null) {
            bearing = compass;
        } else if (yaw != null && Math.abs(gyroCorrelation) > 2) {
            double sign = Math.signum(gyroCorrelation);
            bearing = TunnelMath.turn(bearing, yaw, sign, dt);
        }

        double distance = speed * dt;
        long moved = speed > MOVING_MPS ? (long) (dt * 1000) : 0;
        if (!TunnelMath.withinLimits(travelledM + distance, movingMs + moved)) {
            if (!limitLogged) Log.i(TAG, "estimate stopped after " + (int) travelledM + " m, " + movingMs / 1000 + " s of driving without GPS");
            limitLogged = true;
            return;
        }
        travelledM += distance;
        movingMs += moved;
        Location next = destination(estimate, bearing, distance);
        next.setSpeed(speed);
        next.setBearing((float) bearing);
        next.setAccuracy(TunnelMath.accuracy(startAccuracy, travelledM));
        next.setTime(System.currentTimeMillis());
        next.setElapsedRealtimeNanos(SystemClock.elapsedRealtimeNanos());
        estimate = next;

        pushingOurs.set(Boolean.TRUE);
        try {
            Method push = f.getClass().getMethod("push", Location.class);
            push.invoke(f, next);
        } catch (Throwable t) {
            Log.w(TAG, "push", t);
        } finally {
            pushingOurs.remove();
        }
    }

    /** Learns which way the gyroscope turns, from the GPS bearing while driving. */
    private static void learnGyroSign(Location fix) {
        Location prev = previousFix;
        previousFix = new Location(fix);
        if (prev == null || !fix.hasBearing() || !prev.hasBearing() || fix.getSpeed() < 5) return;
        double dt = (fix.getElapsedRealtimeNanos() - prev.getElapsedRealtimeNanos()) / 1e9;
        if (dt <= 0.2 || dt > 3) return;
        double rate = Math.toRadians(wrap(fix.getBearing() - prev.getBearing())) / dt; // clockwise, rad/s
        Float yaw = carYawRate();
        if (yaw == null || Math.abs(rate) < 0.03) return;
        gyroCorrelation = Math.max(-50, Math.min(50, gyroCorrelation + Math.signum(rate * yaw)));
    }

    private static Location destination(Location from, double bearingDeg, double meters) {
        double[] to = TunnelMath.destination(from.getLatitude(), from.getLongitude(), bearingDeg, meters);
        Location out = new Location(from);
        out.setLatitude(to[0]);
        out.setLongitude(to[1]);
        return out;
    }

    private static double wrap(double deg) {
        return TunnelMath.wrap(deg);
    }

    // endregion

    // region Car data (AARE's CarData)

    private static Object state() {
        try {
            Class<?> carData = Class.forName("net.prototux.aare.car.CarData", false, TunnelNavigation.class.getClassLoader());
            Object instance = carData.getField("INSTANCE").get(null);
            Object flow = carData.getMethod("getState").invoke(instance);
            return flow.getClass().getMethod("getValue").invoke(flow);
        } catch (Throwable t) {
            return null;
        }
    }

    /** A sensor value of [state] no older than two seconds, or null. */
    private static Object fresh(String getter) {
        try {
            Object s = state();
            if (s == null) return null;
            Object timed = s.getClass().getMethod(getter).invoke(s);
            if (timed == null) return null;
            long at = (long) timed.getClass().getMethod("getAtMillis").invoke(timed);
            if (System.currentTimeMillis() - at > 2000) return null;
            return timed.getClass().getMethod("getValue").invoke(timed);
        } catch (Throwable t) {
            return null;
        }
    }

    private static boolean connected() {
        try {
            Object s = state();
            return s != null && (boolean) s.getClass().getMethod("getConnected").invoke(s);
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean moving() {
        Float v = carSpeed();
        return v != null && v > MOVING_MPS;
    }

    /** m/s: the car's speed, else the mean of its wheel speeds. */
    private static Float carSpeed() {
        try {
            Object speed = fresh("getSpeed");
            if (speed != null) return Math.abs((float) speed.getClass().getMethod("getMetersPerSecond").invoke(speed));
            Object dr = fresh("getDeadReckoning");
            if (dr != null) {
                List<?> wheels = (List<?>) dr.getClass().getMethod("getWheelSpeedsMps").invoke(dr);
                if (wheels != null && !wheels.isEmpty()) {
                    double sum = 0;
                    for (Object w : wheels) sum += ((Number) w).doubleValue();
                    return (float) Math.abs(sum / wheels.size());
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static final TunnelMath.CompassWatch compassWatch = new TunnelMath.CompassWatch();

    /**
     * The car's compass, only while it moves. Many cars derive it from their GPS: in a tunnel it
     * freezes on the last heading, and following it the estimate went straight on in curves, off the
     * outside of the road.
     */
    private static Float carCompass() {
        try {
            Object c = fresh("getCompass");
            if (c == null) return null;
            float b = (float) c.getClass().getMethod("getBearingDeg").invoke(c);
            return compassWatch.update(b, SystemClock.elapsedRealtime());
        } catch (Throwable t) {
            return null;
        }
    }

    /** rad/s around the vertical axis, as the car sends it (sign learned separately). */
    private static Float carYawRate() {
        try {
            Object g = fresh("getGyroscope");
            if (g == null) return null;
            return (Float) g.getClass().getMethod("getZ").invoke(g);
        } catch (Throwable t) {
            return null;
        }
    }

    // endregion
}
