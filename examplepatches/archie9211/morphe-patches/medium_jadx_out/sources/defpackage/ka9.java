package defpackage;

import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ka9 {
    public static final ja9 a;

    static {
        a = Build.VERSION.SDK_INT >= 24 ? new dq() : new cd7();
    }
}
