package ads_mobile_sdk;

import b.d;
import b.t2;

/* loaded from: classes.dex */
public final class p53 extends cu0 {
    private static final p53 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f8103c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f8104d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f8105e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f8106f = 4;
    private boolean cacheHit_;
    private int retryNumber_;
    private boolean thirdPartyCookiesEnabled_;
    private boolean wasLastSignalUsed_;

    static {
        p53 p53Var = new p53();
        DEFAULT_INSTANCE = p53Var;
        cu0.a(p53.class, p53Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001\u0004\u0002\u0007\u0003\u0007\u0004\u0007", new Object[]{"retryNumber_", "wasLastSignalUsed_", "thirdPartyCookiesEnabled_", "cacheHit_"});
        }
        if (iA == 3) {
            return new p53();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }
}
