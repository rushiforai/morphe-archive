package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class d83 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[q76.values().length];
        try {
            iArr[q76.LookaheadMeasurement.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[q76.LookaheadPlacement.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[q76.Measurement.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[q76.Placement.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        a = iArr;
    }
}
