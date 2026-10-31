package ads_mobile_sdk;

import b.d;
import b.t2;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes.dex */
public final class sh2 extends cu0 {
    private static final sh2 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f9556c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f9557d = 2;
    private int bitField0_;
    private gn1 includeSignals_ = gn1.f4008b;
    private vm1 pattern_;

    static {
        sh2 sh2Var = new sh2();
        DEFAULT_INSTANCE = sh2Var;
        cu0.a(sh2.class, sh2Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0001\u0000\u0000\u0001ဉ\u0000\u00022", new Object[]{"bitField0_", "pattern_", "includeSignals_", new dn1(ft3.f3519d, ft3.f3521f, d53.p())});
        }
        if (iA == 3) {
            return new sh2();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }

    public final Map o() {
        return Collections.unmodifiableMap(this.includeSignals_);
    }

    public final vm1 p() {
        vm1 vm1Var = this.pattern_;
        return vm1Var == null ? vm1.p() : vm1Var;
    }

    public final boolean q() {
        return (this.bitField0_ & 1) != 0;
    }
}
