package ads_mobile_sdk;

import b.t2;

/* loaded from: classes2.dex */
public final class ue extends cu0 {
    private static final ue DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f10322c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f10323d = 2;
    private int eventType_;
    private long timestampMs_;

    static {
        ue ueVar = new ue();
        DEFAULT_INSTANCE = ueVar;
        cu0.a(ue.class, ueVar);
    }

    public static b.ma o() {
        return (b.ma) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\f\u0002\u0002", new Object[]{"eventType_", "timestampMs_"});
        }
        if (iA == 3) {
            return new ue();
        }
        if (iA != 4) {
            return null;
        }
        return new b.ma(DEFAULT_INSTANCE);
    }
}
