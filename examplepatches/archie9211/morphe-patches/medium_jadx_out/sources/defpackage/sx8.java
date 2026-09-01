package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class sx8 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[hx1.values().length];
        a = iArr;
        try {
            iArr[hx1.TEXT.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[hx1.BYTE.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            a[hx1.NUMERIC.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
    }
}
