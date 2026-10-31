package ads_mobile_sdk;

import b.d;
import b.t2;

/* loaded from: classes.dex */
public final class t50 extends cu0 {
    private static final t50 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f9782c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f9783d = 2;
    private int bitField0_;
    private int hashRealtimeThreatType_;
    private int urlRealtimeThreatType_;

    static {
        t50 t50Var = new t50();
        DEFAULT_INSTANCE = t50Var;
        cu0.a(t50.class, t50Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            b8 b8Var = b8.a$12;
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001", new Object[]{"bitField0_", "hashRealtimeThreatType_", b8Var, "urlRealtimeThreatType_", b8Var});
        }
        if (iA == 3) {
            return new t50();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }
}
