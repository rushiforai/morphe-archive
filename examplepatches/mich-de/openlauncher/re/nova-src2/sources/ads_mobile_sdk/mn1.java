package ads_mobile_sdk;

import b.e9;
import b.t;
import b.t2;

/* loaded from: classes.dex */
public final class mn1 extends cu0 {
    private static final mn1 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f7289c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f7290d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f7291e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f7292f = 5;

    /* renamed from: g, reason: collision with root package name */
    public static final int f7293g = 4;

    /* renamed from: h, reason: collision with root package name */
    public static final int f7294h = 6;

    /* renamed from: i, reason: collision with root package name */
    public static final int f7295i = 7;

    /* renamed from: j, reason: collision with root package name */
    public static final int f7296j = 8;

    /* renamed from: k, reason: collision with root package name */
    public static final int f7297k = 9;
    private int bitField0_;
    private Object comparisonOperator_;
    private boolean equalsTo_;
    private Object matchValue_;
    private int matchValueCase_ = 0;
    private int comparisonOperatorCase_ = 0;
    private e9 path_ = in2.f4887e;

    static {
        mn1 mn1Var = new mn1();
        DEFAULT_INSTANCE = mn1Var;
        cu0.a(mn1.class, mn1Var);
    }

    public static mn1 q() {
        return DEFAULT_INSTANCE;
    }

    public final boolean A() {
        return this.matchValueCase_ == 5;
    }

    public final boolean B() {
        return this.matchValueCase_ == 2;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\t\u0002\u0001\u0001\t\t\u0000\u0001\u0000\u0001Ț\u0002Ȼ\u0000\u0003:\u0000\u0004<\u0000\u00053\u0000\u0006:\u0001\u0007:\u0001\b:\u0001\tဇ\u0000", new Object[]{"matchValue_", "matchValueCase_", "comparisonOperator_", "comparisonOperatorCase_", "bitField0_", "path_", mn1.class, "equalsTo_"});
        }
        if (iA == 3) {
            return new mn1();
        }
        if (iA != 4) {
            return null;
        }
        return new t(14);
    }

    public final mn1 o() {
        return this.matchValueCase_ == 4 ? (mn1) this.matchValue_ : DEFAULT_INSTANCE;
    }

    public final boolean p() {
        if (this.matchValueCase_ == 3) {
            return ((Boolean) this.matchValue_).booleanValue();
        }
        return false;
    }

    public final boolean r() {
        return this.equalsTo_;
    }

    public final double s() {
        if (this.matchValueCase_ == 5) {
            return ((Double) this.matchValue_).doubleValue();
        }
        return 0.0d;
    }

    public final e9 t() {
        return this.path_;
    }

    public final String u() {
        return this.matchValueCase_ == 2 ? (String) this.matchValue_ : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public final boolean v() {
        return this.matchValueCase_ == 4;
    }

    public final boolean w() {
        return this.comparisonOperatorCase_ == 8;
    }

    public final boolean x() {
        return this.matchValueCase_ == 3;
    }

    public final boolean y() {
        return this.comparisonOperatorCase_ == 6;
    }

    public final boolean z() {
        return this.comparisonOperatorCase_ == 7;
    }
}
