package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract /* synthetic */ class sp {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[aw8.values().length];
        a = iArr;
        try {
            iArr[aw8.TRUE.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[aw8.FALSE.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            a[aw8.UNSET.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
    }
}
