package ads_mobile_sdk;

import b.t2;

/* loaded from: classes.dex */
public final class iq1 extends cu0 {
    private static final iq1 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f4902c = 1;
    private String action_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        iq1 iq1Var = new iq1();
        DEFAULT_INSTANCE = iq1Var;
        cu0.a(iq1.class, iq1Var);
    }

    public static b.z3 o() {
        return (b.z3) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001Ȉ", new Object[]{"action_"});
        }
        if (iA == 3) {
            return new iq1();
        }
        if (iA != 4) {
            return null;
        }
        return new b.z3();
    }

    public final void b(String str) {
        this.action_ = str;
    }
}
