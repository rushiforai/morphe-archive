package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class m4b {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[n4b.values().length];
        a = iArr;
        try {
            iArr[n4b.HARDWARE.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[n4b.SOFTWARE.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            a[n4b.AUTOMATIC.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
    }
}
