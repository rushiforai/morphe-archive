package com.apm.insight.k;

import android.util.Log;
import com.apm.insight.runtime.m;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONArray;

/* loaded from: classes.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    private static File f21735a = null;

    /* renamed from: b, reason: collision with root package name */
    private static boolean f21736b = false;

    /* renamed from: c, reason: collision with root package name */
    private static boolean f21737c = false;

    /* renamed from: d, reason: collision with root package name */
    private static Map<String, String> f21738d;

    public static boolean a() {
        return f21736b;
    }

    public static boolean b() {
        return f21737c;
    }

    public static void c() {
        if (f21736b) {
            return;
        }
        f21737c = true;
        File file = new File(com.apm.insight.l.j.j(com.apm.insight.e.g()), "apminsight/configCrash/configFile");
        if (file.exists()) {
            try {
                com.apm.insight.runtime.a.a(new JSONArray(com.apm.insight.l.f.a(file, "\n")), false);
                f21736b = true;
            } catch (Throwable unused) {
                com.apm.insight.runtime.a.a((JSONArray) null, false);
            }
        }
    }

    public static void d() {
        c();
        if (g()) {
            a.a();
        }
    }

    public static void e() {
        m.a().a(new Runnable() { // from class: com.apm.insight.k.j.1
            @Override // java.lang.Runnable
            public final void run() {
                if (j.g()) {
                    a.a();
                }
            }
        });
    }

    public static void f() {
        Map<String, String> map = f21738d;
        if (map != null) {
            map.clear();
        }
    }

    public static boolean g() {
        File fileH = h();
        try {
            Map<String, String> mapC = f21738d;
            if (mapC == null) {
                mapC = com.apm.insight.l.f.c(fileH);
            }
            f21738d = mapC;
            if (mapC == null) {
                f21738d = new HashMap();
                return true;
            }
            if (mapC.size() < com.apm.insight.entity.b.c()) {
                return true;
            }
            Iterator<String> it = com.apm.insight.entity.b.d().iterator();
            while (it.hasNext()) {
                if (!f21738d.containsKey(it.next())) {
                    return true;
                }
            }
            long jCurrentTimeMillis = System.currentTimeMillis();
            boolean z11 = false;
            for (Map.Entry<String, String> entry : f21738d.entrySet()) {
                try {
                    if (jCurrentTimeMillis - Long.decode(entry.getValue()).longValue() > com.apm.insight.runtime.d.d(entry.getKey())) {
                        z11 = true;
                    }
                } catch (Throwable th2) {
                    com.apm.insight.a.a(th2);
                }
            }
            if (z11) {
                com.apm.insight.a.a((Object) "config should be updated");
            } else {
                com.apm.insight.a.a((Object) "config should not be updated");
            }
            return z11;
        } catch (Throwable th3) {
            Log.e("npth", "err", th3);
            return true;
        }
    }

    private static File h() {
        if (f21735a == null) {
            f21735a = new File(com.apm.insight.l.j.j(com.apm.insight.e.g()), "apminsight/configCrash/configInvalid");
        }
        return f21735a;
    }

    public static void a(JSONArray jSONArray) {
        try {
            com.apm.insight.l.f.a(new File(com.apm.insight.l.j.j(com.apm.insight.e.g()), "apminsight/configCrash/configFile"), jSONArray);
        } catch (IOException unused) {
        }
        try {
            com.apm.insight.l.f.a(h(), f21738d);
        } catch (Throwable unused2) {
        }
    }

    public static void a(String str) {
        if (f21738d == null) {
            f21738d = new HashMap();
        }
        f21738d.put(str, String.valueOf(System.currentTimeMillis()));
    }
}
