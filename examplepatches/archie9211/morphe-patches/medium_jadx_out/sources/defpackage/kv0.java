package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class kv0 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[lv0.values().length];
        try {
            iArr[lv0.YOUR_FOLLOWING_FEED.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[lv0.HOME.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[lv0.EXPLORE.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[lv0.YOUR_LIBRARY.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[lv0.YOUR_PROFILE.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        a = iArr;
    }
}
