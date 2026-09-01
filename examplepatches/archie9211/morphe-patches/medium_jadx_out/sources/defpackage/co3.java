package defpackage;

import android.view.ViewConfiguration;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class co3 {
    public static final float a = ViewConfiguration.getScrollFriction();
    public static final double b;
    public static final double c;

    static {
        double dLog = Math.log(0.78d) / Math.log(0.9d);
        b = dLog;
        c = dLog - 1.0d;
    }
}
