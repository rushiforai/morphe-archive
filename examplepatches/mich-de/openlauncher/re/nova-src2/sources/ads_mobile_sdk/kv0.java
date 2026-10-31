package ads_mobile_sdk;

import android.os.Build;
import b.e9;
import b.j6;
import b.k9;
import b.t2;
import b.u6;
import bt.f;
import java.util.Objects;

/* loaded from: classes.dex */
public final class kv0 extends cu0 {
    public static final int A = 16;
    public static final int B = 17;
    public static final int C = 18;
    public static final int D = 19;
    private static final kv0 DEFAULT_INSTANCE;
    public static final int E = 20;
    public static final int F = 21;
    public static final int G = 22;
    public static final int H = 23;
    public static final int I = 24;
    public static final int J = 25;
    public static final int K = 26;
    public static final int L = 27;
    public static final int M = 28;
    public static final int N = 29;
    public static final int O = 30;
    public static final int P = 31;
    public static final int Q = 40;
    public static final int R = 42;
    public static final int S = 43;
    public static final int T = 44;
    public static final int U = 45;
    public static final int V = 46;
    public static final int W = 47;
    public static final int X = 48;
    public static final int Y = 49;
    public static final int Z = 50;

    /* renamed from: a0, reason: collision with root package name */
    public static final int f5970a0 = 51;
    private static final u6 activeCuiStack_converter_ = new f(26);

    /* renamed from: b0, reason: collision with root package name */
    public static final int f5971b0 = 52;

    /* renamed from: c, reason: collision with root package name */
    public static final int f5972c = 1;

    /* renamed from: c0, reason: collision with root package name */
    public static final int f5973c0 = 53;

    /* renamed from: d, reason: collision with root package name */
    public static final int f5974d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f5975e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f5976f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f5977g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f5978h = 6;

    /* renamed from: i, reason: collision with root package name */
    public static final int f5979i = 7;

    /* renamed from: j, reason: collision with root package name */
    public static final int f5980j = 8;

    /* renamed from: k, reason: collision with root package name */
    public static final int f5981k = 9;

    /* renamed from: l, reason: collision with root package name */
    public static final int f5982l = 41;

    /* renamed from: m, reason: collision with root package name */
    public static final int f5983m = 10;
    public static final int n = 32;
    public static final int o = 11;

    /* renamed from: p, reason: collision with root package name */
    public static final int f5984p = 12;

    /* renamed from: q, reason: collision with root package name */
    public static final int f5985q = 13;

    /* renamed from: r, reason: collision with root package name */
    public static final int f5986r = 14;

    /* renamed from: s, reason: collision with root package name */
    public static final int f5987s = 33;

    /* renamed from: t, reason: collision with root package name */
    public static final int f5988t = 34;

    /* renamed from: u, reason: collision with root package name */
    public static final int f5989u = 35;

    /* renamed from: v, reason: collision with root package name */
    public static final int f5990v = 36;

    /* renamed from: w, reason: collision with root package name */
    public static final int f5991w = 37;

    /* renamed from: x, reason: collision with root package name */
    public static final int f5992x = 38;

    /* renamed from: y, reason: collision with root package name */
    public static final int f5993y = 39;

    /* renamed from: z, reason: collision with root package name */
    public static final int f5994z = 15;
    private int activeCuiStackMemoizedSerializedSize;
    private j6 activeCuiStack_;
    private int activeCui_;
    private String adUnitId_;
    private long availableMemoryBytes_;
    private int bitField0_;
    private yr chromeVariations_;
    private jv0 deobfuscatedStacktrace_;
    private int deviceAdvertisedMemTier_;
    private int deviceAvailableMemoryTier_;
    private int deviceAvailableProcessorTier_;
    private int displayHeight_;
    private int displayWidth_;
    private int format_;
    private long gmsCoreVersion_;
    private int liveWebviewCount_;
    private e9 loadedAdsStats_;
    private boolean lowMemory_;
    private int mediationChainLength_;
    private int networkType_;
    private int orientation_;
    private int os_;
    private long samplingDenominator_;
    private e9 showingAdsStats_;
    private int targetVersion_;
    private long thresholdMemoryBytes_;
    private long timeMsec_;
    private int totalCpu_;
    private long totalMemoryBytes_;
    private boolean trapped_;
    private int experimentIdMemoizedSerializedSize = -1;
    private String name_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String exceptionClass_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String topException_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String stacktrace_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String sdkVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String afmaVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String webViewVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String appName_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String appVersionName_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String appId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String osVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String deviceModel_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String country_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private b.k8 experimentId_ = wm1.f11335e;
    private String sessionId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String requestId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String adId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String backendQueryId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String gwsQueryId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String mediationAdapter_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String mediationAdapterVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String plugin_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String stackTraceHash_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String requestAgent_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String unityEditorVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        kv0 kv0Var = new kv0();
        DEFAULT_INSTANCE = kv0Var;
        cu0.a(kv0.class, kv0Var);
    }

    public kv0() {
        in2 in2Var = in2.f4887e;
        this.loadedAdsStats_ = in2Var;
        this.showingAdsStats_ = in2Var;
        this.activeCuiStack_ = jb1.f5202e;
        this.adUnitId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public final void a(gv0 gv0Var) {
        e9 e9Var = this.loadedAdsStats_;
        if (!((j) e9Var).f5068a) {
            this.loadedAdsStats_ = k9.n(e9Var);
        }
        this.loadedAdsStats_.add(gv0Var);
    }

    public final void e(String str) {
        this.appId_ = str;
    }

    public final void i(String str) {
        this.country_ = str;
    }

    public final void j(String str) {
        String str2 = Build.MODEL;
        Objects.requireNonNull(str2);
        this.deviceModel_ = str2;
    }

    public final void k(String str) {
        this.exceptionClass_ = str;
    }

    public final void l(String str) {
        this.gwsQueryId_ = str;
    }

    public final void n(String str) {
        Objects.requireNonNull(str);
        this.mediationAdapterVersion_ = str;
    }

    public final void b(gv0 gv0Var) {
        e9 e9Var = this.showingAdsStats_;
        if (!((j) e9Var).f5068a) {
            this.showingAdsStats_ = k9.n(e9Var);
        }
        this.showingAdsStats_.add(gv0Var);
    }

    public final void c(String str) {
        Objects.requireNonNull(str);
        this.adUnitId_ = str;
    }

    public final void d(String str) {
        Objects.requireNonNull(str);
        this.afmaVersion_ = str;
    }

    public final void f(String str) {
        this.appName_ = str;
    }

    public final void g(String str) {
        this.appVersionName_ = str;
    }

    public final void h(String str) {
        this.backendQueryId_ = str;
    }

    public final void m(String str) {
        Objects.requireNonNull(str);
        this.mediationAdapter_ = str;
    }

    public final void o(String str) {
        Objects.requireNonNull(str);
        this.name_ = str;
    }

    public final void p(String str) {
        String str2 = Build.VERSION.RELEASE;
        Objects.requireNonNull(str2);
        this.osVersion_ = str2;
    }

    public final void r(String str) {
        Objects.requireNonNull(str);
        this.requestAgent_ = str;
    }

    public final void s(String str) {
        Objects.requireNonNull(str);
        this.requestId_ = str;
    }

    public final void t(String str) {
        Objects.requireNonNull(str);
        this.sdkVersion_ = str;
    }

    public final void u(String str) {
        this.sessionId_ = str;
    }

    public final void v(String str) {
        this.stackTraceHash_ = str;
    }

    public final void w(String str) {
        this.stacktrace_ = str;
    }

    public final void x(String str) {
        this.topException_ = str;
    }

    public final void y(String str) {
        this.unityEditorVersion_ = str;
    }

    public final void z(String str) {
        this.webViewVersion_ = str;
    }

    public static kv0 o() {
        return DEFAULT_INSTANCE;
    }

    public static b.c4 p() {
        return (b.c4) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u00045\u0000\u0001\u000155\u0000\u0004\u0000\u0001\u0002\u0002\u0007\u0003Ȉ\u0004Ȉ\u0005Ȉ\u0006Ȉ\u0007\f\bȈ\tȈ\nȈ\u000bȈ\fȈ\r\u0004\u000eȈ\u000fȈ\u0010%\u0011\f\u0012\u0004\u0013\u0002\u0014\f\u0015Ȉ\u0016Ȉ\u0017Ȉ\u0018Ȉ\u0019Ȉ\u001aȈ\u001bȈ\u001cȈ\u001d\u0002\u001eȈ\u001fဉ\u0000 Ȉ!\u0004\"\u0004#\u0004$\u0002%\u0002&\u0002'\u0007(ဉ\u0001)Ȉ*Ȉ+Ȉ,\u0004-\u001b.\u001b/\f0\f1\f2,3\u00044Ȉ5\f", new Object[]{"bitField0_", "timeMsec_", "trapped_", "name_", "exceptionClass_", "topException_", "stacktrace_", "os_", "sdkVersion_", "afmaVersion_", "appName_", "appId_", "osVersion_", "targetVersion_", "deviceModel_", "country_", "experimentId_", "orientation_", "networkType_", "gmsCoreVersion_", "format_", "sessionId_", "requestId_", "adId_", "backendQueryId_", "gwsQueryId_", "mediationAdapter_", "mediationAdapterVersion_", "plugin_", "samplingDenominator_", "stackTraceHash_", "deobfuscatedStacktrace_", "appVersionName_", "displayWidth_", "displayHeight_", "totalCpu_", "totalMemoryBytes_", "availableMemoryBytes_", "thresholdMemoryBytes_", "lowMemory_", "chromeVariations_", "webViewVersion_", "requestAgent_", "unityEditorVersion_", "liveWebviewCount_", "loadedAdsStats_", gv0.class, "showingAdsStats_", gv0.class, "deviceAdvertisedMemTier_", "deviceAvailableProcessorTier_", "activeCui_", "activeCuiStack_", "mediationChainLength_", "adUnitId_", "deviceAvailableMemoryTier_"});
        }
        if (iA == 3) {
            return new kv0();
        }
        if (iA != 4) {
            return null;
        }
        return new b.c4();
    }

    public final void b(String str) {
        Objects.requireNonNull(str);
        this.adId_ = str;
    }

    public final void a(yr yrVar) {
        this.chromeVariations_ = yrVar;
        this.bitField0_ |= 2;
    }
}
