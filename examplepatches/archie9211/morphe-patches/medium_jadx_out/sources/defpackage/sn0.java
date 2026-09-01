package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class sn0 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[zi7.values().length];
        b = iArr;
        try {
            iArr[zi7.MASK_MODE_NONE.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            b[zi7.MASK_MODE_SUBTRACT.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            b[zi7.MASK_MODE_INTERSECT.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            b[zi7.MASK_MODE_ADD.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        int[] iArr2 = new int[uo6.values().length];
        a = iArr2;
        try {
            iArr2[uo6.SHAPE.ordinal()] = 1;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            a[uo6.PRE_COMP.ordinal()] = 2;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            a[uo6.SOLID.ordinal()] = 3;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            a[uo6.IMAGE.ordinal()] = 4;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            a[uo6.NULL.ordinal()] = 5;
        } catch (NoSuchFieldError unused9) {
        }
        try {
            a[uo6.TEXT.ordinal()] = 6;
        } catch (NoSuchFieldError unused10) {
        }
        try {
            a[uo6.UNKNOWN.ordinal()] = 7;
        } catch (NoSuchFieldError unused11) {
        }
    }
}
