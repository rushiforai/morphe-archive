package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes2.dex */
public final class je extends cu0 {
    private static final je DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f5225c = 1;
    private int bitField0_;
    private String requestToken_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        je jeVar = new je();
        DEFAULT_INSTANCE = jeVar;
        cu0.a(je.class, jeVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဈ\u0000", new Object[]{"bitField0_", "requestToken_"});
        }
        if (iA == 3) {
            return new je();
        }
        if (iA != 4) {
            return null;
        }
        return new t(DEFAULT_INSTANCE);
    }
}
