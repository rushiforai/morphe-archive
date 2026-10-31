package ads_mobile_sdk;

import b.k0;
import b.t2;
import com.bytedance.sdk.openadsdk.TTAdConstant;

/* loaded from: classes2.dex */
public final class cn2 extends cu0 {
    private static final cn2 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f1951c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f1952d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f1953e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f1954f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f1955g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f1956h = 6;

    /* renamed from: i, reason: collision with root package name */
    public static final int f1957i = 7;

    /* renamed from: j, reason: collision with root package name */
    public static final int f1958j = 8;

    /* renamed from: k, reason: collision with root package name */
    public static final int f1959k = 9;

    /* renamed from: l, reason: collision with root package name */
    public static final int f1960l = 10;
    private long appStartProgramUpdateDelayMs_;
    private int bitField0_;
    private boolean enableRetryDownload_;
    private boolean reinitializeAfterUpdate_;
    private boolean updateBeforeInitialization_;
    private boolean updateOnInitializationOnly_ = true;
    private long minUpdateIntervalMs_ = TTAdConstant.AD_MAX_EVENT_TIME;
    private long programAlmostExpiredMs_ = 3600000;
    private String programRequestUrl_ = "https://pagead2.googlesyndication.com/mads/asp";
    private long maxRetryCount_ = 5;
    private long retryBaseIntervalMs_ = 60000;

    static {
        cn2 cn2Var = new cn2();
        DEFAULT_INSTANCE = cn2Var;
        cu0.a(cn2.class, cn2Var);
    }

    public static cn2 p() {
        return DEFAULT_INSTANCE;
    }

    public static k0 w() {
        return (k0) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\n\u0000\u0001\u0001\n\n\u0000\u0000\u0000\u0001ဇ\u0000\u0002ဇ\u0001\u0003ဇ\u0002\u0004ဂ\u0003\u0005ဂ\u0004\u0006ဈ\u0005\u0007ဂ\u0006\bဇ\u0007\tဂ\b\nဂ\t", new Object[]{"bitField0_", "updateOnInitializationOnly_", "reinitializeAfterUpdate_", "updateBeforeInitialization_", "minUpdateIntervalMs_", "programAlmostExpiredMs_", "programRequestUrl_", "appStartProgramUpdateDelayMs_", "enableRetryDownload_", "maxRetryCount_", "retryBaseIntervalMs_"});
        }
        if (iA == 3) {
            return new cn2();
        }
        if (iA != 4) {
            return null;
        }
        return new k0(DEFAULT_INSTANCE);
    }

    public final boolean q() {
        return this.enableRetryDownload_;
    }

    public final long r() {
        return this.maxRetryCount_;
    }

    public final long s() {
        return this.programAlmostExpiredMs_;
    }

    public final String t() {
        return this.programRequestUrl_;
    }

    public final long u() {
        return this.retryBaseIntervalMs_;
    }

    public final boolean v() {
        return this.updateBeforeInitialization_;
    }

    public final void b(String str) {
        this.bitField0_ |= 32;
        this.programRequestUrl_ = str;
    }

    public final long o() {
        return this.appStartProgramUpdateDelayMs_;
    }
}
