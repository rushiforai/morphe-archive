package ads_mobile_sdk;

import b.d5;
import b.t2;
import java.util.Objects;

/* loaded from: classes.dex */
public final class l50 extends cu0 {
    private static final l50 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f6080c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f6081d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f6082e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f6083f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f6084g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f6085h = 6;

    /* renamed from: i, reason: collision with root package name */
    public static final int f6086i = 7;

    /* renamed from: j, reason: collision with root package name */
    public static final int f6087j = 8;
    private boolean appVerificationEnabled_;
    private int bitField0_;
    private long googlePlayServicesVersion_;
    private boolean isAsyncCheck_;
    private boolean isInstantApps_;
    private int urlApiType_;
    private String clientVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String clientName_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String updateApiListVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        l50 l50Var = new l50();
        DEFAULT_INSTANCE = l50Var;
        cu0.a(l50.class, l50Var);
    }

    public static d5 o() {
        return (d5) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\b\u0000\u0001\u0001\b\b\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဂ\u0001\u0003ဇ\u0002\u0004᠌\u0003\u0005ဈ\u0004\u0006ဈ\u0005\u0007ဇ\u0006\bဇ\u0007", new Object[]{"bitField0_", "clientVersion_", "googlePlayServicesVersion_", "isInstantApps_", "urlApiType_", b8.a$11, "clientName_", "updateApiListVersion_", "isAsyncCheck_", "appVerificationEnabled_"});
        }
        if (iA == 3) {
            return new l50();
        }
        if (iA != 4) {
            return null;
        }
        return new d5(DEFAULT_INSTANCE);
    }

    public final void b(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 1;
        this.clientVersion_ = str;
    }
}
