package ads_mobile_sdk;

import b.hc;
import b.t2;

/* loaded from: classes.dex */
public final class xw1 extends cu0 {
    private static final xw1 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f11868c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f11869d = 2;
    private int bitField0_;
    private int sccgDir_;
    private boolean sccgTap_;

    static {
        xw1 xw1Var = new xw1();
        DEFAULT_INSTANCE = xw1Var;
        cu0.a(xw1.class, xw1Var);
    }

    public static hc o() {
        return (hc) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001င\u0000\u0002ဇ\u0001", new Object[]{"bitField0_", "sccgDir_", "sccgTap_"});
        }
        if (iA == 3) {
            return new xw1();
        }
        if (iA != 4) {
            return null;
        }
        return new hc();
    }
}
