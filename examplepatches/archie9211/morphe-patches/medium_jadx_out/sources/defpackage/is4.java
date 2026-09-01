package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class is4 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[ip6.values().length];
        try {
            iArr[ip6.Ltr.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[ip6.Rtl.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        a = iArr;
        int[] iArr2 = new int[zr4.values().length];
        try {
            iArr2[zr4.Active.ordinal()] = 1;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr2[zr4.ActiveParent.ordinal()] = 2;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr2[zr4.Captured.ordinal()] = 3;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr2[zr4.Inactive.ordinal()] = 4;
        } catch (NoSuchFieldError unused6) {
        }
        b = iArr2;
    }
}
