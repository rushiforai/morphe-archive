package ads_mobile_sdk;

import b.t2;
import java.util.Objects;

/* loaded from: classes.dex */
public final class ri2 extends cu0 {
    private static final ri2 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f9194c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f9195d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f9196e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f9197f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f9198g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f9199h = 6;
    private boolean cacheHit_;
    private int maxBufferSize_;
    private int numPreloadedAds_;
    private boolean preloadInFlight_;
    private String preloadId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String evictedAdId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        ri2 ri2Var = new ri2();
        DEFAULT_INSTANCE = ri2Var;
        cu0.a(ri2.class, ri2Var);
    }

    public static b.i9 o() {
        return (b.i9) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0006\u0000\u0000\u0001\u0006\u0006\u0000\u0000\u0000\u0001Ȉ\u0002\u0004\u0003\u0004\u0004\u0007\u0005Ȉ\u0006\u0007", new Object[]{"preloadId_", "maxBufferSize_", "numPreloadedAds_", "cacheHit_", "evictedAdId_", "preloadInFlight_"});
        }
        if (iA == 3) {
            return new ri2();
        }
        if (iA != 4) {
            return null;
        }
        return new b.i9();
    }

    public final void b(String str) {
        this.evictedAdId_ = str;
    }

    public final void c(String str) {
        Objects.requireNonNull(str);
        this.preloadId_ = str;
    }
}
