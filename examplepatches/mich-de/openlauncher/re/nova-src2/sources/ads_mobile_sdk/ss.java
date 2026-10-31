package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes2.dex */
public final class ss extends cu0 {
    private static final ss DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f9648c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f9649d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f9650e = 3;
    private int bitField0_;
    private String downloadPath_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private boolean meteredAllowed_;
    private boolean roamingAllowed_;

    static {
        ss ssVar = new ss();
        DEFAULT_INSTANCE = ssVar;
        cu0.a(ss.class, ssVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဇ\u0001\u0003ဇ\u0002", new Object[]{"bitField0_", "downloadPath_", "meteredAllowed_", "roamingAllowed_"});
        }
        if (iA == 3) {
            return new ss();
        }
        if (iA != 4) {
            return null;
        }
        return new t(DEFAULT_INSTANCE);
    }
}
