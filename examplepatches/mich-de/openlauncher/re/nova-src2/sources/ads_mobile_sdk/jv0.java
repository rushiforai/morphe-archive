package ads_mobile_sdk;

import b.d;
import b.t2;

/* loaded from: classes.dex */
public final class jv0 extends cu0 {
    private static final jv0 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f5420c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f5421d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f5422e = 4;

    /* renamed from: f, reason: collision with root package name */
    public static final int f5423f = 3;
    private int status_;
    private String stacktrace_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String topException_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String conduitTraceKey_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        jv0 jv0Var = new jv0();
        DEFAULT_INSTANCE = jv0Var;
        cu0.a(jv0.class, jv0Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001\f\u0002Ȉ\u0003Ȉ\u0004Ȉ", new Object[]{"status_", "stacktrace_", "conduitTraceKey_", "topException_"});
        }
        if (iA == 3) {
            return new jv0();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }
}
