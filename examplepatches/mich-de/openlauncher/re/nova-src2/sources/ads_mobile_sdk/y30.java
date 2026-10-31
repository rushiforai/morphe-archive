package ads_mobile_sdk;

import b.t2;
import b.uc;

/* loaded from: classes.dex */
public final class y30 extends cu0 {
    private static final y30 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f11938c = 1;
    private int bitField0_;
    private sq sha256_ = sq.f9634b;

    static {
        y30 y30Var = new y30();
        DEFAULT_INSTANCE = y30Var;
        cu0.a(y30.class, y30Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ည\u0000", new Object[]{"bitField0_", "sha256_"});
        }
        if (iA == 3) {
            return new y30();
        }
        if (iA != 4) {
            return null;
        }
        return new uc(DEFAULT_INSTANCE);
    }
}
