package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class a3d {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[x2d.values().length];
        try {
            iArr[x2d.END.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[x2d.ROLLBACK.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[x2d.BEGIN_EXCLUSIVE.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[x2d.BEGIN_IMMEDIATE.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[x2d.BEGIN_DEFERRED.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        a = iArr;
    }
}
