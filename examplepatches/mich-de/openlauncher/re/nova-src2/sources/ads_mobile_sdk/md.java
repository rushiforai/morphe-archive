package ads_mobile_sdk;

import b.t2;
import b.y5;

/* loaded from: classes2.dex */
public final class md extends cu0 {
    private static final md DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f7108c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f7109d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f7110e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f7111f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f7112g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f7113h = 6;

    /* renamed from: i, reason: collision with root package name */
    public static final int f7114i = 7;

    /* renamed from: j, reason: collision with root package name */
    public static final int f7115j = 8;

    /* renamed from: k, reason: collision with root package name */
    public static final int f7116k = 9;

    /* renamed from: l, reason: collision with root package name */
    public static final int f7117l = 10;

    /* renamed from: m, reason: collision with root package name */
    public static final int f7118m = 11;
    public static final int n = 12;
    public static final int o = 13;

    /* renamed from: p, reason: collision with root package name */
    public static final int f7119p = 14;

    /* renamed from: q, reason: collision with root package name */
    public static final int f7120q = 15;

    /* renamed from: r, reason: collision with root package name */
    public static final int f7121r = 16;

    /* renamed from: s, reason: collision with root package name */
    public static final int f7122s = 17;

    /* renamed from: t, reason: collision with root package name */
    public static final int f7123t = 18;

    /* renamed from: u, reason: collision with root package name */
    public static final int f7124u = 19;

    /* renamed from: v, reason: collision with root package name */
    public static final int f7125v = 20;

    /* renamed from: w, reason: collision with root package name */
    public static final int f7126w = 21;
    private int bitField0_;
    private long viewDxSignal_;
    private long viewDySignal_;
    private long tcxSignal_ = -1;
    private long tcySignal_ = -1;
    private long tcd_ = -1;
    private long avgMoveTcd_ = -1;
    private long tcp_ = -1;
    private long avgMoveTcp_ = -1;
    private int obscured_ = 1000;
    private long tctMs_ = -1;
    private long toolType_ = -1;
    private long source_ = -1;
    private int isPhysicalTouch_ = 1000;
    private long stkDepth_ = -1;
    private long pathDistanceSignal_ = -1;
    private long viewXSignal_ = -1;
    private long viewYSignal_ = -1;
    private long tcxDownSignal_ = -1;
    private long tcyDownSignal_ = -1;
    private long tcxUpSignal_ = -1;
    private long tcyUpSignal_ = -1;

    static {
        md mdVar = new md();
        DEFAULT_INSTANCE = mdVar;
        cu0.a(md.class, mdVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            ad adVar = ad.a$1;
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0015\u0000\u0001\u0001\u0015\u0015\u0000\u0000\u0000\u0001ဂ\u0000\u0002ဂ\u0001\u0003ဂ\u0002\u0004ဂ\u0003\u0005ဂ\u0004\u0006ဂ\u0005\u0007᠌\u0006\bဂ\u0007\tဂ\b\nဂ\t\u000b᠌\n\fဂ\u000b\rဂ\f\u000eဂ\r\u000fဂ\u000e\u0010ဂ\u000f\u0011ဂ\u0010\u0012ဂ\u0011\u0013ဂ\u0012\u0014ဂ\u0013\u0015ဂ\u0014", new Object[]{"bitField0_", "tcxSignal_", "tcySignal_", "tcd_", "avgMoveTcd_", "tcp_", "avgMoveTcp_", "obscured_", adVar, "tctMs_", "toolType_", "source_", "isPhysicalTouch_", adVar, "stkDepth_", "pathDistanceSignal_", "viewXSignal_", "viewYSignal_", "viewDxSignal_", "viewDySignal_", "tcxDownSignal_", "tcyDownSignal_", "tcxUpSignal_", "tcyUpSignal_"});
        }
        if (iA == 3) {
            return new md();
        }
        if (iA != 4) {
            return null;
        }
        return new y5(DEFAULT_INSTANCE);
    }

    public static y5 o() {
        return (y5) DEFAULT_INSTANCE.e();
    }
}
