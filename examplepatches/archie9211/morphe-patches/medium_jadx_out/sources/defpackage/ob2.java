package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract /* synthetic */ class ob2 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[qb2.values().length];
        try {
            iArr[qb2.PARKING.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[qb2.BLOCKING.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[qb2.CPU_ACQUIRED.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[qb2.DORMANT.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[qb2.TERMINATED.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        a = iArr;
    }
}
