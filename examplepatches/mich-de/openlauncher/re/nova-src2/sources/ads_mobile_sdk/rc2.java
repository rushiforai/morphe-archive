package ads_mobile_sdk;

import b.n7;
import b.t2;

/* loaded from: classes.dex */
public final class rc2 extends cu0 {
    private static final rc2 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f9100c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f9101d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f9102e = 3;
    private int bitField0_;
    private int clearReason_;
    private int fillDisabledReason_;
    private int numAdsCleared_;

    static {
        rc2 rc2Var = new rc2();
        DEFAULT_INSTANCE = rc2Var;
        cu0.a(rc2.class, rc2Var);
    }

    public static n7 o() {
        return (n7) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဌ\u0000\u0002င\u0001\u0003ဌ\u0002", new Object[]{"bitField0_", "clearReason_", "numAdsCleared_", "fillDisabledReason_"});
        }
        if (iA == 3) {
            return new rc2();
        }
        if (iA != 4) {
            return null;
        }
        return new n7(DEFAULT_INSTANCE);
    }
}
