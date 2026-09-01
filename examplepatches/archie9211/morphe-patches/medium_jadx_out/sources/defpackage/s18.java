package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class s18 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[w7c.values().length];
        try {
            iArr[w7c.Hidden.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[w7c.PartiallyExpanded.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[w7c.Expanded.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
    }
}
