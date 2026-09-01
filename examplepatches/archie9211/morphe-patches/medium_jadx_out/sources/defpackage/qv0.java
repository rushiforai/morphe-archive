package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class qv0 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[zw7.values().length];
        try {
            iArr[zw7.REGULAR.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[zw7.PREMIUM.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[zw7.NOT_A_MEMBER.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
        int[] iArr2 = new int[lv0.values().length];
        try {
            iArr2[lv0.YOUR_FOLLOWING_FEED.ordinal()] = 1;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr2[lv0.HOME.ordinal()] = 2;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr2[lv0.EXPLORE.ordinal()] = 3;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr2[lv0.YOUR_LIBRARY.ordinal()] = 4;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr2[lv0.YOUR_PROFILE.ordinal()] = 5;
        } catch (NoSuchFieldError unused8) {
        }
        b = iArr2;
    }
}
