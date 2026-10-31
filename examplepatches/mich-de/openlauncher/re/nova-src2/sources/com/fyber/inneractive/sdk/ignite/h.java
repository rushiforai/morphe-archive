package com.fyber.inneractive.sdk.ignite;

import android.content.ComponentName;
import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.text.TextUtils;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.digitalturbine.ignite.cl.aidl.IIgniteServiceAPI;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.external.InneractiveAdManager;
import com.fyber.inneractive.sdk.network.a1;
import com.fyber.inneractive.sdk.network.t;
import com.fyber.inneractive.sdk.network.w;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class h implements pc.b, pc.a {

    /* renamed from: a, reason: collision with root package name */
    public Context f28479a;

    /* renamed from: b, reason: collision with root package name */
    public IIgniteServiceAPI f28480b;

    /* renamed from: j, reason: collision with root package name */
    public long f28488j;

    /* renamed from: k, reason: collision with root package name */
    public String f28489k;

    /* renamed from: l, reason: collision with root package name */
    public d f28490l;

    /* renamed from: m, reason: collision with root package name */
    public qc.a f28491m;
    public com.fyber.inneractive.sdk.config.global.r n;
    public l o;

    /* renamed from: c, reason: collision with root package name */
    public final Bundle f28481c = new Bundle();

    /* renamed from: e, reason: collision with root package name */
    public boolean f28483e = false;

    /* renamed from: f, reason: collision with root package name */
    public boolean f28484f = false;

    /* renamed from: g, reason: collision with root package name */
    public final CopyOnWriteArrayList f28485g = new CopyOnWriteArrayList();

    /* renamed from: h, reason: collision with root package name */
    public boolean f28486h = false;

    /* renamed from: i, reason: collision with root package name */
    public boolean f28487i = false;

    /* renamed from: d, reason: collision with root package name */
    public final i f28482d = new i(new e(this));

    public final void a(com.fyber.inneractive.sdk.config.global.r rVar) {
        boolean z11;
        h hVar;
        this.n = rVar;
        if (!TextUtils.isEmpty(this.f28489k)) {
            IAlog.a("%s : Ignite installed will init IgniteManager", "IgniteAdapter");
            com.fyber.inneractive.sdk.config.global.features.j jVar = (com.fyber.inneractive.sdk.config.global.features.j) rVar.a(com.fyber.inneractive.sdk.config.global.features.j.class);
            IAlog.a("%s : initializing ignite features", "IgniteAdapter");
            Boolean boolC = jVar.c("odt");
            this.f28483e = boolC != null ? boolC.booleanValue() : false;
            Boolean boolC2 = jVar.c("flow");
            this.f28484f = boolC2 != null ? boolC2.booleanValue() : false;
            Boolean boolC3 = jVar.c("updates");
            boolean zBooleanValue = boolC3 != null ? boolC3.booleanValue() : false;
            Context context = this.f28479a;
            if (context != null && ((z11 = this.f28483e) || this.f28484f)) {
                if (this.o == null) {
                    this.f28487i = false;
                    hVar = this;
                    l lVar = new l(context, new k(), new com.fyber.inneractive.sdk.ignite.events.wrappers.a(), z11, this.f28484f, zBooleanValue, hVar);
                    hVar.o = lVar;
                    lVar.authenticate();
                } else {
                    hVar = this;
                }
                hVar.f28488j = TimeUnit.SECONDS.toMillis(IAConfigManager.Q.f27763w.f27942a.f27936b.a("igniteInstallTimeOutInSeconds", 15, 1));
            }
        }
    }

    public final void m() {
        d dVar = this.f28490l;
        if (dVar != null) {
            com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(dVar);
            this.f28490l = null;
        }
    }

    public final boolean n() {
        l lVar = this.o;
        return lVar != null && lVar.isConnected() && this.o.isAuthenticated();
    }

    public final boolean o() {
        l lVar = this.o;
        return lVar == null || lVar.f69429a.f();
    }

    @Override // pc.b
    public final void onCredentialsRequestFailed(String str) {
        l lVar = this.o;
        if (lVar != null) {
            lVar.onCredentialsRequestFailed(str);
        }
    }

    @Override // pc.b
    public final void onCredentialsRequestSuccess(String str, String str2) {
        l lVar = this.o;
        if (lVar != null) {
            lVar.onCredentialsRequestSuccess(str, str2);
        }
    }

    @Override // pc.a
    public final void onIgniteServiceAuthenticated(String str) {
        this.f28481c.putString("clientToken", str);
        IAlog.a("IgniteAdapter: onIgniteServiceAuthenticated", new Object[0]);
        qc.a aVar = this.f28491m;
        if (aVar != null) {
            aVar.a();
            this.f28491m = null;
        }
    }

    @Override // pc.a
    public final void onIgniteServiceAuthenticationFailed(String str) throws JSONException {
        this.f28480b = null;
        a(j.FAILED_TO_AUTHENTICATE, str);
        IAlog.a("IgniteAdapter: onIgniteServiceAuthenticationFailed : error : %s", str);
        qc.a aVar = this.f28491m;
        if (aVar != null) {
            aVar.a(str);
            this.f28491m = null;
        }
    }

    @Override // pc.a
    public final void onIgniteServiceConnected(ComponentName componentName, IBinder iBinder) {
        String str;
        Context context;
        IAlog.a("IgniteAdapter: onIgniteServiceConnected", new Object[0]);
        this.f28489k = componentName.getPackageName();
        this.f28480b = IIgniteServiceAPI.Stub.asInterface(iBinder);
        if (this.f28487i) {
            l lVar = this.o;
            if (lVar != null) {
                lVar.authenticate();
                return;
            }
            return;
        }
        this.f28487i = true;
        byte[] byteArray = null;
        try {
            o oVarNewBuilder = IgniteRequestOuterClass$IgniteRequest.newBuilder();
            String str2 = IAConfigManager.Q.f27745c;
            oVarNewBuilder.c();
            ((IgniteRequestOuterClass$IgniteRequest) oVarNewBuilder.f30901b).setAppId(str2);
            String packageName = com.fyber.inneractive.sdk.util.o.f31210a.getPackageName();
            oVarNewBuilder.c();
            ((IgniteRequestOuterClass$IgniteRequest) oVarNewBuilder.f30901b).setBundle(packageName);
            String version = InneractiveAdManager.getVersion();
            oVarNewBuilder.c();
            ((IgniteRequestOuterClass$IgniteRequest) oVarNewBuilder.f30901b).setSdkVersion(version);
            String str3 = this.f28489k;
            oVarNewBuilder.c();
            ((IgniteRequestOuterClass$IgniteRequest) oVarNewBuilder.f30901b).setIgnitePackageName(str3);
            if (TextUtils.isEmpty(this.f28489k) || (context = this.f28479a) == null) {
                str = null;
                oVarNewBuilder.c();
                ((IgniteRequestOuterClass$IgniteRequest) oVarNewBuilder.f30901b).setIgniteVersionName(str);
                String strA = com.fyber.inneractive.sdk.util.o.a(this.f28479a);
                oVarNewBuilder.c();
                ((IgniteRequestOuterClass$IgniteRequest) oVarNewBuilder.f30901b).setAppSignature(strA);
                byteArray = ((IgniteRequestOuterClass$IgniteRequest) oVarNewBuilder.a()).toByteArray();
            } else {
                try {
                    str = context.getPackageManager().getPackageInfo(this.f28489k, 0).versionName;
                } catch (Exception unused) {
                    IAlog.a("Failed to resolve ignite version", new Object[0]);
                }
                oVarNewBuilder.c();
                ((IgniteRequestOuterClass$IgniteRequest) oVarNewBuilder.f30901b).setIgniteVersionName(str);
                String strA2 = com.fyber.inneractive.sdk.util.o.a(this.f28479a);
                oVarNewBuilder.c();
                ((IgniteRequestOuterClass$IgniteRequest) oVarNewBuilder.f30901b).setAppSignature(strA2);
                byteArray = ((IgniteRequestOuterClass$IgniteRequest) oVarNewBuilder.a()).toByteArray();
            }
        } catch (Throwable unused2) {
            IAlog.a("Failed to build ignite request", new Object[0]);
        }
        if (byteArray != null) {
            IAConfigManager.Q.f27759s.a(new a1(new b(this), byteArray, this.n));
        }
    }

    @Override // pc.a
    public final void onIgniteServiceConnectionFailed(String str) throws JSONException {
        IAlog.a("IgniteAdapter: onIgniteServiceConnectionFailed : error : %s", str);
        a(j.FAILED_TO_BIND_SERVICE, str);
    }

    @Override // pc.a
    public final void onOdtUnsupported() {
        l lVar;
        IAlog.f("%s: onOdtUnsupported : unsupported ignite version", "IgniteAdapter");
        if (this.f28484f || (lVar = this.o) == null) {
            return;
        }
        lVar.destroy();
        this.o = null;
    }

    public final void a(j jVar, String str) throws JSONException {
        if (this.f28486h) {
            return;
        }
        this.f28486h = true;
        t tVar = t.IGNITE_FLOW_FAILED_TO_START;
        w wVar = new w((com.fyber.inneractive.sdk.response.e) null);
        wVar.f28819b = tVar;
        wVar.f28818a = null;
        wVar.f28821d = null;
        JSONObject jSONObject = new JSONObject();
        String strA = jVar.a();
        try {
            jSONObject.put("error_code", strA);
        } catch (Exception unused) {
            IAlog.f("Got exception adding param to json object: %s, %s", "error_code", strA);
        }
        if (!TextUtils.isEmpty(str)) {
            try {
                jSONObject.put(PglCryptUtils.KEY_MESSAGE, str);
            } catch (Exception unused2) {
                IAlog.f("Got exception adding param to json object: %s, %s", PglCryptUtils.KEY_MESSAGE, str);
            }
        }
        wVar.f28823f.put(jSONObject);
        wVar.a((String) null);
    }

    public final void a(qc.a aVar) {
        IAlog.a("IgniteAdapter : reconnectIgnite : with callback : " + aVar, new Object[0]);
        this.f28491m = aVar;
        l lVar = this.o;
        if (lVar != null) {
            lVar.authenticate();
        }
    }

    public final void a(String str, g gVar) throws JSONException {
        String strA;
        if (TextUtils.isEmpty(str)) {
            return;
        }
        IAlog.a("Starting install timeout with %d", Long.valueOf(this.f28488j));
        d dVar = new d(this);
        this.f28490l = dVar;
        com.fyber.inneractive.sdk.util.r.f31216b.postDelayed(dVar, this.f28488j);
        if (n() && !o() && this.f28480b != null) {
            try {
                JSONObject jSONObject = new JSONObject();
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put("packageName", str);
                jSONObject.put("data", jSONObject2);
                IIgniteServiceAPI iIgniteServiceAPI = this.f28480b;
                String string = jSONObject.toString();
                Bundle bundle = this.f28481c;
                Bundle bundle2 = new Bundle();
                i iVar = this.f28482d;
                c cVar = new c(this, gVar);
                iVar.getClass();
                iIgniteServiceAPI.install(string, bundle, bundle2, new s((e) iVar.f28492a, cVar));
                return;
            } catch (Exception unused) {
                IAlog.a("Failed to install app", new Object[0]);
                return;
            }
        }
        Iterator it = this.f28485g.iterator();
        while (it.hasNext()) {
            r rVar = (r) it.next();
            if (rVar != null) {
                if (o()) {
                    strA = j.SESSION_EXPIRED.a();
                } else {
                    strA = j.NOT_CONNECTED.a();
                }
                rVar.a((String) null, strA, (String) null);
            }
        }
    }
}
