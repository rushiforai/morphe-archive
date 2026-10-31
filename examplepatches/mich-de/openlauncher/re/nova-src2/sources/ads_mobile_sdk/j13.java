package ads_mobile_sdk;

import b.d;
import b.e9;
import b.t2;

/* loaded from: classes.dex */
public final class j13 extends cu0 {
    private static final j13 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f5098c = 1;
    private e9 evictions_ = in2.f4887e;

    static {
        j13 j13Var = new j13();
        DEFAULT_INSTANCE = j13Var;
        cu0.a(j13.class, j13Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001b", new Object[]{"evictions_", h13.class});
        }
        if (iA == 3) {
            return new j13();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }
}
