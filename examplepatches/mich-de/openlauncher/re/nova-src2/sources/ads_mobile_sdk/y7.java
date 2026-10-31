package ads_mobile_sdk;

import b.t2;

/* loaded from: classes.dex */
public final class y7 extends cu0 {
    private static final y7 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f11950c = 18;
    private s7 adshieldMonitoringMessage_;
    private int bitField0_;

    static {
        y7 y7Var = new y7();
        DEFAULT_INSTANCE = y7Var;
        cu0.a(y7.class, y7Var);
    }

    public static b.lc o() {
        return (b.lc) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0001\u0000\u0001\u0012\u0012\u0001\u0000\u0000\u0000\u0012ဉ\u0000", new Object[]{"bitField0_", "adshieldMonitoringMessage_"});
        }
        if (iA == 3) {
            return new y7();
        }
        if (iA != 4) {
            return null;
        }
        return new b.lc(DEFAULT_INSTANCE);
    }

    public final void a(s7 s7Var) {
        this.adshieldMonitoringMessage_ = s7Var;
        this.bitField0_ |= 1;
    }
}
