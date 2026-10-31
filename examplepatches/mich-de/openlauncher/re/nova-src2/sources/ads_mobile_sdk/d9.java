package ads_mobile_sdk;

import b.e9;
import b.q0;
import b.t2;

/* loaded from: classes.dex */
public final class d9 extends cu0 {
    private static final d9 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f2214c = 1;
    private e9 adUnitPatterns_ = in2.f4887e;

    static {
        d9 d9Var = new d9();
        DEFAULT_INSTANCE = d9Var;
        cu0.a(d9.class, d9Var);
    }

    public static d9 p() {
        return DEFAULT_INSTANCE;
    }

    public static q0 q() {
        return (q0) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001b", new Object[]{"adUnitPatterns_", z8.class});
        }
        if (iA == 3) {
            return new d9();
        }
        if (iA != 4) {
            return null;
        }
        return new q0(DEFAULT_INSTANCE);
    }

    public final e9 o() {
        return this.adUnitPatterns_;
    }
}
