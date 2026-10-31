package ads_mobile_sdk;

import b.t2;

/* loaded from: classes2.dex */
public final class bq extends cu0 {
    private static final bq DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f1488c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f1489d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f1490e = 3;
    private int bitField0_;
    private long major_;
    private long micro_;
    private long minor_;

    static {
        bq bqVar = new bq();
        DEFAULT_INSTANCE = bqVar;
        cu0.a(bq.class, bqVar);
    }

    public static b.u o() {
        return (b.u) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဃ\u0000\u0002ဃ\u0001\u0003ဃ\u0002", new Object[]{"bitField0_", "major_", "minor_", "micro_"});
        }
        if (iA == 3) {
            return new bq();
        }
        if (iA != 4) {
            return null;
        }
        return new b.u(DEFAULT_INSTANCE);
    }
}
