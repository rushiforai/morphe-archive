package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class ljd {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[pi3.values().length];
        a = iArr;
        try {
            iArr[pi3.LEFT_ALIGN.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[pi3.RIGHT_ALIGN.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            a[pi3.CENTER.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
    }
}
