package ads_mobile_sdk;

import b.jb;
import b.t2;

/* loaded from: classes.dex */
public final class wa1 extends cu0 {
    private static final wa1 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f11111c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f11112d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f11113e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f11114f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f11115g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f11116h = 6;

    /* renamed from: i, reason: collision with root package name */
    public static final int f11117i = 7;

    /* renamed from: j, reason: collision with root package name */
    public static final int f11118j = 8;
    private boolean googlePlayInstant_;
    private long installBeginTimestampSeconds_;
    private long installBeginTimestampServerSeconds_;
    private int installReferrerErrorCode_;
    private String installReferrer_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String installVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private long referrerClickTimestampSeconds_;
    private long referrerClickTimestampServerSeconds_;

    static {
        wa1 wa1Var = new wa1();
        DEFAULT_INSTANCE = wa1Var;
        cu0.a(wa1.class, wa1Var);
    }

    public static jb o() {
        return (jb) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\b\u0000\u0000\u0001\b\b\u0000\u0000\u0000\u0001Ȉ\u0002\u0002\u0003\u0002\u0004\u0007\u0005\u0002\u0006\u0002\u0007Ȉ\b\f", new Object[]{"installReferrer_", "referrerClickTimestampSeconds_", "installBeginTimestampSeconds_", "googlePlayInstant_", "referrerClickTimestampServerSeconds_", "installBeginTimestampServerSeconds_", "installVersion_", "installReferrerErrorCode_"});
        }
        if (iA == 3) {
            return new wa1();
        }
        if (iA != 4) {
            return null;
        }
        return new jb(DEFAULT_INSTANCE);
    }

    public final void b(String str) {
        this.installReferrer_ = str;
    }

    public final void c(String str) {
        this.installVersion_ = str;
    }
}
