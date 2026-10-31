package ads_mobile_sdk;

import b.ra;
import b.t2;

/* loaded from: classes2.dex */
public final class u53 extends cu0 {
    private static final u53 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f10205c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f10206d = 2;
    private boolean automaticRefresh_;
    private boolean staleResultAllowed_;

    static {
        u53 u53Var = new u53();
        DEFAULT_INSTANCE = u53Var;
        cu0.a(u53.class, u53Var);
    }

    public static ra o() {
        return (ra) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u0007\u0002\u0007", new Object[]{"automaticRefresh_", "staleResultAllowed_"});
        }
        if (iA == 3) {
            return new u53();
        }
        if (iA != 4) {
            return null;
        }
        return new ra(DEFAULT_INSTANCE);
    }
}
