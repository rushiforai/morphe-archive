package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract /* synthetic */ class bh6 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[xm6.values().length];
        try {
            iArr[xm6.FILE_FACADE.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[xm6.MULTIFILE_CLASS.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[xm6.MULTIFILE_CLASS_PART.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[xm6.SYNTHETIC_CLASS.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[xm6.UNKNOWN.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[xm6.CLASS.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        a = iArr;
    }
}
