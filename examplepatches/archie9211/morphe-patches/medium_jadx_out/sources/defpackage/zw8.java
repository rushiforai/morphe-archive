package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract /* synthetic */ class zw8 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;
    public static final /* synthetic */ int[] c;

    static {
        int[] iArr = new int[c28.values().length];
        c = iArr;
        try {
            iArr[c28.FINAL.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            c[c28.SEALED.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            c[c28.OPEN.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            c[c28.ABSTRACT.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        int[] iArr2 = new int[ax8.values().length];
        b = iArr2;
        try {
            iArr2[ax8.OVERRIDABLE.ordinal()] = 1;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            b[ax8.CONFLICT.ordinal()] = 2;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            b[ax8.INCOMPATIBLE.ordinal()] = 3;
        } catch (NoSuchFieldError unused7) {
        }
        int[] iArr3 = new int[x74.values().length];
        a = iArr3;
        try {
            iArr3[x74.OVERRIDABLE.ordinal()] = 1;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            a[x74.INCOMPATIBLE.ordinal()] = 2;
        } catch (NoSuchFieldError unused9) {
        }
        try {
            a[x74.UNKNOWN.ordinal()] = 3;
        } catch (NoSuchFieldError unused10) {
        }
    }
}
