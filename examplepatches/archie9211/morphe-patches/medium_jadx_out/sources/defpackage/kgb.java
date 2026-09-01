package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class kgb {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[vx6.values().length];
        try {
            iArr[vx6.DESTROYED.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[vx6.INITIALIZED.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[vx6.CREATED.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[vx6.STARTED.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[vx6.RESUMED.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        a = iArr;
    }
}
