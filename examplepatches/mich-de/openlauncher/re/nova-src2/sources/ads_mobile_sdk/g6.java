package ads_mobile_sdk;

import b.e9;
import b.k9;
import b.t2;

/* loaded from: classes.dex */
public final class g6 extends cu0 {
    private static final g6 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f3642c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f3643d = 2;
    private int bitField0_;
    private long lastAccessTimeMs_;
    private e9 responses_ = in2.f4887e;

    static {
        g6 g6Var = new g6();
        DEFAULT_INSTANCE = g6Var;
        cu0.a(g6.class, g6Var);
    }

    public static g6 o() {
        return DEFAULT_INSTANCE;
    }

    public final void a(b6 b6Var) {
        e9 e9Var = this.responses_;
        if (!((j) e9Var).f5068a) {
            this.responses_ = k9.n(e9Var);
        }
        this.responses_.add(b6Var);
    }

    public final long p() {
        return this.lastAccessTimeMs_;
    }

    public final int q() {
        return this.responses_.size();
    }

    public final e9 r() {
        return this.responses_;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u001b\u0002ဂ\u0000", new Object[]{"bitField0_", "responses_", b6.class, "lastAccessTimeMs_"});
        }
        if (iA == 3) {
            return new g6();
        }
        if (iA != 4) {
            return null;
        }
        return new b.u2();
    }

    public final void a(int i5, b6 b6Var) {
        e9 e9Var = this.responses_;
        if (!((j) e9Var).f5068a) {
            this.responses_ = k9.n(e9Var);
        }
        this.responses_.set(i5, b6Var);
    }
}
