package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract /* synthetic */ class u83 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[p4a.values().length];
        try {
            iArr[p4a.PRETTY.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[p4a.DEBUG.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[p4a.NONE.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
    }
}
