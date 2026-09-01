package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class m28 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[n28.values().length];
        a = iArr;
        try {
            iArr[n28.RUNNING.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[n28.FINISHED.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
    }
}
