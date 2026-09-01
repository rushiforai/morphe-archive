package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class vd6 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[ed6.values().length];
        a = iArr;
        try {
            iArr[ed6.NUMBER.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[ed6.BEGIN_ARRAY.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            a[ed6.BEGIN_OBJECT.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
    }
}
