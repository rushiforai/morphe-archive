package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class pgg {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[zrg.values().length];
        b = iArr;
        try {
            iArr[zrg.SYMMETRIC.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            b[zrg.ASYMMETRIC_PRIVATE.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        int[] iArr2 = new int[ntg.values().length];
        a = iArr2;
        try {
            iArr2[ntg.TINK.ordinal()] = 1;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            a[ntg.zzc.ordinal()] = 2;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            a[ntg.RAW.ordinal()] = 3;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            a[ntg.CRUNCHY.ordinal()] = 4;
        } catch (NoSuchFieldError unused6) {
        }
    }
}
