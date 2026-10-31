package ads_mobile_sdk;

import b.e9;
import b.n0;
import b.qc;
import b.t2;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes.dex */
public final class yn1 extends cu0 {
    private static final yn1 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f12218c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f12219d = 3;

    /* renamed from: e, reason: collision with root package name */
    public static final int f12220e = 2;
    private e9 adapters_;
    private gn1 data_ = gn1.f4008b;
    private e9 waterfallAdapters_;

    static {
        yn1 yn1Var = new yn1();
        DEFAULT_INSTANCE = yn1Var;
        cu0.a(yn1.class, yn1Var);
    }

    public yn1() {
        in2 in2Var = in2.f4887e;
        this.adapters_ = in2Var;
        this.waterfallAdapters_ = in2Var;
    }

    public static qc r() {
        return (qc) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            n0 n0Var = ft3.f3519d;
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0003\u0000\u0000\u0001\u0003\u0003\u0001\u0002\u0000\u0001Ț\u00022\u0003Ț", new Object[]{"adapters_", "data_", new dn1(n0Var, n0Var, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), "waterfallAdapters_"});
        }
        if (iA == 3) {
            return new yn1();
        }
        if (iA != 4) {
            return null;
        }
        return new qc(DEFAULT_INSTANCE);
    }

    public final e9 o() {
        return this.adapters_;
    }

    public final Map p() {
        return Collections.unmodifiableMap(this.data_);
    }
}
