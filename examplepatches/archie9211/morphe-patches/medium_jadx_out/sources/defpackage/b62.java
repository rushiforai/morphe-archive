package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class b62 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[mpc.values().length];
        a = iArr;
        try {
            iArr[mpc.LEFT_TO_LEFT.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[mpc.LEFT_TO_RIGHT.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            a[mpc.RIGHT_TO_LEFT.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            a[mpc.RIGHT_TO_RIGHT.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            a[mpc.START_TO_START.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            a[mpc.START_TO_END.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            a[mpc.END_TO_START.ordinal()] = 7;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            a[mpc.END_TO_END.ordinal()] = 8;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            a[mpc.TOP_TO_TOP.ordinal()] = 9;
        } catch (NoSuchFieldError unused9) {
        }
        try {
            a[mpc.TOP_TO_BOTTOM.ordinal()] = 10;
        } catch (NoSuchFieldError unused10) {
        }
        try {
            a[mpc.TOP_TO_BASELINE.ordinal()] = 11;
        } catch (NoSuchFieldError unused11) {
        }
        try {
            a[mpc.BOTTOM_TO_TOP.ordinal()] = 12;
        } catch (NoSuchFieldError unused12) {
        }
        try {
            a[mpc.BOTTOM_TO_BOTTOM.ordinal()] = 13;
        } catch (NoSuchFieldError unused13) {
        }
        try {
            a[mpc.BOTTOM_TO_BASELINE.ordinal()] = 14;
        } catch (NoSuchFieldError unused14) {
        }
        try {
            a[mpc.BASELINE_TO_BOTTOM.ordinal()] = 15;
        } catch (NoSuchFieldError unused15) {
        }
        try {
            a[mpc.BASELINE_TO_TOP.ordinal()] = 16;
        } catch (NoSuchFieldError unused16) {
        }
        try {
            a[mpc.BASELINE_TO_BASELINE.ordinal()] = 17;
        } catch (NoSuchFieldError unused17) {
        }
        try {
            a[mpc.CIRCULAR_CONSTRAINT.ordinal()] = 18;
        } catch (NoSuchFieldError unused18) {
        }
        try {
            a[mpc.CENTER_HORIZONTALLY.ordinal()] = 19;
        } catch (NoSuchFieldError unused19) {
        }
        try {
            a[mpc.CENTER_VERTICALLY.ordinal()] = 20;
        } catch (NoSuchFieldError unused20) {
        }
    }
}
