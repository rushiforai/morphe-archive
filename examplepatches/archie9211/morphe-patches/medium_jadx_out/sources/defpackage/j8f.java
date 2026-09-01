package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class j8f {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;
    public static final /* synthetic */ int[] c;
    public static final /* synthetic */ int[] d;

    static {
        int[] iArr = new int[j7f.values().length];
        try {
            iArr[j7f.ENQUEUED.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[j7f.RUNNING.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[j7f.SUCCEEDED.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[j7f.FAILED.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[j7f.BLOCKED.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[j7f.CANCELLED.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        a = iArr;
        int[] iArr2 = new int[tm0.values().length];
        try {
            iArr2[tm0.EXPONENTIAL.ordinal()] = 1;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr2[tm0.LINEAR.ordinal()] = 2;
        } catch (NoSuchFieldError unused8) {
        }
        b = iArr2;
        int[] iArr3 = new int[te8.values().length];
        try {
            iArr3[te8.NOT_REQUIRED.ordinal()] = 1;
        } catch (NoSuchFieldError unused9) {
        }
        try {
            iArr3[te8.CONNECTED.ordinal()] = 2;
        } catch (NoSuchFieldError unused10) {
        }
        try {
            iArr3[te8.UNMETERED.ordinal()] = 3;
        } catch (NoSuchFieldError unused11) {
        }
        try {
            iArr3[te8.NOT_ROAMING.ordinal()] = 4;
        } catch (NoSuchFieldError unused12) {
        }
        try {
            iArr3[te8.METERED.ordinal()] = 5;
        } catch (NoSuchFieldError unused13) {
        }
        c = iArr3;
        int[] iArr4 = new int[lw8.values().length];
        try {
            iArr4[lw8.RUN_AS_NON_EXPEDITED_WORK_REQUEST.ordinal()] = 1;
        } catch (NoSuchFieldError unused14) {
        }
        try {
            iArr4[lw8.DROP_WORK_REQUEST.ordinal()] = 2;
        } catch (NoSuchFieldError unused15) {
        }
        d = iArr4;
    }
}
