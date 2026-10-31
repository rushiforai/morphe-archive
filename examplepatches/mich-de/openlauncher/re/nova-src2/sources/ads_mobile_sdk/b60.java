package ads_mobile_sdk;

import b.t2;
import b.uc;

/* loaded from: classes.dex */
public final class b60 extends cu0 {
    private static final b60 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f1279c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f1280d = 2;
    private int bitField0_;
    private String postData_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private int warningType_;

    static {
        b60 b60Var = new b60();
        DEFAULT_INSTANCE = b60Var;
        cu0.a(b60.class, b60Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001᠌\u0000\u0002ဈ\u0001", new Object[]{"bitField0_", "warningType_", b8.a$16, "postData_"});
        }
        if (iA == 3) {
            return new b60();
        }
        if (iA != 4) {
            return null;
        }
        return new uc(DEFAULT_INSTANCE);
    }
}
