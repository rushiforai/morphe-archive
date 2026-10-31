package ads_mobile_sdk;

import b.t2;

/* loaded from: classes2.dex */
public final class i42 extends cu0 {
    private static final i42 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f4630c = 1;
    private boolean deviceOnline_;

    static {
        i42 i42Var = new i42();
        DEFAULT_INSTANCE = i42Var;
        cu0.a(i42.class, i42Var);
    }

    public static b.t3 o() {
        return (b.t3) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\u0007", new Object[]{"deviceOnline_"});
        }
        if (iA == 3) {
            return new i42();
        }
        if (iA != 4) {
            return null;
        }
        return new b.t3(DEFAULT_INSTANCE);
    }
}
