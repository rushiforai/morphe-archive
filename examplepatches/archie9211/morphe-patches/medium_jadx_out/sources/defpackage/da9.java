package defpackage;

import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class da9 {
    public static final gq a;
    public static final wz7 b;
    public static final zi5 c;

    static {
        String property = System.getProperty("java.vm.name");
        property.getClass();
        if (property.equals("RoboVM")) {
            a = null;
            b = new wz7(22);
            c = new zi5(12);
        } else {
            if (!property.equals("Dalvik")) {
                a = null;
                b = new m1b(22);
                c = new p01(12);
                return;
            }
            a = new gq();
            if (Build.VERSION.SDK_INT >= 24) {
                b = new l1b(22);
                c = new p01(12);
            } else {
                b = new wz7(22);
                c = new zi5(12);
            }
        }
    }
}
