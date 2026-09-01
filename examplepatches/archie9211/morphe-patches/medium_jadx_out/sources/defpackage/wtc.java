package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract /* synthetic */ class wtc {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[g9f.values().length];
        try {
            iArr[g9f.LIST.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[g9f.MAP.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[g9f.POLY_OBJ.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
    }
}
