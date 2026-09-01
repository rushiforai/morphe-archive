package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class g4 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[h4.values().length];
        try {
            iArr[h4.INSTAGRAM_APPLICATION_WEB.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[h4.INSTAGRAM_CUSTOM_CHROME_TAB.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[h4.INSTAGRAM_WEB_VIEW.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
    }
}
