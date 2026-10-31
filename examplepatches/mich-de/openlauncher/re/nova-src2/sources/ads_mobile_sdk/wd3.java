package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes2.dex */
public final class wd3 extends cu0 {
    private static final wd3 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f11226c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f11227d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f11228e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f11229f = 4;
    private int requiredScreenHoldSec_;
    private int settleCount_;
    private boolean settleEndDueToAppBackground_;
    private int videoAutoplayStartTime_;

    static {
        wd3 wd3Var = new wd3();
        DEFAULT_INSTANCE = wd3Var;
        cu0.a(wd3.class, wd3Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001\u0004\u0002\u0004\u0003\f\u0004\u0007", new Object[]{"settleCount_", "requiredScreenHoldSec_", "videoAutoplayStartTime_", "settleEndDueToAppBackground_"});
        }
        if (iA == 3) {
            return new wd3();
        }
        if (iA != 4) {
            return null;
        }
        return new t(DEFAULT_INSTANCE);
    }
}
