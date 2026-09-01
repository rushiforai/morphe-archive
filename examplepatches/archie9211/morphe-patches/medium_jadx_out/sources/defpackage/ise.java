package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract /* synthetic */ class ise {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[c7a.values().length];
        try {
            iArr[c7a.WARNING.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[c7a.ERROR.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[c7a.HIDDEN.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
    }
}
