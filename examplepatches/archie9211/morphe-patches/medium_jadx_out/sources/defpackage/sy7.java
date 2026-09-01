package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class sy7 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[qy7.values().length];
        a = iArr;
        try {
            iArr[qy7.MERGE.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[qy7.ADD.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            a[qy7.SUBTRACT.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            a[qy7.INTERSECT.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            a[qy7.EXCLUDE_INTERSECTIONS.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
    }
}
