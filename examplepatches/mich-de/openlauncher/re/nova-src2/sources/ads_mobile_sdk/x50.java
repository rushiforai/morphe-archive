package ads_mobile_sdk;

import b.d;
import b.t2;

/* loaded from: classes.dex */
public final class x50 extends cu0 {
    private static final x50 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f11575c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f11576d = 2;
    private int bitField0_;
    private String regionCode_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private sq userId_ = sq.f9634b;

    static {
        x50 x50Var = new x50();
        DEFAULT_INSTANCE = x50Var;
        cu0.a(x50.class, x50Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဈ\u0000\u0002ည\u0001", new Object[]{"bitField0_", "regionCode_", "userId_"});
        }
        if (iA == 3) {
            return new x50();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }
}
