package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class d35 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[c35.values().length];
        try {
            iArr[c35.ON_CONFIGURE.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[c35.ON_CREATE.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[c35.ON_UPGRADE.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[c35.ON_DOWNGRADE.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[c35.ON_OPEN.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        a = iArr;
    }
}
