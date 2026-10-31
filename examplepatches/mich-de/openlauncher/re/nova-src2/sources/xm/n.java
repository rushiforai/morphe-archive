package xm;

import android.content.SharedPreferences;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class n {

    /* renamed from: e, reason: collision with root package name */
    public static final Date f96164e = new Date(-1);

    /* renamed from: f, reason: collision with root package name */
    public static final Date f96165f = new Date(-1);

    /* renamed from: a, reason: collision with root package name */
    public final SharedPreferences f96166a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f96167b = new Object();

    /* renamed from: c, reason: collision with root package name */
    public final Object f96168c = new Object();

    /* renamed from: d, reason: collision with root package name */
    public final Object f96169d = new Object();

    public n(SharedPreferences sharedPreferences) {
        this.f96166a = sharedPreferences;
    }

    public final m a() {
        m mVar;
        synchronized (this.f96168c) {
            int i5 = this.f96166a.getInt("num_failed_fetches", 0);
            Date date = new Date(this.f96166a.getLong("backoff_end_time_in_millis", -1L));
            mVar = new m(0);
            mVar.f96162b = i5;
            mVar.f96163c = date;
        }
        return mVar;
    }

    public final HashMap b() {
        try {
            JSONObject jSONObject = new JSONObject(this.f96166a.getString("customSignals", "{}"));
            HashMap map = new HashMap();
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                map.put(next, jSONObject.optString(next));
            }
            return map;
        } catch (JSONException unused) {
            return new HashMap();
        }
    }

    public final long c() {
        return this.f96166a.getLong("fetch_timeout_in_seconds", 60L);
    }

    public final String d() {
        return this.f96166a.getString("last_fetch_etag", null);
    }

    public final Date e() {
        return new Date(this.f96166a.getLong("last_fetch_time_in_millis", -1L));
    }

    public final long f() {
        return this.f96166a.getLong("last_template_version", 0L);
    }

    public final long g() {
        return this.f96166a.getLong("minimum_fetch_interval_in_seconds", i.f96127i);
    }

    public final m h() {
        m mVar;
        synchronized (this.f96169d) {
            int i5 = this.f96166a.getInt("num_failed_realtime_streams", 0);
            Date date = new Date(this.f96166a.getLong("realtime_backoff_end_time_in_millis", -1L));
            mVar = new m(1);
            mVar.f96162b = i5;
            mVar.f96163c = date;
        }
        return mVar;
    }

    public final void i() {
        j(0, f96165f);
    }

    public final void j(int i5, Date date) {
        synchronized (this.f96168c) {
            this.f96166a.edit().putInt("num_failed_fetches", i5).putLong("backoff_end_time_in_millis", date.getTime()).apply();
        }
    }

    public final void k(wm.d dVar) {
        synchronized (this.f96167b) {
            this.f96166a.edit().putLong("fetch_timeout_in_seconds", 60L).putLong("minimum_fetch_interval_in_seconds", dVar.f94609a).commit();
        }
    }

    public final void l(String str) {
        synchronized (this.f96167b) {
            this.f96166a.edit().putString("last_fetch_etag", str).apply();
        }
    }

    public final void m(long j11) {
        synchronized (this.f96167b) {
            this.f96166a.edit().putLong("last_template_version", j11).apply();
        }
    }

    public final void n(int i5, Date date) {
        synchronized (this.f96169d) {
            this.f96166a.edit().putInt("num_failed_realtime_streams", i5).putLong("realtime_backoff_end_time_in_millis", date.getTime()).apply();
        }
    }

    public final void o() {
        synchronized (this.f96167b) {
            this.f96166a.edit().putInt("last_fetch_status", 1).apply();
        }
    }

    public final void p(Date date) {
        synchronized (this.f96167b) {
            this.f96166a.edit().putInt("last_fetch_status", -1).putLong("last_fetch_time_in_millis", date.getTime()).apply();
        }
    }

    public final void q() {
        synchronized (this.f96167b) {
            this.f96166a.edit().putInt("last_fetch_status", 2).apply();
        }
    }
}
