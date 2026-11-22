package io.github.daydreamfix.ext;

import android.content.Context;
import android.content.ContextWrapper;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * 6DoF for Daydream apps. vrcore's shared head tracker (HeadTrackingService) runs in "fake" mode
 * and gets its pose from here: rotation from the phone's game rotation vector, position from
 * ARCore. ARCore runs in vrcore's process (it has the camera permission), through the
 * ArCoreTracker class of DuskDream's Monado runtime, loaded from that APK.
 *
 * Debug props (adb shell setprop, then restart vrcore):
 *   debug.duskdream.6dof          0 = no ARCore position (rotation only)
 *   debug.duskdream.6dof_inv      1 = send the inverse pose
 *   debug.duskdream.6dof_wfirst   1 = send the quaternion as w, x, y, z
 */
public final class SixDof {
    private static final String TAG = "DuskDream6DoF";
    private static final String MONADO = "org.freedesktop.monado.openxr_runtime.out_of_process";
    private static final String TRACKER = "org.freedesktop.monado.auxiliary.ArCoreTracker";
    private static final int FAKE_TRACKER = 0x42a;
    private static final int FAKE_MODE_FROZEN = 0;

    private static Object service;
    private static Method setFakePose;
    private static Method setFakeMode;
    private static Field handleField;

    private static HandlerThread thread;
    private static Handler handler;
    private static boolean running;
    private static boolean usePosition = true;
    private static boolean inverse;
    private static boolean wFirst;
    private static boolean passive;
    /** How far ahead the rotation is predicted, in seconds (vrcore's own tracker also predicts). */
    private static float predictS = 0.05f;
    private static final float[] gyro = new float[3];
    /**
     * Own gyro fusion (world_from_device, Y up) instead of the phone's rotation vector: that one
     * trusts the accelerometer, which the head's swing around the neck fools, so turning tilted.
     */
    private static boolean fusion = true;
    private static float[] fused;
    private static long gyroTimeNs;
    private static long accelTimeNs;

    // ARCore, through Monado's ArCoreTracker.
    private static Object arTracker;
    private static Method arGetState;
    private static Method arStop;
    private static final float[] arState = new float[9];

    // Position state, as in Monado's android_sensors.c.
    private static boolean arTracking;
    private static boolean haveYawOffset;
    private static float yawOffset;
    private static boolean havePrev;
    private static final float[] prev = new float[3];
    private static final float[] pos = new float[3];
    private static long lastLog;

    private SixDof() {}

    /** After HeadTrackingService.e() picked its tracker: take it over with the fake tracker. */
    public static void afterTrackerSetup(Object svc) {
        try {
            if (service == null) {
                service = svc;
                Class<?> client = Class.forName(
                        "com.google.vr.vrcore.tracking.HeadTrackingService$DefaultNativeClient");
                setFakePose = Reflect.method(client, "nativeSetFakePoseQuat", long.class,
                        float.class, float.class, float.class, float.class, float.class, float.class, float.class);
                setFakeMode = Reflect.method(client, "nativeSetFakeMode", long.class, int.class, float.class, int.class);
                handleField = Reflect.field(svc.getClass(), "g");
                usePosition = !"0".equals(prop("debug.duskdream.6dof"));
                inverse = "1".equals(prop("debug.duskdream.6dof_inv"));
                wFirst = "1".equals(prop("debug.duskdream.6dof_wfirst"));
                passive = "1".equals(prop("debug.duskdream.6dof_passive"));
                fusion = !"0".equals(prop("debug.duskdream.6dof_fusion"));
                try {
                    predictS = Float.parseFloat(prop("debug.duskdream.6dof_predict_ms")) / 1000f;
                } catch (NumberFormatException ignored) { }
            }
            if (passive) {
                // Debug: leave vrcore's own tracker on and only log our pose, to compare them.
                usePosition = false;
                start();
                return;
            }
            Reflect.call(svc, "a", new Class<?>[] {int.class}, FAKE_TRACKER);
            setFakeMode.invoke(null, handle(), FAKE_MODE_FROZEN, 1.0f, 0);
            Log.i(TAG, "Fake head tracker on (position " + usePosition + ", inverse " + inverse
                    + ", wFirst " + wFirst + ")");
            start();
        } catch (Throwable t) {
            Log.w(TAG, "Could not take over the head tracker", t);
        }
    }

    /** After HeadTrackingService.setIsTrackerPaused(paused). */
    public static void afterPaused(Object svc, boolean paused) {
        if (service == null) {
            return;
        }
        Log.i(TAG, "Tracker paused: " + paused);
        if (paused) {
            stop();
        } else {
            start();
        }
    }

    /** Before HeadTrackingService.onDestroy(). */
    public static boolean beforeDestroy(Object svc) {
        stop();
        service = null;
        return false;
    }

    private static long handle() throws IllegalAccessException {
        return handleField.getLong(service);
    }

    private static synchronized void start() {
        if (running) {
            return;
        }
        running = true;
        if (thread == null) {
            thread = new HandlerThread("DuskDream6DoF");
            thread.start();
            handler = new Handler(thread.getLooper());
        }
        Context ctx = Daydream.app;
        SensorManager sm = (SensorManager) ctx.getSystemService(Context.SENSOR_SERVICE);
        Sensor rv = sm.getDefaultSensor(Sensor.TYPE_GAME_ROTATION_VECTOR);
        if (rv == null) {
            Log.w(TAG, "No game rotation vector sensor");
        } else {
            sm.registerListener(LISTENER, rv, SensorManager.SENSOR_DELAY_FASTEST, handler);
        }
        Sensor gy = sm.getDefaultSensor(Sensor.TYPE_GYROSCOPE);
        if (gy != null) {
            sm.registerListener(LISTENER, gy, SensorManager.SENSOR_DELAY_FASTEST, handler);
        }
        Sensor acc = sm.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        if (fusion && acc != null) {
            sm.registerListener(LISTENER, acc, SensorManager.SENSOR_DELAY_GAME, handler);
        }
        fused = null;
        gyroTimeNs = 0;
        accelTimeNs = 0;
        if (usePosition) {
            handler.post(SixDof::startArCore);
        }
    }

    private static synchronized void stop() {
        if (!running) {
            return;
        }
        running = false;
        SensorManager sm = (SensorManager) Daydream.app.getSystemService(Context.SENSOR_SERVICE);
        sm.unregisterListener(LISTENER);
        if (handler != null) {
            handler.post(SixDof::stopArCore);
        }
    }

    private static void startArCore() {
        if (arTracker != null || !running) {
            return;
        }
        try {
            Context monado = Daydream.app.createPackageContext(MONADO,
                    Context.CONTEXT_INCLUDE_CODE | Context.CONTEXT_IGNORE_SECURITY);
            Class<?> c = monado.getClassLoader().loadClass(TRACKER);
            arGetState = c.getMethod("getState", float[].class);
            arStop = c.getMethod("stop");
            // ARCore finds its own Java classes through the context's class loader.
            final ClassLoader loader = c.getClassLoader();
            Context ctx = new ContextWrapper(Daydream.app) {
                @Override
                public ClassLoader getClassLoader() {
                    return loader;
                }

                @Override
                public Context getApplicationContext() {
                    return this;
                }
            };
            arTracker = c.getMethod("create", Context.class).invoke(null, ctx);
            havePrev = false;
            Log.i(TAG, "ARCore tracker started");
        } catch (Throwable t) {
            Log.w(TAG, "ARCore not available, rotation only", t);
            arTracker = null;
        }
    }

    private static void stopArCore() {
        if (arTracker == null) {
            return;
        }
        try {
            arStop.invoke(arTracker);
        } catch (Throwable t) {
            Log.w(TAG, "ARCore stop failed", t);
        }
        arTracker = null;
        arTracking = false;
        havePrev = false;
    }

    private static final SensorEventListener LISTENER = new SensorEventListener() {
        @Override
        public void onSensorChanged(SensorEvent e) {
            int type = e.sensor.getType();
            if (type == Sensor.TYPE_GYROSCOPE) {
                gyro[0] = e.values[0];
                gyro[1] = e.values[1];
                gyro[2] = e.values[2];
                if (fusion && fused != null) {
                    float dt = gyroTimeNs == 0 ? 0 : (e.timestamp - gyroTimeNs) * 1e-9f;
                    gyroTimeNs = e.timestamp;
                    if (dt > 0 && dt < 0.1f) {
                        float speed = (float) Math.sqrt(gyro[0] * gyro[0] + gyro[1] * gyro[1] + gyro[2] * gyro[2]);
                        if (speed > 1e-6f) {
                            fused = normalize(mul(fused, axisAngle(gyro[0] / speed, gyro[1] / speed,
                                    gyro[2] / speed, speed * dt)));
                        }
                    }
                    onDevicePose(fused);
                }
            } else if (type == Sensor.TYPE_ACCELEROMETER) {
                onAccel(e);
            } else {
                float qx = e.values[0], qy = e.values[1], qz = e.values[2];
                float qw = e.values.length > 3 ? e.values[3]
                        : (float) Math.sqrt(Math.max(0, 1 - qx * qx - qy * qy - qz * qz));
                float[] dev = mul(WORLD_FROM_ENU, new float[] {qx, qy, qz, qw});
                if (!fusion) {
                    onDevicePose(dev);
                } else if (fused == null) {
                    fused = dev; // starting point, the gyro takes over from here
                }
            }
        }

        @Override
        public void onAccuracyChanged(Sensor sensor, int accuracy) {}
    };

    // Quaternions are float[4] {x, y, z, w}.

    /** World (Y up, -Z north) from Android's ENU world (Z up): -90 degrees about X. */
    private static final float[] WORLD_FROM_ENU = axisAngle(1, 0, 0, (float) (-Math.PI / 2));
    /** Phone sensor frame from head frame (landscape in the viewer): -90 degrees about Z. */
    private static final float[] SENSOR_FROM_HEAD = axisAngle(0, 0, 1, (float) (-Math.PI / 2));

    /** Pulls the fused pose slowly toward gravity, only while the phone is nearly still. */
    private static void onAccel(SensorEvent e) {
        float dt = accelTimeNs == 0 ? 0 : (e.timestamp - accelTimeNs) * 1e-9f;
        accelTimeNs = e.timestamp;
        if (!fusion || fused == null || dt <= 0 || dt > 0.1f) {
            return;
        }
        float ax = e.values[0], ay = e.values[1], az = e.values[2];
        float norm = (float) Math.sqrt(ax * ax + ay * ay + az * az);
        float spin = (float) Math.sqrt(gyro[0] * gyro[0] + gyro[1] * gyro[1] + gyro[2] * gyro[2]);
        if (Math.abs(norm - SensorManager.GRAVITY_EARTH) > 0.5f || spin > 0.5f) {
            return;
        }
        float[] up = rotate(conj(fused), new float[] {0, 1, 0});
        float mx = ax / norm, my = ay / norm, mz = az / norm;
        // Axis that turns the predicted up onto the measured one, in the device frame.
        float cx = up[1] * mz - up[2] * my, cy = up[2] * mx - up[0] * mz, cz = up[0] * my - up[1] * mx;
        float sin = (float) Math.sqrt(cx * cx + cy * cy + cz * cz);
        if (sin < 1e-5f) {
            return;
        }
        float angle = (float) Math.asin(Math.min(1f, sin)) * Math.min(1f, 0.5f * dt);
        fused = normalize(mul(fused, axisAngle(cx / sin, cy / sin, cz / sin, -angle)));
    }

    private static float[] normalize(float[] q) {
        float n = (float) Math.sqrt(q[0] * q[0] + q[1] * q[1] + q[2] * q[2] + q[3] * q[3]);
        return new float[] {q[0] / n, q[1] / n, q[2] / n, q[3] / n};
    }

    private static void onDevicePose(float[] dev) {
        float[] head = mul(dev, SENSOR_FROM_HEAD);

        if (arTracker != null) {
            updatePosition(head);
        }

        float[] q = predict(head);
        float px = pos[0], py = pos[1], pz = pos[2];
        if (inverse) {
            q = conj(q);
            float[] p = rotate(q, new float[] {-px, -py, -pz});
            px = p[0];
            py = p[1];
            pz = p[2];
        }
        long now = System.currentTimeMillis();
        if (passive && now - lastLog > 1000) {
            lastLog = now;
            Log.i(TAG, String.format("ours %.3f %.3f %.3f %.3f", q[0], q[1], q[2], q[3]));
        }
        if (passive) {
            return;
        }
        try {
            if (wFirst) {
                setFakePose.invoke(null, handle(), q[3], q[0], q[1], q[2], px, py, pz);
            } else {
                setFakePose.invoke(null, handle(), q[0], q[1], q[2], q[3], px, py, pz);
            }
        } catch (Throwable t) {
            Log.w(TAG, "setFakePose failed", t);
        }
    }

    private static void updatePosition(float[] head) {
        try {
            arGetState.invoke(arTracker, (Object) arState);
        } catch (Throwable t) {
            return;
        }
        boolean tracking = arState[7] > 0.5f && arState[8] < 250f;
        if (tracking != arTracking) {
            Log.i(TAG, "ARCore position " + (tracking ? "tracking" : "lost"));
            arTracking = tracking;
        }
        if (!tracking) {
            havePrev = false;
            return;
        }
        float[] arHead = mul(new float[] {arState[3], arState[4], arState[5], arState[6]}, SENSOR_FROM_HEAD);
        float yawOurs = yaw(head), yawAr = yaw(arHead);
        if (!Float.isNaN(yawOurs) && !Float.isNaN(yawAr)) {
            float off = wrap(yawOurs - yawAr);
            if (!haveYawOffset) {
                yawOffset = off;
                haveYawOffset = true;
            } else {
                yawOffset = wrap(yawOffset + 0.002f * wrap(off - yawOffset));
            }
        }
        if (!haveYawOffset) {
            return;
        }
        if (havePrev && (arState[0] != prev[0] || arState[1] != prev[1] || arState[2] != prev[2])) {
            float[] d = rotate(axisAngle(0, 1, 0, yawOffset),
                    new float[] {arState[0] - prev[0], arState[1] - prev[1], arState[2] - prev[2]});
            pos[0] += d[0];
            pos[1] += d[1];
            pos[2] += d[2];
        }
        prev[0] = arState[0];
        prev[1] = arState[1];
        prev[2] = arState[2];
        havePrev = true;

        long now = System.currentTimeMillis();
        if (now - lastLog > 5000) {
            lastLog = now;
            Log.i(TAG, String.format("pos %.2f %.2f %.2f yawOffset %.1f", pos[0], pos[1], pos[2],
                    Math.toDegrees(yawOffset)));
        }
    }

    /** Turns the head on by its current angular speed, for predictS seconds. */
    private static float[] predict(float[] head) {
        float[] w = rotate(conj(SENSOR_FROM_HEAD), gyro);
        float speed = (float) Math.sqrt(w[0] * w[0] + w[1] * w[1] + w[2] * w[2]);
        if (predictS <= 0 || speed < 1e-4f) {
            return head;
        }
        return mul(head, axisAngle(w[0] / speed, w[1] / speed, w[2] / speed, speed * predictS));
    }

    private static float[] axisAngle(float x, float y, float z, float a) {
        float s = (float) Math.sin(a / 2);
        return new float[] {x * s, y * s, z * s, (float) Math.cos(a / 2)};
    }

    private static float[] mul(float[] a, float[] b) {
        return new float[] {
            a[3] * b[0] + a[0] * b[3] + a[1] * b[2] - a[2] * b[1],
            a[3] * b[1] - a[0] * b[2] + a[1] * b[3] + a[2] * b[0],
            a[3] * b[2] + a[0] * b[1] - a[1] * b[0] + a[2] * b[3],
            a[3] * b[3] - a[0] * b[0] - a[1] * b[1] - a[2] * b[2],
        };
    }

    private static float[] conj(float[] q) {
        return new float[] {-q[0], -q[1], -q[2], q[3]};
    }

    private static float[] rotate(float[] q, float[] v) {
        float[] r = mul(mul(q, new float[] {v[0], v[1], v[2], 0}), conj(q));
        return new float[] {r[0], r[1], r[2]};
    }

    /** Yaw of the forward (-Z) direction, NaN when looking almost straight up or down. */
    private static float yaw(float[] q) {
        float[] f = rotate(q, new float[] {0, 0, -1});
        if (f[0] * f[0] + f[2] * f[2] < 0.1f) {
            return Float.NaN;
        }
        return (float) Math.atan2(-f[0], -f[2]);
    }

    private static float wrap(float a) {
        while (a > Math.PI) a -= (float) (2 * Math.PI);
        while (a < -Math.PI) a += (float) (2 * Math.PI);
        return a;
    }

    private static String prop(String key) {
        try {
            Class<?> sp = Class.forName("android.os.SystemProperties");
            return (String) sp.getMethod("get", String.class).invoke(null, key);
        } catch (Throwable t) {
            return "";
        }
    }
}
