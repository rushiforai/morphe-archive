package ads_mobile_sdk;

import b.t2;

/* loaded from: classes.dex */
public final class zp extends cu0 {
    private static final zp DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f12601c = 4;

    /* renamed from: d, reason: collision with root package name */
    public static final int f12602d = 5;
    private int bitField0_;
    private String errorDescription_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private int errorType_;

    static {
        zp zpVar = new zp();
        DEFAULT_INSTANCE = zpVar;
        cu0.a(zp.class, zpVar);
    }

    public static b.dd o() {
        return (b.dd) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0002\u0000\u0001\u0004\u0005\u0002\u0000\u0000\u0000\u0004᠌\u0000\u0005ဈ\u0001", new Object[]{"bitField0_", "errorType_", ad.a$16, "errorDescription_"});
        }
        if (iA == 3) {
            return new zp();
        }
        if (iA != 4) {
            return null;
        }
        return new b.dd();
    }

    public final void b(String str) {
        this.bitField0_ |= 2;
        this.errorDescription_ = str;
    }
}
