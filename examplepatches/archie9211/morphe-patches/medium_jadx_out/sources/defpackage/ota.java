package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract /* synthetic */ class ota {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;
    public static final /* synthetic */ int[] c;
    public static final /* synthetic */ int[] d;
    public static final /* synthetic */ int[] e;
    public static final /* synthetic */ int[] f;
    public static final /* synthetic */ int[] g;

    static {
        int[] iArr = new int[w6a.values().length];
        try {
            iArr[w6a.IN.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[w6a.OUT.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[w6a.INV.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
        int[] iArr2 = new int[p6a.values().length];
        try {
            iArr2[p6a.IN.ordinal()] = 1;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr2[p6a.OUT.ordinal()] = 2;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr2[p6a.INV.ordinal()] = 3;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr2[p6a.STAR.ordinal()] = 4;
        } catch (NoSuchFieldError unused7) {
        }
        b = iArr2;
        int[] iArr3 = new int[d7a.values().length];
        try {
            iArr3[d7a.LANGUAGE_VERSION.ordinal()] = 1;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            iArr3[d7a.COMPILER_VERSION.ordinal()] = 2;
        } catch (NoSuchFieldError unused9) {
        }
        try {
            iArr3[d7a.API_VERSION.ordinal()] = 3;
        } catch (NoSuchFieldError unused10) {
        }
        c = iArr3;
        int[] iArr4 = new int[b83.values().length];
        try {
            iArr4[b83.WARNING.ordinal()] = 1;
        } catch (NoSuchFieldError unused11) {
        }
        try {
            iArr4[b83.ERROR.ordinal()] = 2;
        } catch (NoSuchFieldError unused12) {
        }
        try {
            iArr4[b83.HIDDEN.ordinal()] = 3;
        } catch (NoSuchFieldError unused13) {
        }
        d = iArr4;
        int[] iArr5 = new int[r5a.values().length];
        try {
            iArr5[r5a.RETURNS_CONSTANT.ordinal()] = 1;
        } catch (NoSuchFieldError unused14) {
        }
        try {
            iArr5[r5a.CALLS.ordinal()] = 2;
        } catch (NoSuchFieldError unused15) {
        }
        try {
            iArr5[r5a.RETURNS_NOT_NULL.ordinal()] = 3;
        } catch (NoSuchFieldError unused16) {
        }
        e = iArr5;
        int[] iArr6 = new int[s5a.values().length];
        try {
            iArr6[s5a.AT_MOST_ONCE.ordinal()] = 1;
        } catch (NoSuchFieldError unused17) {
        }
        try {
            iArr6[s5a.EXACTLY_ONCE.ordinal()] = 2;
        } catch (NoSuchFieldError unused18) {
        }
        try {
            iArr6[s5a.AT_LEAST_ONCE.ordinal()] = 3;
        } catch (NoSuchFieldError unused19) {
        }
        f = iArr6;
        int[] iArr7 = new int[x5a.values().length];
        try {
            iArr7[x5a.TRUE.ordinal()] = 1;
        } catch (NoSuchFieldError unused20) {
        }
        try {
            iArr7[x5a.FALSE.ordinal()] = 2;
        } catch (NoSuchFieldError unused21) {
        }
        try {
            iArr7[x5a.NULL.ordinal()] = 3;
        } catch (NoSuchFieldError unused22) {
        }
        g = iArr7;
    }
}
