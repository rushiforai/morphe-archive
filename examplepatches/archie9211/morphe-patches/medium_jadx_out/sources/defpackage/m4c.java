package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class m4c {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[o4c.values().length];
        b = iArr;
        try {
            iArr[o4c.BEVEL.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            b[o4c.MITER.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            b[o4c.ROUND.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        int[] iArr2 = new int[n4c.values().length];
        a = iArr2;
        try {
            iArr2[n4c.BUTT.ordinal()] = 1;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            a[n4c.ROUND.ordinal()] = 2;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            a[n4c.UNKNOWN.ordinal()] = 3;
        } catch (NoSuchFieldError unused6) {
        }
    }
}
