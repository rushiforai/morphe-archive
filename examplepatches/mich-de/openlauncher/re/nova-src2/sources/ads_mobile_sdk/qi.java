package ads_mobile_sdk;

import b.n0;
import b.p8;
import b.q1;
import b.t2;
import java.io.InputStream;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes.dex */
public final class qi extends cu0 {
    private static final qi DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f8671c = 13;

    /* renamed from: d, reason: collision with root package name */
    public static final int f8672d = 1;

    /* renamed from: e, reason: collision with root package name */
    public static final int f8673e = 2;

    /* renamed from: f, reason: collision with root package name */
    public static final int f8674f = 3;

    /* renamed from: g, reason: collision with root package name */
    public static final int f8675g = 4;

    /* renamed from: h, reason: collision with root package name */
    public static final int f8676h = 5;

    /* renamed from: i, reason: collision with root package name */
    public static final int f8677i = 6;

    /* renamed from: j, reason: collision with root package name */
    public static final int f8678j = 7;

    /* renamed from: k, reason: collision with root package name */
    public static final int f8679k = 8;

    /* renamed from: l, reason: collision with root package name */
    public static final int f8680l = 9;

    /* renamed from: m, reason: collision with root package name */
    public static final int f8681m = 10;
    public static final int n = 11;
    public static final int o = 12;
    private gn1 adManagerSignalAdapterConfigs_;
    private gn1 adUnitAndFormatToMediationConfigs_;
    private gn1 adUnitAndFormatToRequestSignals_;
    private gn1 adUnitPatterns_;
    private gn1 adapterInitializationConfigs_;
    private gn1 admobSignalAdapterConfigs_;
    private String appSettingsJson_;
    private int appSettingsVersion_;
    private int bitField0_;
    private String commonSettingsJson_;
    private long lastUpdateTimeMs_;
    private int loggingOnlyExperimentIdsMemoizedSerializedSize = -1;
    private b.k8 loggingOnlyExperimentIds_;
    private long serverCacheTtlSecs_;
    private gn1 signalAdapterConfigs_;

    static {
        qi qiVar = new qi();
        DEFAULT_INSTANCE = qiVar;
        cu0.a(qi.class, qiVar);
    }

    public qi() {
        gn1 gn1Var = gn1.f4008b;
        this.adUnitAndFormatToMediationConfigs_ = gn1Var;
        this.adUnitAndFormatToRequestSignals_ = gn1Var;
        this.adapterInitializationConfigs_ = gn1Var;
        this.adUnitPatterns_ = gn1Var;
        this.signalAdapterConfigs_ = gn1Var;
        this.admobSignalAdapterConfigs_ = gn1Var;
        this.adManagerSignalAdapterConfigs_ = gn1Var;
        this.appSettingsJson_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.loggingOnlyExperimentIds_ = wm1.f11335e;
        this.commonSettingsJson_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            n0 n0Var = ft3.f3519d;
            q1 q1Var = ft3.f3521f;
            return new ps2(DEFAULT_INSTANCE, "\u0004\r\u0000\u0001\u0001\r\r\u0007\u0001\u0000\u0001ለ\u0001\u0002ဂ\u0002\u0003ဂ\u0003\u0004%\u00052\u0006ለ\u0004\u00072\b2\t2\n2\u000b2\f2\rင\u0000", new Object[]{"bitField0_", "appSettingsJson_", "lastUpdateTimeMs_", "serverCacheTtlSecs_", "loggingOnlyExperimentIds_", "adUnitAndFormatToMediationConfigs_", new dn1(n0Var, q1Var, dp1.p()), "commonSettingsJson_", "adUnitAndFormatToRequestSignals_", new dn1(n0Var, n0Var, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), "adapterInitializationConfigs_", new dn1(n0Var, q1Var, oa.o()), "adUnitPatterns_", new dn1(n0Var, q1Var, d9.p()), "signalAdapterConfigs_", new dn1(n0Var, q1Var, ap.o()), "admobSignalAdapterConfigs_", new dn1(n0Var, q1Var, ap.o()), "adManagerSignalAdapterConfigs_", new dn1(n0Var, q1Var, ap.o()), "appSettingsVersion_"});
        }
        if (iA == 3) {
            return new qi();
        }
        if (iA != 4) {
            return null;
        }
        return new p8(DEFAULT_INSTANCE);
    }

    public static p8 A() {
        return (p8) DEFAULT_INSTANCE.e();
    }

    public static qi x() {
        return DEFAULT_INSTANCE;
    }

    public final void b(String str) {
        this.bitField0_ |= 2;
        this.appSettingsJson_ = str;
    }

    public final void c(String str) {
        this.bitField0_ |= 16;
        this.commonSettingsJson_ = str;
    }

    public final Map o() {
        return Collections.unmodifiableMap(this.adManagerSignalAdapterConfigs_);
    }

    public final Map p() {
        return Collections.unmodifiableMap(this.adUnitAndFormatToMediationConfigs_);
    }

    public final Map q() {
        return Collections.unmodifiableMap(this.adUnitAndFormatToRequestSignals_);
    }

    public final Map r() {
        return Collections.unmodifiableMap(this.adUnitPatterns_);
    }

    public final Map s() {
        return Collections.unmodifiableMap(this.adapterInitializationConfigs_);
    }

    public final Map t() {
        return Collections.unmodifiableMap(this.admobSignalAdapterConfigs_);
    }

    public final String u() {
        return this.appSettingsJson_;
    }

    public final int v() {
        return this.appSettingsVersion_;
    }

    public final String w() {
        return this.commonSettingsJson_;
    }

    public final long y() {
        return this.lastUpdateTimeMs_;
    }

    public final long z() {
        return this.serverCacheTtlSecs_;
    }

    public static qi a(InputStream inputStream) {
        cu0 cu0VarA = cu0.a(DEFAULT_INSTANCE, com.google.crypto.tink.shaded.protobuf.k.a(inputStream), nl0.a());
        cu0.a(cu0VarA);
        return (qi) cu0VarA;
    }
}
