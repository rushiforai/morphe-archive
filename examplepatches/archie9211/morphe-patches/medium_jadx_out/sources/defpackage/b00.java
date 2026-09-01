package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class b00 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[f00.values().length];
        try {
            iArr[f00.BeforeCache.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[f00.BeforeAutoPersistedQueries.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[f00.BeforeRetryOnError.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[f00.BeforeNetwork.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        a = iArr;
    }
}
