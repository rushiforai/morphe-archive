package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes2.dex */
public final class kd extends cu0 {
    private static final kd DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f5675c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f5676d = 2;
    private int bitField0_;
    private long mediaVolume_ = -1;
    private int isDndMode_ = 1000;

    static {
        kd kdVar = new kd();
        DEFAULT_INSTANCE = kdVar;
        cu0.a(kd.class, kdVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဂ\u0000\u0002᠌\u0001", new Object[]{"bitField0_", "mediaVolume_", "isDndMode_", ad.a$1});
        }
        if (iA == 3) {
            return new kd();
        }
        if (iA != 4) {
            return null;
        }
        return new t(DEFAULT_INSTANCE);
    }
}
