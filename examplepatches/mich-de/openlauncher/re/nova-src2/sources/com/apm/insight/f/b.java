package com.apm.insight.f;

import android.text.TextUtils;
import com.apm.insight.CrashType;
import com.apm.insight.entity.c;
import com.apm.insight.k.g;
import com.apm.insight.runtime.a.f;
import com.apm.insight.runtime.m;
import java.util.List;
import java.util.Map;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    private String f21579a;

    /* renamed from: b, reason: collision with root package name */
    private JSONObject f21580b;

    /* renamed from: c, reason: collision with root package name */
    private String f21581c;

    /* renamed from: d, reason: collision with root package name */
    private boolean f21582d;

    /* renamed from: e, reason: collision with root package name */
    private String f21583e;

    /* renamed from: f, reason: collision with root package name */
    private String f21584f;

    /* renamed from: g, reason: collision with root package name */
    private String f21585g;

    /* renamed from: h, reason: collision with root package name */
    private List<String> f21586h;

    public final JSONObject b() {
        return this.f21580b;
    }

    public final String c() {
        return this.f21581c;
    }

    public final String d() {
        return this.f21583e;
    }

    public final String e() {
        return this.f21584f;
    }

    public final String f() {
        return this.f21585g;
    }

    public final List<String> g() {
        return this.f21586h;
    }

    public static void a(final Throwable th2, final String str, final String str2) {
        try {
            m.a().a(new Runnable() { // from class: com.apm.insight.f.b.1

                /* renamed from: c, reason: collision with root package name */
                private /* synthetic */ boolean f21589c = true;

                /* renamed from: d, reason: collision with root package name */
                private /* synthetic */ Map f21590d = null;

                @Override // java.lang.Runnable
                public final void run() {
                    b.a(null, th2, str, this.f21589c, null, "EnsureNotReachHere", str2);
                }
            });
        } catch (Throwable unused) {
        }
    }

    public final void b(String str) {
        this.f21581c = str;
    }

    public final void c(String str) {
        this.f21583e = str;
    }

    public final void d(String str) {
        this.f21584f = str;
    }

    public final void e(String str) {
        this.f21585g = str;
    }

    public static void a(final Object obj, final Throwable th2, final String str, final String str2, final String str3) {
        try {
            m.a().a(new Runnable() { // from class: com.apm.insight.f.b.2

                /* renamed from: d, reason: collision with root package name */
                private /* synthetic */ boolean f21595d = true;

                /* renamed from: e, reason: collision with root package name */
                private /* synthetic */ Map f21596e = null;

                @Override // java.lang.Runnable
                public final void run() {
                    b.a(obj, th2, str, this.f21595d, null, str2, str3);
                }
            });
        } catch (Throwable unused) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void a(Object obj, Throwable th2, String str, boolean z11, Map<String, String> map, String str2, String str3) {
        if (th2 == null) {
            return;
        }
        try {
            StackTraceElement[] stackTrace = th2.getStackTrace();
            StackTraceElement stackTraceElement = stackTrace[0];
            if (stackTraceElement == null) {
                return;
            }
            String strA = com.apm.insight.l.m.a(th2);
            if (TextUtils.isEmpty(strA)) {
                return;
            }
            c cVarA = c.a(stackTraceElement, strA, str, Thread.currentThread().getName(), z11, str2, str3);
            if (obj != null) {
                cVarA.a("exception_line_num", (Object) com.apm.insight.entity.b.a(obj, th2, stackTrace));
            }
            a(null, cVarA);
            f.a().a(CrashType.ENSURE, cVarA);
            g.a(obj, cVarA);
            com.apm.insight.a.b((Object) "[reportException] ".concat(String.valueOf(str)));
        } catch (Throwable th3) {
            com.apm.insight.a.b(th3);
        }
    }

    public static void a(final StackTraceElement[] stackTraceElementArr, final String str, final String str2) {
        try {
            m.a().a(new Runnable() { // from class: com.apm.insight.f.b.3

                /* renamed from: b, reason: collision with root package name */
                private /* synthetic */ int f21600b = 5;

                /* renamed from: e, reason: collision with root package name */
                private /* synthetic */ Map f21603e = null;

                @Override // java.lang.Runnable
                public final void run() {
                    b.a(stackTraceElementArr, this.f21600b, str, str2, "core_exception_monitor", (Map) null);
                }
            });
        } catch (Throwable unused) {
        }
    }

    private static void a(Map<String, String> map, c cVar) {
        try {
            JSONObject jSONObject = new JSONObject();
            if (map != null) {
                for (String str : map.keySet()) {
                    jSONObject.put(str, map.get(str));
                }
                cVar.a("custom", jSONObject);
            }
        } catch (Throwable unused) {
        }
    }

    public static /* synthetic */ void a(StackTraceElement[] stackTraceElementArr, int i5, String str, String str2, String str3, Map map) {
        StackTraceElement stackTraceElement;
        String string;
        if (stackTraceElementArr != null) {
            try {
                if (stackTraceElementArr.length > i5 + 1 && (stackTraceElement = stackTraceElementArr[i5]) != null) {
                    if (stackTraceElementArr.length <= 0) {
                        string = null;
                    } else {
                        StringBuilder sb2 = new StringBuilder();
                        while (i5 < stackTraceElementArr.length) {
                            com.apm.insight.l.m.a(stackTraceElementArr[i5], sb2);
                            i5++;
                        }
                        string = sb2.toString();
                    }
                    if (TextUtils.isEmpty(string)) {
                        return;
                    }
                    c cVarA = c.a(stackTraceElement, string, str, Thread.currentThread().getName(), true, str2, str3);
                    a(null, cVarA);
                    f.a().a(CrashType.ENSURE, cVarA);
                    g.a(cVarA);
                    com.apm.insight.a.b((Object) "[report] ".concat(String.valueOf(str)));
                }
            } catch (Throwable th2) {
                com.apm.insight.a.b(th2);
            }
        }
    }

    public final String a() {
        return this.f21579a;
    }

    public final void a(String str) {
        this.f21579a = str;
    }

    public final void a(JSONObject jSONObject) {
        this.f21580b = jSONObject;
    }

    public final void a(boolean z11) {
        this.f21582d = z11;
    }

    public final void a(List<String> list) {
        this.f21586h = list;
    }
}
