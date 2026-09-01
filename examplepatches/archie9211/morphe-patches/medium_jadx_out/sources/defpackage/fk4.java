package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class fk4 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[rnd.values().length];
        b = iArr;
        try {
            iArr[rnd.OK.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            b[rnd.BAD_CONFIG.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            b[rnd.AUTH_ERROR.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        int[] iArr2 = new int[t36.values().length];
        a = iArr2;
        try {
            iArr2[t36.OK.ordinal()] = 1;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            a[t36.BAD_CONFIG.ordinal()] = 2;
        } catch (NoSuchFieldError unused5) {
        }
    }
}
