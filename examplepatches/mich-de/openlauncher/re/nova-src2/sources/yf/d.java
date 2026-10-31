package yf;

import ai.y0;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.opengl.Matrix;
import android.view.Display;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes3.dex */
public final class d implements SensorEventListener {

    /* renamed from: a, reason: collision with root package name */
    public final float[] f97246a = new float[16];

    /* renamed from: b, reason: collision with root package name */
    public final float[] f97247b = new float[16];

    /* renamed from: c, reason: collision with root package name */
    public final float[] f97248c = new float[16];

    /* renamed from: d, reason: collision with root package name */
    public final float[] f97249d = new float[3];

    /* renamed from: e, reason: collision with root package name */
    public final Display f97250e;

    /* renamed from: f, reason: collision with root package name */
    public final c[] f97251f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f97252g;

    public d(Display display, c... cVarArr) {
        this.f97250e = display;
        this.f97251f = cVarArr;
    }

    @Override // android.hardware.SensorEventListener
    public final void onAccuracyChanged(Sensor sensor, int i5) {
    }

    @Override // android.hardware.SensorEventListener
    public final void onSensorChanged(SensorEvent sensorEvent) {
        int i5;
        float[] fArr = sensorEvent.values;
        float[] fArr2 = this.f97246a;
        SensorManager.getRotationMatrixFromVector(fArr2, fArr);
        int rotation = this.f97250e.getRotation();
        float[] fArr3 = this.f97247b;
        if (rotation != 0) {
            int i11 = Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE;
            if (rotation != 1) {
                i5 = Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE;
                if (rotation != 2) {
                    if (rotation != 3) {
                        throw new IllegalStateException();
                    }
                    i11 = 130;
                    i5 = 1;
                }
            } else {
                i5 = 129;
                i11 = 2;
            }
            System.arraycopy(fArr2, 0, fArr3, 0, fArr3.length);
            SensorManager.remapCoordinateSystem(fArr3, i11, i5, fArr2);
        }
        SensorManager.remapCoordinateSystem(fArr2, 1, Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE, fArr3);
        float[] fArr4 = this.f97249d;
        SensorManager.getOrientation(fArr3, fArr4);
        float f11 = fArr4[2];
        Matrix.rotateM(fArr2, 0, 90.0f, 1.0f, 0.0f, 0.0f);
        boolean z11 = this.f97252g;
        float[] fArr5 = this.f97248c;
        if (!z11) {
            y0.i(fArr5, fArr2);
            this.f97252g = true;
        }
        System.arraycopy(fArr2, 0, fArr3, 0, fArr3.length);
        Matrix.multiplyMM(fArr2, 0, fArr3, 0, fArr5, 0);
        for (int i12 = 0; i12 < 2; i12++) {
            this.f97251f[i12].a(fArr2, f11);
        }
    }
}
