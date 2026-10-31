package com.vungle.ads.internal.network;

import android.app.UiModeManager;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.security.NetworkSecurityPolicy;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;
import android.webkit.URLUtil;
import androidx.annotation.Keep;
import com.vungle.ads.VungleAdSize;
import com.vungle.ads.VungleAds;
import com.vungle.ads.VungleCSBData;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.ConfigManager;
import com.vungle.ads.internal.l2;
import com.vungle.ads.internal.model.a1;
import com.vungle.ads.internal.model.b3;
import com.vungle.ads.internal.model.c3;
import com.vungle.ads.internal.model.d1;
import com.vungle.ads.internal.model.d3;
import com.vungle.ads.internal.model.h1;
import com.vungle.ads.internal.model.j0;
import com.vungle.ads.internal.model.j3;
import com.vungle.ads.internal.model.k1;
import com.vungle.ads.internal.model.m0;
import com.vungle.ads.internal.model.n1;
import com.vungle.ads.internal.model.q1;
import com.vungle.ads.internal.model.t1;
import com.vungle.ads.internal.model.u0;
import com.vungle.ads.internal.model.u1;
import com.vungle.ads.internal.model.x0;
import com.vungle.ads.internal.network.VungleApiClient;
import com.vungle.ads.internal.persistence.FilePreferences;
import com.vungle.ads.internal.privacy.COPPA;
import com.vungle.ads.internal.privacy.PrivacyConsent;
import com.vungle.ads.internal.privacy.PrivacyManager;
import com.vungle.ads.internal.protos.Sdk;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.ranges.IntRange;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializersKt;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonElementKt;
import kotlinx.serialization.json.JsonKt;
import kotlinx.serialization.json.JsonObject;
import kotlinx.serialization.json.JsonObjectBuilder;
import org.jetbrains.annotations.NotNull;
import x80.h0;
import x80.i0;
import x80.k0;
import x80.o0;
import x80.p0;
import x80.x;

@Metadata(bv = {}, d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/vungle/ads/internal/network/VungleApiClient;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "com/vungle/ads/internal/network/u", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes.dex */
public final class VungleApiClient {

    @Keep
    @NotNull
    private static final String BASE_URL = "https://config.ads.vungle.com/";

    @Keep
    private static final boolean interceptorEnabled = false;

    /* renamed from: a, reason: collision with root package name */
    public final Context f47212a;

    /* renamed from: b, reason: collision with root package name */
    public final com.vungle.ads.internal.platform.f f47213b;

    /* renamed from: c, reason: collision with root package name */
    public final FilePreferences f47214c;

    /* renamed from: d, reason: collision with root package name */
    public e0 f47215d;

    /* renamed from: e, reason: collision with root package name */
    public e0 f47216e;

    /* renamed from: f, reason: collision with root package name */
    public c3 f47217f;

    /* renamed from: g, reason: collision with root package name */
    public j0 f47218g;

    /* renamed from: h, reason: collision with root package name */
    public m0 f47219h;

    /* renamed from: i, reason: collision with root package name */
    public String f47220i;

    /* renamed from: j, reason: collision with root package name */
    public Boolean f47221j;

    /* renamed from: k, reason: collision with root package name */
    public final Lazy f47222k;

    /* renamed from: l, reason: collision with root package name */
    public ConcurrentHashMap f47223l;

    /* renamed from: m, reason: collision with root package name */
    public x80.y f47224m;

    @Keep
    @NotNull
    private static final Set<x80.y> networkInterceptors = new HashSet();

    @Keep
    @NotNull
    private static final Set<x80.y> logInterceptors = new HashSet();
    public static final Json n = JsonKt.Json$default(null, s.f47288a, 1, null);

    public VungleApiClient(Context applicationContext, com.vungle.ads.internal.platform.f platform, FilePreferences filePreferences) {
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(platform, "platform");
        Intrinsics.g(filePreferences, "filePreferences");
        this.f47212a = applicationContext;
        this.f47213b = platform;
        this.f47214c = filePreferences;
        this.f47220i = System.getProperty("http.agent");
        this.f47222k = LazyKt.b(LazyThreadSafetyMode.f71679a, new a0(applicationContext));
        this.f47223l = new ConcurrentHashMap();
        this.f47224m = new x80.y() { // from class: g40.a
            @Override // x80.y
            public final x80.m0 intercept(x xVar) {
                return VungleApiClient.a(this.f57167a, xVar);
            }
        };
        x80.d0 d0Var = new x80.d0();
        TimeUnit timeUnit = TimeUnit.SECONDS;
        d0Var.d(60L, timeUnit);
        d0Var.c(60L, timeUnit);
        d0Var.a(this.f47224m);
        v vVar = new v();
        if (!vVar.equals(d0Var.f95444m)) {
            d0Var.B = null;
        }
        d0Var.f95444m = vVar;
        if (interceptorEnabled) {
            Iterator<x80.y> it = logInterceptors.iterator();
            while (it.hasNext()) {
                d0Var.a(it.next());
            }
            for (x80.y interceptor : networkInterceptors) {
                Intrinsics.g(interceptor, "interceptor");
                d0Var.f95435d.add(interceptor);
            }
        }
        x80.e0 e0Var = new x80.e0(d0Var);
        d0Var.a(new u());
        x80.e0 e0Var2 = new x80.e0(d0Var);
        this.f47216e = new e0(e0Var);
        this.f47215d = new e0(e0Var2);
    }

    public static final x80.m0 a(VungleApiClient this$0, x80.x chain) throws NumberFormatException {
        x80.m0 m0Var;
        x80.f0 f0Var = x80.f0.HTTP_1_1;
        Intrinsics.g(this$0, "this$0");
        Intrinsics.g(chain, "chain");
        h0 h0Var = ((c90.f) chain).f19892e;
        try {
            try {
                x80.m0 m0VarB = ((c90.f) chain).b(h0Var);
                String strB = m0VarB.f95558f.b("Retry-After");
                if (strB == null || strB.length() == 0) {
                    return m0VarB;
                }
                try {
                    long j11 = Long.parseLong(strB);
                    if (j11 <= 0) {
                        return m0VarB;
                    }
                    String strC = h0Var.f95509a.c();
                    long jCurrentTimeMillis = (j11 * 1000) + System.currentTimeMillis();
                    if (!r70.j.A0(strC, "ads", false)) {
                        return m0VarB;
                    }
                    String strA = a(h0Var.f95512d);
                    if (strA.length() <= 0) {
                        return m0VarB;
                    }
                    this$0.f47223l.put(strA, Long.valueOf(jCurrentTimeMillis));
                    return m0VarB;
                } catch (Exception unused) {
                    boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                    com.vungle.ads.internal.util.t.a("VungleApiClient", "Retry-After value is not an valid value");
                    return m0VarB;
                }
            } catch (OutOfMemoryError unused2) {
                boolean z12 = com.vungle.ads.internal.util.u.f47714a;
                StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("OOM for ");
                sbA.append(h0Var.f95509a);
                com.vungle.ads.internal.util.t.b("VungleApiClient", sbA.toString());
                p0.Companion.getClass();
                m0Var = new x80.m0(h0Var, f0Var, "OOM", 500, null, new x80.u((String[]) new ArrayList(20).toArray(new String[0])), o0.c(new byte[0], null), null, null, null, 0L, 0L, null);
                return m0Var;
            }
        } catch (Exception e3) {
            boolean z13 = com.vungle.ads.internal.util.u.f47714a;
            StringBuilder sbA2 = com.iab.omid.library.vungle.internal.l.a("Exception: ");
            sbA2.append(e3.getMessage());
            sbA2.append(" for ");
            sbA2.append(h0Var.f95509a);
            com.vungle.ads.internal.util.t.b("VungleApiClient", sbA2.toString());
            ArrayList arrayList = new ArrayList(20);
            o0 o0Var = p0.Companion;
            Pattern pattern = x80.a0.f95396e;
            x80.a0 a0VarB = x80.z.b("application/json");
            o0Var.getClass();
            m0Var = new x80.m0(h0Var, f0Var, "Server is busy", 500, null, new x80.u((String[]) arrayList.toArray(new String[0])), o0.a("{\"Error\":\"Server is busy\"}", a0VarB), null, null, null, 0L, 0L, null);
            return m0Var;
        }
    }

    public final long b(String placementID) {
        Intrinsics.g(placementID, "placementID");
        Long l9 = (Long) this.f47223l.get(placementID);
        if (l9 != null) {
            return l9.longValue();
        }
        return 0L;
    }

    public final synchronized void c(String appId) {
        PackageInfo packageInfo;
        try {
            Intrinsics.g(appId, "appId");
            f0.a(appId);
            String str = "1.0";
            try {
                if (Build.VERSION.SDK_INT >= 33) {
                    packageInfo = this.f47212a.getPackageManager().getPackageInfo(this.f47212a.getPackageName(), PackageManager.PackageInfoFlags.of(0L));
                    Intrinsics.f(packageInfo, "{\n                    ap…      )\n                }");
                } else {
                    packageInfo = this.f47212a.getPackageManager().getPackageInfo(this.f47212a.getPackageName(), 0);
                    Intrinsics.f(packageInfo, "{\n                    ap…      )\n                }");
                }
                String str2 = packageInfo.versionName;
                Intrinsics.f(str2, "packageInfo.versionName");
                str = str2;
            } catch (Exception unused) {
            }
            f0.b(str);
            this.f47217f = a(this.f47212a);
            String packageName = this.f47212a.getPackageName();
            Intrinsics.f(packageName, "applicationContext.packageName");
            this.f47219h = new m0(packageName, str, appId);
            this.f47221j = d();
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final Boolean d() {
        Boolean boolValueOf;
        boolean z11;
        try {
            try {
                pg.c cVar = pg.c.f82562b;
                Intrinsics.f(cVar, "getInstance()");
                z11 = cVar.b(this.f47212a, pg.c.f82561a) == 0;
                boolValueOf = Boolean.valueOf(z11);
            } catch (NoClassDefFoundError unused) {
                boolean z12 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("VungleApiClient", "Play services Not available");
                boolValueOf = Boolean.FALSE;
                try {
                    this.f47214c.a(false, "isPlaySvcAvailable").b();
                } catch (Exception unused2) {
                    boolean z13 = com.vungle.ads.internal.util.u.f47714a;
                    com.vungle.ads.internal.util.t.c("VungleApiClient", "Failure to write GPS availability to DB");
                }
                return boolValueOf;
            }
            try {
                this.f47214c.a(z11, "isPlaySvcAvailable").b();
                return boolValueOf;
            } catch (Exception unused3) {
                boolean z14 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("VungleApiClient", "Unexpected exception from Play services lib.");
                return boolValueOf;
            }
        } catch (Exception unused4) {
            boolValueOf = null;
        }
    }

    public final n1 b(boolean z11) {
        String strA;
        String configExtension = ConfigManager.INSTANCE.getConfigExtension();
        if (configExtension != null && configExtension.length() == 0) {
            configExtension = this.f47214c.getString("config_extension");
        }
        if (z11) {
            try {
                strA = ((com.vungle.ads.internal.signals.j) this.f47222k.getValue()).a();
            } catch (Exception e3) {
                boolean z12 = com.vungle.ads.internal.util.u.f47714a;
                StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Couldn't convert signals for sending. Error: ");
                sbA.append(e3.getMessage());
                com.vungle.ads.internal.util.t.b("VungleApiClient", sbA.toString());
            }
        } else {
            strA = null;
        }
        if ((configExtension == null || configExtension.length() == 0) && (strA == null || strA.length() == 0)) {
            return null;
        }
        ConfigManager.INSTANCE.getClass();
        return new n1(configExtension, strA, Long.valueOf(ConfigManager.b()));
    }

    public final void d(String adMarkup) {
        Intrinsics.g(adMarkup, "adMarkup");
        e0 e0Var = this.f47216e;
        x80.j0 j0Var = k0.Companion;
        Pattern pattern = x80.a0.f95396e;
        x80.a0 a0VarB = x80.z.b("application/json");
        j0Var.getClass();
        e0Var.a(x80.j0.a(adMarkup, a0VarB)).a(new z());
    }

    public final String b() {
        if (o4.a.a(this.f47212a, "android.permission.ACCESS_NETWORK_STATE") != 0) {
            return null;
        }
        Object systemService = this.f47212a.getSystemService("connectivity");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) systemService).getActiveNetworkInfo();
        if (activeNetworkInfo != null) {
            int type = activeNetworkInfo.getType();
            if (type == 0) {
                return "MOBILE";
            }
            if (type == 1 || type == 6) {
                return "WIFI";
            }
            if (type == 7) {
                return "BLUETOOTH";
            }
            if (type != 9) {
                return "UNKNOWN";
            }
            return "ETHERNET";
        }
        return "NONE";
    }

    public static t1 c(boolean z11) {
        String value;
        t1 t1Var = new t1(null, null, null, null, null);
        PrivacyManager.INSTANCE.getClass();
        String strB = PrivacyManager.b();
        String str = PrivacyManager.f47437e;
        if (str == null) {
            str = "no_interaction";
        }
        String str2 = str;
        String str3 = PrivacyManager.f47438f;
        String str4 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        String str5 = str3 == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str3;
        Long l9 = PrivacyManager.f47439g;
        t1Var.f47150a = new h1(l9 != null ? l9.longValue() : 0L, strB, str2, str5);
        PrivacyConsent privacyConsent = PrivacyManager.f47440h;
        if (privacyConsent == null || (value = privacyConsent.getValue()) == null) {
            value = PrivacyConsent.UNKNOWN.getValue();
        }
        t1Var.f47151b = new x0(value);
        if (PrivacyManager.c() != COPPA.COPPA_NOTSET) {
            t1Var.f47152c = new a1(PrivacyManager.c().getValue());
        }
        if (PrivacyManager.f()) {
            SharedPreferences sharedPreferences = PrivacyManager.f47442j;
            String string = sharedPreferences != null ? sharedPreferences.getString("IABTCF_TCString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b) : null;
            if (string != null) {
                str4 = string;
            }
            t1Var.f47154e = new k1(str4);
        }
        if (z11) {
            t1Var.f47153d = VungleAds.firstPartyData;
        }
        return t1Var;
    }

    public static String a(k0 k0Var) {
        String strP;
        List listA;
        m90.g gVar;
        try {
            Json json = n;
            try {
                gVar = new m90.g();
            } catch (Exception unused) {
            }
            if (k0Var != null) {
                k0Var.writeTo(gVar);
                strP = gVar.P();
            } else {
                strP = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            KSerializer<Object> kSerializerSerializer = SerializersKt.serializer(json.getSerializersModule(), Reflection.b(u1.class));
            Intrinsics.e(kSerializerSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<T of kotlinx.serialization.internal.Platform_commonKt.cast>");
            q1 q1VarC = ((u1) json.decodeFromString(kSerializerSerializer, strP)).c();
            if (q1VarC == null || (listA = q1VarC.a()) == null) {
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            String str = (String) listA.get(0);
            return str == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str;
        } catch (Exception unused2) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }

    public final String c() {
        if (o4.a.a(this.f47212a, "android.permission.ACCESS_NETWORK_STATE") != 0) {
            return null;
        }
        Object systemService = this.f47212a.getSystemService("connectivity");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) systemService).getActiveNetworkInfo();
        if (activeNetworkInfo == null) {
            return "unknown";
        }
        int subtype = activeNetworkInfo.getSubtype();
        if (subtype == 1) {
            return "gprs";
        }
        if (subtype == 2) {
            return "edge";
        }
        if (subtype == 20) {
            return "5g";
        }
        switch (subtype) {
            case 4:
                break;
            case 5:
                break;
            case 6:
                break;
            case 7:
                break;
            case 8:
                break;
            case 9:
                break;
            default:
                switch (subtype) {
                }
        }
        return "unknown";
    }

    public final boolean a(String placementID) {
        Intrinsics.g(placementID, "placementID");
        Long l9 = (Long) this.f47223l.get(placementID);
        if ((l9 != null ? l9.longValue() : 0L) > System.currentTimeMillis()) {
            return true;
        }
        this.f47223l.remove(placementID);
        return false;
    }

    public final m a() {
        m0 m0Var = this.f47219h;
        if (m0Var == null) {
            return null;
        }
        u1 u1Var = new u1(a(true), m0Var, c(false));
        n1 n1VarB = b(false);
        if (n1VarB != null) {
            u1Var.a(n1VarB);
        }
        com.vungle.ads.internal.util.m mVar = com.vungle.ads.internal.util.n.f47696a;
        String strConcat = BASE_URL;
        if (!com.vungle.ads.internal.util.n.a(strConcat)) {
            strConcat = "https://config.ads.vungle.com/";
        }
        if (!r70.j.A0(strConcat, "/", false)) {
            strConcat = strConcat.concat("/");
        }
        return this.f47216e.b(f0.d(), strConcat + "config", u1Var);
    }

    public final m a(String placement, VungleAdSize vungleAdSize) {
        Intrinsics.g(placement, "placement");
        String adsEndpoint = ConfigManager.INSTANCE.getAdsEndpoint();
        u1 u1VarA = a(!ConfigManager.t(), ConfigManager.d());
        q1 q1Var = new q1(ul.b.P(placement), (Long) null, (String) null, (String) null, (String) null, (d1) null, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
        if (vungleAdSize != null) {
            q1Var.a(new u0(vungleAdSize.getWidth(), vungleAdSize.getHeight()));
        }
        u1VarA.a(q1Var);
        return this.f47215d.a(f0.d(), adsEndpoint, u1VarA);
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x007e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final m a(String placement, VungleAdSize vungleAdSize, VungleCSBData vungleCSBData) {
        d1 d1Var;
        JsonObject jsonObjectBuild;
        Intrinsics.g(placement, "placement");
        ConfigManager.INSTANCE.getClass();
        String strE = ConfigManager.e();
        u1 u1VarA = a(!ConfigManager.t(), ConfigManager.d());
        if (vungleCSBData != null) {
            Map<String, String> extras = vungleCSBData.getExtras();
            if (extras == null) {
                jsonObjectBuild = null;
                d1Var = new d1(vungleCSBData.getBidFloor(), vungleCSBData.getPhase(), vungleCSBData.getIsVXWinner(), vungleCSBData.getAuctionId(), vungleCSBData.getCreativeId(), vungleCSBData.getAdUnitId(), jsonObjectBuild != null ? jsonObjectBuild.toString() : null);
            } else {
                if (extras.isEmpty()) {
                    extras = null;
                }
                if (extras != null) {
                    JsonObjectBuilder jsonObjectBuilder = new JsonObjectBuilder();
                    for (Map.Entry<String, String> entry : extras.entrySet()) {
                        jsonObjectBuilder.put(entry.getKey(), JsonElementKt.JsonPrimitive(entry.getValue()));
                    }
                    jsonObjectBuild = jsonObjectBuilder.build();
                }
                d1Var = new d1(vungleCSBData.getBidFloor(), vungleCSBData.getPhase(), vungleCSBData.getIsVXWinner(), vungleCSBData.getAuctionId(), vungleCSBData.getCreativeId(), vungleCSBData.getAdUnitId(), jsonObjectBuild != null ? jsonObjectBuild.toString() : null);
            }
        } else {
            d1Var = null;
        }
        q1 q1Var = new q1(ul.b.P(placement), (Long) null, (String) null, (String) null, (String) null, d1Var, 62);
        if (vungleAdSize != null) {
            q1Var.a(new u0(vungleAdSize.getWidth(), vungleAdSize.getHeight()));
        }
        u1VarA.a(q1Var);
        return this.f47215d.a(f0.d(), strE, u1VarA);
    }

    public final m a(q1 request) {
        m0 m0Var;
        Intrinsics.g(request, "request");
        ConfigManager.INSTANCE.getClass();
        String strO = ConfigManager.o();
        if (strO == null || strO.length() == 0 || (m0Var = this.f47219h) == null) {
            return null;
        }
        u1 u1Var = new u1(a(false), m0Var, c(false));
        u1Var.a(request);
        n1 n1VarB = b(false);
        if (n1VarB != null) {
            u1Var.a(n1VarB);
        }
        return this.f47216e.c(f0.d(), strO, u1Var);
    }

    public final d3 a(String url, Map map, String str, g requestType, com.vungle.ads.internal.util.s sVar) {
        i0 i0VarA;
        x80.m0 m0VarE;
        Intrinsics.g(url, "url");
        Intrinsics.g(requestType, "requestType");
        if (!com.vungle.ads.internal.util.n.a(url)) {
            return new d3("Invalid URL", true, false, 4);
        }
        try {
            if (!NetworkSecurityPolicy.getInstance().isCleartextTrafficPermitted(new URL(url).getHost()) && URLUtil.isHttpUrl(url)) {
                return new d3("Clear Text Traffic is blocked", false, false, 6);
            }
            try {
                String str2 = this.f47220i;
                if (str2 == null) {
                    str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                String str3 = str2;
                if (str != null) {
                    x80.j0 j0Var = k0.Companion;
                    Pattern pattern = x80.a0.f95396e;
                    x80.a0 a0VarB = x80.z.b("application/json");
                    j0Var.getClass();
                    i0VarA = x80.j0.a(str, a0VarB);
                } else {
                    i0VarA = null;
                }
                o oVarA = this.f47216e.a(str3, url, requestType, map, i0VarA).a();
                if (oVarA != null && oVarA.c()) {
                    return null;
                }
                Integer numValueOf = (oVarA == null || (m0VarE = oVarA.e()) == null) ? null : Integer.valueOf(m0VarE.f95556d);
                if (b70.g.O0(ul.b.Q(301, 302, Integer.valueOf(Sdk.SDKError.Reason.AD_EXPIRED_ON_PLAY_VALUE), Integer.valueOf(Sdk.SDKError.Reason.AD_WIN_NOTIFICATION_ERROR_VALUE)), numValueOf)) {
                    AnalyticsClient.a(AnalyticsClient.INSTANCE, Sdk.SDKMetric.SDKMetricType.NOTIFICATION_REDIRECT, 0L, sVar, url, 2);
                    return null;
                }
                boolean z11 = numValueOf != null && new IntRange(500, 599, 1).g(numValueOf.intValue());
                StringBuilder sb2 = new StringBuilder("unsuccessful response, error code: ");
                sb2.append(numValueOf);
                sb2.append(", message: ");
                sb2.append(oVarA != null ? oVarA.d() : null);
                return new d3(sb2.toString(), false, z11, 2);
            } catch (Throwable th2) {
                String localizedMessage = th2.getLocalizedMessage();
                if (localizedMessage == null) {
                    localizedMessage = "IOException";
                }
                return new d3(localizedMessage, false, true, 2);
            }
        } catch (MalformedURLException e3) {
            String localizedMessage2 = e3.getLocalizedMessage();
            if (localizedMessage2 == null) {
                localizedMessage2 = "MalformedURLException";
            }
            return new d3(localizedMessage2, true, false, 4);
        }
    }

    public final void a(LinkedBlockingQueue metrics, com.vungle.ads.internal.y requestListener) {
        Intrinsics.g(metrics, "metrics");
        Intrinsics.g(requestListener, "requestListener");
        ConfigManager.INSTANCE.getClass();
        String strN = ConfigManager.n();
        if (strN.length() == 0) {
            requestListener.a();
            return;
        }
        LinkedBlockingQueue linkedBlockingQueue = new LinkedBlockingQueue();
        Iterator it = metrics.iterator();
        while (it.hasNext()) {
            Sdk.SDKMetric.Builder builder = (Sdk.SDKMetric.Builder) it.next();
            builder.setSessionId(((com.vungle.ads.internal.signals.j) this.f47222k.getValue()).d());
            ConfigManager configManager = ConfigManager.INSTANCE;
            String placementReferenceId = builder.getPlacementReferenceId();
            configManager.getClass();
            j3 j3VarA = ConfigManager.a(placementReferenceId);
            if (j3VarA != null) {
                String strC = j3VarA.c();
                if (strC == null) {
                    strC = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                builder.setPlacementType(strC);
            }
            String strB = b();
            if (strB != null) {
                builder.setConnectionType(strB);
            }
            String strC2 = c();
            if (strC2 != null) {
                builder.setConnectionTypeDetail(strC2);
            }
            Sdk.SDKMetric sDKMetric = (Sdk.SDKMetric) builder.build();
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Sending Metric: ");
            sbA.append(sDKMetric.getType());
            com.vungle.ads.internal.util.t.b("VungleApiClient", sbA.toString());
            linkedBlockingQueue.add(sDKMetric);
        }
        Sdk.MetricBatch metricBatch = (Sdk.MetricBatch) Sdk.MetricBatch.newBuilder().addAllMetrics(linkedBlockingQueue).build();
        x80.j0 j0Var = k0.Companion;
        Pattern pattern = x80.a0.f95396e;
        x80.a0 a0VarB = x80.z.b("application/x-protobuf");
        byte[] byteArray = metricBatch.toByteArray();
        Intrinsics.f(byteArray, "batch.toByteArray()");
        this.f47216e.b(f0.d(), strN, x80.j0.c(j0Var, a0VarB, byteArray, 0, 12)).a(new y(requestListener));
    }

    public final void a(LinkedBlockingQueue errors, com.vungle.ads.internal.x requestListener) {
        Intrinsics.g(errors, "errors");
        Intrinsics.g(requestListener, "requestListener");
        ConfigManager.INSTANCE.getClass();
        String strH = ConfigManager.h();
        if (strH.length() == 0) {
            requestListener.a();
            return;
        }
        LinkedBlockingQueue linkedBlockingQueue = new LinkedBlockingQueue();
        Iterator it = errors.iterator();
        while (it.hasNext()) {
            Sdk.SDKError.Builder builder = (Sdk.SDKError.Builder) it.next();
            builder.setSessionId(((com.vungle.ads.internal.signals.j) this.f47222k.getValue()).d());
            ConfigManager configManager = ConfigManager.INSTANCE;
            String placementReferenceId = builder.getPlacementReferenceId();
            configManager.getClass();
            j3 j3VarA = ConfigManager.a(placementReferenceId);
            if (j3VarA != null) {
                String strC = j3VarA.c();
                if (strC == null) {
                    strC = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                builder.setPlacementType(strC);
            }
            String strB = b();
            if (strB != null) {
                builder.setConnectionType(strB);
            }
            String strC2 = c();
            if (strC2 != null) {
                builder.setConnectionTypeDetail(strC2);
            }
            Sdk.SDKError sDKError = (Sdk.SDKError) builder.build();
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Sending Error: ");
            sbA.append(sDKError.getReason());
            com.vungle.ads.internal.util.t.b("VungleApiClient", sbA.toString());
            linkedBlockingQueue.add(sDKError);
        }
        Sdk.SDKErrorBatch sDKErrorBatch = (Sdk.SDKErrorBatch) Sdk.SDKErrorBatch.newBuilder().addAllErrors(linkedBlockingQueue).build();
        x80.j0 j0Var = k0.Companion;
        byte[] byteArray = sDKErrorBatch.toByteArray();
        Intrinsics.f(byteArray, "batch.toByteArray()");
        Pattern pattern = x80.a0.f95396e;
        x80.a0 a0VarB = x80.z.b("application/x-protobuf");
        int length = sDKErrorBatch.toByteArray().length;
        j0Var.getClass();
        this.f47216e.a(f0.d(), strH, x80.j0.b(a0VarB, byteArray, 0, length)).a(new x(requestListener));
    }

    public final c3 a(Context context) {
        DisplayMetrics displayMetrics = new DisplayMetrics();
        Object systemService = context.getSystemService("window");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.view.WindowManager");
        Display defaultDisplay = ((WindowManager) systemService).getDefaultDisplay();
        if (defaultDisplay != null) {
            defaultDisplay.getMetrics(displayMetrics);
        }
        String MANUFACTURER = Build.MANUFACTURER;
        Intrinsics.f(MANUFACTURER, "MANUFACTURER");
        String MODEL = Build.MODEL;
        Intrinsics.f(MODEL, "MODEL");
        String RELEASE = Build.VERSION.RELEASE;
        Intrinsics.f(RELEASE, "RELEASE");
        c3 c3Var = new c3(MANUFACTURER, MODEL, RELEASE, com.vungle.ads.internal.platform.a.a(context), "Amazon".equals(MANUFACTURER) ? "amazon" : "android", displayMetrics.widthPixels, displayMetrics.heightPixels, this.f47220i);
        try {
            String strJ = ((com.vungle.ads.internal.platform.c) this.f47213b).j();
            this.f47220i = strJ;
            c3Var.b(strJ);
            l2 l2Var = new l2(Sdk.SDKMetric.SDKMetricType.USER_AGENT_LOAD_DURATION_MS);
            l2Var.e();
            ((com.vungle.ads.internal.platform.c) this.f47213b).a(new w(this, l2Var));
            j0 j0VarA = this.f47218g;
            if (j0VarA == null) {
                j0VarA = ((com.vungle.ads.internal.platform.c) this.f47213b).a();
            }
            this.f47218g = j0VarA;
            return c3Var;
        } catch (Exception e3) {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Cannot Get UserAgent. Setting Default Device UserAgent.");
            sbA.append(e3.getLocalizedMessage());
            com.vungle.ads.internal.util.t.b("VungleApiClient", sbA.toString());
            return c3Var;
        }
    }

    public final u1 a(boolean z11, boolean z12) {
        u1 u1Var = new u1(a(false), this.f47219h, c(z12), null, null);
        n1 n1VarB = b(z11);
        if (n1VarB != null) {
            u1Var.f47162d = n1VarB;
        }
        return u1Var;
    }

    public final synchronized c3 a(boolean z11) {
        c3 c3VarA;
        String str;
        try {
            c3 c3VarA2 = this.f47217f;
            if (c3VarA2 == null) {
                c3VarA2 = a(this.f47212a);
                this.f47217f = c3VarA2;
            }
            c3VarA = c3.a(c3VarA2);
            b3 b3Var = new b3();
            DisplayMetrics displayMetrics = new DisplayMetrics();
            Object systemService = this.f47212a.getSystemService("window");
            Intrinsics.e(systemService, "null cannot be cast to non-null type android.view.WindowManager");
            Display defaultDisplay = ((WindowManager) systemService).getDefaultDisplay();
            if (defaultDisplay != null) {
                defaultDisplay.getMetrics(displayMetrics);
            }
            c3VarA.a(displayMetrics.heightPixels);
            c3VarA.b(displayMetrics.widthPixels);
            j0 j0VarA = this.f47218g;
            if (j0VarA == null) {
                j0VarA = ((com.vungle.ads.internal.platform.c) this.f47213b).a();
            }
            this.f47218g = j0VarA;
            String strA = j0VarA.a();
            j0 j0Var = this.f47218g;
            Boolean boolValueOf = j0Var != null ? Boolean.valueOf(j0Var.b()) : null;
            PrivacyManager.INSTANCE.getClass();
            if (PrivacyManager.e()) {
                if (strA != null) {
                    if ("Amazon".equals(Build.MANUFACTURER)) {
                        b3Var.a(strA);
                    } else {
                        b3Var.f(strA);
                    }
                    c3VarA.a(strA);
                } else {
                    c3VarA.a(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                }
            }
            if (z11 || !PrivacyManager.e()) {
                c3VarA.a((String) null);
                b3Var.f(null);
                b3Var.a((String) null);
            }
            boolean zHasSystemFeature = false;
            c3VarA.a(Intrinsics.b(boolValueOf, Boolean.TRUE) ? 1 : 0);
            if (this.f47221j == null) {
                this.f47221j = this.f47214c.a("isPlaySvcAvailable");
            }
            if (this.f47221j == null) {
                this.f47221j = d();
            }
            Boolean bool = this.f47221j;
            b3Var.a(bool != null ? bool.booleanValue() : false);
            if (PrivacyManager.a() != 2) {
                String strB = ((com.vungle.ads.internal.platform.c) this.f47213b).b();
                if (strB != null) {
                    b3Var.b(strB);
                }
                Integer numC = ((com.vungle.ads.internal.platform.c) this.f47213b).c();
                if (numC != null) {
                    b3Var.a(Integer.valueOf(numC.intValue()));
                }
            }
            Intent intentRegisterReceiver = this.f47212a.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
            if (intentRegisterReceiver != null) {
                int intExtra = intentRegisterReceiver.getIntExtra("level", -1);
                int intExtra2 = intentRegisterReceiver.getIntExtra("scale", -1);
                if (intExtra > 0 && intExtra2 > 0) {
                    b3Var.a(intExtra / intExtra2);
                }
                int intExtra3 = intentRegisterReceiver.getIntExtra("status", -1);
                if (intExtra3 == -1) {
                    str = "UNKNOWN";
                } else if (intExtra3 != 2 && intExtra3 != 5) {
                    str = "NOT_CHARGING";
                } else {
                    int intExtra4 = intentRegisterReceiver.getIntExtra("plugged", -1);
                    if (intExtra4 == 1) {
                        str = "BATTERY_PLUGGED_AC";
                    } else if (intExtra4 == 2) {
                        str = "BATTERY_PLUGGED_USB";
                    } else if (intExtra4 != 4) {
                        str = "BATTERY_PLUGGED_OTHERS";
                    } else {
                        str = "BATTERY_PLUGGED_WIRELESS";
                    }
                }
            } else {
                str = "UNKNOWN";
            }
            b3Var.c(str);
            b3Var.a(((com.vungle.ads.internal.platform.c) this.f47213b).l() ? 1 : 0);
            String strB2 = b();
            if (strB2 != null) {
                b3Var.d(strB2);
            }
            String strC = c();
            if (strC != null) {
                b3Var.e(strC);
            }
            b3Var.i(Locale.getDefault().toString());
            b3Var.h(Locale.getDefault().getLanguage());
            b3Var.j(TimeZone.getDefault().getID());
            b3Var.b(((com.vungle.ads.internal.platform.c) this.f47213b).k());
            b3Var.c(((com.vungle.ads.internal.platform.c) this.f47213b).o() ? 1 : 0);
            if ("Amazon".equals(Build.MANUFACTURER)) {
                zHasSystemFeature = this.f47212a.getPackageManager().hasSystemFeature("amazon.hardware.fire_tv");
            } else {
                Object systemService2 = this.f47212a.getSystemService("uimode");
                Intrinsics.e(systemService2, "null cannot be cast to non-null type android.app.UiModeManager");
                if (((UiModeManager) systemService2).getCurrentModeType() == 4) {
                    zHasSystemFeature = true;
                }
            }
            b3Var.b(zHasSystemFeature);
            this.f47213b.getClass();
            b3Var.a();
            b3Var.b(((com.vungle.ads.internal.platform.c) this.f47213b).m() ? 1 : 0);
            ConfigManager.INSTANCE.getClass();
            if (ConfigManager.r()) {
                b3Var.d(Long.valueOf(((com.vungle.ads.internal.platform.c) this.f47213b).i()));
                b3Var.b(Long.valueOf(((com.vungle.ads.internal.platform.c) this.f47213b).h()));
                b3Var.c(Long.valueOf(((com.vungle.ads.internal.platform.c) this.f47213b).g()));
                b3Var.a(Long.valueOf(((com.vungle.ads.internal.platform.c) this.f47213b).d()));
            }
            b3Var.g(((com.vungle.ads.internal.platform.c) this.f47213b).f());
            c3VarA.b(this.f47220i);
            c3VarA.a(b3Var);
        } catch (Throwable th2) {
            throw th2;
        }
        return c3VarA;
    }
}
