package ads_mobile_sdk;

import b.t2;

/* loaded from: classes2.dex */
public final class gv0 extends cu0 {
    private static final gv0 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f4089c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f4090d = 2;
    private int count_;
    private int format_;

    static {
        gv0 gv0Var = new gv0();
        DEFAULT_INSTANCE = gv0Var;
        cu0.a(gv0.class, gv0Var);
    }

    public static b.g3 o() {
        return (b.g3) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\f\u0002\u0004", new Object[]{"format_", "count_"});
        }
        if (iA == 3) {
            return new gv0();
        }
        if (iA != 4) {
            return null;
        }
        return new b.g3(DEFAULT_INSTANCE);
    }
}
