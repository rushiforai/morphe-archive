package defpackage;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kue implements SensorEventListener {
    public lt a;

    @Override // android.hardware.SensorEventListener
    public final void onAccuracyChanged(Sensor sensor, int i) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            sensor.getClass();
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    @Override // android.hardware.SensorEventListener
    public final void onSensorChanged(SensorEvent sensorEvent) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            sensorEvent.getClass();
            lt ltVar = this.a;
            if (ltVar != null) {
                float[] fArr = sensorEvent.values;
                double d = fArr[0] / 9.80665f;
                double d2 = fArr[1] / 9.80665f;
                double d3 = fArr[2] / 9.80665f;
                if (Math.sqrt((d3 * d3) + (d2 * d2) + (d * d)) > 2.3d) {
                    ltVar.g();
                }
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }
}
