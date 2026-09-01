package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class gm0 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[em0.values().length];
        try {
            iArr[em0.DROP_OLDEST.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[em0.IGNORE_NEWEST.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        a = iArr;
    }
}
