package app.southstar21.extension.instagram.liquidglass;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;

import java.util.ArrayList;

/**
 * The glass glint that slides along the rim as the phone tilts, like on iOS 26. This publishes a
 * tilt angle; {@link #glint} turns it into a spot on the rim of a rounded rectangle, found by
 * walking round the perimeter in proportion to the angle, and a weaker one opposite it.
 * <p>
 * The tilt comes from the game rotation vector sensor (or gravity, or the accelerometer), read at
 * about 30 Hz and low-pass filtered. It is measured against a neutral pose that slowly follows
 * the phone, so holding the phone at any angle gives the default look and only tilting moves the
 * light. The angle is capped at about 115 degrees each way and the neutral takes about a minute to
 * follow, so a held tilt stays.
 * <p>
 * The sensor runs only while some client is active (a glass view that is attached, visible and
 * has the setting on); with no client nothing is registered and the light sits at rest. The
 * published angle changes only in steps of about one degree, and clients are told then, so a
 * steady phone costs no redraws. Everything runs on the main thread.
 */
final class TiltLight implements SensorEventListener {
    /** Wants to know when the light moved, to draw again. */
    interface Listener {
        void onLightChanged();
    }

    /** The most the angle turns, in radians (about 115 degrees). */
    private static final float MAX_ANGLE = 2.0f;
    /** The published angle moves in steps at least this big (about 1.7 degrees). */
    private static final float STEP = 0.03f;
    /** Where the glint rests, as an angle round the rim from the top center, clockwise (top left). */
    private static final float REST_ANGLE = -0.5f;
    /** Sensor period, about 30 Hz. */
    private static final int PERIOD_US = 33_000;
    /** Per sample: how far the tilt follows the sensor, and how far the neutral follows the tilt. */
    private static final float FOLLOW = 0.25f;
    private static final float NEUTRAL_FOLLOW = 0.0007f;  // about 48 s at 30 Hz
    /** Angle in radians per unit of tilt (the sine of the angle): sideways and forwards. */
    private static final float ROLL_GAIN = 3.0f;
    private static final float PITCH_GAIN = 2.2f;

    private static final TiltLight INSTANCE = new TiltLight();
    private static final ArrayList<Listener> clients = new ArrayList<>();

    /** The published tilt angle. */
    private static float angle = 0f;

    private SensorManager manager;
    private Sensor sensor;
    private boolean rotationVector;
    private boolean registered;
    private boolean haveFilter;
    private float fx, fz, nx, nz;
    private final float[] matrix = new float[9];

    private TiltLight() {
    }

    /** The published tilt angle in radians, 0 at rest. */
    static float angle() {
        return angle;
    }

    /**
     * The glint's anchor points on the rim of a rounded rectangle of half size ({@code hw},
     * {@code hh}) and corner radius {@code r}, relative to its center, for the tilt {@code tilt}:
     * {@code out[0..1]} is the glint and {@code out[2..3]} the weaker one opposite it. The rim is
     * walked from the top center, clockwise, a full turn being 2 pi, so the same angle puts the
     * glint at the same fraction of the way round whatever the shape. {@code out[4]} is the glint's
     * softness (its gaussian sigma) in the same units as the sizes. No allocation.
     */
    static void glint(float hw, float hh, float r, float tilt, float[] out) {
        r = Math.max(0f, Math.min(r, Math.min(hw, hh)));
        float sx = 2f * (hw - r), sy = 2f * (hh - r), arc = 1.5707964f * r;
        float perimeter = 2f * sx + 2f * sy + 4f * arc;
        out[4] = Math.max(2f, 0.9f * Math.min(hw, hh));
        if (perimeter < 1e-3f) {
            out[0] = out[1] = out[2] = out[3] = 0f;
            return;
        }
        float s = (REST_ANGLE + tilt) / 6.2831855f * perimeter;
        s -= perimeter * (float) Math.floor(s / perimeter);
        pointAt(hw, hh, r, sx, sy, arc, perimeter, s, out, 0);
        float opp = s + perimeter * 0.5f;
        if (opp >= perimeter) opp -= perimeter;
        pointAt(hw, hh, r, sx, sy, arc, perimeter, opp, out, 2);
    }

    /** The point {@code s} along the rim from the top center, clockwise, into {@code out[at..at+1]}. */
    private static void pointAt(float hw, float hh, float r, float sx, float sy, float arc,
                                float perimeter, float s, float[] out, int at) {
        float x, y;
        float ix = hw - r, iy = hh - r;
        if (s < sx * 0.5f) {                       // top, right half
            x = s;
            y = -hh;
        } else if ((s -= sx * 0.5f) < arc) {       // top right corner
            float a = r > 0f ? s / r : 0f;
            x = ix + r * (float) Math.sin(a);
            y = -iy - r * (float) Math.cos(a);
        } else if ((s -= arc) < sy) {              // right side
            x = hw;
            y = -iy + s;
        } else if ((s -= sy) < arc) {              // bottom right corner
            float a = r > 0f ? s / r : 0f;
            x = ix + r * (float) Math.cos(a);
            y = iy + r * (float) Math.sin(a);
        } else if ((s -= arc) < sx) {              // bottom
            x = ix - s;
            y = hh;
        } else if ((s -= sx) < arc) {              // bottom left corner
            float a = r > 0f ? s / r : 0f;
            x = -ix - r * (float) Math.sin(a);
            y = iy + r * (float) Math.cos(a);
        } else if ((s -= arc) < sy) {              // left side
            x = -hw;
            y = iy - s;
        } else if ((s -= sy) < arc) {              // top left corner
            float a = r > 0f ? s / r : 0f;
            x = -ix - r * (float) Math.cos(a);
            y = -iy - r * (float) Math.sin(a);
        } else {                                   // top, left half
            s -= arc;
            x = -ix + s;
            y = -hh;
        }
        out[at] = x;
        out[at + 1] = y;
    }

    /**
     * Starts or stops a client's need for the sensor. Safe to call every frame: nothing happens
     * unless {@code active} differs from the last call for that client.
     */
    static void setActive(Context context, Listener client, boolean active) {
        int at = clients.indexOf(client);
        if (active) {
            if (at >= 0) return;
            clients.add(client);
            if (clients.size() == 1) INSTANCE.start(context);
        } else {
            if (at < 0) return;
            clients.remove(at);
            if (clients.isEmpty()) INSTANCE.stop();
        }
    }

    private void start(Context context) {
        if (registered) return;
        if (manager == null) {
            manager = (SensorManager) context.getApplicationContext().getSystemService(Context.SENSOR_SERVICE);
            if (manager == null) return;
        }
        sensor = manager.getDefaultSensor(Sensor.TYPE_GAME_ROTATION_VECTOR);
        rotationVector = sensor != null;
        if (sensor == null) sensor = manager.getDefaultSensor(Sensor.TYPE_GRAVITY);
        if (sensor == null) sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        // No sensor: the light just stays at rest.
        if (sensor == null) return;
        haveFilter = false;
        registered = manager.registerListener(this, sensor, PERIOD_US);
    }

    private void stop() {
        if (registered) manager.unregisterListener(this);
        registered = false;
        haveFilter = false;
        // Back to rest, so the next start begins from the default look.
        angle = 0f;
    }

    @Override
    public void onSensorChanged(SensorEvent event) {
        float ux, uz;
        if (rotationVector) {
            // The third row of the rotation matrix is the world's up in the phone's axes.
            SensorManager.getRotationMatrixFromVector(matrix, event.values);
            ux = matrix[6];
            uz = matrix[8];
        } else {
            float x = event.values[0], y = event.values[1], z = event.values[2];
            float len = (float) Math.sqrt(x * x + y * y + z * z);
            if (len < 1e-3f) return;
            ux = x / len;
            uz = z / len;
        }
        if (!haveFilter) {
            haveFilter = true;
            fx = nx = ux;
            fz = nz = uz;
            return;
        }
        fx += (ux - fx) * FOLLOW;
        fz += (uz - fz) * FOLLOW;
        // The neutral drifts after the pose, so a phone held at any angle ends up at rest.
        nx += (fx - nx) * NEUTRAL_FOLLOW;
        nz += (fz - nz) * NEUTRAL_FOLLOW;
        // Right edge up moves the glint clockwise round the rim; leaning the top back moves it the
        // other way.
        float target = ROLL_GAIN * (fx - nx) - PITCH_GAIN * (fz - nz);
        target = Math.max(-MAX_ANGLE, Math.min(MAX_ANGLE, target));
        if (Math.abs(target - angle) < STEP) return;
        angle = target;
        for (int i = 0; i < clients.size(); i++) clients.get(i).onLightChanged();
    }

    @Override
    public void onAccuracyChanged(Sensor sensor, int accuracy) {
    }
}
