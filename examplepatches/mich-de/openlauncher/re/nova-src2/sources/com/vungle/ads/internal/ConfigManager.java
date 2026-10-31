package com.vungle.ads.internal;

import android.content.Context;
import com.vungle.ads.NetworkUnreachable;
import com.vungle.ads.internal.model.j3;
import com.vungle.ads.internal.network.VungleApiClient;
import com.vungle.ads.internal.persistence.FilePreferences;
import com.vungle.ads.internal.privacy.PrivacyManager;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializersKt;
import kotlinx.serialization.json.Json;
import org.jetbrains.annotations.NotNull;

@Metadata(bv = {}, d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\bÆ\u0002\u0018\u00002\u00020\u0001:\u0001\u0007B\t\b\u0002¢\u0006\u0004\b\u0005\u0010\u0006J\u0006\u0010\u0003\u001a\u00020\u0002J\u0006\u0010\u0004\u001a\u00020\u0002¨\u0006\n²\u0006\f\u0010\t\u001a\u00020\b8\nX\u008a\u0084\u0002"}, d2 = {"Lcom/vungle/ads/internal/ConfigManager;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getAdsEndpoint", "getConfigExtension", "<init>", "()V", "com/vungle/ads/internal/q0", "Lcom/vungle/ads/internal/network/VungleApiClient;", "vungleApiClient", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes.dex */
public final class ConfigManager {

    /* renamed from: a, reason: collision with root package name */
    public static volatile com.vungle.ads.internal.model.w2 f46715a;

    /* renamed from: b, reason: collision with root package name */
    public static volatile Map f46716b;

    /* renamed from: c, reason: collision with root package name */
    public static volatile com.vungle.ads.internal.model.i2 f46717c;

    /* renamed from: d, reason: collision with root package name */
    public static volatile List f46718d;

    /* renamed from: e, reason: collision with root package name */
    public static volatile String f46719e;

    /* renamed from: f, reason: collision with root package name */
    public static Map f46720f;

    /* renamed from: h, reason: collision with root package name */
    public static String f46722h;

    @NotNull
    public static final ConfigManager INSTANCE = new ConfigManager();

    /* renamed from: g, reason: collision with root package name */
    public static final Lazy f46721g = LazyKt.b(LazyThreadSafetyMode.f71679a, u0.f47556a);

    private ConfigManager() {
    }

    public static void b(String applicationId) {
        Intrinsics.g(applicationId, "applicationId");
        f46722h = applicationId;
    }

    public static void c() {
        ServiceLocator serviceLocator;
        Map map = f46716b;
        if (map == null || map.isEmpty() || (serviceLocator = ServiceLocator.INSTANCE) == null) {
            return;
        }
        ((com.vungle.ads.internal.executor.d) ((com.vungle.ads.internal.executor.a) serviceLocator.getService(com.vungle.ads.internal.executor.a.class))).f46820a.execute(new c40.c(map, (com.vungle.ads.internal.downloader.t) serviceLocator.getService(com.vungle.ads.internal.downloader.t.class)));
    }

    public static boolean d() {
        Boolean bool;
        com.vungle.ads.internal.model.w2 w2Var = f46715a;
        if (w2Var == null || (bool = w2Var.n) == null) {
            return true;
        }
        return bool.booleanValue();
    }

    public static String e() {
        com.vungle.ads.internal.model.i2 i2Var = f46717c;
        String str = null;
        String str2 = i2Var != null ? i2Var.f47061e : null;
        if (str2 != null && str2.length() != 0) {
            str = str2;
        }
        return str == null ? Constants.f46723a : str;
    }

    public static int f() {
        com.vungle.ads.internal.model.b2 b2Var;
        Integer num;
        com.vungle.ads.internal.model.w2 w2Var = f46715a;
        if (w2Var == null || (b2Var = w2Var.f47175a) == null || (num = b2Var.f46944b) == null) {
            return 3;
        }
        return num.intValue();
    }

    public static long g() {
        com.vungle.ads.internal.model.b2 b2Var;
        Long l9;
        com.vungle.ads.internal.model.w2 w2Var = f46715a;
        if (w2Var == null || (b2Var = w2Var.f47175a) == null || (l9 = b2Var.f46943a) == null) {
            return 1048576000L;
        }
        long j11 = 1024;
        return l9.longValue() * j11 * j11;
    }

    public static String h() {
        com.vungle.ads.internal.model.i2 i2Var = f46717c;
        String str = null;
        String str2 = i2Var != null ? i2Var.f47059c : null;
        if (str2 != null && str2.length() != 0) {
            str = str2;
        }
        return str == null ? Constants.f46724b : str;
    }

    public static String i() {
        com.vungle.ads.internal.model.v2 v2Var;
        com.vungle.ads.internal.model.l2 l2Var;
        com.vungle.ads.internal.model.w2 w2Var = f46715a;
        if (w2Var == null || (v2Var = w2Var.f47180f) == null || (l2Var = v2Var.f47170a) == null) {
            return null;
        }
        return l2Var.f47085e;
    }

    public static String j() {
        com.vungle.ads.internal.model.v2 v2Var;
        com.vungle.ads.internal.model.l2 l2Var;
        com.vungle.ads.internal.model.w2 w2Var = f46715a;
        if (w2Var == null || (v2Var = w2Var.f47180f) == null || (l2Var = v2Var.f47170a) == null) {
            return null;
        }
        return l2Var.f47086f;
    }

    public static String k() {
        com.vungle.ads.internal.model.v2 v2Var;
        com.vungle.ads.internal.model.l2 l2Var;
        com.vungle.ads.internal.model.w2 w2Var = f46715a;
        if (w2Var == null || (v2Var = w2Var.f47180f) == null || (l2Var = v2Var.f47170a) == null) {
            return null;
        }
        return l2Var.f47083c;
    }

    public static String l() {
        com.vungle.ads.internal.model.v2 v2Var;
        com.vungle.ads.internal.model.l2 l2Var;
        com.vungle.ads.internal.model.w2 w2Var = f46715a;
        if (w2Var == null || (v2Var = w2Var.f47180f) == null || (l2Var = v2Var.f47170a) == null) {
            return null;
        }
        return l2Var.f47082b;
    }

    public static boolean m() {
        com.vungle.ads.internal.model.v2 v2Var;
        com.vungle.ads.internal.model.l2 l2Var;
        Boolean bool;
        com.vungle.ads.internal.model.w2 w2Var = f46715a;
        if (w2Var == null || (v2Var = w2Var.f47180f) == null || (l2Var = v2Var.f47170a) == null || (bool = l2Var.f47081a) == null) {
            return false;
        }
        return bool.booleanValue();
    }

    public static String n() {
        com.vungle.ads.internal.model.i2 i2Var = f46717c;
        String str = null;
        String str2 = i2Var != null ? i2Var.f47060d : null;
        if (str2 != null && str2.length() != 0) {
            str = str2;
        }
        return str == null ? Constants.f46725c : str;
    }

    public static String o() {
        com.vungle.ads.internal.model.i2 i2Var = f46717c;
        if (i2Var != null) {
            return i2Var.f47058b;
        }
        return null;
    }

    public static com.vungle.ads.internal.model.o2 p() {
        com.vungle.ads.internal.model.v2 v2Var;
        com.vungle.ads.internal.model.p2 p2Var;
        LinkedHashMap linkedHashMap = com.vungle.ads.internal.model.o2.f47108b;
        com.vungle.ads.internal.model.w2 w2Var = f46715a;
        return (com.vungle.ads.internal.model.o2) com.vungle.ads.internal.model.o2.f47108b.get((w2Var == null || (v2Var = w2Var.f47180f) == null || (p2Var = v2Var.f47171b) == null) ? null : p2Var.f47111a);
    }

    public static boolean q() {
        Boolean bool;
        com.vungle.ads.internal.model.w2 w2Var = f46715a;
        if (w2Var == null || (bool = w2Var.f47191s) == null) {
            return false;
        }
        return bool.booleanValue();
    }

    public static boolean r() {
        Boolean bool;
        com.vungle.ads.internal.model.w2 w2Var = f46715a;
        if (w2Var == null || (bool = w2Var.f47190r) == null) {
            return true;
        }
        return bool.booleanValue();
    }

    public static boolean s() {
        Boolean bool;
        com.vungle.ads.internal.model.w2 w2Var = f46715a;
        if (w2Var == null || (bool = w2Var.o) == null) {
            return false;
        }
        return bool.booleanValue();
    }

    public static boolean t() {
        Boolean bool;
        com.vungle.ads.internal.model.w2 w2Var = f46715a;
        if (w2Var == null || (bool = w2Var.f47187m) == null) {
            return false;
        }
        return bool.booleanValue();
    }

    @NotNull
    public final String getAdsEndpoint() {
        com.vungle.ads.internal.model.i2 i2Var = f46717c;
        String str = null;
        String str2 = i2Var != null ? i2Var.f47057a : null;
        if (str2 != null && str2.length() != 0) {
            str = str2;
        }
        return str == null ? Constants.DEFAULT_ADS_ENDPOINT : str;
    }

    @NotNull
    public final String getConfigExtension() {
        String str = f46719e;
        return str == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str;
    }

    public static long b() {
        Long l9;
        com.vungle.ads.internal.model.w2 w2Var = f46715a;
        if (w2Var == null || (l9 = w2Var.f47188p) == null) {
            return -1L;
        }
        return l9.longValue();
    }

    public final void a(Context context, com.vungle.ads.internal.model.w2 w2Var, q0 source, k2 k2Var) {
        Long l9;
        char c11;
        Intrinsics.g(context, "context");
        Intrinsics.g(source, "source");
        try {
            synchronized (this) {
                try {
                    ServiceLocator serviceLocatorA = s1.a();
                    if (serviceLocatorA == null) {
                        return;
                    }
                    FilePreferences filePreferences = (FilePreferences) serviceLocatorA.getService(FilePreferences.class);
                    INSTANCE.getClass();
                    if (w2Var == null || (l9 = w2Var.f47188p) == null || l9.longValue() == -1) {
                        c11 = 0;
                    } else {
                        c11 = w2Var.f47177c == null ? (char) 1 : (char) 2;
                    }
                    if (c11 == 0) {
                        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                        com.vungle.ads.internal.util.t.b("ConfigManager", "Config is not available.");
                        return;
                    }
                    if (c11 != 1) {
                        Map mapA = a(context, w2Var, source, k2Var, serviceLocatorA, filePreferences);
                        Unit unit = Unit.f71706a;
                        if (mapA != null) {
                            a(mapA);
                            return;
                        }
                        return;
                    }
                    if (source != q0.INIT_CACHED && w2Var != null) {
                        Long l11 = w2Var.f47188p;
                        long jLongValue = l11 != null ? l11.longValue() : -1L;
                        com.vungle.ads.internal.model.w2 w2Var2 = f46715a;
                        if (w2Var2 != null) {
                            w2Var2.f47188p = Long.valueOf(jLongValue);
                        }
                        com.vungle.ads.internal.model.w2 w2Var3 = f46715a;
                        if (w2Var3 != null) {
                            a(w2Var3, filePreferences);
                        }
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        } catch (Exception e3) {
            boolean z12 = com.vungle.ads.internal.util.u.f47714a;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Error while validating config: ");
            sbA.append(e3.getMessage());
            com.vungle.ads.internal.util.t.b("ConfigManager", sbA.toString());
        }
    }

    public static void a(Map map) {
        ServiceLocator serviceLocator = ServiceLocator.INSTANCE;
        if (serviceLocator == null) {
            return;
        }
        ((com.vungle.ads.internal.executor.d) ((com.vungle.ads.internal.executor.a) serviceLocator.getService(com.vungle.ads.internal.executor.a.class))).f46820a.execute(new c40.c((com.vungle.ads.internal.downloader.t) serviceLocator.getService(com.vungle.ads.internal.downloader.t.class), map));
    }

    public static Map a(Context context, com.vungle.ads.internal.model.w2 w2Var, q0 q0Var, k2 k2Var, ServiceLocator serviceLocator, FilePreferences filePreferences) {
        Boolean bool;
        FilePreferences filePreferences2;
        com.vungle.ads.internal.model.s2 s2Var;
        Boolean bool2;
        com.vungle.ads.internal.model.s2 s2Var2;
        Integer num;
        f46715a = w2Var;
        if (q0Var != q0.AD_RESPONSE) {
            f46716b = w2Var != null ? w2Var.e() : null;
        }
        f46717c = w2Var != null ? w2Var.c() : null;
        f46718d = w2Var != null ? w2Var.d() : null;
        VungleApiClient vungleApiClient = (VungleApiClient) serviceLocator.getService(VungleApiClient.class);
        com.vungle.ads.internal.executor.a aVar = (com.vungle.ads.internal.executor.a) serviceLocator.getService(com.vungle.ads.internal.executor.a.class);
        AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
        com.vungle.ads.internal.executor.j jVarE = ((com.vungle.ads.internal.executor.d) aVar).e();
        com.vungle.ads.internal.model.w2 w2Var2 = f46715a;
        boolean zBooleanValue = true;
        int iIntValue = (w2Var2 == null || (s2Var2 = w2Var2.f47178d) == null || (num = s2Var2.f47144a) == null) ? 1 : num.intValue();
        com.vungle.ads.internal.model.w2 w2Var3 = f46715a;
        analyticsClient.a(vungleApiClient, jVarE, iIntValue, (w2Var3 == null || (s2Var = w2Var3.f47178d) == null || (bool2 = s2Var.f47145b) == null) ? false : bool2.booleanValue());
        if (q0Var != q0.INIT_CACHED && w2Var != null) {
            a(w2Var, filePreferences);
            String strA = w2Var.a();
            if (strA != null) {
                ConfigManager configManager = INSTANCE;
                configManager.getClass();
                Intrinsics.g(context, "context");
                synchronized (configManager) {
                    f46719e = strA;
                    Unit unit = Unit.f71706a;
                }
                ServiceLocator serviceLocatorA = s1.a();
                if (serviceLocatorA != null && (filePreferences2 = (FilePreferences) serviceLocatorA.getService(FilePreferences.class)) != null) {
                    filePreferences2.a("config_extension", strA).b();
                }
            }
        }
        if (k2Var != null) {
            AnalyticsClient.a(analyticsClient, k2Var, (com.vungle.ads.internal.util.s) null, 6);
        }
        PrivacyManager privacyManager = PrivacyManager.INSTANCE;
        com.vungle.ads.internal.model.w2 w2Var4 = f46715a;
        if (w2Var4 != null && (bool = w2Var4.f47182h) != null) {
            zBooleanValue = bool.booleanValue();
        }
        privacyManager.getClass();
        PrivacyManager.a(zBooleanValue);
        Map mapE = w2Var != null ? w2Var.e() : null;
        if (mapE == null || mapE.isEmpty() || Intrinsics.b(mapE, f46720f)) {
            return null;
        }
        f46720f = mapE;
        return mapE;
    }

    public static final void a(Map map, com.vungle.ads.internal.downloader.t capturedTdm) {
        Intrinsics.g(capturedTdm, "$capturedTdm");
        Set setKeySet = map.keySet();
        ArrayList arrayList = new ArrayList();
        Iterator it = setKeySet.iterator();
        while (it.hasNext()) {
            String strA = com.vungle.ads.internal.downloader.t.a((String) it.next());
            if (strA != null) {
                arrayList.add(strA);
            }
        }
        capturedTdm.a(b70.g.N1(arrayList));
        capturedTdm.a(map);
    }

    public static final void a(com.vungle.ads.internal.downloader.t capturedTdm, Map templates) {
        Intrinsics.g(capturedTdm, "$capturedTdm");
        Intrinsics.g(templates, "$templates");
        capturedTdm.b(templates);
    }

    public static j3 a(String str) {
        List list = f46718d;
        Object obj = null;
        if (list == null) {
            return null;
        }
        Iterator it = list.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Object next = it.next();
            if (Intrinsics.b(((j3) next).b(), str)) {
                obj = next;
                break;
            }
        }
        return (j3) obj;
    }

    public static com.vungle.ads.internal.model.w2 a(FilePreferences filePreferences, String appId) {
        Long lA;
        Intrinsics.g(filePreferences, "filePreferences");
        Intrinsics.g(appId, "appId");
        try {
            String string = filePreferences.getString("config_app_id");
            if (string != null && string.length() != 0 && string.equalsIgnoreCase(appId)) {
                String string2 = filePreferences.getString("config_response");
                if (string2 == null) {
                    return null;
                }
                long jA = filePreferences.a("config_update_time", 0L);
                INSTANCE.getClass();
                Json json = (Json) f46721g.getValue();
                KSerializer<Object> kSerializerSerializer = SerializersKt.serializer(json.getSerializersModule(), Reflection.b(com.vungle.ads.internal.model.w2.class));
                Intrinsics.e(kSerializerSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<T of kotlinx.serialization.internal.Platform_commonKt.cast>");
                com.vungle.ads.internal.model.w2 w2Var = (com.vungle.ads.internal.model.w2) json.decodeFromString(kSerializerSerializer, string2);
                com.vungle.ads.internal.model.f2 f2VarB = w2Var.b();
                if (((f2VarB == null || (lA = f2VarB.a()) == null) ? -1L : lA.longValue()) + jA < System.currentTimeMillis()) {
                    boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                    com.vungle.ads.internal.util.t.c("ConfigManager", "cache config expired. re-config");
                    return null;
                }
                boolean z12 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("ConfigManager", "use cache config.");
                return w2Var;
            }
            boolean z13 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.c("ConfigManager", "app id mismatch, re-config");
            return null;
        } catch (Exception e3) {
            boolean z14 = com.vungle.ads.internal.util.u.f47714a;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Error while parsing cached config: ");
            sbA.append(e3.getMessage());
            com.vungle.ads.internal.util.t.b("ConfigManager", sbA.toString());
            return null;
        }
    }

    public static void a(com.vungle.ads.internal.model.w2 config, FilePreferences filePreferences) {
        Intrinsics.g(config, "config");
        Intrinsics.g(filePreferences, "filePreferences");
        try {
            String str = f46722h;
            if (str != null) {
                filePreferences.a("config_app_id", str);
                filePreferences.b("config_update_time", System.currentTimeMillis());
                Json json = (Json) f46721g.getValue();
                KSerializer<Object> kSerializerSerializer = SerializersKt.serializer(json.getSerializersModule(), Reflection.b(com.vungle.ads.internal.model.w2.class));
                Intrinsics.e(kSerializerSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<T of kotlinx.serialization.internal.Platform_commonKt.cast>");
                filePreferences.a("config_response", json.encodeToString(kSerializerSerializer, config));
                filePreferences.b();
                return;
            }
            Intrinsics.m("applicationId");
            throw null;
        } catch (Exception e3) {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Exception: ");
            sbA.append(e3.getMessage());
            sbA.append(" for updating cached config");
            com.vungle.ads.internal.util.t.b("ConfigManager", sbA.toString());
        }
    }

    public final void a() {
        synchronized (this) {
            f46717c = null;
            f46718d = null;
            f46715a = null;
            f46716b = null;
            f46719e = null;
            f46720f = null;
            Unit unit = Unit.f71706a;
        }
    }

    public static void a(Context context, p2 onComplete) {
        Intrinsics.g(context, "context");
        Intrinsics.g(onComplete, "onComplete");
        try {
            com.vungle.ads.internal.network.m mVarA = ((VungleApiClient) LazyKt.b(LazyThreadSafetyMode.f71679a, new r0(context)).getValue()).a();
            if (mVarA != null) {
                mVarA.a(new s0(context, onComplete));
            }
        } catch (Throwable th2) {
            if (th2 instanceof UnknownHostException ? true : th2 instanceof SecurityException) {
                new NetworkUnreachable(fq.c.f(th2, com.iab.omid.library.vungle.internal.l.a("Config unknown: "))).logErrorNoReturnValue$vungle_ads_release();
            } else {
                new NetworkUnreachable(fq.c.f(th2, com.iab.omid.library.vungle.internal.l.a("Config: "))).logErrorNoReturnValue$vungle_ads_release();
            }
            onComplete.invoke(Boolean.FALSE);
        }
    }
}
