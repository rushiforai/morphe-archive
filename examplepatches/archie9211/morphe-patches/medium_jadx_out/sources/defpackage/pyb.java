package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class pyb {
    public static final d1g b;
    public static final d1g c;
    public static final d1g d;
    public static final d1g e;
    public static final int a = kk7.D(100, 12, "kotlinx.coroutines.semaphore.maxSpinCycles");
    public static final int f = kk7.D(16, 12, "kotlinx.coroutines.semaphore.segmentSize");

    static {
        int i = 16;
        boolean z = false;
        b = new d1g(i, "PERMIT", z);
        c = new d1g(i, "TAKEN", z);
        d = new d1g(i, "BROKEN", z);
        e = new d1g(i, "CANCELLED", z);
    }
}
