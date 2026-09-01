package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class a50 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;
    public static final /* synthetic */ int[] c;

    static {
        int[] iArr = new int[z40.values().length];
        try {
            iArr[z40.ARRAY.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[z40.BOOL.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[z40.INT.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
        int[] iArr2 = new int[v92.values().length];
        try {
            iArr2[v92.APP_DATA.ordinal()] = 1;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr2[v92.USER_DATA.ordinal()] = 2;
        } catch (NoSuchFieldError unused5) {
        }
        b = iArr2;
        int[] iArr3 = new int[o40.values().length];
        try {
            iArr3[o40.MOBILE_APP_INSTALL.ordinal()] = 1;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr3[o40.CUSTOM.ordinal()] = 2;
        } catch (NoSuchFieldError unused7) {
        }
        c = iArr3;
    }
}
