package com.bytedance.sdk.openadsdk.wwx;

import android.content.Context;
import android.hardware.SensorEventListener;
import android.os.Vibrator;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public class jc {
    public static WeakReference<ycx> ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected static final float[] f27356zb = new float[3];
    protected static final float[] sya = new float[3];

    /* renamed from: dj, reason: collision with root package name */
    protected static final float[] f27355dj = new float[9];
    protected static final float[] lud = new float[3];

    public static void dj(Context context, SensorEventListener sensorEventListener, int i5) {
        if (sensorEventListener == null || context == null) {
            return;
        }
        try {
            WeakReference<ycx> weakReference = ycx;
            if (weakReference != null) {
                weakReference.get();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "aOsjhgyuQdKC", "SPoshxeQYNSUT9lvgwWhPFLhI6MGv33Ikg==", 102);
            ul.ycx("SensorHub", "startListenRotationVector err", th2);
        }
    }

    public static void sya(Context context, SensorEventListener sensorEventListener, int i5) {
        if (sensorEventListener == null || context == null) {
            return;
        }
        try {
            WeakReference<ycx> weakReference = ycx;
            if (weakReference != null) {
                weakReference.get();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "aOsjhgyuQdKC", "SPoshxeQYNSUT9lxhR+lKUnPLpYGsGzVgV7eUoI=", 85);
            ul.ycx("SensorHub", "startListenLinearAcceleration error", th2);
        }
    }

    public static void ycx(Context context, SensorEventListener sensorEventListener) {
    }

    public static void zb(Context context, SensorEventListener sensorEventListener, int i5) {
        if (sensorEventListener == null || context == null) {
            return;
        }
        try {
            WeakReference<ycx> weakReference = ycx;
            if (weakReference != null) {
                weakReference.get();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "aOsjhgyuQdKC", "SPoshxeQYNSUT9l6lQOvO1jhPZA=", 69);
            ul.ycx("SensorHub", "startListenGyroscope error", th2);
        }
    }

    public static void ycx(ycx ycxVar) {
        ycx = new WeakReference<>(ycxVar);
    }

    public static void ycx(Context context, SensorEventListener sensorEventListener, int i5) {
        if (sensorEventListener == null || context == null) {
            return;
        }
        try {
            WeakReference<ycx> weakReference = ycx;
            if (weakReference != null) {
                weakReference.get();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "aOsjhgyuQdKC", "SPoshxeQYNSUT9l8jxKlJF78IpgGqGzV", 53);
            ul.ycx("SensorHub", "startListenAccelerometer error", th2);
        }
    }

    public static void ycx(Context context, long j11) {
        if (context == null) {
            return;
        }
        ((Vibrator) context.getSystemService("vibrator")).vibrate(j11);
    }
}
