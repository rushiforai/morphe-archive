package ads_mobile_sdk;

import b.t2;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class cl1 extends cu0 {
    private static final cl1 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f1947c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f1948d = 2;
    private String functionName_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private int numIsolates_;

    static {
        cl1 cl1Var = new cl1();
        DEFAULT_INSTANCE = cl1Var;
        cu0.a(cl1.class, cl1Var);
    }

    public static b.j0 o() {
        return (b.j0) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001Ȉ\u0002\u0004", new Object[]{"functionName_", "numIsolates_"});
        }
        if (iA == 3) {
            return new cl1();
        }
        if (iA != 4) {
            return null;
        }
        return new b.j0(DEFAULT_INSTANCE);
    }

    public final void b(String str) {
        Objects.requireNonNull(str);
        this.functionName_ = str;
    }
}
