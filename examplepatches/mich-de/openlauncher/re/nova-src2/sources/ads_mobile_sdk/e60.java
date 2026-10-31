package ads_mobile_sdk;

import b.d;
import b.t2;

/* loaded from: classes.dex */
public final class e60 extends cu0 {
    private static final e60 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f2745c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f2746d = 2;
    private int bitField0_;
    private String name_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String value_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        e60 e60Var = new e60();
        DEFAULT_INSTANCE = e60Var;
        cu0.a(e60.class, e60Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဈ\u0001", new Object[]{"bitField0_", "name_", "value_"});
        }
        if (iA == 3) {
            return new e60();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }
}
