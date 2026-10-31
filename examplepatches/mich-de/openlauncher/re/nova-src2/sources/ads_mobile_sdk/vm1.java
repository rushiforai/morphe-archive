package ads_mobile_sdk;

import b.e9;
import b.t;
import b.t2;

/* loaded from: classes.dex */
public final class vm1 extends cu0 {
    private static final vm1 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f10825c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f10826d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f10827e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f10828f = 4;
    private e9 andNodes_;
    private int bitField0_;
    private mn1 matchNode_;
    private vm1 notNode_;
    private e9 orNodes_;

    static {
        vm1 vm1Var = new vm1();
        DEFAULT_INSTANCE = vm1Var;
        cu0.a(vm1.class, vm1Var);
    }

    public vm1() {
        in2 in2Var = in2.f4887e;
        this.andNodes_ = in2Var;
        this.orNodes_ = in2Var;
    }

    public static vm1 p() {
        return DEFAULT_INSTANCE;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0002\u0000\u0001\u001b\u0002\u001b\u0003ဉ\u0000\u0004ဉ\u0001", new Object[]{"bitField0_", "andNodes_", vm1.class, "orNodes_", vm1.class, "notNode_", "matchNode_"});
        }
        if (iA == 3) {
            return new vm1();
        }
        if (iA != 4) {
            return null;
        }
        return new t(26);
    }

    public final e9 o$1() {
        return this.andNodes_;
    }

    public final mn1 q() {
        mn1 mn1Var = this.matchNode_;
        return mn1Var == null ? mn1.q() : mn1Var;
    }

    public final vm1 r() {
        vm1 vm1Var = this.notNode_;
        return vm1Var == null ? DEFAULT_INSTANCE : vm1Var;
    }

    public final e9 s() {
        return this.orNodes_;
    }

    public final boolean t() {
        return (this.bitField0_ & 2) != 0;
    }

    public final boolean u() {
        return (this.bitField0_ & 1) != 0;
    }
}
