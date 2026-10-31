package ads_mobile_sdk;

import b.e9;
import b.j6;
import b.k9;
import b.t2;
import b.x3;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.Objects;

/* loaded from: classes.dex */
public final class pd extends cu0 {
    public static final int A = 29;
    public static final int A0 = 96;
    public static final int B = 31;
    public static final int B0 = 82;
    public static final int C = 32;
    public static final int C0 = 83;
    public static final int D = 33;
    public static final int D0 = 84;
    private static final pd DEFAULT_INSTANCE;
    public static final int E = 34;
    public static final int E0 = 85;
    public static final int F = 35;
    public static final int F0 = 86;
    public static final int G = 36;
    public static final int G0 = 87;
    public static final int H = 37;
    public static final int H0 = 97;
    public static final int I = 38;
    public static final int I0 = 88;
    public static final int J = 39;
    public static final int J0 = 89;
    public static final int K = 40;
    public static final int K0 = 103;
    public static final int L = 41;
    public static final int L0 = 90;
    public static final int M = 42;
    public static final int M0 = 91;
    public static final int N = 44;
    public static final int N0 = 92;
    public static final int O = 45;
    public static final int O0 = 93;
    public static final int P = 46;
    public static final int P0 = 94;
    public static final int Q = 47;
    public static final int Q0 = 98;
    public static final int R = 74;
    public static final int R0 = 99;
    public static final int S = 48;
    public static final int S0 = 100;
    public static final int T = 49;
    public static final int T0 = 101;
    public static final int U = 51;
    public static final int U0 = 102;
    public static final int V = 52;
    public static final int V0 = 104;
    public static final int W = 53;
    public static final int W0 = 105;
    public static final int X = 54;
    public static final int X0 = 21;
    public static final int Y = 55;
    public static final int Y0 = 24;
    public static final int Z = 56;
    public static final int Z0 = 26;

    /* renamed from: a0, reason: collision with root package name */
    public static final int f8167a0 = 50;

    /* renamed from: a1, reason: collision with root package name */
    public static final int f8168a1 = 28;

    /* renamed from: b0, reason: collision with root package name */
    public static final int f8169b0 = 43;

    /* renamed from: b1, reason: collision with root package name */
    public static final int f8170b1 = 30;

    /* renamed from: c, reason: collision with root package name */
    public static final int f8171c = 1;

    /* renamed from: c0, reason: collision with root package name */
    public static final int f8172c0 = 57;

    /* renamed from: c1, reason: collision with root package name */
    public static final int f8173c1 = 25;

    /* renamed from: d, reason: collision with root package name */
    public static final int f8174d = 2;

    /* renamed from: d0, reason: collision with root package name */
    public static final int f8175d0 = 58;

    /* renamed from: d1, reason: collision with root package name */
    public static final int f8176d1 = 201;

    /* renamed from: e, reason: collision with root package name */
    public static final int f8177e = 3;

    /* renamed from: e0, reason: collision with root package name */
    public static final int f8178e0 = 59;

    /* renamed from: e1, reason: collision with root package name */
    public static final int f8179e1 = 301;

    /* renamed from: f, reason: collision with root package name */
    public static final int f8180f = 4;

    /* renamed from: f0, reason: collision with root package name */
    public static final int f8181f0 = 60;

    /* renamed from: f1, reason: collision with root package name */
    public static final int f8182f1 = 302;

    /* renamed from: g, reason: collision with root package name */
    public static final int f8183g = 5;

    /* renamed from: g0, reason: collision with root package name */
    public static final int f8184g0 = 61;
    public static final int g1 = 106;

    /* renamed from: h, reason: collision with root package name */
    public static final int f8185h = 6;

    /* renamed from: h0, reason: collision with root package name */
    public static final int f8186h0 = 71;
    public static final int h1 = 107;

    /* renamed from: i, reason: collision with root package name */
    public static final int f8187i = 7;

    /* renamed from: i0, reason: collision with root package name */
    public static final int f8188i0 = 72;
    public static final int i1 = 108;

    /* renamed from: j, reason: collision with root package name */
    public static final int f8189j = 8;

    /* renamed from: j0, reason: collision with root package name */
    public static final int f8190j0 = 62;

    /* renamed from: j1, reason: collision with root package name */
    public static final int f8191j1 = 109;

    /* renamed from: k, reason: collision with root package name */
    public static final int f8192k = 9;

    /* renamed from: k0, reason: collision with root package name */
    public static final int f8193k0 = 63;

    /* renamed from: k1, reason: collision with root package name */
    public static final int f8194k1 = 110;

    /* renamed from: l, reason: collision with root package name */
    public static final int f8195l = 10;

    /* renamed from: l0, reason: collision with root package name */
    public static final int f8196l0 = 67;

    /* renamed from: l1, reason: collision with root package name */
    public static final int f8197l1 = 111;

    /* renamed from: m, reason: collision with root package name */
    public static final int f8198m = 11;

    /* renamed from: m0, reason: collision with root package name */
    public static final int f8199m0 = 64;
    public static final int n = 12;

    /* renamed from: n0, reason: collision with root package name */
    public static final int f8200n0 = 65;
    public static final int o = 13;

    /* renamed from: o0, reason: collision with root package name */
    public static final int f8201o0 = 66;

    /* renamed from: p, reason: collision with root package name */
    public static final int f8202p = 14;

    /* renamed from: p0, reason: collision with root package name */
    public static final int f8203p0 = 95;

    /* renamed from: q, reason: collision with root package name */
    public static final int f8204q = 15;

    /* renamed from: q0, reason: collision with root package name */
    public static final int f8205q0 = 68;

    /* renamed from: r, reason: collision with root package name */
    public static final int f8206r = 16;

    /* renamed from: r0, reason: collision with root package name */
    public static final int f8207r0 = 69;

    /* renamed from: s, reason: collision with root package name */
    public static final int f8208s = 17;

    /* renamed from: s0, reason: collision with root package name */
    public static final int f8209s0 = 70;

    /* renamed from: t, reason: collision with root package name */
    public static final int f8210t = 18;

    /* renamed from: t0, reason: collision with root package name */
    public static final int f8211t0 = 73;

    /* renamed from: u, reason: collision with root package name */
    public static final int f8212u = 19;

    /* renamed from: u0, reason: collision with root package name */
    public static final int f8213u0 = 76;

    /* renamed from: v, reason: collision with root package name */
    public static final int f8214v = 20;

    /* renamed from: v0, reason: collision with root package name */
    public static final int f8215v0 = 77;

    /* renamed from: w, reason: collision with root package name */
    public static final int f8216w = 22;

    /* renamed from: w0, reason: collision with root package name */
    public static final int f8217w0 = 78;

    /* renamed from: x, reason: collision with root package name */
    public static final int f8218x = 23;

    /* renamed from: x0, reason: collision with root package name */
    public static final int f8219x0 = 79;

    /* renamed from: y, reason: collision with root package name */
    public static final int f8220y = 27;

    /* renamed from: y0, reason: collision with root package name */
    public static final int f8221y0 = 80;

    /* renamed from: z, reason: collision with root package name */
    public static final int f8222z = 75;

    /* renamed from: z0, reason: collision with root package name */
    public static final int f8223z0 = 81;
    private long actSignal_;
    private j6 activeExperimentIds_;
    private long activityIntentSignal_;
    private String activityNameSignal_;
    private long activityStackSizeSignal_;
    private long acxSignal_;
    private long acySignal_;
    private long aczSignal_;
    private rd adAttestationSignal_;
    private long adeventToVpnOffMs_;
    private String adshieldVersion_;
    private long attSignal_;
    private long attitudeSignal_;
    private long atvSignal_;
    private long batteryTemperatureSignal_;
    private int bitField0_;
    private int bitField1_;
    private int bitField2_;
    private int bitField3_;
    private long bootCountSignal_;
    private long btlSignal_;
    private long btsSignal_;
    private long clsSignal_;
    private int debuggerStateSignal_;
    private String deviceModelSignal_;
    private boolean didOptOut_;
    private String didSignalAndroidAdId_;
    private int didSignalType_;
    private String didSignal_;
    private int encryptionMethod_;
    private long evtTime_;
    private long experimentalInt64Signal_;
    private String experimentalStringSignal_;
    private int fallbackSignalsType_;
    private e9 functionDenylistSignal_;
    private long gmscoreVersionSignal_;
    private tc hwInfo_;
    private long impressionDurationHighAttentionMs_;
    private long impressionDurationMs_;
    private vc inputEvent_;
    private boolean iomSignal_;
    private int iosomSignal_;
    private int isLauncherSignal_;
    private long jbkSignal_;
    private xc keyEvent_;
    private long keyId_;
    private long lastKnownDeviceTrustworthiness_;
    private long lastKnownHumannessScore_;
    private long lastKnownTrustDecisionLabel_;
    private int launcherActivityEnabled_;
    private String lccSignal_;
    private String llcSignal_;
    private int mpSignal_;
    private int navigationTriggerType_;
    private long netSignal_;
    private int niSignal_;
    private long ornSignal_;
    private long pkgNameDetailSignal_;
    private long pmSignal_;
    private e9 previousTouches_;
    private long processImportanceSignal_;
    private int protoName_;
    private int proxyDetectedSignal_;
    private long psnSignal_;
    private long ratSignal_;
    private he rawAdAttestationSignal_;
    private long recentForegroundTimeSignal_;
    private long reqType_;
    private je requestData_;
    private e9 resetCounters_;
    private String sccSignal_;
    private id screenInfo_;
    private long screenStateSignal_;
    private String sftnIdSignal_;
    private kd soundInfoSignal_;
    private long swzSignal_;
    private long tctSignal_;
    private long tcxSignal_;
    private long tcySignal_;
    private long timeSinceVpnOnMs_;
    private long totalForegroundTimeSignal_;
    private md touch_;
    private long uhSignal_;
    private long uptSignal_;
    private long usgSignal_;
    private long utzSignal_;
    private long uwSignal_;
    private long vcdSignal_;
    private long virtualIntegrityType_;
    private long visSignal_;
    private od visibilitySignal_;
    private int vpnSignal_;
    private int activeExperimentIdsMemoizedSerializedSize = -1;
    private String osVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String afmaVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String stkSignal_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String intSignal_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String midSignal_ = "D";
    private String cerSignal_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String vnmSignal_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private long tcpSignal_ = -1;
    private long tcdSignal_ = -1;
    private long tcuSignal_ = -1;
    private long tcmSignal_ = -1;
    private long tcdnSignal_ = -1;
    private long tccSignal_ = -1;
    private long cpuSignal_ = -1;
    private long stkDepthSignal_ = -1;
    private String appIdSignal_ = "D";
    private String installerSignal_ = "D";
    private long timeSinceInstallMinutes_ = -1;
    private int usbConnectedSignal_ = 1000;
    private int adbEnabledSignal_ = 1000;
    private long deviceElapsedRealTimeSignal_ = -1;
    private long deviceUptimeSignal_ = -1;
    private long timeOnScreenMs_ = -1;
    private long percentAdOnScreen_ = -1;
    private long percentScreenCoveredByAd_ = -1;
    private int isNativeViewPerformclickMissing_ = 1000;

    static {
        pd pdVar = new pd();
        DEFAULT_INSTANCE = pdVar;
        cu0.a(pd.class, pdVar);
    }

    public pd() {
        in2 in2Var = in2.f4887e;
        this.previousTouches_ = in2Var;
        this.gmscoreVersionSignal_ = -1L;
        this.batteryTemperatureSignal_ = -1L;
        this.processImportanceSignal_ = -1L;
        this.screenStateSignal_ = -1L;
        this.recentForegroundTimeSignal_ = -1L;
        this.totalForegroundTimeSignal_ = -1L;
        this.activityIntentSignal_ = -1L;
        this.activityStackSizeSignal_ = -1L;
        this.activityNameSignal_ = "D";
        this.pkgNameDetailSignal_ = -1L;
        this.attitudeSignal_ = -1L;
        this.proxyDetectedSignal_ = 1000;
        this.launcherActivityEnabled_ = 1000;
        this.sftnIdSignal_ = "D";
        this.resetCounters_ = in2Var;
        this.vpnSignal_ = 1000;
        this.functionDenylistSignal_ = in2Var;
        this.deviceModelSignal_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.timeSinceVpnOnMs_ = -1L;
        this.adeventToVpnOffMs_ = -1L;
        this.impressionDurationMs_ = -1L;
        this.impressionDurationHighAttentionMs_ = -1L;
        this.virtualIntegrityType_ = -1L;
        this.adshieldVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.lastKnownTrustDecisionLabel_ = -1L;
        this.bootCountSignal_ = -1L;
        this.lccSignal_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.llcSignal_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.ratSignal_ = -1L;
        this.pmSignal_ = -1L;
        this.didSignal_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.didSignalType_ = 2;
        this.didSignalAndroidAdId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.experimentalInt64Signal_ = -1L;
        this.experimentalStringSignal_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.activeExperimentIds_ = jb1.f5202e;
        this.clsSignal_ = -1L;
        this.isLauncherSignal_ = 1000;
        this.iosomSignal_ = 1000;
        this.sccSignal_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public final void a(md mdVar) {
        e9 e9Var = this.previousTouches_;
        if (!((j) e9Var).f5068a) {
            this.previousTouches_ = k9.n(e9Var);
        }
        this.previousTouches_.add(mdVar);
    }

    public final void e(String str) {
        Objects.requireNonNull(str);
        this.bitField1_ |= 128;
        this.appIdSignal_ = str;
    }

    public final void i(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 4194304;
        this.intSignal_ = str;
    }

    public final void j(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 1;
        this.osVersion_ = str;
    }

    public final void k(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 268435456;
        this.vnmSignal_ = str;
    }

    public static x3 w() {
        return (x3) DEFAULT_INSTANCE.e();
    }

    public final void b(String str) {
        Objects.requireNonNull(str);
        this.bitField1_ |= 268435456;
        this.activityNameSignal_ = str;
    }

    public final void c(String str) {
        Objects.requireNonNull(str);
        this.bitField2_ |= SQLiteDatabase.OPEN_PRIVATECACHE;
        this.adshieldVersion_ = str;
    }

    public final void d(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 2;
        this.afmaVersion_ = str;
    }

    public final void f(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 16777216;
        this.cerSignal_ = str;
    }

    public final void g(String str) {
        Objects.requireNonNull(str);
        this.bitField2_ |= 1024;
        this.deviceModelSignal_ = str;
    }

    public final void h(String str) {
        Objects.requireNonNull(str);
        this.bitField1_ |= 256;
        this.installerSignal_ = str;
    }

    public final long o() {
        return this.gmscoreVersionSignal_;
    }

    public final String p() {
        return this.intSignal_;
    }

    public final long q() {
        return this.psnSignal_;
    }

    public final he r() {
        he heVar = this.rawAdAttestationSignal_;
        return heVar == null ? he.DEFAULT_INSTANCE : heVar;
    }

    public final long s() {
        return this.recentForegroundTimeSignal_;
    }

    public final boolean t() {
        return (this.bitField1_ & 1048576) != 0;
    }

    public final boolean u() {
        return (this.bitField0_ & 524288) != 0;
    }

    public final boolean v() {
        return (this.bitField3_ & 64) != 0;
    }

    public final void b(md mdVar) {
        this.touch_ = mdVar;
        this.bitField1_ |= SQLiteDatabase.OPEN_PRIVATECACHE;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            ad adVar = ad.a$12;
            ad adVar2 = ad.a$1;
            return new ps2(DEFAULT_INSTANCE, "\u0001r\u0000\u0004\u0001Įr\u0000\u0004\u0000\u0001ဈ\u0000\u0002ဈ\u0001\u0003ဂ\u0002\u0004ဂ\u0003\u0005ဂ\u0004\u0006ဂ\u0005\u0007ဂ\u0006\bဂ\u0007\tဂ\b\nဂ\t\u000bဂ\n\fဂ\u000b\rဈ\f\u000eဂ\r\u000fဂ\u000e\u0010ဂ\u000f\u0011ဂ\u0010\u0012ဂ\u0011\u0013ဂ\u0012\u0014ဂ\u0013\u0015ဂ`\u0016ဂ\u0014\u0017ဂ\u0015\u0018ဈa\u0019ဂe\u001a᠌b\u001bဈ\u0016\u001cဇc\u001dဈ\u0018\u001eဈd\u001fဂ\u0019 ဂ\u001a!ဂ\u001b\"ဈ\u001c#ဂ\u001d$ဂ\u001e%ဂ\u001f&ဉ 'ဂ!(ဂ\")ဂ#*ဂ$+\u001b,ဂ%-ဂ&.ဈ'/ဈ(0᠌*1᠌+2ဉ23ဂ,4ဂ-5ဂ.6ဂ/7ဂ08᠌19ဉ3:ဂ4;ဂ5<ဂ6=ဂ7>ဂ:?ဂ;@ဂ=A᠌>B᠌?Cဈ<D᠌AEဉBFဂCGဂ8Hဂ9I᠌DJဂ)Kဈ\u0017L᠌EMဈFN\u001bO᠌GP\u001bQဉHRဈJSဂKTဂLUဂMVဂNWဂOXဂQYဈRZဉT[ဉU\\ဂV]ဂW^᠌X_᠌@`ဉIaဂPbဈYcဈZdဂ[eဂ\\f᠌]gဂShဉ^iဇ_j'kဂil᠌jm᠌kn᠌loဈmÉဉfĭဂgĮဈh", new Object[]{"bitField0_", "bitField1_", "bitField2_", "bitField3_", "osVersion_", "afmaVersion_", "atvSignal_", "attSignal_", "btsSignal_", "btlSignal_", "acxSignal_", "acySignal_", "aczSignal_", "actSignal_", "netSignal_", "ornSignal_", "stkSignal_", "tcxSignal_", "tcySignal_", "tctSignal_", "uptSignal_", "visSignal_", "swzSignal_", "psnSignal_", "reqType_", "jbkSignal_", "usgSignal_", "didSignal_", "evtTime_", "didSignalType_", adVar, "intSignal_", "didOptOut_", "cerSignal_", "didSignalAndroidAdId_", "uwSignal_", "uhSignal_", "utzSignal_", "vnmSignal_", "vcdSignal_", "tcpSignal_", "tcdSignal_", "adAttestationSignal_", "tcuSignal_", "tcmSignal_", "tcdnSignal_", "tccSignal_", "previousTouches_", md.class, "cpuSignal_", "stkDepthSignal_", "appIdSignal_", "installerSignal_", "usbConnectedSignal_", adVar2, "adbEnabledSignal_", adVar2, "touch_", "deviceElapsedRealTimeSignal_", "deviceUptimeSignal_", "timeOnScreenMs_", "percentAdOnScreen_", "percentScreenCoveredByAd_", "isNativeViewPerformclickMissing_", adVar2, "visibilitySignal_", "gmscoreVersionSignal_", "batteryTemperatureSignal_", "processImportanceSignal_", "screenStateSignal_", "activityIntentSignal_", "activityStackSizeSignal_", "pkgNameDetailSignal_", "encryptionMethod_", ad.a$24, "protoName_", ad.a$3, "activityNameSignal_", "debuggerStateSignal_", b8.a$10, "requestData_", "attitudeSignal_", "recentForegroundTimeSignal_", "totalForegroundTimeSignal_", "proxyDetectedSignal_", adVar2, "timeSinceInstallMinutes_", "midSignal_", "launcherActivityEnabled_", adVar2, "sftnIdSignal_", "resetCounters_", gd.class, "vpnSignal_", adVar2, "functionDenylistSignal_", lc.class, "soundInfoSignal_", "deviceModelSignal_", "timeSinceVpnOnMs_", "adeventToVpnOffMs_", "impressionDurationMs_", "impressionDurationHighAttentionMs_", "lastKnownDeviceTrustworthiness_", "virtualIntegrityType_", "adshieldVersion_", "inputEvent_", "keyEvent_", "lastKnownTrustDecisionLabel_", "bootCountSignal_", "navigationTriggerType_", ad.f922a, "fallbackSignalsType_", ad.a$15, "screenInfo_", "lastKnownHumannessScore_", "lccSignal_", "llcSignal_", "ratSignal_", "pmSignal_", "niSignal_", ad.a$2, "keyId_", "hwInfo_", "iomSignal_", "activeExperimentIds_", "clsSignal_", "isLauncherSignal_", adVar2, "iosomSignal_", adVar2, "mpSignal_", ad.a$23, "sccSignal_", "rawAdAttestationSignal_", "experimentalInt64Signal_", "experimentalStringSignal_"});
        }
        if (iA == 3) {
            return new pd();
        }
        if (iA != 4) {
            return null;
        }
        return new x3();
    }

    public final void a(vc vcVar) {
        this.inputEvent_ = vcVar;
        this.bitField2_ |= 1048576;
    }

    public final void a(he heVar) {
        Objects.requireNonNull(heVar);
        this.rawAdAttestationSignal_ = heVar;
        this.bitField3_ |= 64;
    }

    public final void a(od odVar) {
        this.visibilitySignal_ = odVar;
        this.bitField1_ |= 524288;
    }

    public static pd a(byte[] bArr, nl0 nl0Var) {
        cu0 cu0VarA = cu0.a(DEFAULT_INSTANCE, bArr, bArr.length, nl0Var);
        cu0.a(cu0VarA);
        return (pd) cu0VarA;
    }
}
