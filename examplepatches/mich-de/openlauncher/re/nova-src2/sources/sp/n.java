package sp;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.Semaphore;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class n {

    /* renamed from: j, reason: collision with root package name */
    public static n f87629j;

    /* renamed from: a, reason: collision with root package name */
    public Semaphore f87630a;

    /* renamed from: b, reason: collision with root package name */
    public Semaphore f87631b;

    /* renamed from: c, reason: collision with root package name */
    public Context f87632c;

    /* renamed from: d, reason: collision with root package name */
    public long f87633d;

    /* renamed from: e, reason: collision with root package name */
    public b6.e f87634e;

    /* renamed from: f, reason: collision with root package name */
    public br.a f87635f;

    /* renamed from: g, reason: collision with root package name */
    public String[] f87636g;

    /* renamed from: h, reason: collision with root package name */
    public ConcurrentHashMap f87637h;

    /* renamed from: i, reason: collision with root package name */
    public o f87638i;

    static {
        new b50.d(n.class.getSimpleName());
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static void a(n nVar, k kVar) {
        synchronized (nVar) {
            try {
                nVar.f87630a.acquire();
            } catch (InterruptedException e3) {
                r0.c(e3);
            }
            long jO = r0.f87657d.o();
            try {
                if (!kVar.containsKey("data_sharing_options")) {
                    SharedPreferences sharedPreferencesC = m0.f87615q.c();
                    Boolean boolValueOf = !sharedPreferencesC.contains("limit_data_sharing") ? null : Boolean.valueOf(sharedPreferencesC.getBoolean("limit_data_sharing", false));
                    if (boolValueOf != null) {
                        s60.b bVar = new s60.b();
                        bVar.put("limit_data_sharing", boolValueOf);
                        kVar.put("data_sharing_options", new JSONObject(bVar).toString());
                    }
                }
                String strC = nVar.c(kVar);
                kVar.h();
                JSONObject jSONObject = new JSONObject((String) kVar.get("e"));
                if (nVar.f87637h.containsKey(strC)) {
                    l lVar = (l) nVar.f87637h.get(strC);
                    JSONObject jSONObject2 = new JSONObject((String) lVar.get("e"));
                    double d5 = jSONObject2.getDouble("r") + jSONObject.getDouble("r");
                    double d11 = jSONObject2.getDouble("ad_revenue") + jSONObject.getDouble("ad_revenue");
                    int i5 = jSONObject2.getInt("admon_count") + 1;
                    jSONObject2.put("r", d5);
                    jSONObject2.put("ad_revenue", d11);
                    jSONObject2.put("admon_count", i5);
                    jSONObject2.put("last_update_timestamp", jO);
                    lVar.put("e", jSONObject2.toString());
                    lVar.h();
                    nVar.f87630a.release();
                    o oVar = nVar.f87638i;
                    String strH = lVar.h();
                    synchronized (oVar) {
                        oVar.f87642a.f(strC, strH);
                    }
                } else {
                    JSONObject jSONObject3 = new JSONObject(strC);
                    jSONObject3.remove("send_id");
                    jSONObject3.remove("data_sharing_options");
                    double d12 = jSONObject.getDouble("r");
                    double d13 = jSONObject.getDouble("ad_revenue");
                    jSONObject3.put("r", d12);
                    jSONObject3.put("ad_revenue", d13);
                    jSONObject3.put("admon_count", 1);
                    jSONObject3.put("is_admon_revenue", jSONObject.getBoolean("is_admon_revenue"));
                    jSONObject3.put("is_revenue_event", jSONObject.getBoolean("is_revenue_event"));
                    jSONObject3.put("first_update_timestamp", jO);
                    jSONObject3.put("last_update_timestamp", jO);
                    kVar.put("e", jSONObject3.toString());
                    StringBuilder sb2 = new StringBuilder("a");
                    SharedPreferences sharedPreferences = nVar.f87632c.getSharedPreferences("pref-admon-event-index", 0);
                    long j11 = sharedPreferences.getLong("admon-event-index", -1L) + 1;
                    SharedPreferences.Editor editorEdit = sharedPreferences.edit();
                    editorEdit.putLong("admon-event-index", j11);
                    editorEdit.commit();
                    sb2.append(String.valueOf(j11));
                    kVar.put("event_index", sb2.toString());
                    h0 h0Var = p.b().f87645a;
                    if (h0Var != null ? h0Var.d() : h0.a().d()) {
                        kVar.put("_de", InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
                    }
                    nVar.f87637h.put(strC, kVar);
                    nVar.f87630a.release();
                    o oVar2 = nVar.f87638i;
                    String strH2 = kVar.h();
                    synchronized (oVar2) {
                        oVar2.f87642a.c(strC, strH2);
                    }
                    kVar.h();
                }
            } catch (Throwable th2) {
                nVar.f87630a.release();
                r0.c(th2);
                throw th2;
            }
        }
    }

    public static n b() {
        if (f87629j == null) {
            n nVar = new n();
            nVar.f87630a = new Semaphore(1, true);
            nVar.f87631b = new Semaphore(1, true);
            nVar.f87636g = new String[]{"ad_platform", "ad_currency", "pcc"};
            nVar.f87637h = new ConcurrentHashMap();
            f87629j = nVar;
        }
        return f87629j;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final String c(k kVar) throws JSONException {
        kVar.h();
        JSONObject jSONObject = new JSONObject((String) kVar.get("e"));
        JSONObject jSONObject2 = new JSONObject();
        jSONObject2.put("send_id", this.f87633d);
        for (String str : this.f87636g) {
            try {
                jSONObject2.put(str, jSONObject.getString(str));
            } catch (JSONException e3) {
                r0.c(e3);
            }
        }
        String str2 = (String) kVar.get("data_sharing_options");
        if (str2 != null) {
            jSONObject2.put("data_sharing_options", str2);
        }
        jSONObject2.toString();
        return jSONObject2.toString();
    }

    public final void d() {
        try {
            h0 h0Var = p.b().f87645a;
            if (h0Var != null ? h0Var.e() : h0.a().e()) {
                h0 h0Var2 = p.b().f87645a;
                int iB = h0Var2 != null ? h0Var2.b() : h0.a().b();
                if (iB != 0) {
                    long jO = r0.f87657d.o();
                    long j11 = this.f87632c.getSharedPreferences("batch_send_id", 0).getLong("pref-admon-last-flush-timestmap", 0L);
                    long j12 = iB * 1000;
                    if (j11 > 0 && jO - j11 < j12) {
                        return;
                    }
                }
                Executors.newSingleThreadExecutor().execute(new o7.g0(this, 20));
            }
        } catch (Throwable th2) {
            r0.c(th2);
        }
    }

    public final void e(Application application) {
        long j11;
        HashSet hashSetB;
        o oVar = new o();
        oVar.f87642a = new h30.b(application, "singular-batch-managerx-1.db", null, 1);
        oVar.f87643b = application;
        this.f87638i = oVar;
        this.f87634e = new b6.e(25);
        this.f87635f = new br.a(25);
        synchronized (oVar) {
            j11 = application.getSharedPreferences("batch_send_id", 0).getLong("sendId", 0L);
        }
        this.f87633d = j11;
        this.f87632c = application;
        o oVar2 = this.f87638i;
        synchronized (oVar2) {
            int i5 = o.f87641c;
            hashSetB = oVar2.f87642a.b();
            hashSetB.size();
        }
        Iterator it = hashSetB.iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            try {
                this.f87637h.put(entry.getKey(), l.d((String) entry.getValue()));
            } catch (Throwable th2) {
                r0.c(th2);
            }
        }
        this.f87637h.size();
    }
}
