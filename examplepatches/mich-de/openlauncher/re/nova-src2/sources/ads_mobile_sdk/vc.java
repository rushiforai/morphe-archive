package ads_mobile_sdk;

import b.lb;
import b.t2;

/* loaded from: classes2.dex */
public final class vc extends cu0 {
    private static final vc DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f10723c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f10724d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f10725e = 3;
    private int bitField0_;
    private long source_ = -1;
    private int isPhysicalInput_ = 1000;
    private int verified_ = 1000;

    static {
        vc vcVar = new vc();
        DEFAULT_INSTANCE = vcVar;
        cu0.a(vc.class, vcVar);
    }

    public static lb o() {
        return (lb) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            ad adVar = ad.a$1;
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဂ\u0000\u0002᠌\u0001\u0003᠌\u0002", new Object[]{"bitField0_", "source_", "isPhysicalInput_", adVar, "verified_", adVar});
        }
        if (iA == 3) {
            return new vc();
        }
        if (iA != 4) {
            return null;
        }
        return new lb(DEFAULT_INSTANCE);
    }
}
