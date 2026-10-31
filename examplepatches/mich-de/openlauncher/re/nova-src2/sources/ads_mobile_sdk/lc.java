package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes.dex */
public final class lc extends cu0 {
    private static final lc DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f6142c = 1;
    private int bitField0_;
    private int function_;

    static {
        lc lcVar = new lc();
        DEFAULT_INSTANCE = lcVar;
        cu0.a(lc.class, lcVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001᠌\u0000", new Object[]{"bitField0_", "function_", ad.a$17});
        }
        if (iA == 3) {
            return new lc();
        }
        if (iA != 4) {
            return null;
        }
        return new t(12);
    }
}
