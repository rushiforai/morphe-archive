package ads_mobile_sdk;

import b.t2;

/* loaded from: classes.dex */
public final class vw1 extends cu0 {
    private static final vw1 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f10936c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f10937d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f10938e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f10939f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f10940g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f10941h = 6;

    /* renamed from: i, reason: collision with root package name */
    public static final int f10942i = 7;

    /* renamed from: j, reason: collision with root package name */
    public static final int f10943j = 8;

    /* renamed from: k, reason: collision with root package name */
    public static final int f10944k = 9;
    private int bitField0_;
    private boolean disableImageLoading_;
    private boolean isBannerAllowed_;
    private boolean isNativeAllowed_;
    private boolean multipleImages_;
    private String nativeMediaOrientation_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private int preferredAdChoicesPosition_;
    private xw1 sdkCustomClickGesture_;
    private boolean useCustomMute_;
    private zw1 videoOptions_;

    static {
        vw1 vw1Var = new vw1();
        DEFAULT_INSTANCE = vw1Var;
        cu0.a(vw1.class, vw1Var);
    }

    public static b.rb o() {
        return (b.rb) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\t\u0000\u0001\u0001\t\t\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဇ\u0001\u0003ဇ\u0002\u0004င\u0003\u0005ဇ\u0004\u0006ဈ\u0005\u0007ဇ\u0006\bဇ\u0007\tဉ\b", new Object[]{"bitField0_", "videoOptions_", "multipleImages_", "useCustomMute_", "preferredAdChoicesPosition_", "disableImageLoading_", "nativeMediaOrientation_", "isBannerAllowed_", "isNativeAllowed_", "sdkCustomClickGesture_"});
        }
        if (iA == 3) {
            return new vw1();
        }
        if (iA != 4) {
            return null;
        }
        return new b.rb(DEFAULT_INSTANCE);
    }

    public final void b(String str) {
        this.bitField0_ |= 32;
        this.nativeMediaOrientation_ = str;
    }

    public final void a(xw1 xw1Var) {
        this.sdkCustomClickGesture_ = xw1Var;
        this.bitField0_ |= 256;
    }

    public final void a(zw1 zw1Var) {
        this.videoOptions_ = zw1Var;
        this.bitField0_ |= 1;
    }
}
