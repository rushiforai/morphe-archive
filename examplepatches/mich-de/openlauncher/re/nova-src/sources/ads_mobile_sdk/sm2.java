package ads_mobile_sdk;

import b.d;
import b.t2;

/* loaded from: classes.dex */
public final class sm2 extends cu0 {
    private static final sm2 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f9610c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f9611d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f9612e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f9613f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f9614g = 5;
    private int bitField0_;
    private long downloadTimestampSecs_;
    private long expiredTimestampSecs_;
    private long expiryPeriodSecs_;
    private String vmChecksum_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String bytecodeChecksum_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        sm2 sm2Var = new sm2();
        DEFAULT_INSTANCE = sm2Var;
        cu0.a(sm2.class, sm2Var);
    }

    public static sm2 p() {
        return DEFAULT_INSTANCE;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဈ\u0001\u0003ဃ\u0002\u0004ဃ\u0003\u0005ဃ\u0004", new Object[]{"bitField0_", "vmChecksum_", "bytecodeChecksum_", "expiredTimestampSecs_", "downloadTimestampSecs_", "expiryPeriodSecs_"});
        }
        if (iA == 3) {
            return new sm2();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }

    public final String o() {
        return this.bytecodeChecksum_;
    }

    public final long q() {
        return this.expiredTimestampSecs_;
    }

    public final String r() {
        return this.vmChecksum_;
    }
}
