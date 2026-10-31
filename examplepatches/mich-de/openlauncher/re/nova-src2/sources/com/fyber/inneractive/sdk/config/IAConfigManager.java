package com.fyber.inneractive.sdk.config;

import android.content.Context;
import android.content.SharedPreferences;
import android.webkit.WebView;
import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationName;
import com.fyber.inneractive.sdk.external.InneractiveUserConfig;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.t1;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;

/* loaded from: classes.dex */
public class IAConfigManager {
    public static long R;
    public final com.fyber.inneractive.sdk.util.y0 A;
    public g B;
    public m C;
    public com.fyber.inneractive.sdk.network.v0 D;
    public h E;
    public final com.fyber.inneractive.sdk.ignite.h F;
    public final com.fyber.inneractive.sdk.cache.l G;
    public final com.fyber.inneractive.sdk.network.f H;
    public final HashMap I;
    public final com.fyber.inneractive.sdk.serverapi.extradata.d J;
    public final AtomicBoolean K;
    public com.fyber.inneractive.sdk.measurement.e L;
    public WebView M;
    public final com.fyber.inneractive.sdk.config.global.r N;
    public com.fyber.inneractive.sdk.config.cellular.a O;
    public final AtomicBoolean P;

    /* renamed from: a, reason: collision with root package name */
    public HashMap f27743a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    public HashMap f27744b = new HashMap();

    /* renamed from: c, reason: collision with root package name */
    public String f27745c;

    /* renamed from: d, reason: collision with root package name */
    public String f27746d;

    /* renamed from: e, reason: collision with root package name */
    public String f27747e;

    /* renamed from: f, reason: collision with root package name */
    public volatile Integer f27748f;

    /* renamed from: g, reason: collision with root package name */
    public Context f27749g;

    /* renamed from: h, reason: collision with root package name */
    public final CopyOnWriteArrayList f27750h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f27751i;

    /* renamed from: j, reason: collision with root package name */
    public final p0 f27752j;

    /* renamed from: k, reason: collision with root package name */
    public InneractiveUserConfig f27753k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f27754l;

    /* renamed from: m, reason: collision with root package name */
    public String f27755m;
    public InneractiveMediationName n;
    public String o;

    /* renamed from: p, reason: collision with root package name */
    public String f27756p;

    /* renamed from: q, reason: collision with root package name */
    public ArrayList f27757q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f27758r;

    /* renamed from: s, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.network.l0 f27759s;

    /* renamed from: t, reason: collision with root package name */
    public String f27760t;

    /* renamed from: u, reason: collision with root package name */
    public v f27761u;

    /* renamed from: v, reason: collision with root package name */
    public j f27762v;

    /* renamed from: w, reason: collision with root package name */
    public w f27763w;

    /* renamed from: x, reason: collision with root package name */
    public final c1 f27764x;

    /* renamed from: y, reason: collision with root package name */
    public t1 f27765y;

    /* renamed from: z, reason: collision with root package name */
    public com.fyber.inneractive.sdk.config.global.a f27766z;
    public static final IAConfigManager Q = new IAConfigManager();
    public static final k0 S = new k0();

    public interface OnConfigurationReadyAndValidListener {
        void onConfigurationReadyAndValid(IAConfigManager iAConfigManager, boolean z11, Exception exc);
    }

    public IAConfigManager() {
        new HashSet();
        this.f27751i = false;
        this.f27752j = new p0();
        this.f27754l = false;
        this.f27758r = false;
        this.f27759s = new com.fyber.inneractive.sdk.network.l0();
        this.f27760t = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f27764x = new c1();
        this.A = new com.fyber.inneractive.sdk.util.y0();
        this.F = new com.fyber.inneractive.sdk.ignite.h();
        this.G = new com.fyber.inneractive.sdk.cache.l();
        this.H = new com.fyber.inneractive.sdk.network.f();
        this.I = new HashMap();
        new AtomicBoolean();
        this.K = new AtomicBoolean(false);
        this.N = com.fyber.inneractive.sdk.config.global.r.a();
        this.P = new AtomicBoolean(false);
        this.f27750h = new CopyOnWriteArrayList();
        this.J = new com.fyber.inneractive.sdk.serverapi.extradata.d();
    }

    public static void addListener(OnConfigurationReadyAndValidListener onConfigurationReadyAndValidListener) {
        Q.f27750h.add(onConfigurationReadyAndValidListener);
    }

    public static JSONArray b() {
        com.fyber.inneractive.sdk.serverapi.extradata.d dVar = Q.J;
        dVar.getClass();
        JSONArray jSONArray = (JSONArray) dVar.a(new JSONArray(), new com.fyber.inneractive.sdk.serverapi.extradata.b());
        if (jSONArray == null) {
            IAlog.a("%sExtra data JSON is empty", "UserExtraDataManager");
            return null;
        }
        IAlog.a("%sReturning extra data JSON objects", "UserExtraDataManager");
        return jSONArray;
    }

    public static boolean c() {
        h hVar = Q.E;
        if (hVar == null) {
            return false;
        }
        return hVar.i();
    }

    public static boolean d() {
        IAConfigManager iAConfigManager = Q;
        boolean z11 = iAConfigManager.f27747e != null;
        int i5 = n.f27870a;
        boolean zBooleanValue = Boolean.valueOf(System.getProperty("ia.testEnvironmentConfiguration.forceConfigRefresh", Boolean.toString(false))).booleanValue();
        if ((z11 && System.currentTimeMillis() - R > 3600000) || zBooleanValue) {
            if (zBooleanValue) {
                v vVar = iAConfigManager.f27761u;
                vVar.f27938d = false;
                com.fyber.inneractive.sdk.util.r.f31215a.execute(new com.fyber.inneractive.sdk.util.l(vVar.f27939e));
            }
            a();
            com.fyber.inneractive.sdk.web.b1 b1Var = com.fyber.inneractive.sdk.web.b1.f31264c;
            b1Var.getClass();
            com.fyber.inneractive.sdk.util.r.f31215a.execute(new com.fyber.inneractive.sdk.web.a1(b1Var));
        }
        return z11;
    }

    public static void e() {
        Integer numG;
        Integer numF;
        IAConfigManager iAConfigManager = Q;
        iAConfigManager.K.set(true);
        if (iAConfigManager.P.compareAndSet(false, true)) {
            h hVar = iAConfigManager.E;
            if (hVar != null) {
                numF = hVar.f();
                numG = hVar.g();
            } else {
                numG = null;
                numF = null;
            }
            new com.fyber.inneractive.sdk.network.w(com.fyber.inneractive.sdk.network.u.IA_IAB_GDPR_TCF_PURPOSE_1_DISABLED).a("cmp_id", numF, "cmp_version", numG).a((String) null);
        }
    }

    public static void f() {
        SharedPreferences sharedPreferences = com.fyber.inneractive.sdk.util.o.f31210a.getSharedPreferences("IAConfigurationPreferences", 0);
        if (sharedPreferences != null) {
            c9.q(sharedPreferences, "IAConfigFQE", true);
        }
    }

    public static boolean g() {
        IAConfigManager iAConfigManager = Q;
        Boolean boolC = ((com.fyber.inneractive.sdk.config.global.features.m) iAConfigManager.N.a(com.fyber.inneractive.sdk.config.global.features.m.class)).c("enable");
        boolean zBooleanValue = boolC != null ? boolC.booleanValue() : false;
        IAlog.a("OMSDK AB %s", String.valueOf(zBooleanValue));
        if (zBooleanValue) {
            com.fyber.inneractive.sdk.measurement.e eVar = iAConfigManager.L;
            return eVar == null || !eVar.f28502a;
        }
        IAlog.a("OM SDK disabled", new Object[0]);
        IAlog.d("OM SDK disabled", new Object[0]);
        return false;
    }

    public static void removeListener(OnConfigurationReadyAndValidListener onConfigurationReadyAndValidListener) {
        Q.f27750h.remove(onConfigurationReadyAndValidListener);
    }

    public final void a(boolean z11, Exception exc) {
        Iterator it = this.f27750h.iterator();
        while (it.hasNext()) {
            OnConfigurationReadyAndValidListener onConfigurationReadyAndValidListener = (OnConfigurationReadyAndValidListener) it.next();
            if (onConfigurationReadyAndValidListener != null) {
                IAlog.e("notifying listener configuration state has been resolved", new Object[0]);
                onConfigurationReadyAndValidListener.onConfigurationReadyAndValid(this, z11, !z11 ? exc : null);
            }
        }
    }

    public static void a() {
        IAConfigManager iAConfigManager = Q;
        g gVar = iAConfigManager.B;
        if (gVar != null) {
            iAConfigManager.f27759s.a(gVar);
        }
        v vVar = iAConfigManager.f27761u;
        if (vVar.f27938d) {
            return;
        }
        iAConfigManager.f27759s.a(new com.fyber.inneractive.sdk.network.v0(new s(vVar), vVar.f27935a, vVar.f27939e));
    }
}
