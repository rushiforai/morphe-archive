package com.apm.insight.runtime.a;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import android.os.SystemClock;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public class b {

    /* renamed from: a, reason: collision with root package name */
    private static boolean f21823a = true;

    /* renamed from: b, reason: collision with root package name */
    private static boolean f21824b = false;

    /* renamed from: c, reason: collision with root package name */
    private static boolean f21825c = false;

    /* renamed from: d, reason: collision with root package name */
    private static int f21826d = 1;

    /* renamed from: e, reason: collision with root package name */
    private static boolean f21827e = false;

    /* renamed from: f, reason: collision with root package name */
    private static long f21828f = -1;

    /* renamed from: z, reason: collision with root package name */
    private static volatile b f21829z;
    private int B;

    /* renamed from: g, reason: collision with root package name */
    private Application f21830g;

    /* renamed from: h, reason: collision with root package name */
    private Context f21831h;
    private String n;
    private long o;

    /* renamed from: p, reason: collision with root package name */
    private String f21837p;

    /* renamed from: q, reason: collision with root package name */
    private long f21838q;

    /* renamed from: r, reason: collision with root package name */
    private String f21839r;

    /* renamed from: s, reason: collision with root package name */
    private long f21840s;

    /* renamed from: t, reason: collision with root package name */
    private String f21841t;

    /* renamed from: u, reason: collision with root package name */
    private long f21842u;

    /* renamed from: v, reason: collision with root package name */
    private String f21843v;

    /* renamed from: w, reason: collision with root package name */
    private long f21844w;

    /* renamed from: i, reason: collision with root package name */
    private List<String> f21832i = new ArrayList();

    /* renamed from: j, reason: collision with root package name */
    private List<Long> f21833j = new ArrayList();

    /* renamed from: k, reason: collision with root package name */
    private List<String> f21834k = new ArrayList();

    /* renamed from: l, reason: collision with root package name */
    private List<Long> f21835l = new ArrayList();

    /* renamed from: m, reason: collision with root package name */
    private LinkedList<a> f21836m = new LinkedList<>();

    /* renamed from: x, reason: collision with root package name */
    private boolean f21845x = false;

    /* renamed from: y, reason: collision with root package name */
    private long f21846y = -1;
    private int A = 50;

    /* loaded from: classes2.dex */
    public static class a {

        /* renamed from: a, reason: collision with root package name */
        String f21848a;

        /* renamed from: b, reason: collision with root package name */
        String f21849b;

        /* renamed from: c, reason: collision with root package name */
        long f21850c;

        public a(String str, String str2, long j11) {
            this.f21849b = str2;
            this.f21850c = j11;
            this.f21848a = str;
        }

        public final String toString() {
            return com.apm.insight.l.b.a().format(new Date(this.f21850c)) + " : " + this.f21848a + ' ' + this.f21849b;
        }
    }

    private b(Application application) {
        this.f21831h = application;
        this.f21830g = application;
        if (application != null) {
            try {
                this.f21830g.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() { // from class: com.apm.insight.runtime.a.b.1
                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public final void onActivityCreated(Activity activity, Bundle bundle) {
                        b.this.n = activity.getClass().getName();
                        b.this.o = System.currentTimeMillis();
                        boolean unused = b.f21824b = bundle != null;
                        boolean unused2 = b.f21825c = true;
                        b.this.f21832i.add(b.this.n);
                        b.this.f21833j.add(Long.valueOf(b.this.o));
                        b bVar = b.this;
                        b.a(bVar, bVar.n, b.this.o, "onCreate");
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public final void onActivityDestroyed(Activity activity) {
                        String name = activity.getClass().getName();
                        int iIndexOf = b.this.f21832i.indexOf(name);
                        if (iIndexOf >= 0 && iIndexOf < b.this.f21832i.size()) {
                            b.this.f21832i.remove(iIndexOf);
                            b.this.f21833j.remove(iIndexOf);
                        }
                        b.this.f21834k.add(name);
                        long jCurrentTimeMillis = System.currentTimeMillis();
                        b.this.f21835l.add(Long.valueOf(jCurrentTimeMillis));
                        b.a(b.this, name, jCurrentTimeMillis, "onDestroy");
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public final void onActivityPaused(Activity activity) {
                        b.this.f21841t = activity.getClass().getName();
                        b.this.f21842u = System.currentTimeMillis();
                        b.l(b.this);
                        if (b.this.B == 0) {
                            b.this.f21845x = false;
                            boolean unused = b.f21825c = false;
                            b.this.f21846y = SystemClock.uptimeMillis();
                        } else if (b.this.B < 0) {
                            b.n(b.this);
                            b.this.f21845x = false;
                            boolean unused2 = b.f21825c = false;
                            b.this.f21846y = SystemClock.uptimeMillis();
                        }
                        b bVar = b.this;
                        b.a(bVar, bVar.f21841t, b.this.f21842u, "onPause");
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public final void onActivityResumed(Activity activity) {
                        b.this.f21839r = activity.getClass().getName();
                        b.this.f21840s = System.currentTimeMillis();
                        b.g(b.this);
                        if (!b.this.f21845x) {
                            if (b.f21823a) {
                                b.k();
                                int unused = b.f21826d = 1;
                                long unused2 = b.f21828f = b.this.f21840s;
                            }
                            if (!b.this.f21839r.equals(b.this.f21841t)) {
                                return;
                            }
                            if (b.f21825c && !b.f21824b) {
                                int unused3 = b.f21826d = 4;
                                long unused4 = b.f21828f = b.this.f21840s;
                                return;
                            } else if (!b.f21825c) {
                                int unused5 = b.f21826d = 3;
                                long unused6 = b.f21828f = b.this.f21840s;
                                return;
                            }
                        }
                        b.this.f21845x = true;
                        b bVar = b.this;
                        b.a(bVar, bVar.f21839r, b.this.f21840s, "onResume");
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public final void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public final void onActivityStarted(Activity activity) {
                        b.this.f21837p = activity.getClass().getName();
                        b.this.f21838q = System.currentTimeMillis();
                        b bVar = b.this;
                        b.a(bVar, bVar.f21837p, b.this.f21838q, "onStart");
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public final void onActivityStopped(Activity activity) {
                        b.this.f21843v = activity.getClass().getName();
                        b.this.f21844w = System.currentTimeMillis();
                        b bVar = b.this;
                        b.a(bVar, bVar.f21843v, b.this.f21844w, "onStop");
                    }
                });
            } catch (Throwable unused) {
            }
        }
    }

    public static /* synthetic */ int g(b bVar) {
        int i5 = bVar.B;
        bVar.B = i5 + 1;
        return i5;
    }

    public static /* synthetic */ int l(b bVar) {
        int i5 = bVar.B;
        bVar.B = i5 - 1;
        return i5;
    }

    public static /* synthetic */ int n(b bVar) {
        bVar.B = 0;
        return 0;
    }

    public static /* synthetic */ boolean k() {
        f21823a = false;
        return false;
    }

    private JSONArray n() {
        JSONArray jSONArray = new JSONArray();
        List<String> list = this.f21832i;
        if (list != null && !list.isEmpty()) {
            for (int i5 = 0; i5 < this.f21832i.size(); i5++) {
                try {
                    jSONArray.put(a(this.f21832i.get(i5), this.f21833j.get(i5).longValue()));
                } catch (Throwable unused) {
                }
            }
        }
        return jSONArray;
    }

    private JSONArray o() {
        JSONArray jSONArray = new JSONArray();
        List<String> list = this.f21834k;
        if (list != null && !list.isEmpty()) {
            for (int i5 = 0; i5 < this.f21834k.size(); i5++) {
                try {
                    jSONArray.put(a(this.f21834k.get(i5), this.f21835l.get(i5).longValue()));
                } catch (Throwable unused) {
                }
            }
        }
        return jSONArray;
    }

    public final JSONObject g() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        if (com.apm.insight.e.w()) {
            try {
                jSONObject.put("last_create_activity", a(this.n, this.o));
                jSONObject.put("last_start_activity", a(this.f21837p, this.f21838q));
                jSONObject.put("last_resume_activity", a(this.f21839r, this.f21840s));
                jSONObject.put("last_pause_activity", a(this.f21841t, this.f21842u));
                jSONObject.put("last_stop_activity", a(this.f21843v, this.f21844w));
                jSONObject.put("alive_activities", n());
                jSONObject.put("finish_activities", o());
            } catch (JSONException unused) {
            }
        }
        return jSONObject;
    }

    public final String h() {
        return String.valueOf(this.f21839r);
    }

    public final JSONArray i() {
        JSONArray jSONArray = new JSONArray();
        Iterator it = new ArrayList(this.f21836m).iterator();
        while (it.hasNext()) {
            jSONArray.put(((a) it.next()).toString());
        }
        return jSONArray;
    }

    public final boolean f() {
        return this.f21845x;
    }

    public static long c() {
        return f21828f;
    }

    public static b d() {
        if (f21829z == null) {
            synchronized (b.class) {
                try {
                    if (f21829z == null) {
                        f21829z = new b(com.apm.insight.e.h());
                    }
                } finally {
                }
            }
        }
        return f21829z;
    }

    public final long e() {
        return SystemClock.uptimeMillis() - this.f21846y;
    }

    public static int b() {
        int i5 = f21826d;
        return i5 == 1 ? f21827e ? 2 : 1 : i5;
    }

    public static void a() {
        f21827e = true;
    }

    private static JSONObject a(String str, long j11) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(PendingUpgradeStore.KEY_NAME, str);
            jSONObject.put("time", j11);
        } catch (JSONException unused) {
        }
        return jSONObject;
    }

    public static /* synthetic */ void a(b bVar, String str, long j11, String str2) {
        a aVar;
        if (com.apm.insight.e.w()) {
            try {
                if (bVar.f21836m.size() >= bVar.A) {
                    aVar = bVar.f21836m.poll();
                    if (aVar != null) {
                        bVar.f21836m.add(aVar);
                    }
                } else {
                    aVar = null;
                }
                if (aVar == null) {
                    aVar = new a(str, str2, j11);
                    bVar.f21836m.add(aVar);
                }
                aVar.f21849b = str2;
                aVar.f21848a = str;
                aVar.f21850c = j11;
            } catch (Throwable unused) {
            }
        }
    }
}
