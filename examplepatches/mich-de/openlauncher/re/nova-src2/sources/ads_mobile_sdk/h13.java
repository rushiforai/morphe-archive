package ads_mobile_sdk;

import b.d;
import b.t2;

/* loaded from: classes.dex */
public final class h13 extends cu0 {
    private static final h13 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f4190c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f4191d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f4192e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f4193f = 4;
    private int evictionReason_;
    private int scarRequestType_;
    private String requestId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String requestAgent_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        h13 h13Var = new h13();
        DEFAULT_INSTANCE = h13Var;
        cu0.a(h13.class, h13Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001\f\u0002Ȉ\u0003\f\u0004Ȉ", new Object[]{"evictionReason_", "requestId_", "scarRequestType_", "requestAgent_"});
        }
        if (iA == 3) {
            return new h13();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }
}
