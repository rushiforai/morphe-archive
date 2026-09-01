package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class vh8 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[yd4.values().length];
        try {
            iArr[yd4.CacheOnly.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[yd4.NetworkOnly.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[yd4.CacheFirst.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[yd4.NetworkFirst.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[yd4.CacheAndNetwork.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        a = iArr;
    }
}
