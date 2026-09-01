package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class r25 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[vx6.values().length];
        a = iArr;
        try {
            iArr[vx6.RESUMED.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[vx6.STARTED.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            a[vx6.CREATED.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            a[vx6.INITIALIZED.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
    }
}
