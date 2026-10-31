package com.pgl.ssdk;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes4.dex */
public class ak implements SensorEventListener {

    /* renamed from: a, reason: collision with root package name */
    private static final float[] f42269a = {999999.0f, 999999.0f, 999999.0f};

    /* renamed from: b, reason: collision with root package name */
    public static boolean f42270b = true;

    /* renamed from: c, reason: collision with root package name */
    private static volatile ak f42271c;

    /* renamed from: i, reason: collision with root package name */
    private final Context f42277i;

    /* renamed from: d, reason: collision with root package name */
    private Sensor f42272d = null;

    /* renamed from: e, reason: collision with root package name */
    private Sensor f42273e = null;

    /* renamed from: f, reason: collision with root package name */
    private Sensor f42274f = null;

    /* renamed from: g, reason: collision with root package name */
    private volatile boolean f42275g = false;

    /* renamed from: h, reason: collision with root package name */
    private volatile boolean f42276h = false;

    /* renamed from: j, reason: collision with root package name */
    private AtomicReference<a> f42278j = new AtomicReference<>();

    /* renamed from: k, reason: collision with root package name */
    private long f42279k = 999999;

    public static class a {

        /* renamed from: a, reason: collision with root package name */
        public long f42280a;

        /* renamed from: b, reason: collision with root package name */
        public float[] f42281b = null;

        /* renamed from: c, reason: collision with root package name */
        public float[] f42282c = null;

        /* renamed from: d, reason: collision with root package name */
        public float[] f42283d = null;

        public a(long j11) {
            this.f42280a = j11;
        }
    }

    private ak(Context context) {
        this.f42277i = context;
    }

    public static ak a(Context context) {
        if (f42271c == null) {
            synchronized (ak.class) {
                try {
                    if (f42271c == null) {
                        f42271c = new ak(context);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        if (f42270b) {
            f42271c.c();
        }
        return f42271c;
    }

    private void c() {
        if (this.f42276h) {
            return;
        }
        try {
            SensorManager sensorManager = (SensorManager) this.f42277i.getApplicationContext().getSystemService("sensor");
            if (sensorManager != null) {
                this.f42272d = sensorManager.getDefaultSensor(1);
                this.f42273e = sensorManager.getDefaultSensor(2);
                this.f42274f = sensorManager.getDefaultSensor(4);
            }
        } catch (Exception unused) {
        }
        this.f42276h = true;
    }

    private void e() {
        this.f42279k = -1L;
        this.f42275g = false;
        try {
            SensorManager sensorManager = (SensorManager) this.f42277i.getApplicationContext().getSystemService("sensor");
            if (sensorManager != null) {
                sensorManager.unregisterListener(this);
            }
        } catch (Exception unused) {
        }
    }

    public Object[] b() {
        Object[] objArr = new Object[6];
        a aVar = this.f42278j.get();
        if (!f42270b || aVar == null) {
            a(objArr);
            return objArr;
        }
        int i5 = 0;
        do {
            if ((this.f42272d == null || aVar.f42281b != null) && ((this.f42273e == null || aVar.f42282c != null) && (this.f42274f == null || aVar.f42283d != null))) {
                break;
            }
            ay.a(50L);
            i5++;
        } while (i5 <= 20);
        e();
        this.f42275g = false;
        a(objArr, aVar);
        this.f42278j.set(null);
        return objArr;
    }

    public boolean d() {
        if (this.f42272d != null) {
            try {
                SensorManager sensorManager = (SensorManager) this.f42277i.getApplicationContext().getSystemService("sensor");
                if (sensorManager != null) {
                    boolean zRegisterListener = sensorManager.registerListener(this, this.f42272d, 2);
                    Sensor sensor = this.f42273e;
                    if (sensor != null) {
                        sensorManager.registerListener(this, sensor, 2);
                    }
                    Sensor sensor2 = this.f42274f;
                    if (sensor2 != null) {
                        sensorManager.registerListener(this, sensor2, 2);
                    }
                    if (zRegisterListener) {
                        long jCurrentTimeMillis = System.currentTimeMillis();
                        this.f42279k = jCurrentTimeMillis;
                        this.f42278j.set(new a(jCurrentTimeMillis));
                        this.f42275g = true;
                    } else {
                        e();
                    }
                }
            } catch (Throwable unused) {
                e();
            }
        }
        return this.f42275g;
    }

    @Override // android.hardware.SensorEventListener
    public void onAccuracyChanged(Sensor sensor, int i5) {
    }

    @Override // android.hardware.SensorEventListener
    public void onSensorChanged(SensorEvent sensorEvent) {
        a aVar = this.f42278j.get();
        if (aVar == null) {
            return;
        }
        int type = sensorEvent.sensor.getType();
        if (type == 1) {
            if (aVar.f42281b == null) {
                aVar.f42281b = sensorEvent.values;
            }
        } else if (type == 2) {
            if (aVar.f42282c == null) {
                aVar.f42282c = sensorEvent.values;
            }
        } else if (type == 4 && aVar.f42283d == null) {
            aVar.f42283d = sensorEvent.values;
        }
    }

    public void a() {
        if (!f42270b || this.f42275g) {
            return;
        }
        d();
    }

    private static void a(Object[] objArr) {
        Float fValueOf = Float.valueOf(999999.0f);
        objArr[0] = fValueOf;
        objArr[1] = fValueOf;
        objArr[2] = fValueOf;
        objArr[3] = 999999L;
        float[] fArr = f42269a;
        objArr[4] = fArr;
        objArr[5] = fArr;
    }

    private static void a(Object[] objArr, a aVar) {
        Float fValueOf = Float.valueOf(999999.0f);
        float[] fArr = aVar.f42281b;
        if (fArr != null) {
            float[] fArr2 = aVar.f42282c;
            float[] fArrA = fArr2 != null ? a(objArr, fArr, fArr2) : a(objArr, fArr);
            objArr[0] = Float.valueOf(fArrA[0]);
            objArr[1] = Float.valueOf(fArrA[1]);
            objArr[2] = Float.valueOf(fArrA[2]);
            objArr[4] = aVar.f42281b;
        } else {
            objArr[0] = fValueOf;
            objArr[1] = fValueOf;
            objArr[2] = fValueOf;
            objArr[4] = f42269a;
        }
        objArr[3] = Long.valueOf(aVar.f42280a);
        float[] fArr3 = aVar.f42283d;
        if (fArr3 != null) {
            objArr[5] = fArr3;
        } else {
            objArr[5] = f42269a;
        }
    }

    private static float[] a(Object[] objArr, float[] fArr) {
        float f11 = fArr[0];
        float f12 = fArr[1];
        float f13 = fArr[2];
        float fSqrt = 1.0f / ((float) Math.sqrt((f13 * f13) + ((f12 * f12) + (f11 * f11))));
        return new float[]{999999.0f, (((float) Math.toDegrees((float) Math.asin(-(f12 * fSqrt)))) + 360.0f) % 360.0f, (((float) Math.toDegrees((float) Math.atan2(-(f11 * fSqrt), f13 * fSqrt))) + 360.0f) % 360.0f};
    }

    private static float[] a(Object[] objArr, float[] fArr, float[] fArr2) {
        float[] fArr3 = new float[9];
        SensorManager.getRotationMatrix(fArr3, new float[9], fArr, fArr2);
        SensorManager.getOrientation(fArr3, new float[3]);
        return new float[]{(((float) Math.toDegrees(r2[0])) + 360.0f) % 360.0f, (((float) Math.toDegrees(r2[1])) + 360.0f) % 360.0f, (((float) Math.toDegrees(r2[2])) + 360.0f) % 360.0f};
    }
}
