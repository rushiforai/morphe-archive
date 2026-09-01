package defpackage;

import android.os.SystemClock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ewf {
    public static final swf a;

    static {
        bwf bwfVar;
        try {
            SystemClock.elapsedRealtimeNanos();
            bwfVar = new bwf(0);
        } catch (Throwable unused) {
            SystemClock.elapsedRealtime();
            bwfVar = new bwf(1);
        }
        a = bwfVar;
    }
}
