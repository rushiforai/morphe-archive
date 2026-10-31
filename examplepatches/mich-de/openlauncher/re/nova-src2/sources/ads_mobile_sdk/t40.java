package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes.dex */
public final class t40 extends cu0 {
    private static final t40 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f9773c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f9774d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f9775e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f9776f = 4;
    private int bitField0_;
    private long firstInteractionTimestampMsec_;
    private long lastInteractionTimestampMsec_;
    private int occurrenceCount_;
    private int securityInterstitialInteraction_;

    static {
        t40 t40Var = new t40();
        DEFAULT_INSTANCE = t40Var;
        cu0.a(t40.class, t40Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001᠌\u0000\u0002င\u0001\u0003ဂ\u0002\u0004ဂ\u0003", new Object[]{"bitField0_", "securityInterstitialInteraction_", ad.a$19, "occurrenceCount_", "firstInteractionTimestampMsec_", "lastInteractionTimestampMsec_"});
        }
        if (iA == 3) {
            return new t40();
        }
        if (iA != 4) {
            return null;
        }
        return new t(18);
    }
}
