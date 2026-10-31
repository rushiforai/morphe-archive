package ads_mobile_sdk;

import b.d;
import b.t2;

/* loaded from: classes.dex */
public final class v40 extends cu0 {
    private static final v40 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f10571c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f10572d = 2;
    private int bitField0_;
    private long displayDurationSec_;
    private String origin_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        v40 v40Var = new v40();
        DEFAULT_INSTANCE = v40Var;
        cu0.a(v40.class, v40Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဂ\u0001", new Object[]{"bitField0_", "origin_", "displayDurationSec_"});
        }
        if (iA == 3) {
            return new v40();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }
}
