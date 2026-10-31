package com.fyber.inneractive.sdk.external;

import android.app.Application;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.ResolveInfo;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import b.c9;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.a0;
import com.fyber.inneractive.sdk.config.c1;
import com.fyber.inneractive.sdk.config.f0;
import com.fyber.inneractive.sdk.config.h;
import com.fyber.inneractive.sdk.config.h0;
import com.fyber.inneractive.sdk.config.j;
import com.fyber.inneractive.sdk.config.m;
import com.fyber.inneractive.sdk.config.r0;
import com.fyber.inneractive.sdk.config.u;
import com.fyber.inneractive.sdk.config.x;
import com.fyber.inneractive.sdk.external.OnFyberMarketplaceInitializedListener;
import com.fyber.inneractive.sdk.ignite.l;
import com.fyber.inneractive.sdk.logger.FMPLogger;
import com.fyber.inneractive.sdk.mraid.IAMraidKit;
import com.fyber.inneractive.sdk.network.t;
import com.fyber.inneractive.sdk.network.v0;
import com.fyber.inneractive.sdk.network.w;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.b0;
import com.fyber.inneractive.sdk.util.l0;
import com.fyber.inneractive.sdk.util.n;
import com.fyber.inneractive.sdk.util.o;
import com.fyber.inneractive.sdk.util.p1;
import com.fyber.inneractive.sdk.util.r;
import com.fyber.inneractive.sdk.util.s;
import com.fyber.inneractive.sdk.util.t1;
import com.fyber.inneractive.sdk.util.v;
import com.fyber.inneractive.sdk.util.y;
import com.fyber.inneractive.sdk.util.z;
import com.fyber.inneractive.sdk.video.IAVideoKit;
import com.fyber.inneractive.sdk.web.b1;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ThreadPoolExecutor;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class InneractiveAdManager implements u {
    public static final String GLOBAL_CONFIG_PARAM_FIRST_INIT_EVENT = "sdk_first_init";

    /* renamed from: d, reason: collision with root package name */
    public static IAConfigManager.OnConfigurationReadyAndValidListener f27983d;

    /* renamed from: e, reason: collision with root package name */
    public static b f27984e;

    /* renamed from: a, reason: collision with root package name */
    public volatile Context f27985a;

    /* renamed from: b, reason: collision with root package name */
    public String f27986b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f27987c = false;

    /* loaded from: classes3.dex */
    public enum GdprConsentSource {
        Internal,
        External
    }

    public static void a() throws JSONException {
        SharedPreferences sharedPreferences = o.f31210a.getSharedPreferences("Fyber_Shared_File", 0);
        String string = sharedPreferences.getString("FyberExceptionKey", "empty");
        String string2 = sharedPreferences.getString("FyberDescriptionKey", "empty");
        String string3 = sharedPreferences.getString("FyberNameKey", "empty");
        String string4 = sharedPreferences.getString("FyberVersionKey", getVersion());
        IAlog.a(" name- %s   description - %s exception - %s", string3, string2, string);
        if (string.contains("OutOfMemoryError") || string.equals("empty") || string2.equals("empty") || string3.equals("empty")) {
            return;
        }
        IAlog.a("Firing Event 999 for %s", string);
        w wVar = new w(com.fyber.inneractive.sdk.network.u.IA_UNCAUGHT_EXCEPTION);
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("exception_name", string3);
        } catch (Exception unused) {
            IAlog.f("Got exception adding param to json object: %s, %s", "exception_name", string3);
        }
        try {
            jSONObject.put(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, string2);
        } catch (Exception unused2) {
            IAlog.f("Got exception adding param to json object: %s, %s", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, string2);
        }
        try {
            jSONObject.put("stack_trace", string);
        } catch (Exception unused3) {
            IAlog.f("Got exception adding param to json object: %s, %s", "stack_trace", string);
        }
        wVar.f28823f.put(jSONObject);
        if (wVar.a(string4)) {
            sharedPreferences.edit().remove("FyberExceptionKey").remove("FyberVersionKey").remove("FyberDescriptionKey").remove("FyberNameKey").apply();
        }
    }

    @Deprecated
    public static boolean areNativeAdsSupportedForOS() {
        return true;
    }

    public static void clearGdprConsentData() {
        h hVar = IAConfigManager.Q.E;
        if (hVar != null) {
            hVar.a();
        } else {
            IAlog.f("clearGdprConsentData() was invoked, but Fyber SDK was not properly initialized", new Object[0]);
        }
    }

    public static void clearImpressionDataListener() {
        IAConfigManager.Q.A.f31253a = null;
    }

    public static void clearLgpdConsentData() {
        h hVar = IAConfigManager.Q.E;
        if (hVar != null) {
            hVar.b();
        } else {
            IAlog.f("clearLgpdConsentData was invoked, but Fyber SDK was not properly initialized", new Object[0]);
        }
    }

    public static void clearUSPrivacyString() {
        h hVar = IAConfigManager.Q.E;
        if (hVar != null) {
            hVar.c();
        }
    }

    public static void currentAudienceAppliesToCoppa() {
        h hVar = IAConfigManager.Q.E;
        if (hVar == null) {
            IAlog.f("currentAudienceAppliesToCoppa was invoked, but Fyber SDK was not properly initialized", new Object[0]);
        } else if (o.f31210a == null) {
            IAlog.f("setCurrentAudienceAppliesToCoppa was invoked, but the Inneractive SDK was not properly initialized, or destroyed.", new Object[0]);
        } else {
            hVar.f27848j = Boolean.TRUE;
        }
    }

    public static void currentAudienceIsAChild() {
        c.f28015a.f27987c = true;
    }

    public static void destroy() {
        l lVar;
        IAlog.a("InneractiveAdManager:destroy called", new Object[0]);
        if (c.f28015a.f27985a == null) {
            IAlog.a("InneractiveAdManager:destroy called, but manager is not initialized", new Object[0]);
            return;
        }
        c.f28015a.f27985a = null;
        IAConfigManager.removeListener(f27983d);
        f27983d = null;
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        iAConfigManager.A.f31253a = null;
        iAConfigManager.f27751i = false;
        h hVar = iAConfigManager.E;
        if (hVar != null) {
            com.fyber.inneractive.sdk.privacy.c cVar = hVar.f27851m;
            cVar.getClass();
            synchronized (com.fyber.inneractive.sdk.privacy.c.f30748g) {
                try {
                    if (cVar.f30751c) {
                        cVar.f30751c = false;
                        r.f31216b.removeCallbacks(cVar.f30752d);
                        cVar.f30750b.set(null);
                        SharedPreferences sharedPreferences = cVar.f30753e;
                        if (sharedPreferences == null) {
                            IAlog.a("%sUnable to unregister SharedPreferences observer, mAppDefaultPrefs are null", "PrivacyFlagsObserver: ");
                        } else {
                            sharedPreferences.unregisterOnSharedPreferenceChangeListener(cVar.f30754f);
                            cVar.f30753e = null;
                            IAlog.a("%sUnregistered IAB app default SharedPreferences observer", "PrivacyFlagsObserver: ");
                        }
                    }
                } finally {
                }
            }
        }
        try {
            com.fyber.inneractive.sdk.config.cellular.a aVar = iAConfigManager.O;
            if (aVar != null && aVar.f27776a != null) {
                aVar.f27778c.clear();
                aVar.f27776a.a((com.fyber.inneractive.sdk.config.cellular.h) aVar);
                aVar.f27776a.a();
            }
        } catch (Throwable th2) {
            IAlog.a("failed to destroy network watchdog", th2, new Object[0]);
        }
        com.fyber.inneractive.sdk.serverapi.extradata.d dVar = iAConfigManager.J;
        dVar.f31102d.clear();
        dVar.f31104f = null;
        com.fyber.inneractive.sdk.ignite.h hVar2 = iAConfigManager.F;
        if (!TextUtils.isEmpty(hVar2.f28489k) && (lVar = hVar2.o) != null) {
            lVar.destroy();
            hVar2.o = null;
        }
        l0.f31201a.a();
        b0.a();
        com.fyber.inneractive.sdk.factories.d.f28022a.f28023a.clear();
        com.fyber.inneractive.sdk.factories.b.f28020a.f28021a.clear();
        com.fyber.inneractive.sdk.factories.h.f28024a.f28025a.clear();
        InneractiveAdSpotManager.destroy();
        n.f31205a.clear();
        com.fyber.inneractive.sdk.bidder.b bVar = com.fyber.inneractive.sdk.bidder.b.f27620h;
        com.fyber.inneractive.sdk.bidder.f fVar = bVar.f27624d;
        if (fVar != null) {
            try {
                o.f31210a.unregisterReceiver(fVar);
            } catch (Exception unused) {
            }
        }
        bVar.f27624d = null;
        com.fyber.inneractive.sdk.config.cellular.a aVar2 = IAConfigManager.Q.O;
        if (aVar2 != null) {
            try {
                aVar2.f27778c.remove(bVar);
            } catch (Throwable th3) {
                IAlog.a("failed to remove network observer", th3, new Object[0]);
            }
        }
        com.fyber.inneractive.sdk.nativead.b.f28680f.a();
    }

    public static String getAppId() {
        return IAConfigManager.Q.f27745c;
    }

    @Deprecated
    public static String getDevPlatform() {
        return c.f28015a.f27986b;
    }

    public static Boolean getGdprConsent() {
        h hVar = IAConfigManager.Q.E;
        if (hVar != null) {
            return hVar.e();
        }
        return null;
    }

    public static GdprConsentSource getGdprStatusSource() {
        h hVar = IAConfigManager.Q.E;
        if (hVar != null) {
            return hVar.f27844f;
        }
        IAlog.f("getGdprStatusSource() was invoked, but Fyber SDK was not properly initialized", new Object[0]);
        return null;
    }

    public static boolean getMuteVideo() {
        return IAConfigManager.Q.f27754l;
    }

    public static String getUserId() {
        return IAConfigManager.Q.E.f27845g;
    }

    public static InneractiveUserConfig getUserParams() {
        return IAConfigManager.Q.f27753k;
    }

    public static String getVersion() {
        return "8.4.7";
    }

    public static void initialize(Context context, String str) {
        initialize(context, str, null);
    }

    @Deprecated
    public static boolean isCurrentDeviceSupportsVideo() {
        return true;
    }

    public static boolean isCurrentUserAChild() {
        return c.f28015a.f27987c;
    }

    @Deprecated
    public static void setDevPlatform(String str) {
        c.f28015a.f27986b = str;
    }

    public static void setExtraData(String str, String str2) {
        com.fyber.inneractive.sdk.serverapi.extradata.d dVar = IAConfigManager.Q.J;
        dVar.getClass();
        if (!v.a(str)) {
            IAlog.a("%sCould not set extra data, key can't be null or empty", "UserExtraDataManager");
            return;
        }
        if (!v.a(str2)) {
            dVar.f31102d.remove(str.trim());
            IAlog.a("%sCleared extra data successfully for key: %s", "UserExtraDataManager", str);
        } else {
            String strTrim = str.trim();
            String strTrim2 = str2.trim();
            dVar.f31102d.put(strTrim, strTrim2);
            IAlog.a("%sSet extra data successfully for key: %s, value: %s", "UserExtraDataManager", strTrim, strTrim2);
        }
    }

    public static void setGdprConsent(boolean z11) {
        setGdprConsent(z11, GdprConsentSource.Internal);
    }

    public static void setGdprConsentString(String str) {
        h hVar = IAConfigManager.Q.E;
        if (hVar == null) {
            IAlog.f("setGdprConsentString() was invoked, but Fyber SDK was not properly initialized", new Object[0]);
            return;
        }
        if (o.f31210a == null) {
            IAlog.f("SetGdprConsentString() was invoked, but the Inneractive SDK was not properly initialized, or destroyed.", new Object[0]);
            return;
        }
        hVar.f27842d = str;
        if (hVar.a("IAGdprConsentData", str)) {
            return;
        }
        IAlog.f("SetGdprConsentString() was invoked, but the Inneractive SDK was not properly initialized, destroyed, or data is empty.", new Object[0]);
    }

    public static void setImpressionDataListener(OnGlobalImpressionDataListener onGlobalImpressionDataListener) {
        IAConfigManager.Q.A.f31253a = onGlobalImpressionDataListener;
    }

    public static void setLgpdConsent(boolean z11) {
        h hVar = IAConfigManager.Q.E;
        if (hVar == null) {
            IAlog.f("setLgpdConsent was invoked, but Fyber SDK was not properly initialized", new Object[0]);
            return;
        }
        if (o.f31210a == null) {
            IAlog.f("setLgpdConsentStatus was invoked, but the Inneractive SDK was not properly initialized, or destroyed.", new Object[0]);
            return;
        }
        hVar.f27847i = Boolean.valueOf(z11);
        if (hVar.a(z11, "IALgpdConsentStatus")) {
            return;
        }
        IAlog.f("setLgpdConsentStatus was invoked, but the Inneractive SDK was not properly initialized, or destroyed.", new Object[0]);
    }

    public static void setLogLevel(int i5) {
        IAlog.f31163a = i5;
    }

    public static void setMediationName(String str) {
        IAConfigManager.Q.f27755m = str;
    }

    public static void setMediationVersion(String str) {
        if (str != null) {
            IAConfigManager.Q.o = str;
        }
    }

    public static void setMuteVideo(boolean z11) {
        IAConfigManager.Q.f27754l = z11;
    }

    public static void setUSPrivacyString(String str) {
        h hVar = IAConfigManager.Q.E;
        if (hVar == null) {
            IAlog.f("setUSPrivacyString() was invoked, but Fyber SDK was not properly initialized", new Object[0]);
            return;
        }
        if (o.f31210a == null) {
            IAlog.f("setUSPrivacyString() was invoked, but the Inneractive SDK was not properly initialized, or destroyed.", new Object[0]);
            return;
        }
        hVar.f27846h = str;
        if (hVar.a("IACCPAConsentData", str)) {
            return;
        }
        IAlog.f("setUSPrivacyString() was invoked, but the Inneractive SDK was not properly initialized, destroyed, or data is empty.", new Object[0]);
    }

    public static void setUseLocation(boolean z11) {
        IAConfigManager.Q.getClass();
    }

    public static void setUserId(String str) {
        if (o.f31210a != null) {
            IAConfigManager.Q.E.a(str);
        } else {
            IAConfigManager iAConfigManager = IAConfigManager.Q;
            IAlog.f("setUsedId() was invoked, but the Inneractive SDK was not properly initialized, or destroyed.", new Object[0]);
        }
    }

    public static void setUserParams(InneractiveUserConfig inneractiveUserConfig) {
        IAConfigManager.Q.f27753k = inneractiveUserConfig;
        IAlog.a("config manager: setUserParams called with: gender:" + inneractiveUserConfig.getGender() + " zip: " + inneractiveUserConfig.getZipCode(), new Object[0]);
    }

    public static void useSecureConnections(boolean z11) {
        IAConfigManager.Q.f27758r = z11;
        IAlog.a("config manager: useSecureConnections called with: isSecured: + %s", Boolean.valueOf(z11));
        if (s.a() || z11) {
            return;
        }
        IAlog.f("************************************************************************************************************************", new Object[0]);
        IAlog.f("*** useSecureConnections was set to false while secure traffic is enabled in the network security config", new Object[0]);
        IAlog.f("***  The traffic will be Secured  ", new Object[0]);
        IAlog.f("************************************************************************************************************************", new Object[0]);
    }

    public static boolean wasInitialized() {
        return c.f28015a.f27985a != null;
    }

    public Context getAppContext() {
        return this.f27985a;
    }

    @Override // com.fyber.inneractive.sdk.config.u
    public void onGlobalConfigChanged(com.fyber.inneractive.sdk.config.v vVar, com.fyber.inneractive.sdk.config.r rVar) {
        if (rVar == null || !rVar.a(false, GLOBAL_CONFIG_PARAM_FIRST_INIT_EVENT)) {
            return;
        }
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        r.f31216b.post(new a0());
    }

    public static void initialize(Context context, String str, OnFyberMarketplaceInitializedListener onFyberMarketplaceInitializedListener) {
        String language;
        List<ResolveInfo> listQueryIntentServices;
        if (context == null || str == null) {
            IAlog.b("InneractiveAdManager:initialize. No context or App Id given", new Object[0]);
            a(onFyberMarketplaceInitializedListener, (str == null || TextUtils.isEmpty(str.trim())) ? OnFyberMarketplaceInitializedListener.FyberInitStatus.INVALID_APP_ID : OnFyberMarketplaceInitializedListener.FyberInitStatus.FAILED, (str == null ? "appid" : "context").concat(" is null"));
            return;
        }
        String str2 = IAConfigManager.Q.f27745c;
        boolean z11 = (str2 == null || str2.equalsIgnoreCase(str)) ? false : true;
        String str3 = null;
        if (c.f28015a.f27985a != null && !z11) {
            IAlog.a("InneractiveAdManager:initialize called, but manager is already initialized. ignoring", new Object[0]);
            a(onFyberMarketplaceInitializedListener, OnFyberMarketplaceInitializedListener.FyberInitStatus.SUCCESSFULLY, null);
            return;
        }
        IAlog.f31165c.retainAll(Collections.singleton(IAlog.f31164b));
        int i5 = com.fyber.inneractive.sdk.config.n.f27870a;
        String property = System.getProperty("ia.testEnvironmentConfiguration.logger");
        if (property != null) {
            for (String str4 : property.split(",")) {
                try {
                    FMPLogger fMPLogger = (FMPLogger) Class.forName(str4).newInstance();
                    fMPLogger.initialize(context);
                    IAlog.f31165c.add(fMPLogger);
                } catch (Throwable unused) {
                }
            }
        }
        o.f31210a = (Application) context.getApplicationContext();
        SharedPreferences sharedPreferences = context.getSharedPreferences("Fyber_Shared_File", 0);
        if (f27984e == null) {
            f27984e = new b();
        }
        b bVar = f27984e;
        bVar.f28013a = sharedPreferences;
        Thread.setDefaultUncaughtExceptionHandler(bVar);
        b0 b0Var = z.f31254a;
        Context applicationContext = context.getApplicationContext();
        b0Var.getClass();
        IAlog.a("%sinit called", IAlog.a(b0Var));
        b0Var.f31174c = applicationContext;
        b0Var.f31175d = new y(b0Var);
        IntentFilter intentFilter = new IntentFilter("android.intent.action.SCREEN_OFF");
        intentFilter.addAction("android.intent.action.SCREEN_ON");
        intentFilter.addAction("android.intent.action.USER_PRESENT");
        b0Var.f31174c.registerReceiver(b0Var.f31175d, intentFilter);
        Intent intent = new Intent();
        intent.setAction("com.fyber.inneractive.sdk.intent.action.REGISTER_KIT");
        intent.setPackage(o.f31210a.getPackageName());
        Context applicationContext2 = context.getApplicationContext();
        if (applicationContext2 == null) {
            throw new IllegalArgumentException("Context can't be null");
        }
        List<BroadcastReceiver> listAsList = Arrays.asList(new IAMraidKit(), new IAVideoKit(), new com.fyber.inneractive.sdk.nativead.e());
        for (BroadcastReceiver broadcastReceiver : listAsList) {
            try {
                broadcastReceiver.onReceive(applicationContext2, intent);
            } catch (Throwable unused2) {
                IAlog.f("%sCould not trigger receiver for %s", IAlog.a(com.fyber.inneractive.sdk.a.class), broadcastReceiver);
            }
        }
        if (com.fyber.inneractive.sdk.factories.d.f28022a.f28023a.size() == 0) {
            Log.e("Inneractive_error", "Critical error raised while initializing SDK - please make sure you have added all the required fyber libraries (ia-mraid-kit, ia-video-kit) to your project");
        }
        if (listAsList.size() == 0) {
            IAlog.b("InneractiveAdManager:initialize. please make sure you have added all the required fyber libraries (ia-mraid-kit, ia-video-kit) to your project", new Object[0]);
            a(onFyberMarketplaceInitializedListener, OnFyberMarketplaceInitializedListener.FyberInitStatus.FAILED_NO_KITS_DETECTED, null);
            return;
        }
        a aVar = new a(context, onFyberMarketplaceInitializedListener);
        f27983d = aVar;
        IAConfigManager.addListener(aVar);
        if (z11) {
            IAConfigManager iAConfigManager = IAConfigManager.Q;
            iAConfigManager.f27745c = str;
            HashMap map = iAConfigManager.f27743a;
            if (map != null) {
                map.clear();
            }
            HashMap map2 = iAConfigManager.f27744b;
            if (map2 != null) {
                map2.clear();
            }
            iAConfigManager.f27747e = null;
            iAConfigManager.f27746d = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            IAConfigManager.a();
        } else {
            Context applicationContext3 = context.getApplicationContext();
            IAConfigManager iAConfigManager2 = IAConfigManager.Q;
            if (!iAConfigManager2.f27751i) {
                iAConfigManager2.f27762v = new j(context, applicationContext3);
                t1 t1Var = new t1();
                iAConfigManager2.f27765y = t1Var;
                t1Var.f31230c = applicationContext3.getApplicationContext();
                r.f31215a.execute(new p1(t1Var));
                com.fyber.inneractive.sdk.network.l0 l0Var = iAConfigManager2.f27759s;
                if (!l0Var.f28741b) {
                    l0Var.f28741b = true;
                    for (int i11 = 0; i11 < 6; i11++) {
                        l0Var.f28743d.submit(l0Var.f28744e);
                    }
                }
                b1.f31264c.getClass();
                iAConfigManager2.E = new h();
                com.fyber.inneractive.sdk.config.v vVar = new com.fyber.inneractive.sdk.config.v(applicationContext3);
                iAConfigManager2.f27761u = vVar;
                iAConfigManager2.f27763w = new com.fyber.inneractive.sdk.config.w(vVar);
                iAConfigManager2.H.a((Application) applicationContext3.getApplicationContext());
                iAConfigManager2.f27761u.f27937c.add(new com.fyber.inneractive.sdk.config.b0(iAConfigManager2));
                com.fyber.inneractive.sdk.config.v vVar2 = iAConfigManager2.f27761u;
                vVar2.getClass();
                IAConfigManager.Q.f27759s.a(new v0(new com.fyber.inneractive.sdk.config.s(vVar2), vVar2.f27935a, vVar2.f27939e));
                iAConfigManager2.f27766z = new com.fyber.inneractive.sdk.config.global.a();
                IAlog.a("Initializing config manager", new Object[0]);
                IAlog.a("Config manager: lib name = %s", AndroidContextPlugin.PLATFORM);
                IAlog.a("Config manager: app version = %s", "8.4.7");
                com.fyber.inneractive.sdk.config.z zVar = x.f27950a;
                if (zVar.f27965a == null) {
                    zVar.f27965a = applicationContext3;
                    new Thread(new r0(applicationContext3, zVar)).start();
                }
                if (!str.matches("[0-9]+")) {
                    IAlog.b("************************************************************************************************************************", new Object[0]);
                    IAlog.b("*************************************** APP ID Must contain only numbers ***********************************************", new Object[0]);
                    IAlog.b("*************************************** Are you sure that you are using the correct APP ID *****************************", new Object[0]);
                    IAlog.b("************************************************************************************************************************", new Object[0]);
                }
                iAConfigManager2.f27749g = applicationContext3;
                iAConfigManager2.f27745c = str;
                iAConfigManager2.f27753k = new InneractiveUserConfig();
                iAConfigManager2.f27751i = true;
                c1 c1Var = iAConfigManager2.f27764x;
                c1Var.getClass();
                com.fyber.inneractive.sdk.config.e eVar = new com.fyber.inneractive.sdk.config.e(c1Var);
                c1Var.f27771b = eVar;
                eVar.a();
                c1Var.f27773d.put("SESSION_STAMP", Long.toString(SystemClock.elapsedRealtime()));
                com.fyber.inneractive.sdk.cache.session.e eVar2 = new com.fyber.inneractive.sdk.cache.session.e();
                c1Var.f27770a = eVar2;
                com.fyber.inneractive.sdk.cache.session.c cVar = new com.fyber.inneractive.sdk.cache.session.c(eVar2);
                ThreadPoolExecutor threadPoolExecutor = r.f31215a;
                threadPoolExecutor.execute(cVar);
                iAConfigManager2.C = new m(iAConfigManager2.f27749g);
                iAConfigManager2.B = new com.fyber.inneractive.sdk.config.g(new f0(iAConfigManager2), iAConfigManager2.f27749g);
                threadPoolExecutor.execute(new h0(iAConfigManager2));
                h hVar = iAConfigManager2.E;
                hVar.j();
                SharedPreferences sharedPreferences2 = hVar.f27850l;
                if (sharedPreferences2 == null) {
                    IAlog.a("%sregisterIabAppDefaultPreferenceObserver App default shared prefs is null - returning", "ConfigDataProtectionProvider: ");
                } else {
                    com.fyber.inneractive.sdk.privacy.c cVar2 = hVar.f27851m;
                    cVar2.getClass();
                    synchronized (com.fyber.inneractive.sdk.privacy.c.f30748g) {
                        try {
                            if (!cVar2.f30751c) {
                                cVar2.f30753e = sharedPreferences2;
                                sharedPreferences2.registerOnSharedPreferenceChangeListener(cVar2.f30754f);
                                cVar2.f30751c = true;
                                IAlog.a("%sRegistered IAB app default SharedPreferences observer", "PrivacyFlagsObserver: ");
                            }
                        } finally {
                        }
                    }
                }
                try {
                    language = Locale.getDefault().getLanguage();
                    try {
                        IAlog.a("Available device language: %s", language);
                    } catch (Exception unused3) {
                    }
                } catch (Exception unused4) {
                    language = null;
                }
                iAConfigManager2.f27756p = language;
                com.fyber.inneractive.sdk.ignite.h hVar2 = iAConfigManager2.F;
                hVar2.f28479a = applicationContext3;
                Intent intent2 = new Intent("com.digitalturbine.ignite.cl.IgniteRemoteService");
                Context context2 = hVar2.f28479a;
                if (context2 != null && (listQueryIntentServices = context2.getPackageManager().queryIntentServices(intent2, 0)) != null && listQueryIntentServices.size() > 0) {
                    str3 = listQueryIntentServices.get(0).serviceInfo.packageName;
                }
                hVar2.f28489k = str3;
                com.fyber.inneractive.sdk.config.cellular.a aVar2 = new com.fyber.inneractive.sdk.config.cellular.a(iAConfigManager2.f27749g);
                iAConfigManager2.O = aVar2;
                com.fyber.inneractive.sdk.config.cellular.d dVar = aVar2.f27776a;
                if (dVar != null) {
                    try {
                        dVar.a(aVar2);
                    } catch (Throwable th2) {
                        IAlog.a("failed to register network detector", th2, new Object[0]);
                    }
                }
            }
        }
        c.f28015a.f27985a = context.getApplicationContext();
        IAConfigManager iAConfigManager3 = IAConfigManager.Q;
        iAConfigManager3.f27761u.f27937c.remove(c.f28015a);
        iAConfigManager3.f27761u.f27937c.add(c.f28015a);
    }

    public static void setGdprConsent(boolean z11, GdprConsentSource gdprConsentSource) {
        h hVar = IAConfigManager.Q.E;
        if (hVar == null) {
            IAlog.f("setGdprConsent() was invoked, but Fyber SDK was not properly initialized", new Object[0]);
            return;
        }
        if (o.f31210a == null) {
            IAlog.f("SetGdprConsent(boolean) was invoked, but the Inneractive SDK was not properly initialized, or destroyed.", new Object[0]);
            return;
        }
        hVar.f27839a = Boolean.valueOf(z11);
        if (!hVar.a(z11, "IAGDPRBool")) {
            IAlog.f("SetGdprConsent(boolean) was invoked, but the Inneractive SDK was not properly initialized, or destroyed.", new Object[0]);
        }
        hVar.f27844f = gdprConsentSource;
        if (hVar.a("IAGdprSource", gdprConsentSource.name())) {
            return;
        }
        IAlog.f("SetGdprConsent(boolean) was invoked, but the Inneractive SDK was not properly initialized, or destroyed.", new Object[0]);
    }

    public static void setMediationName(InneractiveMediationName inneractiveMediationName) {
        if (inneractiveMediationName != null) {
            IAConfigManager iAConfigManager = IAConfigManager.Q;
            iAConfigManager.n = inneractiveMediationName;
            iAConfigManager.f27755m = inneractiveMediationName.getKey();
        }
    }

    public static void a(OnFyberMarketplaceInitializedListener onFyberMarketplaceInitializedListener, OnFyberMarketplaceInitializedListener.FyberInitStatus fyberInitStatus, String str) {
        if (onFyberMarketplaceInitializedListener != null) {
            onFyberMarketplaceInitializedListener.onFyberMarketplaceInitialized(fyberInitStatus);
        }
        if (c.f28015a.f27985a == null || fyberInitStatus == OnFyberMarketplaceInitializedListener.FyberInitStatus.SUCCESSFULLY) {
            return;
        }
        w wVar = new w(t.FMP_SDK_INIT_FAILED, (InneractiveAdRequest) null, (com.fyber.inneractive.sdk.response.e) null);
        if (!TextUtils.isEmpty(str)) {
            wVar.a(PglCryptUtils.KEY_MESSAGE, str);
        }
        wVar.a("init_status", fyberInitStatus.name());
        wVar.a((String) null);
    }

    public static void a(Context context, Throwable th2) {
        SharedPreferences sharedPreferences = context.getSharedPreferences("Fyber_Shared_File", 0);
        if (sharedPreferences.getBoolean("FyberKotlinDependenciesExceptionReportedKey", false)) {
            return;
        }
        if (com.fyber.inneractive.sdk.network.z.a(th2.getClass().getSimpleName(), "Unable resolve Kotlin dependencies: " + th2.getMessage(), null, null)) {
            c9.q(sharedPreferences, "FyberKotlinDependenciesExceptionReportedKey", true);
        }
    }
}
