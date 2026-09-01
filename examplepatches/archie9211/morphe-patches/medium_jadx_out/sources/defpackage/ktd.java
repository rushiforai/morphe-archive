package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class ktd {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[gn8.values().length];
        try {
            iArr[gn8.NO_OP.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[gn8.ADD.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[gn8.REMOVE.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
    }
}
