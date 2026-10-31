package ads_mobile_sdk;

import b.d;
import b.t2;

/* loaded from: classes2.dex */
public final class f40 extends cu0 {
    private static final f40 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f3148c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f3149d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f3150e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f3151f = 4;
    private int action_;
    private int bitField0_;
    private long intervalMsec_;
    private boolean isTerminalAction_;
    private int surface_;

    static {
        f40 f40Var = new f40();
        DEFAULT_INSTANCE = f40Var;
        cu0.a(f40.class, f40Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001\u0003ဇ\u0002\u0004ဂ\u0003", new Object[]{"bitField0_", "surface_", b8.a$4, "action_", b8.a$1, "isTerminalAction_", "intervalMsec_"});
        }
        if (iA == 3) {
            return new f40();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }
}
