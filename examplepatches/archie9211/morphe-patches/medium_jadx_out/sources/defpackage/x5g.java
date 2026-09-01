package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class x5g {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[iqg.values().length];
        b = iArr;
        try {
            iArr[iqg.SHA1.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            b[iqg.SHA224.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            b[iqg.SHA256.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            b[iqg.SHA384.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            b[iqg.SHA512.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        int[] iArr2 = new int[ntg.values().length];
        a = iArr2;
        try {
            iArr2[ntg.TINK.ordinal()] = 1;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            a[ntg.CRUNCHY.ordinal()] = 2;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            a[ntg.zzc.ordinal()] = 3;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            a[ntg.RAW.ordinal()] = 4;
        } catch (NoSuchFieldError unused9) {
        }
    }
}
