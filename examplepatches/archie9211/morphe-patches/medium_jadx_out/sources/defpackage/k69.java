package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class k69 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[n69.values().length];
        try {
            iArr[n69.InitialPending.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[n69.RecomposePending.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[n69.Recomposing.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[n69.ApplyPending.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[n69.Applied.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[n69.Cancelled.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr[n69.Invalid.ordinal()] = 7;
        } catch (NoSuchFieldError unused7) {
        }
        a = iArr;
    }
}
