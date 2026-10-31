package ads_mobile_sdk;

import b.e9;
import b.l9;
import b.t2;

/* loaded from: classes2.dex */
public final class rp3 extends cu0 {
    private static final rp3 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f9278c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f9279d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f9280e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f9281f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f9282g = 5;
    private e9 blockedStartupLocations_;
    private long maxTimePerTaskInUiThreadMs_;
    private e9 nonUiThreadBlockingStartupLocations_;
    private long totalTimeInUiThreadMs_;
    private e9 uiThreadBlockingStartupLocations_;

    static {
        rp3 rp3Var = new rp3();
        DEFAULT_INSTANCE = rp3Var;
        cu0.a(rp3.class, rp3Var);
    }

    public rp3() {
        in2 in2Var = in2.f4887e;
        this.blockedStartupLocations_ = in2Var;
        this.nonUiThreadBlockingStartupLocations_ = in2Var;
        this.uiThreadBlockingStartupLocations_ = in2Var;
    }

    public static l9 o() {
        return (l9) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0005\u0000\u0000\u0001\u0005\u0005\u0000\u0003\u0000\u0001\u0002\u0002\u0002\u0003Ț\u0004Ț\u0005Ț", new Object[]{"totalTimeInUiThreadMs_", "maxTimePerTaskInUiThreadMs_", "blockedStartupLocations_", "nonUiThreadBlockingStartupLocations_", "uiThreadBlockingStartupLocations_"});
        }
        if (iA == 3) {
            return new rp3();
        }
        if (iA != 4) {
            return null;
        }
        return new l9(DEFAULT_INSTANCE);
    }
}
