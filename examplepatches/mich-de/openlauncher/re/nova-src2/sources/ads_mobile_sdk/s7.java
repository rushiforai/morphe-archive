package ads_mobile_sdk;

import android.os.Build;
import b.e9;
import b.j6;
import b.k9;
import b.p9;
import b.t2;
import java.util.Objects;

/* loaded from: classes.dex */
public final class s7 extends cu0 {
    private static final s7 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f9427c = 8;

    /* renamed from: d, reason: collision with root package name */
    public static final int f9428d = 21;

    /* renamed from: e, reason: collision with root package name */
    public static final int f9429e = 22;

    /* renamed from: f, reason: collision with root package name */
    public static final int f9430f = 23;

    /* renamed from: g, reason: collision with root package name */
    public static final int f9431g = 24;

    /* renamed from: h, reason: collision with root package name */
    public static final int f9432h = 25;

    /* renamed from: i, reason: collision with root package name */
    public static final int f9433i = 40;

    /* renamed from: j, reason: collision with root package name */
    public static final int f9434j = 41;

    /* renamed from: k, reason: collision with root package name */
    public static final int f9435k = 60;

    /* renamed from: l, reason: collision with root package name */
    public static final int f9436l = 61;

    /* renamed from: m, reason: collision with root package name */
    public static final int f9437m = 62;
    public static final int n = 63;
    public static final int o = 64;

    /* renamed from: p, reason: collision with root package name */
    public static final int f9438p = 65;

    /* renamed from: q, reason: collision with root package name */
    public static final int f9439q = 66;
    private long apiLevel_;
    private long appVersionCode_;
    private int bitField0_;
    private int deviceType_;
    private int hostType_;
    private int osType_;
    private long requestedAdshieldVersion_;
    private long samplingDenominator_;
    private int experimentIdsMemoizedSerializedSize = -1;
    private e9 logEvents_ = in2.f4887e;
    private String model_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String locale_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String country_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String appId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String hostVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String adshieldVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private j6 experimentIds_ = jb1.f5202e;

    static {
        s7 s7Var = new s7();
        DEFAULT_INSTANCE = s7Var;
        cu0.a(s7.class, s7Var);
    }

    public final void a(em1 em1Var) {
        e9 e9Var = this.logEvents_;
        if (!((j) e9Var).f5068a) {
            this.logEvents_ = k9.n(e9Var);
        }
        this.logEvents_.add(em1Var);
    }

    public final void e(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 128;
        this.hostVersion_ = str;
    }

    public static p9 o() {
        return (p9) DEFAULT_INSTANCE.e();
    }

    public final void b(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 256;
        this.adshieldVersion_ = str;
    }

    public final void c(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 32;
        this.appId_ = str;
    }

    public final void d(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 8;
        this.country_ = str;
    }

    public final void f(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 4;
        this.locale_ = str;
    }

    public final void g(String str) {
        String str2 = Build.MODEL;
        Objects.requireNonNull(str2);
        this.bitField0_ |= 2;
        this.model_ = str2;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u000f\u0000\u0001\bB\u000f\u0000\u0002\u0000\b\u001b\u0015ဂ\u0000\u0016ဈ\u0001\u0017ဈ\u0002\u0018ဈ\u0003\u0019᠌\u0004(ဈ\u0005)ဂ\u0006<ဈ\u0007=ဈ\b>ဂ\t?ဂ\n@'Aဌ\u000bBဌ\f", new Object[]{"bitField0_", "logEvents_", em1.class, "apiLevel_", "model_", "locale_", "country_", "deviceType_", ad.a$9, "appId_", "appVersionCode_", "hostVersion_", "adshieldVersion_", "samplingDenominator_", "requestedAdshieldVersion_", "experimentIds_", "hostType_", "osType_"});
        }
        if (iA == 3) {
            return new s7();
        }
        if (iA != 4) {
            return null;
        }
        return new p9();
    }
}
