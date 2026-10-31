package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes2.dex */
public final class gd extends cu0 {
    private static final gd DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f3768c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f3769d = 2;
    private int bitField0_;
    private long counter_ = -1;
    private int deviceIdType_;

    static {
        gd gdVar = new gd();
        DEFAULT_INSTANCE = gdVar;
        cu0.a(gd.class, gdVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001᠌\u0000\u0002ဂ\u0001", new Object[]{"bitField0_", "deviceIdType_", ad.a$12, "counter_"});
        }
        if (iA == 3) {
            return new gd();
        }
        if (iA != 4) {
            return null;
        }
        return new t(DEFAULT_INSTANCE);
    }
}
