package ads_mobile_sdk;

import b.ob;
import b.t2;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes2.dex */
public final class vr0 extends cu0 {
    private static final vr0 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f10880c = 1;
    private gn1 adResponseLists_ = gn1.f4008b;

    static {
        vr0 vr0Var = new vr0();
        DEFAULT_INSTANCE = vr0Var;
        cu0.a(vr0.class, vr0Var);
    }

    public static vr0 p() {
        return DEFAULT_INSTANCE;
    }

    public static ob r() {
        return (ob) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u00012", new Object[]{"adResponseLists_", new dn1(ft3.f3519d, ft3.f3521f, g6.o())});
        }
        if (iA == 3) {
            return new vr0();
        }
        if (iA != 4) {
            return null;
        }
        return new ob(DEFAULT_INSTANCE);
    }

    public final Map o() {
        return Collections.unmodifiableMap(this.adResponseLists_);
    }

    public final gn1 q() {
        gn1 gn1Var = this.adResponseLists_;
        if (!gn1Var.f4009a) {
            this.adResponseLists_ = gn1Var.b();
        }
        return this.adResponseLists_;
    }
}
