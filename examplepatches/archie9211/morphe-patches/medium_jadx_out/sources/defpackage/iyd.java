package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract /* synthetic */ class iyd {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[bk6.values().length];
        try {
            iArr[bk6.IN.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[bk6.INVARIANT.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[bk6.OUT.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
    }
}
