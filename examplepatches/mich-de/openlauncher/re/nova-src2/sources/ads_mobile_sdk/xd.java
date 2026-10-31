package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes2.dex */
public final class xd extends cu0 {
    private static final xd DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f11672c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f11673d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f11674e = 3;
    private int bitField0_;
    private long lifecycle_;
    private long outcome_;
    private long signal_;

    static {
        xd xdVar = new xd();
        DEFAULT_INSTANCE = xdVar;
        cu0.a(xd.class, xdVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဂ\u0000\u0002ဂ\u0001\u0003ဂ\u0002", new Object[]{"bitField0_", "signal_", "outcome_", "lifecycle_"});
        }
        if (iA == 3) {
            return new xd();
        }
        if (iA != 4) {
            return null;
        }
        return new t(DEFAULT_INSTANCE);
    }
}
