package ads_mobile_sdk;

import b.s5;
import b.t2;

/* loaded from: classes2.dex */
public final class n01 extends cu0 {
    private static final n01 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f7389c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f7390d = 2;
    private int action_;
    private String message_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        n01 n01Var = new n01();
        DEFAULT_INSTANCE = n01Var;
        cu0.a(n01.class, n01Var);
    }

    public static s5 o() {
        return (s5) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\f\u0002Ȉ", new Object[]{"action_", "message_"});
        }
        if (iA == 3) {
            return new n01();
        }
        if (iA != 4) {
            return null;
        }
        return new s5(DEFAULT_INSTANCE);
    }

    public final void b(String str) {
        this.message_ = str;
    }
}
