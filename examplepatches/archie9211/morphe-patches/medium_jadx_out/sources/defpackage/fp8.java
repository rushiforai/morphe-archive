package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class fp8 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[gp8.values().length];
        a = iArr;
        try {
            iArr[gp8.DIRECT.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[gp8.SAVE_LAYER.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            a[gp8.BITMAP.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            a[gp8.RENDER_NODE.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
    }
}
