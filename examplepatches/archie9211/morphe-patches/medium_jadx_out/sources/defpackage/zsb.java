package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class zsb {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[e66.values().length];
        try {
            iArr[e66.USER.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[e66.MAINTAINER.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[e66.TELEMETRY.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
        try {
            new int[ggd.values().length][ggd.MethodCalled.ordinal()] = 1;
        } catch (NoSuchFieldError unused4) {
        }
        int[] iArr2 = new int[d66.values().length];
        try {
            iArr2[d66.VERBOSE.ordinal()] = 1;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr2[d66.DEBUG.ordinal()] = 2;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr2[d66.INFO.ordinal()] = 3;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr2[d66.WARN.ordinal()] = 4;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            iArr2[d66.ERROR.ordinal()] = 5;
        } catch (NoSuchFieldError unused9) {
        }
        b = iArr2;
    }
}
