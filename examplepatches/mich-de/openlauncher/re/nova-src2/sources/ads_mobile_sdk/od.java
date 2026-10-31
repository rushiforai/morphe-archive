package ads_mobile_sdk;

import b.t2;

/* loaded from: classes.dex */
public final class od extends cu0 {
    private static final od DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f7833c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f7834d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f7835e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f7836f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f7837g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f7838h = 6;

    /* renamed from: i, reason: collision with root package name */
    public static final int f7839i = 7;

    /* renamed from: j, reason: collision with root package name */
    public static final int f7840j = 8;
    private int bitField0_;
    private long percentAdOnScreen_ = -1;
    private long percentScreenCoveredByAd_ = -1;
    private long minAlphaSignal_ = -1;
    private long viewHeight_ = -1;
    private long viewWidth_ = -1;
    private long displayDensity_ = -1;
    private long estimatedOccludedSurface_ = -1;
    private long scaleFactor_ = -1;

    static {
        od odVar = new od();
        DEFAULT_INSTANCE = odVar;
        cu0.a(od.class, odVar);
    }

    public static b.v6 o() {
        return (b.v6) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\b\u0000\u0001\u0001\b\b\u0000\u0000\u0000\u0001ဂ\u0000\u0002ဂ\u0001\u0003ဂ\u0002\u0004ဂ\u0003\u0005ဂ\u0004\u0006ဂ\u0005\u0007ဂ\u0006\bဂ\u0007", new Object[]{"bitField0_", "percentAdOnScreen_", "percentScreenCoveredByAd_", "minAlphaSignal_", "viewHeight_", "viewWidth_", "displayDensity_", "estimatedOccludedSurface_", "scaleFactor_"});
        }
        if (iA == 3) {
            return new od();
        }
        if (iA != 4) {
            return null;
        }
        return new b.v6(DEFAULT_INSTANCE);
    }
}
