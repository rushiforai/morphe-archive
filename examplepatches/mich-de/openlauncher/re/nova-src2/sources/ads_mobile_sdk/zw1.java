package ads_mobile_sdk;

import b.t2;

/* loaded from: classes2.dex */
public final class zw1 extends cu0 {
    private static final zw1 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f12703c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f12704d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f12705e = 3;
    private int bitField0_;
    private boolean clickToExpandRequested_;
    private boolean customControlsRequested_;
    private boolean startMuted_;

    static {
        zw1 zw1Var = new zw1();
        DEFAULT_INSTANCE = zw1Var;
        cu0.a(zw1.class, zw1Var);
    }

    public static b.gd o() {
        return (b.gd) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဇ\u0000\u0002ဇ\u0001\u0003ဇ\u0002", new Object[]{"bitField0_", "startMuted_", "clickToExpandRequested_", "customControlsRequested_"});
        }
        if (iA == 3) {
            return new zw1();
        }
        if (iA != 4) {
            return null;
        }
        return new b.gd(DEFAULT_INSTANCE);
    }
}
