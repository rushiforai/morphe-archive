package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class x6d {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[te8.values().length];
        a = iArr;
        try {
            iArr[te8.NOT_REQUIRED.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[te8.CONNECTED.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            a[te8.UNMETERED.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            a[te8.NOT_ROAMING.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            a[te8.METERED.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
    }
}
