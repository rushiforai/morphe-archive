package ads_mobile_sdk;

import b.e9;
import b.t2;

/* loaded from: classes.dex */
public final class oa extends cu0 {
    private static final oa DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f7807c = 1;
    private e9 initializationData_ = in2.f4887e;

    static {
        oa oaVar = new oa();
        DEFAULT_INSTANCE = oaVar;
        cu0.a(oa.class, oaVar);
    }

    public static oa o() {
        return DEFAULT_INSTANCE;
    }

    public static b.t6 q() {
        return (b.t6) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001b", new Object[]{"initializationData_", qa.class});
        }
        if (iA == 3) {
            return new oa();
        }
        if (iA != 4) {
            return null;
        }
        return new b.t6();
    }

    public final e9 p$1() {
        return this.initializationData_;
    }
}
