package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class hvd {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[jd6.values().length];
        a = iArr;
        try {
            iArr[jd6.NUMBER.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[jd6.STRING.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            a[jd6.BOOLEAN.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
    }
}
