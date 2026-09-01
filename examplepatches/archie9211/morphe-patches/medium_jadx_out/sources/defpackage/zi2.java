package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract /* synthetic */ class zi2 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;
    public static final /* synthetic */ int[] c;
    public static final /* synthetic */ int[] d;

    static {
        int[] iArr = new int[ti2.values().length];
        d = iArr;
        try {
            iArr[ti2.CRONET_SOURCE_STATICALLY_LINKED.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            d[ti2.CRONET_SOURCE_PLAY_SERVICES.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            d[ti2.CRONET_SOURCE_FALLBACK.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            d[ti2.CRONET_SOURCE_PLATFORM.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            d[ti2.CRONET_SOURCE_UNSPECIFIED.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        int[] iArr2 = new int[vi2.values().length];
        c = iArr2;
        try {
            iArr2[vi2.SUCCEEDED.ordinal()] = 1;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            c[vi2.ERROR.ordinal()] = 2;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            c[vi2.CANCELLED.ordinal()] = 3;
        } catch (NoSuchFieldError unused8) {
        }
        int[] iArr3 = new int[ri2.values().length];
        b = iArr3;
        try {
            iArr3[ri2.API.ordinal()] = 1;
        } catch (NoSuchFieldError unused9) {
        }
        try {
            b[ri2.IMPL.ordinal()] = 2;
        } catch (NoSuchFieldError unused10) {
        }
        int[] iArr4 = new int[ui2.values().length];
        a = iArr4;
        try {
            iArr4[ui2.NETWORK.ordinal()] = 1;
        } catch (NoSuchFieldError unused11) {
        }
        try {
            a[ui2.OTHER.ordinal()] = 2;
        } catch (NoSuchFieldError unused12) {
        }
    }
}
