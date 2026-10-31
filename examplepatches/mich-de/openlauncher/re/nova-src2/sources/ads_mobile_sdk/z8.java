package ads_mobile_sdk;

import b.e9;
import b.t2;
import java.util.List;

/* loaded from: classes.dex */
public final class z8 extends cu0 {
    private static final z8 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f12480c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f12481d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f12482e = 3;
    private int bitField0_;
    private String effectiveAdUnitId_;
    private e9 excludingRegexes_;
    private e9 includingRegexes_;

    static {
        z8 z8Var = new z8();
        DEFAULT_INSTANCE = z8Var;
        cu0.a(z8.class, z8Var);
    }

    public z8() {
        in2 in2Var = in2.f4887e;
        this.includingRegexes_ = in2Var;
        this.excludingRegexes_ = in2Var;
        this.effectiveAdUnitId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public static b.vc r() {
        return (b.vc) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0002\u0000\u0001Ț\u0002Ț\u0003ለ\u0000", new Object[]{"bitField0_", "includingRegexes_", "excludingRegexes_", "effectiveAdUnitId_"});
        }
        if (iA == 3) {
            return new z8();
        }
        if (iA != 4) {
            return null;
        }
        return new b.vc(DEFAULT_INSTANCE);
    }

    public final String o() {
        return this.effectiveAdUnitId_;
    }

    public final e9 p$1() {
        return this.excludingRegexes_;
    }

    public final List q() {
        return this.includingRegexes_;
    }

    public final void b(String str) {
        this.bitField0_ |= 1;
        this.effectiveAdUnitId_ = str;
    }
}
