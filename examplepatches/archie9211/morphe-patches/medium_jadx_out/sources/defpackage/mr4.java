package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class mr4 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[ul2.values().length];
        try {
            iArr[ul2.Redirected.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[ul2.Cancelled.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[ul2.RedirectCancelled.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[ul2.None.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        a = iArr;
    }
}
