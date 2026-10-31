package ads_mobile_sdk;

import b.c0;
import b.k9;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public final class cc2 {
    public Integer A;
    public final p53 B;
    public ri2 C;
    public final Boolean D;
    public final Integer E;
    public final Integer F;
    public rp3 G;
    public ch2 H;
    public n01 I;
    public wa1 J;
    public ta K;
    public vr L;
    public final wd3 M;
    public rc2 N;
    public final Integer O;
    public int Q;
    public int R;

    /* renamed from: a, reason: collision with root package name */
    public int f1787a;

    /* renamed from: b, reason: collision with root package name */
    public final mi3 f1788b;

    /* renamed from: c, reason: collision with root package name */
    public final wv0 f1789c;

    /* renamed from: d, reason: collision with root package name */
    public final List f1790d;

    /* renamed from: e, reason: collision with root package name */
    public final UUID f1791e;

    /* renamed from: f, reason: collision with root package name */
    public final int f1792f;

    /* renamed from: g, reason: collision with root package name */
    public final int f1793g;

    /* renamed from: h, reason: collision with root package name */
    public final long f1794h;

    /* renamed from: i, reason: collision with root package name */
    public final long f1795i;

    /* renamed from: j, reason: collision with root package name */
    public final long f1796j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f1797k;

    /* renamed from: l, reason: collision with root package name */
    public int f1798l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f1799m;
    public Throwable n;
    public Throwable o;

    /* renamed from: p, reason: collision with root package name */
    public long f1800p;

    /* renamed from: q, reason: collision with root package name */
    public long f1801q;

    /* renamed from: r, reason: collision with root package name */
    public long f1802r;

    /* renamed from: s, reason: collision with root package name */
    public final ArrayList f1803s;

    /* renamed from: t, reason: collision with root package name */
    public u73 f1804t;

    /* renamed from: u, reason: collision with root package name */
    public final j13 f1805u;

    /* renamed from: w, reason: collision with root package name */
    public iq1 f1806w;

    /* renamed from: x, reason: collision with root package name */
    public aw0 f1807x;

    /* renamed from: y, reason: collision with root package name */
    public cl1 f1808y;

    /* renamed from: z, reason: collision with root package name */
    public String f1809z;

    public cc2(int i5, mi3 traceMetaSet, wv0 cuiName, List tags, UUID rootTraceId, int i11, int i12, long j11, long j12, long j13, boolean z11, Boolean bool, Integer num, Integer num2, int i13) {
        Duration.Companion companion = Duration.f72038b;
        DurationUnit durationUnit = DurationUnit.f72046e;
        long jG = DurationKt.g(0, durationUnit);
        long jG2 = DurationKt.g(0, durationUnit);
        long jG3 = DurationKt.g(0, durationUnit);
        ArrayList arrayList = new ArrayList();
        Boolean bool2 = (i13 & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0 ? null : bool;
        Integer num3 = (i13 & 1073741824) != 0 ? null : num;
        Integer num4 = (i13 & Integer.MIN_VALUE) != 0 ? null : num2;
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(cuiName, "cuiName");
        Intrinsics.g(tags, "tags");
        Intrinsics.g(rootTraceId, "rootTraceId");
        this.f1787a = i5;
        this.f1788b = traceMetaSet;
        this.f1789c = cuiName;
        this.f1790d = tags;
        this.f1791e = rootTraceId;
        this.f1792f = i11;
        this.f1793g = i12;
        this.f1794h = j11;
        this.f1795i = j12;
        this.f1796j = j13;
        this.f1797k = z11;
        this.f1798l = 0;
        this.f1799m = true;
        this.n = null;
        this.o = null;
        this.f1800p = jG;
        this.f1801q = jG2;
        this.f1802r = jG3;
        this.f1803s = arrayList;
        this.f1804t = null;
        this.f1805u = null;
        this.f1806w = null;
        this.f1807x = aw0.PROCESS_STATE_UNKNOWN;
        this.f1808y = null;
        this.f1809z = null;
        this.A = null;
        this.B = null;
        this.C = null;
        this.D = bool2;
        this.E = num3;
        this.F = num4;
        this.G = null;
        this.H = null;
        this.I = null;
        this.J = null;
        this.K = null;
        this.L = null;
        this.M = null;
        this.N = null;
        this.O = -1;
        this.Q = -1;
        this.R = -1;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof cc2)) {
            return false;
        }
        cc2 cc2Var = (cc2) obj;
        return this.f1787a == cc2Var.f1787a && Intrinsics.b(this.f1788b, cc2Var.f1788b) && this.f1789c == cc2Var.f1789c && Intrinsics.b(this.f1790d, cc2Var.f1790d) && Intrinsics.b(this.f1791e, cc2Var.f1791e) && this.f1792f == cc2Var.f1792f && this.f1793g == cc2Var.f1793g && this.f1794h == cc2Var.f1794h && this.f1795i == cc2Var.f1795i && this.f1796j == cc2Var.f1796j && this.f1797k == cc2Var.f1797k && this.f1798l == cc2Var.f1798l && this.f1799m == cc2Var.f1799m && Intrinsics.b(this.n, cc2Var.n) && Intrinsics.b(this.o, cc2Var.o) && Duration.d(this.f1800p, cc2Var.f1800p) && Duration.d(this.f1801q, cc2Var.f1801q) && Duration.d(this.f1802r, cc2Var.f1802r) && Intrinsics.b(this.f1803s, cc2Var.f1803s) && Intrinsics.b(this.f1804t, cc2Var.f1804t) && Intrinsics.b(this.f1805u, cc2Var.f1805u) && Intrinsics.b(this.f1806w, cc2Var.f1806w) && this.f1807x == cc2Var.f1807x && Intrinsics.b(this.f1808y, cc2Var.f1808y) && Intrinsics.b(this.f1809z, cc2Var.f1809z) && Intrinsics.b(this.A, cc2Var.A) && Intrinsics.b(this.B, cc2Var.B) && Intrinsics.b(this.C, cc2Var.C) && Intrinsics.b(this.D, cc2Var.D) && Intrinsics.b(this.E, cc2Var.E) && Intrinsics.b(this.F, cc2Var.F) && Intrinsics.b(this.G, cc2Var.G) && Intrinsics.b(this.H, cc2Var.H) && Intrinsics.b(this.I, cc2Var.I) && Intrinsics.b(this.J, cc2Var.J) && Intrinsics.b(this.K, cc2Var.K) && Intrinsics.b(this.L, cc2Var.L) && Intrinsics.b(this.M, cc2Var.M) && Intrinsics.b(this.N, cc2Var.N) && Intrinsics.b(this.O, cc2Var.O) && this.Q == cc2Var.Q && this.R == cc2Var.R;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iD = c0.d(c0.d(c0.d(k9.b(this.f1793g, k9.b(this.f1792f, (this.f1791e.hashCode() + k9.d((this.f1789c.hashCode() + ((this.f1788b.hashCode() + (Integer.hashCode(this.f1787a) * 31)) * 31)) * 31, this.f1790d)) * 31)), 31, this.f1794h), 31, this.f1795i), 31, this.f1796j);
        boolean z11 = this.f1797k;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int i11 = (iD + i5) * 31;
        int i12 = this.f1798l;
        int iF = (i11 + (i12 == 0 ? 0 : c0.F(i12))) * 31;
        boolean z12 = this.f1799m;
        int i13 = (iF + (z12 ? 1 : z12 ? 1 : 0)) * 31;
        Throwable th2 = this.n;
        int iHashCode = (i13 + (th2 == null ? 0 : th2.hashCode())) * 31;
        Throwable th3 = this.o;
        int iHashCode2 = (iHashCode + (th3 == null ? 0 : th3.hashCode())) * 31;
        long j11 = this.f1800p;
        Duration.Companion companion = Duration.f72038b;
        int iD2 = k9.d(c0.d(c0.d(c0.d(iHashCode2, 31, j11), 31, this.f1801q), 31, this.f1802r), this.f1803s);
        u73 u73Var = this.f1804t;
        int iHashCode3 = (iD2 + (u73Var == null ? 0 : u73Var.hashCode())) * 31;
        j13 j13Var = this.f1805u;
        int iHashCode4 = (iHashCode3 + (j13Var == null ? 0 : j13Var.hashCode())) * 961;
        iq1 iq1Var = this.f1806w;
        int iHashCode5 = (this.f1807x.hashCode() + ((iHashCode4 + (iq1Var == null ? 0 : iq1Var.hashCode())) * 31)) * 31;
        cl1 cl1Var = this.f1808y;
        int iHashCode6 = (iHashCode5 + (cl1Var == null ? 0 : cl1Var.hashCode())) * 31;
        String str = this.f1809z;
        int iHashCode7 = (iHashCode6 + (str == null ? 0 : str.hashCode())) * 31;
        Integer num = this.A;
        int iHashCode8 = (iHashCode7 + (num == null ? 0 : num.hashCode())) * 31;
        p53 p53Var = this.B;
        int iHashCode9 = (iHashCode8 + (p53Var == null ? 0 : p53Var.hashCode())) * 31;
        ri2 ri2Var = this.C;
        int iHashCode10 = (iHashCode9 + (ri2Var == null ? 0 : ri2Var.hashCode())) * 31;
        Boolean bool = this.D;
        int iHashCode11 = (iHashCode10 + (bool == null ? 0 : bool.hashCode())) * 31;
        Integer num2 = this.E;
        int iHashCode12 = (iHashCode11 + (num2 == null ? 0 : num2.hashCode())) * 31;
        Integer num3 = this.F;
        int iHashCode13 = (iHashCode12 + (num3 == null ? 0 : num3.hashCode())) * 31;
        rp3 rp3Var = this.G;
        int iHashCode14 = (iHashCode13 + (rp3Var == null ? 0 : rp3Var.hashCode())) * 31;
        ch2 ch2Var = this.H;
        int iHashCode15 = (iHashCode14 + (ch2Var == null ? 0 : ch2Var.hashCode())) * 31;
        n01 n01Var = this.I;
        int iHashCode16 = (iHashCode15 + (n01Var == null ? 0 : n01Var.hashCode())) * 31;
        wa1 wa1Var = this.J;
        int iHashCode17 = (iHashCode16 + (wa1Var == null ? 0 : wa1Var.hashCode())) * 31;
        ta taVar = this.K;
        int iHashCode18 = (iHashCode17 + (taVar == null ? 0 : taVar.hashCode())) * 31;
        vr vrVar = this.L;
        int iHashCode19 = (iHashCode18 + (vrVar == null ? 0 : vrVar.hashCode())) * 31;
        wd3 wd3Var = this.M;
        int iHashCode20 = (iHashCode19 + (wd3Var == null ? 0 : wd3Var.hashCode())) * 31;
        rc2 rc2Var = this.N;
        int iHashCode21 = (iHashCode20 + (rc2Var == null ? 0 : rc2Var.hashCode())) * 31;
        Integer num4 = this.O;
        return Integer.hashCode(this.R) + k9.b(this.Q, (iHashCode21 + (num4 != null ? num4.hashCode() : 0)) * 961);
    }

    public final String toString() {
        String str;
        int i5 = this.f1787a;
        int i11 = this.f1798l;
        boolean z11 = this.f1799m;
        Throwable th2 = this.n;
        Throwable th3 = this.o;
        String strR = Duration.r(this.f1800p);
        String strR2 = Duration.r(this.f1801q);
        String strR3 = Duration.r(this.f1802r);
        u73 u73Var = this.f1804t;
        iq1 iq1Var = this.f1806w;
        aw0 aw0Var = this.f1807x;
        cl1 cl1Var = this.f1808y;
        String str2 = this.f1809z;
        Integer num = this.A;
        ri2 ri2Var = this.C;
        rp3 rp3Var = this.G;
        ch2 ch2Var = this.H;
        n01 n01Var = this.I;
        wa1 wa1Var = this.J;
        ta taVar = this.K;
        vr vrVar = this.L;
        rc2 rc2Var = this.N;
        int i12 = this.Q;
        int i13 = this.R;
        StringBuilder sb2 = new StringBuilder("PerTraceMeta(id=");
        sb2.append(i5);
        sb2.append(", traceMetaSet=");
        sb2.append(this.f1788b);
        sb2.append(", cuiName=");
        sb2.append(this.f1789c);
        sb2.append(", tags=");
        sb2.append(this.f1790d);
        sb2.append(", rootTraceId=");
        sb2.append(this.f1791e);
        sb2.append(", parentTraceId=");
        sb2.append(this.f1792f);
        sb2.append(", traceDepth=");
        sb2.append(this.f1793g);
        sb2.append(", startTimeMillis=");
        sb2.append(this.f1794h);
        c0.B(sb2, ", timeSinceSdkInitStartMillis=", this.f1795i, ", timeSinceSdkInitCompleteMillis=");
        sb2.append(this.f1796j);
        sb2.append(", useAsyncAndroidTrace=");
        sb2.append(this.f1797k);
        sb2.append(", gmsgName=");
        switch (i11) {
            case 1:
                str = "GMSG_NAME_UNKNOWN";
                break;
            case 2:
                str = "GMSG_NAME_SDK_CORE_LOADED";
                break;
            case 3:
                str = "GMSG_NAME_RESULT";
                break;
            case 4:
                str = "GMSG_NAME_OPEN";
                break;
            case 5:
                str = "GMSG_NAME_CLICK";
                break;
            case 6:
                str = "GMSG_NAME_HTTP_TRACK";
                break;
            case 7:
                str = "GMSG_NAME_REFRESH";
                break;
            case 8:
                str = "GMSG_DELAY_PAGE_LOADED";
                break;
            case 9:
                str = "GMSG_DELAY_PAGE_CLOSED";
                break;
            case 10:
                str = "GMSG_VIDEO_METADATA";
                break;
            case 11:
                str = "GMSG_VIDEO";
                break;
            case 12:
                str = "GMSG_UPDATE_CONSENT_ALLOWLIST";
                break;
            case 13:
                str = "GMSG_APP_EVENT";
                break;
            case 14:
                str = "GMSG_TOUCH_EVENT";
                break;
            case 15:
                str = "GMSG_INTERSTITIAL_PROPERTIES";
                break;
            case 16:
                str = "GMSG_CUSTOM_CLOSE";
                break;
            case 17:
                str = "GMSG_CLOSE";
                break;
            case 18:
                str = "GMSG_BACK_BUTTON";
                break;
            case 19:
                str = "GMSG_REWARD";
                break;
            case 20:
                str = "GMSG_AD_METADATA_CHANGED";
                break;
            case 21:
                str = "GMSG_INSTRUMENT";
                break;
            case 22:
                str = "GMSG_CAN_OPEN_URLS";
                break;
            case 23:
                str = "GMSG_H5";
                break;
            case 24:
                str = "GMSG_VIEW_LOCATION";
                break;
            case 25:
                str = "GMSG_MRAID_LOADED";
                break;
            case 26:
                str = "GMSG_MRAID";
                break;
            case 27:
                str = "GMSG_RESET_PAID";
                break;
            case 28:
                str = "GMSG_SET_PAIDV2_PERSONALIZATION_ENABLED";
                break;
            case 29:
                str = "GMSG_LOG";
                break;
            case 30:
                str = "GMSG_NATIVE_IMPRESSION";
                break;
            case 31:
                str = "GMSG_TRACK_ACTIVE_VIEW_UNIT";
                break;
            case 32:
                str = "GMSG_UNTRACK_ACTIVE_VIEW_UNIT";
                break;
            case 33:
                str = "GMSG_CAN_OPEN_INTENTS";
                break;
            case 34:
                str = "GMSG_CAN_OPEN_APP";
                break;
            case 35:
                str = "GMSG_CUSTOM_CLICK";
                break;
            case 36:
                str = "GMSG_NATIVE_CLICK_RECORDED";
                break;
            case 37:
                str = "GMSG_NATIVE_AD_VIEW_SIGNALS";
                break;
            case 38:
                str = "GMSG_NATIVE_CLICK_META";
                break;
            case 39:
                str = "GMSG_NATIVE_VIDEO_CLICKED";
                break;
            case 40:
                str = "GMSG_INSPECTOR_SET_APPLICATION_STATE";
                break;
            case 41:
                str = "GMSG_INSPECTOR_SINGLE_AD_SOURCE_TEST";
                break;
            case 42:
                str = "GMSG_INSPECTOR_UI_STORAGE";
                break;
            case 43:
                str = "GMSG_SHARE_SHEET";
                break;
            case 44:
                str = "GMSG_OUT_OF_CONTEXT_TESTING";
                break;
            case 45:
                str = "GMSG_HIDE_OVERLAY";
                break;
            case 46:
                str = "GMSG_SHOW_OVERLAY";
                break;
            case 47:
                str = "GMSG_LOAD_OVERLAY_HTML";
                break;
            case 48:
                str = "GMSG_SEND_MESSAGE_TO_NATIVE_JS";
                break;
            case 49:
                str = "GMSG_LOG_SCION_EVENT";
                break;
            case 50:
                str = "GMSG_HIDE_VALIDATOR_OVERLAY";
                break;
            case 51:
                str = "GMSG_LOAD_NATIVE_AD_POLICY_VIOLATIONS";
                break;
            case 52:
                str = "GMSG_SHOW_VALIDATOR_OVERLAY";
                break;
            case 53:
                str = "GMSG_IN_MEMORY_SDK_CORE_DATA";
                break;
            case 54:
                str = "GMSG_PERSISTENT_SDK_CORE_DATA";
                break;
            case 55:
                str = "GMSG_FLUID_HEIGHT";
                break;
            case 56:
                str = "GMSG_NATIVE_IMPRESSION_FLOW_CONTROL";
                break;
            case 57:
                str = "UNRECOGNIZED";
                break;
            default:
                str = AbstractJsonLexerKt.NULL;
                break;
        }
        sb2.append(str);
        sb2.append(", isSuccess=");
        sb2.append(z11);
        sb2.append(", exception=");
        sb2.append(th2);
        sb2.append(", causingException=");
        sb2.append(th3);
        c0.D(sb2, ", latency=", strR, ", cpuTime=", strR2);
        sb2.append(", childCpuTime=");
        sb2.append(strR3);
        sb2.append(", errorMessages=");
        sb2.append(this.f1803s);
        sb2.append(", signalMeta=");
        sb2.append(u73Var);
        sb2.append(", scarCacheEvictionData=");
        sb2.append(this.f1805u);
        sb2.append(", h5Data=null, mraidData=");
        sb2.append(iq1Var);
        sb2.append(", processState=");
        sb2.append(aw0Var);
        sb2.append(", jsEngineData=");
        sb2.append(cl1Var);
        sb2.append(", cronetProvider=");
        sb2.append(str2);
        sb2.append(", customTabsNavigationEvent=");
        sb2.append(num);
        sb2.append(", signalCacheData=");
        sb2.append(this.B);
        sb2.append(", preloadData=");
        sb2.append(ri2Var);
        sb2.append(", hasNetworkConnectivity=");
        sb2.append(this.D);
        sb2.append(", networkType=");
        sb2.append(this.E);
        sb2.append(", networkTypeCoarse=");
        sb2.append(this.F);
        sb2.append(", webViewData=");
        sb2.append(rp3Var);
        sb2.append(", postClickLifecycleMonitoringData=");
        sb2.append(ch2Var);
        sb2.append(", hsdpServiceData=");
        sb2.append(n01Var);
        sb2.append(", installReferrerDetails=");
        sb2.append(wa1Var);
        sb2.append(", adapterInitializationData=");
        sb2.append(taVar);
        sb2.append(", centralizedManagerPreloadData=");
        sb2.append(vrVar);
        sb2.append(", swipeableInterstitialSettleData=");
        sb2.append(this.M);
        sb2.append(", persistentCacheEventData=");
        sb2.append(rc2Var);
        sb2.append(", liveWebViewCount=");
        sb2.append(this.O);
        sb2.append(", contentProviderType=null, previousAppExitReason=");
        sb2.append(i12);
        sb2.append(", previousAppExitSignal=");
        sb2.append(i13);
        sb2.append(")");
        return sb2.toString();
    }
}
