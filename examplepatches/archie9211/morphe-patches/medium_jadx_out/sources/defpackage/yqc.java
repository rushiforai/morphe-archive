package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract /* synthetic */ class yqc {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[xqc.values().length];
        try {
            iArr[xqc.PUBLISHED_AT_ASC.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[xqc.PUBLISHED_AT_DESC.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[xqc.READ_COUNT_ASC.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[xqc.READ_COUNT_DESC.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[xqc.VIEW_COUNT_ASC.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[xqc.VIEW_COUNT_DESC.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr[xqc.LIFETIME_EARNINGS_ASC.ordinal()] = 7;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr[xqc.LIFETIME_EARNINGS_DESC.ordinal()] = 8;
        } catch (NoSuchFieldError unused8) {
        }
        a = iArr;
    }
}
