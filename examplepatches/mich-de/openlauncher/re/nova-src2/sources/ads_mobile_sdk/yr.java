package ads_mobile_sdk;

import b.j6;
import b.sc;
import b.t2;

/* loaded from: classes2.dex */
public final class yr extends cu0 {
    private static final yr DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f12272c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f12273d = 3;
    private j6 triggerVariationId_;
    private j6 variationId_;

    static {
        yr yrVar = new yr();
        DEFAULT_INSTANCE = yrVar;
        cu0.a(yr.class, yrVar);
    }

    public yr() {
        jb1 jb1Var = jb1.f5202e;
        this.variationId_ = jb1Var;
        this.triggerVariationId_ = jb1Var;
    }

    public static sc o() {
        return (sc) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0002\u0000\u0000\u0001\u0003\u0002\u0000\u0002\u0000\u0001\u0016\u0003\u0016", new Object[]{"variationId_", "triggerVariationId_"});
        }
        if (iA == 3) {
            return new yr();
        }
        if (iA != 4) {
            return null;
        }
        return new sc(DEFAULT_INSTANCE);
    }

    public static yr a(byte[] bArr) {
        cu0 cu0VarA = cu0.a(DEFAULT_INSTANCE, bArr, bArr.length, nl0.a());
        cu0.a(cu0VarA);
        return (yr) cu0VarA;
    }
}
