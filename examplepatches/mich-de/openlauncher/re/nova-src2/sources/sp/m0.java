package sp;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.tiktok.util.UrlConst;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import javax.net.ssl.HttpsURLConnection;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class m0 {

    /* renamed from: p, reason: collision with root package name */
    public static int f87614p;

    /* renamed from: q, reason: collision with root package name */
    public static m0 f87615q;

    /* renamed from: a, reason: collision with root package name */
    public final Application f87616a;

    /* renamed from: b, reason: collision with root package name */
    public final i f87617b;

    /* renamed from: c, reason: collision with root package name */
    public final gc.c f87618c;

    /* renamed from: d, reason: collision with root package name */
    public rp.c f87619d;

    /* renamed from: e, reason: collision with root package name */
    public k0 f87620e;

    /* renamed from: f, reason: collision with root package name */
    public t f87621f;

    /* renamed from: g, reason: collision with root package name */
    public HashMap f87622g;

    /* renamed from: h, reason: collision with root package name */
    public Map f87623h;

    /* renamed from: i, reason: collision with root package name */
    public Map f87624i;

    /* renamed from: j, reason: collision with root package name */
    public Map f87625j;

    /* renamed from: k, reason: collision with root package name */
    public String f87626k;
    public double n;

    /* renamed from: l, reason: collision with root package name */
    public boolean f87627l = false;

    /* renamed from: m, reason: collision with root package name */
    public boolean f87628m = false;
    public final u o = new u();

    static {
        new b50.d("Instance");
        f87614p = 0;
    }

    public m0(Context context, rp.c cVar) {
        JSONObject jSONObject;
        String str = r.f87650a;
        String str2 = r.f87650a;
        Context applicationContext = context.getApplicationContext();
        if (!(applicationContext instanceof Application)) {
            a("ie1");
            throw new IllegalStateException("Context failed to cast to ApplicationContext");
        }
        this.f87616a = (Application) applicationContext;
        this.f87619d = cVar;
        gc.c cVar2 = new gc.c("worker");
        this.f87618c = cVar2;
        gc.c cVar3 = new gc.c("api");
        j0 j0Var = new j0();
        int i5 = 1;
        j0Var.f87598a = new q.c(new i0(context.getApplicationContext(), "singular-1.db", null, 1), 26);
        this.f87617b = new i(cVar3, context, j0Var);
        cVar2.start();
        try {
            jSONObject = new JSONObject(c().getString("global_properties", "{}"));
        } catch (Throwable th2) {
            r0.c(th2);
            jSONObject = new JSONObject();
        }
        HashMap map = new HashMap();
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            try {
                String next = itKeys.next();
                map.put(next, jSONObject.getString(next));
            } catch (Throwable th3) {
                r0.c(th3);
            }
        }
        this.f87622g = map;
        if (this.f87619d.f86135d.size() != 0) {
            HashMap map2 = (HashMap) this.f87622g.clone();
            Iterator it = this.f87619d.f86135d.values().iterator();
            if (it.hasNext()) {
                throw u4.e(it);
            }
            if (map2.size() <= 5) {
                this.f87622g = map2;
                h();
                if (this.f87622g == null) {
                    this.f87622g = null;
                    h();
                }
            }
        }
        g(new l0(this, this, i5));
    }

    public static void a(String str) {
        m0 m0Var = f87615q;
        if (m0Var == null || m0Var.o == null) {
            return;
        }
        h0 h0Var = p.b().f87645a;
        if (h0Var != null ? h0Var.f87587c : h0.a().f87587c) {
            ConcurrentHashMap concurrentHashMap = f87615q.o.f87688a;
            try {
                Integer numValueOf = 1;
                if (concurrentHashMap.containsKey(str) && (numValueOf = (Integer) concurrentHashMap.get(str)) != null) {
                    numValueOf = Integer.valueOf(numValueOf.intValue() + 1);
                }
                concurrentHashMap.put(str, numValueOf);
            } catch (Throwable unused) {
                int i5 = u.f87687b;
            }
        }
    }

    public static m0 b(Context context, rp.c cVar) {
        if (f87615q == null) {
            synchronized (m0.class) {
                try {
                    if (f87615q == null) {
                        int i5 = cVar.f86137f;
                        f87615q = new m0(context, cVar);
                    }
                } finally {
                }
            }
        }
        m0 m0Var = f87615q;
        m0Var.f87619d = cVar;
        return m0Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:68:0x019e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void i(long j11) throws IOException {
        Uri uri;
        Uri uri2;
        HttpURLConnection httpURLConnection;
        j jVar = new j(j11);
        m0 m0Var = f87615q;
        c cVar = new c();
        cVar.put("s", String.valueOf(j11));
        cVar.put("a", m0Var.f87619d.f86132a);
        String str = "1";
        Uri uri3 = null;
        if (e0.a().f87577b.booleanValue()) {
            uri = e0.a().f87576a;
            cVar.put("pu", "1");
        } else {
            uri = null;
        }
        cVar.put("ddl_enabled", "false");
        if (uri != null && uri.isHierarchical() && uri.isAbsolute()) {
            String queryParameter = uri.getQueryParameter("referrer");
            String query = uri.getQuery();
            if (!r0.l(queryParameter)) {
                cVar.put("ref", queryParameter);
            }
            if (!r0.l(query)) {
                cVar.put("extra", query);
            }
            if (r0.k(uri)) {
                cVar.put("esp_link", uri.toString());
                int i5 = r0.f87655b;
                try {
                    URL url = new URL(uri.toString());
                    if (url.getProtocol().equalsIgnoreCase("https")) {
                        int i11 = q0.f87648a;
                        httpURLConnection = (HttpsURLConnection) url.openConnection();
                    } else {
                        int i12 = q0.f87648a;
                        httpURLConnection = (HttpURLConnection) url.openConnection();
                    }
                    httpURLConnection.setInstanceFollowRedirects(false);
                    httpURLConnection.connect();
                    String headerField = httpURLConnection.getHeaderField("Location");
                    if (headerField == null) {
                        uri.toString();
                    } else {
                        uri3 = Uri.parse(headerField);
                    }
                } catch (IOException e3) {
                    r0.c(e3);
                }
                uri = uri3;
            }
            int i13 = r0.f87655b;
            if (uri != null) {
                if (uri.getScheme() == null) {
                    uri2 = Uri.parse(UrlConst.HTTPS + uri.toString());
                } else {
                    uri2 = uri;
                }
                if (uri2.getHost() != null) {
                    boolean z11 = (r0.k(uri) || r0.j(uri) || r0.n(uri)) && r0.a(uri) == null;
                    if (!z11) {
                        r0.i(uri);
                    }
                    cVar.put("singular_link", uri.toString());
                    cVar.put("singular_link_resolve_timeout", String.valueOf(0L));
                    cVar.put("singular_link_resolve_required", String.valueOf(z11));
                } else {
                    uri2.toString();
                }
            }
        }
        if (br.c.f18431b == null) {
            br.c.f18431b = new br.c();
        }
        br.c.f18431b.getClass();
        cVar.e(m0Var, true);
        t tVar = m0Var.f87621f;
        String str2 = tVar.f87671i;
        String str3 = tVar.E;
        cVar.put("ab", str2);
        cVar.put("av", tVar.f87672j);
        cVar.put("br", tVar.f87673k);
        cVar.put("de", tVar.f87674l);
        cVar.put("ma", tVar.n);
        cVar.put("mo", tVar.o);
        cVar.put("n", tVar.f87676p);
        cVar.put("pr", tVar.f87678r);
        cVar.put("sdk", m0Var.f87621f.f87679s);
        cVar.put("dnt", "-1");
        if (tVar.f87667e) {
            if (!tVar.f87668f) {
                str = "0";
            }
        } else if (!tVar.f87670h) {
            str = "-1";
        } else if (!tVar.f87668f) {
        }
        cVar.put("dnt", str);
        cVar.put("v", tVar.f87680t);
        if (!r0.l(tVar.f87684x)) {
            cVar.put("src", tVar.f87684x);
        }
        if (!r0.l(tVar.f87682v)) {
            cVar.put("ri", tVar.f87682v);
        }
        if (!r0.l(tVar.f87683w)) {
            cVar.put("fi", tVar.f87683w);
        }
        if (!r0.l(tVar.f87685y) && !r0.l(tVar.f87686z) && !r0.l(tVar.A)) {
            cVar.put("apc", tVar.f87685y);
            cVar.put("apg", tVar.f87686z);
            cVar.put("aps", tVar.A);
        }
        cVar.put("lc", Locale.getDefault().toString());
        cVar.put("install_time", Long.valueOf(tVar.B).toString());
        cVar.put("update_time", Long.valueOf(tVar.C).toString());
        cVar.put("current_device_time", Long.valueOf(r0.f87657d.o()).toString());
        cVar.put("device_type", tVar.f87681u);
        cVar.put("custom_user_id", tVar.D);
        if (!r0.l(str3)) {
            cVar.put("device_user_agent", str3);
        }
        if (m0Var.f87628m) {
            cVar.put("is", InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
        } else {
            cVar.put("is", "false");
        }
        if (m0Var.f87628m) {
            if (m0Var.f87623h != null) {
                cVar.put("install_ref", new JSONObject(m0Var.f87623h).toString());
            }
            cVar.put("install_ref_timeinterval", String.valueOf(m0Var.n));
            HashMap map = new HashMap();
            Map map2 = m0Var.f87624i;
            if (map2 != null) {
                map.putAll(map2);
            }
            Map map3 = m0Var.f87625j;
            if (map3 != null) {
                map.putAll(map3);
            }
            cVar.put("referrer_data", new JSONObject(map).toString());
        }
        boolean z12 = m0Var.f87628m;
        String str4 = m0Var.f87626k;
        if (z12 & (str4 != null)) {
            cVar.put("dt_referrer", str4);
        }
        cVar.put("asid_timeinterval", String.valueOf(r0.f87654a));
        cVar.put("asid_scope", String.valueOf(r0.f87655b));
        String str5 = r0.f87656c;
        if (!r0.l(str5)) {
            cVar.put("ek", str5);
        }
        jVar.putAll(cVar);
        f87615q.f87617b.a(jVar);
        m0 m0Var2 = f87615q;
        m0Var2.f87619d.getClass();
        m0Var2.f87628m = false;
    }

    public final SharedPreferences c() {
        return this.f87616a.getSharedPreferences("singular-pref-session", 0);
    }

    public final void d(f fVar) {
        if (c().getBoolean("stop_all_tracking", false)) {
            return;
        }
        if (this.f87627l && f87615q != null && this.f87620e != null) {
            g(new o7.g0(fVar, 22));
            return;
        }
        mk.w wVar = new mk.w((Object) this, (Object) fVar, false, 21);
        if (f87614p < 10) {
            this.f87618c.a().postDelayed(wVar, 2000);
            f87614p++;
        }
        a("ie4");
    }

    public final void e(ai.j jVar) {
        if (c().getBoolean("stop_all_tracking", false)) {
            return;
        }
        if (this.f87627l && f87615q != null && this.f87620e != null) {
            g(new o7.g0(jVar, 21));
            return;
        }
        mk.w wVar = new mk.w((Object) this, (Object) jVar, false, 20);
        if (f87614p < 10) {
            this.f87618c.a().postDelayed(wVar, 2000);
            f87614p++;
        }
        a("ie3");
    }

    public final boolean f(String str, String str2) {
        if ((str != null ? str.length() : 0) + (str2 != null ? str2.length() : 0) > 3746) {
            a("fe14");
            return false;
        }
        e(new ai.j(str, str2));
        return true;
    }

    public final void g(Runnable runnable) {
        this.f87618c.a().post(runnable);
    }

    public final void h() {
        if (this.f87622g == null) {
            this.f87622g = new HashMap();
        }
        SharedPreferences.Editor editorEdit = c().edit();
        editorEdit.putString("global_properties", new JSONObject(this.f87622g).toString());
        editorEdit.commit();
    }
}
