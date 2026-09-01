package defpackage;

import android.hardware.SensorManager;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fq1 {
    public static SensorManager c;
    public static jue d;
    public static String e;
    public static volatile boolean h;
    public static final fq1 a = new fq1();
    public static final kue b = new kue();
    public static final AtomicBoolean f = new AtomicBoolean(true);
    public static final AtomicBoolean g = new AtomicBoolean(false);

    public static final String a() {
        if (ec2.a.contains(fq1.class)) {
            return null;
        }
        try {
            String string = e;
            if (string == null) {
                string = UUID.randomUUID().toString();
                e = string;
            }
            string.getClass();
            return string;
        } catch (Throwable th) {
            ec2.a(fq1.class, th);
            return null;
        }
    }
}
