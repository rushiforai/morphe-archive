package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes2.dex */
public final class lz0 extends cu0 {
    private static final lz0 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f6993c = 1;
    private String action_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        lz0 lz0Var = new lz0();
        DEFAULT_INSTANCE = lz0Var;
        cu0.a(lz0.class, lz0Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001Ȉ", new Object[]{"action_"});
        }
        if (iA == 3) {
            return new lz0();
        }
        if (iA != 4) {
            return null;
        }
        return new t(DEFAULT_INSTANCE);
    }
}
