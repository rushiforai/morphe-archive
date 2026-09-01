package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class ej3 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[lj3.values().length];
        try {
            iArr[lj3.DOWNLOADED.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[lj3.DOWNLOADED_DISABLED.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[lj3.NOT_DOWNLOADED_DISABLED.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
    }
}
