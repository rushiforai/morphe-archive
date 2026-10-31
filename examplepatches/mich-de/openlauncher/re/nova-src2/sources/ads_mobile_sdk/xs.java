package ads_mobile_sdk;

import b.d;
import b.t2;

/* loaded from: classes2.dex */
public final class xs extends cu0 {
    private static final xs DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f11810c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f11811d = 2;
    private String baseId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private int bitField0_;
    private int type_;

    static {
        xs xsVar = new xs();
        DEFAULT_INSTANCE = xsVar;
        cu0.a(xs.class, xsVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဈ\u0000\u0002᠌\u0001", new Object[]{"bitField0_", "baseId_", "type_", ad.a$13});
        }
        if (iA == 3) {
            return new xs();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }
}
