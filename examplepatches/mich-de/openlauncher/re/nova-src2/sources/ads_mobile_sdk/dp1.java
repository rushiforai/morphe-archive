package ads_mobile_sdk;

import b.e9;
import b.t2;
import b.w0;

/* loaded from: classes.dex */
public final class dp1 extends cu0 {
    private static final dp1 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f2582c = 1;
    private e9 adNetworkInfo_ = in2.f4887e;

    static {
        dp1 dp1Var = new dp1();
        DEFAULT_INSTANCE = dp1Var;
        cu0.a(dp1.class, dp1Var);
    }

    public static dp1 p() {
        return DEFAULT_INSTANCE;
    }

    public static w0 q() {
        return (w0) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001b", new Object[]{"adNetworkInfo_", yn1.class});
        }
        if (iA == 3) {
            return new dp1();
        }
        if (iA != 4) {
            return null;
        }
        return new w0(DEFAULT_INSTANCE);
    }

    public final e9 o() {
        return this.adNetworkInfo_;
    }
}
