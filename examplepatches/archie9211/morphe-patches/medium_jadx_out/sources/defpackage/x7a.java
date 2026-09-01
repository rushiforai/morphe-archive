package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class x7a {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[r7a.values().length];
        a = iArr;
        try {
            iArr[r7a.DEFAULT.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[r7a.SIGNED.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            a[r7a.FIXED.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
    }
}
