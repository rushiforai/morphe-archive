package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes2.dex */
public final class xn3 extends cu0 {
    private static final xn3 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f11785c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f11786d = 2;
    private int bitField0_;
    private int protocolNumber_;
    private int variant_;

    static {
        xn3 xn3Var = new xn3();
        DEFAULT_INSTANCE = xn3Var;
        cu0.a(xn3.class, xn3Var);
    }

    public static xn3 o() {
        return DEFAULT_INSTANCE;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001င\u0000\u0002င\u0001", new Object[]{"bitField0_", "protocolNumber_", "variant_"});
        }
        if (iA == 3) {
            return new xn3();
        }
        if (iA != 4) {
            return null;
        }
        return new t(DEFAULT_INSTANCE);
    }

    public final int p() {
        return this.protocolNumber_;
    }

    public final int q() {
        return this.variant_;
    }
}
