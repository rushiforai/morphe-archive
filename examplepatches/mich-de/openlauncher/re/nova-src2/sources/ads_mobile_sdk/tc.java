package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes2.dex */
public final class tc extends cu0 {
    private static final tc DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f9838c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f9839d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f9840e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f9841f = 4;
    private int bitField0_;
    private int frontCamera_ = 1000;
    private int rearCamera_ = 1000;
    private int frontFlash_ = 1000;
    private int rearFlash_ = 1000;

    static {
        tc tcVar = new tc();
        DEFAULT_INSTANCE = tcVar;
        cu0.a(tc.class, tcVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            ad adVar = ad.a$1;
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001\u0003᠌\u0002\u0004᠌\u0003", new Object[]{"bitField0_", "frontCamera_", adVar, "rearCamera_", adVar, "frontFlash_", adVar, "rearFlash_", adVar});
        }
        if (iA == 3) {
            return new tc();
        }
        if (iA != 4) {
            return null;
        }
        return new t(DEFAULT_INSTANCE);
    }
}
