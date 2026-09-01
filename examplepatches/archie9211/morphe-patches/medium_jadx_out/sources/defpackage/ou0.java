package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class ou0 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[y7b.values().length];
        try {
            iArr[y7b.Faded.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[y7b.NotReposted.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[y7b.Reposted.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
    }
}
