package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class h82 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[hw8.values().length];
        try {
            iArr[hw8.Vertical.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[hw8.Horizontal.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        a = iArr;
    }
}
