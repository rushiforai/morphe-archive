package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract /* synthetic */ class wm8 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[um0.values().length];
        a = iArr;
        try {
            iArr[um0.DROP.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[um0.LATEST.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            a[um0.MISSING.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            a[um0.ERROR.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
    }
}
