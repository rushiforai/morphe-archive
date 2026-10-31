package ads_mobile_sdk;

import b.s9;
import b.t2;

/* loaded from: classes.dex */
public final class te2 extends cu0 {
    private static final te2 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f9905c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f9906d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f9907e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f9908f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f9909g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f9910h = 6;
    private int bitField0_;
    private boolean cacheHit_;
    private int cacheMissReason_;
    private boolean isFromPreviousSession_;
    private int numAdsInCachedResponse_;
    private int numRequestedAds_;
    private long timeInCacheMs_;

    static {
        te2 te2Var = new te2();
        DEFAULT_INSTANCE = te2Var;
        cu0.a(te2.class, te2Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0000\u0000\u0001ဇ\u0000\u0002ဇ\u0001\u0003ဌ\u0002\u0004င\u0003\u0005င\u0004\u0006ဂ\u0005", new Object[]{"bitField0_", "cacheHit_", "isFromPreviousSession_", "cacheMissReason_", "numRequestedAds_", "numAdsInCachedResponse_", "timeInCacheMs_"});
        }
        if (iA == 3) {
            return new te2();
        }
        if (iA != 4) {
            return null;
        }
        return new s9(DEFAULT_INSTANCE);
    }

    public static s9 o() {
        return (s9) DEFAULT_INSTANCE.e();
    }
}
