package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class j48 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[i48.values().length];
        try {
            iArr[i48.DefaultSpatial.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[i48.FastSpatial.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[i48.SlowSpatial.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[i48.DefaultEffects.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[i48.FastEffects.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[i48.SlowEffects.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        a = iArr;
    }
}
