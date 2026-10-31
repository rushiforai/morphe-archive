package ads_mobile_sdk;

import b.cd;
import b.j6;
import b.t2;

/* loaded from: classes2.dex */
public final class zn3 extends cu0 {
    private static final zn3 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f12599c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f12600d = 2;
    private int bitField0_;
    private String apiName_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private j6 compatibleSdks_ = jb1.f5202e;

    static {
        zn3 zn3Var = new zn3();
        DEFAULT_INSTANCE = zn3Var;
        cu0.a(zn3.class, zn3Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0001\u0000\u0001ဈ\u0000\u0002\u0016", new Object[]{"bitField0_", "apiName_", "compatibleSdks_"});
        }
        if (iA == 3) {
            return new zn3();
        }
        if (iA != 4) {
            return null;
        }
        return new cd(DEFAULT_INSTANCE);
    }
}
