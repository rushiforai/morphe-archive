package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract /* synthetic */ class o7a {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[b6a.values().length];
        try {
            iArr[b6a.DECLARATION.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[b6a.FAKE_OVERRIDE.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[b6a.DELEGATION.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[b6a.SYNTHESIZED.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        a = iArr;
        int[] iArr2 = new int[e41.values().length];
        try {
            iArr2[e41.DECLARATION.ordinal()] = 1;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr2[e41.FAKE_OVERRIDE.ordinal()] = 2;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr2[e41.DELEGATION.ordinal()] = 3;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr2[e41.SYNTHESIZED.ordinal()] = 4;
        } catch (NoSuchFieldError unused8) {
        }
        int[] iArr3 = new int[g7a.values().length];
        try {
            iArr3[g7a.INTERNAL.ordinal()] = 1;
        } catch (NoSuchFieldError unused9) {
        }
        try {
            iArr3[g7a.PRIVATE.ordinal()] = 2;
        } catch (NoSuchFieldError unused10) {
        }
        try {
            iArr3[g7a.PRIVATE_TO_THIS.ordinal()] = 3;
        } catch (NoSuchFieldError unused11) {
        }
        try {
            iArr3[g7a.PROTECTED.ordinal()] = 4;
        } catch (NoSuchFieldError unused12) {
        }
        try {
            iArr3[g7a.PUBLIC.ordinal()] = 5;
        } catch (NoSuchFieldError unused13) {
        }
        try {
            iArr3[g7a.LOCAL.ordinal()] = 6;
        } catch (NoSuchFieldError unused14) {
        }
        b = iArr3;
    }
}
