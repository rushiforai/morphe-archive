package com.apm.insight.h;

import android.text.TextUtils;
import android.util.Log;
import b.u4;
import com.apm.insight.e;
import com.apm.insight.l.f;
import com.apm.insight.l.j;
import com.apm.insight.nativecrash.NativeImpl;
import com.apm.insight.runtime.m;
import com.apm.insight.runtime.n;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    private static HashMap<String, String> f21635a;

    /* renamed from: b, reason: collision with root package name */
    private Map<String, String> f21636b;

    public b(File file) {
        String strA;
        File fileC = j.c(file);
        if (!fileC.exists() || fileC.length() == 0 || (strA = NativeImpl.a(fileC.getAbsolutePath())) == null) {
            return;
        }
        String[] strArrSplit = strA.split("\n");
        this.f21636b = new HashMap();
        for (String str : strArrSplit) {
            String[] strArrSplit2 = str.split("=");
            if (strArrSplit2.length == 2) {
                this.f21636b.put(strArrSplit2[0], strArrSplit2[1]);
            }
        }
    }

    public static String a(String str) {
        return e.g().getFilesDir() + "/apminsight/selflib/lib" + str + ".so";
    }

    public static void b(final String str) {
        m.a().a(new Runnable() { // from class: com.apm.insight.h.b.1

            /* renamed from: a, reason: collision with root package name */
            private boolean f21637a = false;

            @Override // java.lang.Runnable
            public final void run() {
                String strA;
                b.b();
                if (b.c(str)) {
                    return;
                }
                n.a("updateSo", str);
                File file = new File(b.a(str));
                file.getParentFile().mkdirs();
                if (file.exists()) {
                    file.delete();
                }
                String str2 = "doUnpackLibrary: " + str;
                if (e.i().isDebugMode()) {
                    Log.w("npth", str2);
                }
                try {
                    strA = c.a(e.g(), str, file);
                } catch (Throwable th2) {
                    n.a("updateSoError", str);
                    com.apm.insight.c.a();
                    com.apm.insight.runtime.j.a(th2, "NPTH_CATCH");
                    strA = null;
                }
                if (strA != null) {
                    if (this.f21637a) {
                        n.a("updateSoFailed", str);
                        return;
                    }
                    this.f21637a = true;
                    n.a("updateSoPostRetry", str);
                    m.a().a(this, 3000L);
                    return;
                }
                b.f21635a.put(file.getName(), "2.0.0.9");
                try {
                    f.a(new File(e.g().getFilesDir() + "/apminsight/selflib/" + str + ".ver"), "2.0.0.9", false);
                } catch (Throwable unused) {
                }
                n.a("updateSoSuccess", str);
            }
        });
    }

    public final boolean d() {
        Map<String, String> map = this.f21636b;
        return (map == null || map.isEmpty() || TextUtils.isEmpty(this.f21636b.get("process_name")) || TextUtils.isEmpty(this.f21636b.get("crash_thread_name")) || TextUtils.isEmpty(this.f21636b.get("pid")) || TextUtils.isEmpty(this.f21636b.get("tid")) || TextUtils.isEmpty(this.f21636b.get("start_time")) || TextUtils.isEmpty(this.f21636b.get("crash_time")) || TextUtils.isEmpty(this.f21636b.get("signal_line"))) ? false : true;
    }

    public final String e() {
        return this.f21636b.get("signal_line");
    }

    public final Map<String, String> f() {
        return this.f21636b;
    }

    public static String a() {
        return e.g().getFilesDir() + "/apminsight/selflib/";
    }

    public static /* synthetic */ void b() {
        if (f21635a == null) {
            f21635a = new HashMap<>();
            File file = new File(e.g().getFilesDir(), "/apminsight/selflib/");
            String[] list = file.list();
            if (list != null) {
                for (String str : list) {
                    if (str.endsWith(".ver")) {
                        try {
                            f21635a.put(u4.f(4, 0, str), f.a(file.getAbsolutePath() + "/" + str, "\n"));
                        } catch (Throwable th2) {
                            com.apm.insight.c.a();
                            com.apm.insight.runtime.j.a(th2, "NPTH_CATCH");
                        }
                    } else if (!str.endsWith(".so")) {
                        f.a(new File(file, str));
                    }
                }
            }
        }
    }

    public static /* synthetic */ boolean c(String str) {
        return "2.0.0.9".equals(f21635a.get(str)) && new File(a(str)).exists();
    }
}
