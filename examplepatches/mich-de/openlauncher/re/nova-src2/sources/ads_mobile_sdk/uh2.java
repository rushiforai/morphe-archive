package ads_mobile_sdk;

import b.e9;
import b.t2;

/* loaded from: classes2.dex */
public final class uh2 extends cu0 {
    private static final uh2 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f10335c = 1;
    private e9 rules_ = in2.f4887e;

    static {
        uh2 uh2Var = new uh2();
        DEFAULT_INSTANCE = uh2Var;
        cu0.a(uh2.class, uh2Var);
    }

    public static uh2 o() {
        return DEFAULT_INSTANCE;
    }

    public static b.za r() {
        return (b.za) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001b", new Object[]{"rules_", sh2.class});
        }
        if (iA == 3) {
            return new uh2();
        }
        if (iA != 4) {
            return null;
        }
        return new b.za(DEFAULT_INSTANCE);
    }

    public final int p() {
        return this.rules_.size();
    }

    public final e9 q() {
        return this.rules_;
    }

    public static uh2 a(byte[] bArr) {
        cu0 cu0VarA = cu0.a(DEFAULT_INSTANCE, bArr, bArr.length, nl0.a());
        cu0.a(cu0VarA);
        return (uh2) cu0VarA;
    }
}
