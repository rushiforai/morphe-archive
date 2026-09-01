package j$.time.chrono;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract /* synthetic */ class n {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[j$.time.temporal.a.values().length];
        a = iArr;
        try {
            iArr[j$.time.temporal.a.DAY_OF_MONTH.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[j$.time.temporal.a.DAY_OF_YEAR.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            a[j$.time.temporal.a.ALIGNED_WEEK_OF_MONTH.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            a[j$.time.temporal.a.YEAR.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            a[j$.time.temporal.a.YEAR_OF_ERA.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            a[j$.time.temporal.a.ERA.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
    }
}
