package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes2.dex */
public final class d53 extends cu0 {
    private static final d53 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f2184c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f2185d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f2186e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f2187f = 4;
    private int valueCase_ = 0;
    private Object value_;

    static {
        d53 d53Var = new d53();
        DEFAULT_INSTANCE = d53Var;
        cu0.a(d53.class, d53Var);
    }

    public static d53 p() {
        return DEFAULT_INSTANCE;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0004\u0001\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001Ȼ\u0000\u0002:\u0000\u00035\u0000\u00043\u0000", new Object[]{"value_", "valueCase_"});
        }
        if (iA == 3) {
            return new d53();
        }
        if (iA != 4) {
            return null;
        }
        return new t(DEFAULT_INSTANCE);
    }

    public final boolean o() {
        if (this.valueCase_ == 2) {
            return ((Boolean) this.value_).booleanValue();
        }
        return false;
    }

    public final double q() {
        if (this.valueCase_ == 4) {
            return ((Double) this.value_).doubleValue();
        }
        return 0.0d;
    }

    public final long r() {
        if (this.valueCase_ == 3) {
            return ((Long) this.value_).longValue();
        }
        return 0L;
    }

    public final String s() {
        return this.valueCase_ == 1 ? (String) this.value_ : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public final boolean t() {
        return this.valueCase_ == 2;
    }

    public final boolean u() {
        return this.valueCase_ == 4;
    }

    public final boolean v() {
        return this.valueCase_ == 3;
    }

    public final boolean w() {
        return this.valueCase_ == 1;
    }
}
