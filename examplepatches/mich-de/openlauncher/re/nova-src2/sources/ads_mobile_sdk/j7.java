package ads_mobile_sdk;

import androidx.recyclerview.widget.u1;
import b.t2;
import b.w3;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.Objects;

/* loaded from: classes.dex */
public final class j7 extends cu0 {
    public static final int A = 26;
    public static final int B = 27;
    public static final int C = 28;
    public static final int D = 29;
    private static final j7 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f5125c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f5126d = 22;

    /* renamed from: e, reason: collision with root package name */
    public static final int f5127e = 9;

    /* renamed from: f, reason: collision with root package name */
    public static final int f5128f = 23;

    /* renamed from: g, reason: collision with root package name */
    public static final int f5129g = 24;

    /* renamed from: h, reason: collision with root package name */
    public static final int f5130h = 3;

    /* renamed from: i, reason: collision with root package name */
    public static final int f5131i = 25;

    /* renamed from: j, reason: collision with root package name */
    public static final int f5132j = 4;

    /* renamed from: k, reason: collision with root package name */
    public static final int f5133k = 5;

    /* renamed from: l, reason: collision with root package name */
    public static final int f5134l = 6;

    /* renamed from: m, reason: collision with root package name */
    public static final int f5135m = 18;
    public static final int n = 7;
    public static final int o = 8;

    /* renamed from: p, reason: collision with root package name */
    public static final int f5136p = 10;

    /* renamed from: q, reason: collision with root package name */
    public static final int f5137q = 11;

    /* renamed from: r, reason: collision with root package name */
    public static final int f5138r = 12;

    /* renamed from: s, reason: collision with root package name */
    public static final int f5139s = 13;

    /* renamed from: t, reason: collision with root package name */
    public static final int f5140t = 14;

    /* renamed from: u, reason: collision with root package name */
    public static final int f5141u = 15;

    /* renamed from: v, reason: collision with root package name */
    public static final int f5142v = 16;

    /* renamed from: w, reason: collision with root package name */
    public static final int f5143w = 17;

    /* renamed from: x, reason: collision with root package name */
    public static final int f5144x = 19;

    /* renamed from: y, reason: collision with root package name */
    public static final int f5145y = 20;

    /* renamed from: z, reason: collision with root package name */
    public static final int f5146z = 21;
    private boolean allowFallbackToStaticProgram_;
    private int bitField0_;
    private boolean cancelQueuedSignalTaskOnTimeout_;
    private boolean enableAsyncInputEventProcessing_;
    private boolean enableLazyScheduler_;
    private boolean enableViewstringBinding_;
    private boolean forceInitializeWithStaticProgram_;
    private int hostType_;
    private tm1 loggingOptions_;
    private cn2 programUpdateOptions_;
    private int requestedAdshieldVersion_;
    private int fallbackAdshieldVersion_ = 1;
    private boolean allowFallback_ = true;
    private String hostVersion_ = "unknown_host";
    private boolean enableGassClient_ = true;
    private long appStartQuerySignalsTimeoutMs_ = 100;
    private long signalsTimeoutMs_ = 2000;
    private long gassSignalTimeoutMs_ = 10;
    private long localIntSignalTimeoutMs_ = 100;
    private long httpRequestTimeoutMs_ = 20000;
    private String prodInstallerCert_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String debugInstallerCert_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private long methodTimeoutMs_ = 500;
    private long appStartWindowMs_ = 3000;
    private boolean enableMinimalAppStartQuerySignals_ = true;
    private boolean clearDgArgsAfterUse_ = true;
    private boolean enableDgProgramCache_ = true;
    private boolean enableMinimalCerSignal_ = true;
    private boolean skipProgramUpdateWithStaticProgram_ = true;

    static {
        j7 j7Var = new j7();
        DEFAULT_INSTANCE = j7Var;
        cu0.a(j7.class, j7Var);
    }

    public static w3 P() {
        return (w3) DEFAULT_INSTANCE.e();
    }

    public final i7 E() {
        i7 i7Var;
        switch (this.hostType_) {
            case 0:
                i7Var = i7.UNKNOWN_HOST_TYPE;
                break;
            case 1:
                i7Var = i7.GMA;
                break;
            case 2:
                i7Var = i7.YOUTUBE;
                break;
            case 3:
                i7Var = i7.GPAY;
                break;
            case 4:
                i7Var = i7.IMA;
                break;
            case 5:
                i7Var = i7.PAL;
                break;
            case 6:
                i7Var = i7.MAPS;
                break;
            default:
                i7Var = null;
                break;
        }
        return i7Var == null ? i7.UNRECOGNIZED : i7Var;
    }

    public final String F() {
        return this.hostVersion_;
    }

    public final long G() {
        return this.httpRequestTimeoutMs_;
    }

    public final long H() {
        return this.localIntSignalTimeoutMs_;
    }

    public final tm1 I() {
        tm1 tm1Var = this.loggingOptions_;
        return tm1Var == null ? tm1.o() : tm1Var;
    }

    public final long J() {
        return this.methodTimeoutMs_;
    }

    public final String K() {
        return this.prodInstallerCert_;
    }

    public final cn2 L() {
        cn2 cn2Var = this.programUpdateOptions_;
        return cn2Var == null ? cn2.p() : cn2Var;
    }

    public final c8 M() {
        c8 c8VarA = c8.a(this.requestedAdshieldVersion_);
        return c8VarA == null ? c8.ADSHIELD_VERSION_UNSPECIFIED : c8VarA;
    }

    public final long N() {
        return this.signalsTimeoutMs_;
    }

    public final boolean O() {
        return this.skipProgramUpdateWithStaticProgram_;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            b8 b8Var = b8.f1313a;
            return new ps2(DEFAULT_INSTANCE, "\u0004\u001c\u0000\u0001\u0001\u001d\u001c\u0000\u0000\u0000\u0001᠌\u0000\u0003ဈ\u0005\u0004ဇ\u0007\u0005ဉ\b\u0006ဇ\t\u0007ဂ\u000b\bဉ\f\tဇ\u0002\nဂ\r\u000bဂ\u000e\fဂ\u000f\rဈ\u0010\u000eဈ\u0011\u000fဂ\u0012\u0010ဂ\u0013\u0011ဇ\u0014\u0012ဂ\n\u0013ဇ\u0015\u0014ဇ\u0016\u0015ဇ\u0017\u0016᠌\u0001\u0017ဇ\u0003\u0018ဇ\u0004\u0019ဌ\u0006\u001aဇ\u0018\u001bဇ\u0019\u001cဇ\u001a\u001dဇ\u001b", new Object[]{"bitField0_", "requestedAdshieldVersion_", b8Var, "hostVersion_", "enableGassClient_", "loggingOptions_", "enableViewstringBinding_", "signalsTimeoutMs_", "programUpdateOptions_", "allowFallback_", "gassSignalTimeoutMs_", "localIntSignalTimeoutMs_", "httpRequestTimeoutMs_", "prodInstallerCert_", "debugInstallerCert_", "methodTimeoutMs_", "appStartWindowMs_", "enableMinimalAppStartQuerySignals_", "appStartQuerySignalsTimeoutMs_", "clearDgArgsAfterUse_", "enableDgProgramCache_", "enableLazyScheduler_", "fallbackAdshieldVersion_", b8Var, "allowFallbackToStaticProgram_", "forceInitializeWithStaticProgram_", "hostType_", "enableMinimalCerSignal_", "skipProgramUpdateWithStaticProgram_", "enableAsyncInputEventProcessing_", "cancelQueuedSignalTaskOnTimeout_"});
        }
        if (iA == 3) {
            return new j7();
        }
        if (iA != 4) {
            return null;
        }
        return new w3(DEFAULT_INSTANCE);
    }

    public final boolean A() {
        return this.enableViewstringBinding_;
    }

    public final c8 B() {
        c8 c8VarA = c8.a(this.fallbackAdshieldVersion_);
        return c8VarA == null ? c8.ADSHIELD_VERSION_1 : c8VarA;
    }

    public final boolean C() {
        return this.forceInitializeWithStaticProgram_;
    }

    public final long D() {
        return this.gassSignalTimeoutMs_;
    }

    public final void b(String str) {
        this.bitField0_ |= SQLiteDatabase.OPEN_SHAREDCACHE;
        this.debugInstallerCert_ = str;
    }

    public final void c(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 32;
        this.hostVersion_ = str;
    }

    public final void d(String str) {
        this.bitField0_ |= SQLiteDatabase.OPEN_FULLMUTEX;
        this.prodInstallerCert_ = str;
    }

    public final boolean o() {
        return this.allowFallback_;
    }

    public final boolean p() {
        return this.allowFallbackToStaticProgram_;
    }

    public final long q() {
        return this.appStartQuerySignalsTimeoutMs_;
    }

    public final long r() {
        return this.appStartWindowMs_;
    }

    public final boolean s() {
        return this.cancelQueuedSignalTaskOnTimeout_;
    }

    public final boolean t() {
        return this.clearDgArgsAfterUse_;
    }

    public final String u() {
        return this.debugInstallerCert_;
    }

    public final boolean v() {
        return this.enableAsyncInputEventProcessing_;
    }

    public final boolean w() {
        return this.enableGassClient_;
    }

    public final boolean x() {
        return this.enableLazyScheduler_;
    }

    public final boolean y() {
        return this.enableMinimalAppStartQuerySignals_;
    }

    public final boolean z() {
        return this.enableMinimalCerSignal_;
    }

    public final void a(tm1 tm1Var) {
        this.loggingOptions_ = tm1Var;
        this.bitField0_ |= 256;
    }

    public final void a(cn2 cn2Var) {
        this.programUpdateOptions_ = cn2Var;
        this.bitField0_ |= u1.FLAG_APPEARED_IN_PRE_LAYOUT;
    }
}
