package ads_mobile_sdk;

import b.cd;
import b.t2;

/* loaded from: classes.dex */
public final class zs extends cu0 {
    private static final zs DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f12641c = 1;
    private int bitField0_;
    private xs increment_;

    static {
        zs zsVar = new zs();
        DEFAULT_INSTANCE = zsVar;
        cu0.a(zs.class, zsVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဉ\u0000", new Object[]{"bitField0_", "increment_"});
        }
        if (iA == 3) {
            return new zs();
        }
        if (iA != 4) {
            return null;
        }
        return new cd();
    }
}
