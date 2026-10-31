package com.facebook.ads.redexgen.X;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

/* renamed from: com.facebook.ads.redexgen.X.ln, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2134ln implements SensorEventListener {
    public C2134ln() {
    }

    @Override // android.hardware.SensorEventListener
    public final void onAccuracyChanged(Sensor sensor, int i5) {
    }

    @Override // android.hardware.SensorEventListener
    public final void onSensorChanged(SensorEvent sensorEvent) {
        float[] unused = C2136lp.A0A = sensorEvent.values;
        C2136lp.A06();
    }
}
