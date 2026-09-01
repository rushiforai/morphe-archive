package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class ry3 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[e28.values().length];
        a = iArr;
        try {
            iArr[e28.NUMERIC.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[e28.ALPHANUMERIC.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            a[e28.BYTE.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            a[e28.KANJI.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
    }
}
