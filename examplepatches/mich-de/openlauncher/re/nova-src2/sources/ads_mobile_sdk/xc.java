package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes2.dex */
public final class xc extends cu0 {
    private static final xc DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f11667c = 1;
    private int bitField0_;
    private long keypressDurationNs_ = -1;

    static {
        xc xcVar = new xc();
        DEFAULT_INSTANCE = xcVar;
        cu0.a(xc.class, xcVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဂ\u0000", new Object[]{"bitField0_", "keypressDurationNs_"});
        }
        if (iA == 3) {
            return new xc();
        }
        if (iA != 4) {
            return null;
        }
        return new t(DEFAULT_INSTANCE);
    }
}
