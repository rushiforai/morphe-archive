package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class tda {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[qvc.values().length];
        try {
            iArr[qvc.ACCEPTED.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[qvc.CHANGES_REQUESTED.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[qvc.OPEN.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[qvc.CHANGES_MADE.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[qvc.IN_REVIEW.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[qvc.TRIAGE.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        a = iArr;
        int[] iArr2 = new int[eea.values().length];
        try {
            iArr2[eea.PUBLIC.ordinal()] = 1;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr2[eea.UNLISTED.ordinal()] = 2;
        } catch (NoSuchFieldError unused8) {
        }
        b = iArr2;
    }
}
