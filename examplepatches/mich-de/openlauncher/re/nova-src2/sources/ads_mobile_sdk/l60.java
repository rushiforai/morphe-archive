package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes2.dex */
public final class l60 extends cu0 {
    private static final l60 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f6100c = 1;
    private int bitField0_;
    private String url_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        l60 l60Var = new l60();
        DEFAULT_INSTANCE = l60Var;
        cu0.a(l60.class, l60Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဈ\u0000", new Object[]{"bitField0_", "url_"});
        }
        if (iA == 3) {
            return new l60();
        }
        if (iA != 4) {
            return null;
        }
        return new t(DEFAULT_INSTANCE);
    }
}
