package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes2.dex */
public final class id extends cu0 {
    private static final id DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f4722c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f4723d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f4724e = 3;
    private int bitField0_;
    private long screenBrightness_ = -1;
    private long screenBrightnessMode_ = -1;
    private long screenOffTimeout_ = -1;

    static {
        id idVar = new id();
        DEFAULT_INSTANCE = idVar;
        cu0.a(id.class, idVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဂ\u0000\u0002ဂ\u0001\u0003ဂ\u0002", new Object[]{"bitField0_", "screenBrightness_", "screenBrightnessMode_", "screenOffTimeout_"});
        }
        if (iA == 3) {
            return new id();
        }
        if (iA != 4) {
            return null;
        }
        return new t(DEFAULT_INSTANCE);
    }
}
