package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract /* synthetic */ class a15 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[tpc.values().length];
        try {
            iArr[tpc.BEGINNING.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[tpc.AFTER_DOT.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[tpc.MIDDLE.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
    }
}
