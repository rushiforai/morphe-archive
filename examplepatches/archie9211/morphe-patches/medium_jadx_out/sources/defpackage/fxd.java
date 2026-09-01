package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract /* synthetic */ class fxd {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[hxd.values().length];
        a = iArr;
        try {
            iArr[hxd.OUT_IN_IN_POSITION.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[hxd.IN_IN_OUT_POSITION.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            a[hxd.NO_CONFLICT.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
    }
}
