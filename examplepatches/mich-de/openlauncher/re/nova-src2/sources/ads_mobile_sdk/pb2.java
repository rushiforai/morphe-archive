package ads_mobile_sdk;

import b.e9;
import b.t2;

/* loaded from: classes.dex */
public final class pb2 extends cu0 {
    private static final pb2 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f8154c = 1;
    private e9 rules_ = in2.f4887e;

    static {
        pb2 pb2Var = new pb2();
        DEFAULT_INSTANCE = pb2Var;
        cu0.a(pb2.class, pb2Var);
    }

    public static pb2 o() {
        return DEFAULT_INSTANCE;
    }

    public static b.m7 r() {
        return (b.m7) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001b", new Object[]{"rules_", nb2.class});
        }
        if (iA == 3) {
            return new pb2();
        }
        if (iA != 4) {
            return null;
        }
        return new b.m7(DEFAULT_INSTANCE);
    }

    public final int p() {
        return this.rules_.size();
    }

    public final e9 q() {
        return this.rules_;
    }

    public static pb2 a(byte[] bArr) {
        cu0 cu0VarA = cu0.a(DEFAULT_INSTANCE, bArr, bArr.length, nl0.a());
        cu0.a(cu0VarA);
        return (pb2) cu0VarA;
    }
}
