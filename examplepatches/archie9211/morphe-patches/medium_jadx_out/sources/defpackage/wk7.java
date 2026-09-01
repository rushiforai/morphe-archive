package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class wk7 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[wp6.values().length];
        try {
            iArr[wp6.Measuring.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[wp6.LayingOut.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        a = iArr;
        int[] iArr2 = new int[yp6.values().length];
        try {
            iArr2[yp6.InMeasureBlock.ordinal()] = 1;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr2[yp6.InLayoutBlock.ordinal()] = 2;
        } catch (NoSuchFieldError unused4) {
        }
        b = iArr2;
    }
}
