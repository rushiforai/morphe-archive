package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes.dex */
public final class sp extends cu0 {
    private static final sp DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f9627c = 1;
    private int bitField0_;
    private int errorType_;

    static {
        sp spVar = new sp();
        DEFAULT_INSTANCE = spVar;
        cu0.a(sp.class, spVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001᠌\u0000", new Object[]{"bitField0_", "errorType_", ad.a$16});
        }
        if (iA == 3) {
            return new sp();
        }
        if (iA != 4) {
            return null;
        }
        return new t(21);
    }
}
