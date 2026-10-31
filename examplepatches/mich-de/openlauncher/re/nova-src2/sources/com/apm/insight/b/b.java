package com.apm.insight.b;

import android.content.Context;
import android.os.Process;
import android.os.SystemClock;
import android.text.TextUtils;
import b.c0;
import com.apm.insight.CrashType;
import com.apm.insight.ICrashCallback;
import com.apm.insight.Npth;
import com.apm.insight.entity.Header;
import com.apm.insight.entity.b;
import com.apm.insight.l.c;
import com.apm.insight.l.m;
import com.apm.insight.nativecrash.NativeImpl;
import com.apm.insight.runtime.l;
import com.apm.insight.runtime.n;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.android.gms.internal.measurement.k2;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: z, reason: collision with root package name */
    private static volatile boolean f21417z = true;

    /* renamed from: a, reason: collision with root package name */
    private c f21418a;

    /* renamed from: b, reason: collision with root package name */
    private final Context f21419b;

    /* renamed from: c, reason: collision with root package name */
    private volatile boolean f21420c;

    /* renamed from: g, reason: collision with root package name */
    private JSONObject f21424g;

    /* renamed from: h, reason: collision with root package name */
    private JSONObject f21425h;

    /* renamed from: m, reason: collision with root package name */
    private JSONArray f21430m;
    private JSONObject n;

    /* renamed from: q, reason: collision with root package name */
    private JSONArray f21432q;

    /* renamed from: r, reason: collision with root package name */
    private JSONArray f21433r;

    /* renamed from: s, reason: collision with root package name */
    private JSONObject f21434s;

    /* renamed from: t, reason: collision with root package name */
    private boolean f21435t;

    /* renamed from: v, reason: collision with root package name */
    private volatile boolean f21437v;

    /* renamed from: d, reason: collision with root package name */
    private long f21421d = -1;

    /* renamed from: e, reason: collision with root package name */
    private File f21422e = null;

    /* renamed from: f, reason: collision with root package name */
    private boolean f21423f = true;

    /* renamed from: i, reason: collision with root package name */
    private String f21426i = "unknown";

    /* renamed from: j, reason: collision with root package name */
    private String f21427j = "unknown";

    /* renamed from: k, reason: collision with root package name */
    private String f21428k = "unknown";

    /* renamed from: l, reason: collision with root package name */
    private String f21429l = "npth_inner_default";
    private int o = 0;

    /* renamed from: p, reason: collision with root package name */
    private long f21431p = -1;

    /* renamed from: u, reason: collision with root package name */
    private final Object f21436u = new Object();

    /* renamed from: w, reason: collision with root package name */
    private long f21438w = -1;

    /* renamed from: x, reason: collision with root package name */
    private long f21439x = 0;

    /* renamed from: y, reason: collision with root package name */
    private final Runnable f21440y = new Runnable() { // from class: com.apm.insight.b.b.1
        @Override // java.lang.Runnable
        public final void run() {
            try {
                b.this.g();
            } catch (Throwable th2) {
                com.apm.insight.c.a();
                com.apm.insight.runtime.j.a(th2, "NPTH_CATCH");
            }
        }
    };
    private int A = 0;
    private List<Pattern> B = null;
    private Pattern C = null;
    private File D = null;

    public b(Context context) {
        this.f21419b = context;
    }

    private static boolean h() {
        boolean zA = com.apm.insight.l.a.a();
        boolean z11 = !zA;
        if (zA || com.apm.insight.runtime.a.b.d().e() > 2000) {
            return z11;
        }
        return false;
    }

    private File i() {
        if (this.D == null) {
            this.D = new File(this.f21419b.getFilesDir(), "has_anr_signal_" + com.apm.insight.l.a.b().replaceAll(":", "_"));
        }
        return this.D;
    }

    public final void b() {
        if (this.f21420c) {
            this.f21420c = false;
            c cVar = this.f21418a;
            if (cVar != null) {
                cVar.b();
            }
            this.f21418a = null;
        }
    }

    public final void c() {
        c cVar = this.f21418a;
        if (cVar != null) {
            cVar.a();
        }
    }

    public final void d() {
        synchronized (this.f21436u) {
        }
        this.f21440y.run();
    }

    public final void e() {
        if (NativeImpl.h()) {
            try {
                com.apm.insight.l.f.a(i(), String.valueOf(this.A + 1), false);
            } catch (Throwable th2) {
                com.apm.insight.c.a();
                com.apm.insight.runtime.j.a(th2, "NPTH_CATCH");
            }
        }
        this.f21438w = SystemClock.uptimeMillis();
        this.f21437v = true;
    }

    public final void f() {
        File fileI = i();
        try {
            int iIntValue = Integer.decode(com.apm.insight.l.f.a(fileI.getAbsolutePath(), "\n")).intValue();
            this.A = iIntValue;
            if (iIntValue >= 2) {
                NativeImpl.a(false);
            } else {
                NativeImpl.a(true);
            }
        } catch (IOException unused) {
            NativeImpl.a(true);
        } catch (Throwable unused2) {
            com.apm.insight.l.f.a(fileI);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:120:0x03d8 A[Catch: all -> 0x03df, TRY_LEAVE, TryCatch #9 {all -> 0x03df, blocks: (B:118:0x03ca, B:120:0x03d8), top: B:154:0x03ca }] */
    /* JADX WARN: Removed duplicated region for block: B:123:0x0406 A[Catch: all -> 0x0411, TRY_LEAVE, TryCatch #1 {all -> 0x0411, blocks: (B:121:0x03df, B:123:0x0406), top: B:138:0x03df }] */
    /* JADX WARN: Unreachable blocks removed: 2, instructions: 2 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean g() {
        boolean z11;
        int i5;
        String str;
        String str2;
        boolean z12;
        JSONArray jSONArrayB;
        boolean z13;
        JSONArray jSONArrayA;
        JSONObject jSONObject;
        JSONObject jSONObjectA;
        String str3;
        String str4;
        JSONArray jSONArray;
        final long j11;
        JSONObject jSONObjectA2;
        boolean z14;
        JSONObject jSONObject2;
        JSONArray jSONArrayA2;
        boolean zB = com.apm.insight.runtime.i.a().b();
        long jUptimeMillis = SystemClock.uptimeMillis();
        a(jUptimeMillis);
        String strA = d.a(this.f21419b);
        long jCurrentTimeMillis = System.currentTimeMillis();
        String str5 = "normal";
        TextUtils.isEmpty(strA);
        if (TextUtils.isEmpty(strA)) {
            z11 = zB;
            i5 = 1;
            str = "unknown";
            str2 = "unknown";
            z12 = false;
            jSONArrayB = null;
            z13 = false;
            jSONArrayA = null;
            jSONObject = null;
            jSONObjectA = null;
            str3 = "normal";
            str4 = "unknown";
            jSONArray = null;
            j11 = jCurrentTimeMillis;
            jSONObjectA2 = null;
        } else {
            synchronized (this.f21436u) {
            }
            if (this.f21424g == null || System.currentTimeMillis() - this.f21421d > 20000) {
                if (this.f21437v) {
                    this.f21437v = false;
                    str5 = "trace_after";
                }
                b(jUptimeMillis);
            } else {
                str5 = "trace_last";
            }
            JSONObject jSONObject3 = this.f21424g;
            String str6 = this.f21426i;
            String str7 = this.f21427j;
            String str8 = this.f21428k;
            JSONArray jSONArray2 = this.f21430m;
            JSONArray jSONArray3 = this.f21433r;
            JSONArray jSONArray4 = this.f21432q;
            i5 = 1;
            JSONObject jSONObject4 = this.f21434s;
            JSONObject jSONObject5 = this.f21425h;
            z11 = zB;
            z12 = this.f21435t;
            long j12 = this.f21431p;
            this.f21424g = null;
            this.f21430m = null;
            this.f21432q = null;
            this.f21425h = null;
            this.f21433r = null;
            this.f21426i = "unknown";
            this.f21427j = "unknown";
            this.f21428k = "unknown";
            this.o = 0;
            str2 = str8;
            str4 = str6;
            jSONArray = jSONArray2;
            jSONObjectA = jSONObject5;
            jSONArrayA = jSONArray4;
            jSONArrayB = jSONArray3;
            str = str7;
            str3 = str5;
            j11 = j12;
            jSONObjectA2 = jSONObject3;
            jSONObject = jSONObject4;
            z13 = true;
        }
        if (TextUtils.isEmpty(strA)) {
            if (this.f21424g == null || System.currentTimeMillis() - this.f21421d <= 20000) {
                if (this.f21424g == null || System.currentTimeMillis() - this.f21421d <= 2000 || !NativeImpl.h()) {
                    return false;
                }
                com.apm.insight.l.f.a(i());
                return false;
            }
            this.f21424g = null;
            this.f21430m = null;
            this.f21432q = null;
            this.f21425h = null;
            this.f21433r = null;
            this.f21426i = "unknown";
            this.f21427j = "unknown";
            this.f21428k = "unknown";
            this.o = 0;
            this.f21422e = null;
            return false;
        }
        if (jSONObjectA2 == null) {
            if (jSONArrayA == null) {
                try {
                    jSONArrayB = f.b().b();
                    jSONArrayA = j.a(jUptimeMillis);
                    z14 = z12;
                    try {
                        jSONObjectA = f.b().a(jUptimeMillis).a();
                        JSONObject jSONObject6 = new JSONObject();
                        try {
                            com.apm.insight.l.a.a(this.f21419b, jSONObject6);
                            jSONObject = jSONObject6;
                        } catch (Throwable unused) {
                            jSONObject = jSONObject6;
                        }
                    } catch (Throwable unused2) {
                    }
                } catch (Throwable unused3) {
                }
            } else {
                z14 = z12;
            }
            jSONObjectA2 = d.a();
        } else {
            z14 = z12;
        }
        JSONObject jSONObject7 = jSONObject;
        JSONObject jSONObject8 = jSONObjectA;
        if (jSONObjectA2 == null || jSONObjectA2.length() <= 0) {
            return z13;
        }
        boolean z15 = z13;
        try {
            jSONObjectA2.put("pid", Process.myPid());
            jSONObjectA2.put("package", this.f21419b.getPackageName());
            jSONObjectA2.put("is_remote_process", 0);
            jSONObjectA2.put("is_new_stack", 10);
            com.apm.insight.entity.a aVar = new com.apm.insight.entity.a(new JSONObject());
            JSONObject jSONObject9 = jSONObjectA2;
            aVar.a("data", (Object) jSONObject9.toString());
            aVar.a("is_anr", Integer.valueOf(i5));
            aVar.a("anrType", (Object) str3);
            if (com.apm.insight.e.x()) {
                aVar.a("history_message", (Object) jSONArrayB);
                aVar.a("current_message", jSONObject8);
                aVar.a("pending_messages", (Object) jSONArrayA);
            }
            aVar.a("anr_time", Long.valueOf(System.currentTimeMillis()));
            aVar.a("crash_time", Long.valueOf(j11));
            com.apm.insight.c.a.b();
            aVar.c(jSONObject7);
            aVar.a("anr_info", (Object) strA);
            if (jSONArray != null) {
                aVar.a("dump_trace", (Object) jSONArray);
            }
            JSONObject jSONObject10 = this.n;
            aVar.a("all_thread_stacks", (jSONObject10 == null || jSONObject10.length() == 0) ? m.b((String) null) : this.n);
            com.apm.insight.runtime.a.f fVarA = com.apm.insight.runtime.a.f.a();
            CrashType crashType = CrashType.ANR;
            com.apm.insight.entity.a aVarA = fVarA.a(crashType, aVar);
            aVarA.a("is_background", Boolean.valueOf(z14));
            aVarA.a("logcat", (Object) com.apm.insight.runtime.h.a(com.apm.insight.e.f()));
            aVarA.a("has_dump", (Object) InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
            aVarA.a("crash_uuid", (Object) com.apm.insight.e.a(j11, crashType, false, false));
            JSONObject jSONObjectOptJSONObject = aVarA.c().optJSONObject("filters");
            com.apm.insight.entity.d.b(aVarA.c());
            if (jSONObjectOptJSONObject == null) {
                try {
                    jSONObject2 = new JSONObject();
                } catch (Throwable unused4) {
                    jSONObject2 = jSONObjectOptJSONObject;
                    com.apm.insight.a.a.a();
                    CrashType crashType2 = CrashType.LAUNCH;
                    com.apm.insight.e.e();
                    if (com.apm.insight.a.e().length() > 1024) {
                    }
                    jSONArrayA2 = com.apm.insight.nativecrash.b.a(com.apm.insight.l.j.e(com.apm.insight.e.f()), com.apm.insight.l.j.f(com.apm.insight.e.f()));
                    jSONObject2.put("leak_threads_count", String.valueOf(jSONArrayA2.length()));
                    if (jSONArrayA2.length() > 0) {
                    }
                    String strOptString = jSONObject9.optString("mainStackFromTrace");
                    JSONArray jSONArrayA3 = com.apm.insight.entity.b.a(strOptString);
                    com.apm.insight.entity.b.a(aVarA.c(), jSONArrayA3, new b.a() { // from class: com.apm.insight.b.b.2
                        @Override // com.apm.insight.entity.b.a
                        public final void a(JSONObject jSONObject11) {
                            com.apm.insight.k.d.a().a(jSONObject11, j11, b.this.f21423f);
                        }
                    });
                    b(strOptString, jSONArrayA3);
                    return z15;
                }
                try {
                    aVarA.a("filters", jSONObject2);
                } catch (Throwable unused5) {
                    jSONObjectOptJSONObject = jSONObject2;
                    jSONObject2 = jSONObjectOptJSONObject;
                    com.apm.insight.a.a.a();
                    CrashType crashType22 = CrashType.LAUNCH;
                    com.apm.insight.e.e();
                    if (com.apm.insight.a.e().length() > 1024) {
                    }
                    jSONArrayA2 = com.apm.insight.nativecrash.b.a(com.apm.insight.l.j.e(com.apm.insight.e.f()), com.apm.insight.l.j.f(com.apm.insight.e.f()));
                    jSONObject2.put("leak_threads_count", String.valueOf(jSONArrayA2.length()));
                    if (jSONArrayA2.length() > 0) {
                    }
                    String strOptString2 = jSONObject9.optString("mainStackFromTrace");
                    JSONArray jSONArrayA32 = com.apm.insight.entity.b.a(strOptString2);
                    com.apm.insight.entity.b.a(aVarA.c(), jSONArrayA32, new b.a() { // from class: com.apm.insight.b.b.2
                        @Override // com.apm.insight.entity.b.a
                        public final void a(JSONObject jSONObject11) {
                            com.apm.insight.k.d.a().a(jSONObject11, j11, b.this.f21423f);
                        }
                    });
                    b(strOptString2, jSONArrayA32);
                    return z15;
                }
            } else {
                jSONObject2 = jSONObjectOptJSONObject;
            }
            jSONObject2.put("anrType", str3);
            jSONObject2.put("max_utm_thread", str4);
            jSONObject2.put("max_stm_thread", str);
            jSONObject2.put("max_utm_stm_thread", str2);
            jSONObject2.put("max_utm_thread_version", this.f21429l);
            long j13 = j11 - com.apm.insight.e.j();
            jSONObject2.put("crash_length", j13 < 30000 ? "0 - 30s" : j13 < 60000 ? "30s - 1min" : j13 < 120000 ? "1min - 2min" : j13 < 300000 ? "2min - 5min" : j13 < TTAdConstant.AD_MAX_EVENT_TIME ? "5min - 10min" : j13 < 1800000 ? "10min - 30min" : j13 < 3600000 ? "30min - 1h" : "1h - ");
            jSONObject2.put("disable_looper_monitor", String.valueOf(com.apm.insight.runtime.a.c()));
            jSONObject2.put("npth_force_apm_crash", String.valueOf(com.apm.insight.c.a.b()));
            jSONObject2.put("sdk_version", "2.0.0.9");
            jSONObject2.put("has_logcat", String.valueOf(aVarA.a()));
            jSONObject2.put("memory_leak", String.valueOf(com.apm.insight.entity.a.a(com.apm.insight.e.f())));
            jSONObject2.put("fd_leak", String.valueOf(com.apm.insight.entity.a.b(com.apm.insight.e.f())));
            jSONObject2.put("threads_leak", String.valueOf(com.apm.insight.entity.a.c(com.apm.insight.e.f())));
            jSONObject2.put("is_64_devices", String.valueOf(Header.a()));
            jSONObject2.put("is_64_runtime", String.valueOf(NativeImpl.f()));
            jSONObject2.put("is_x86_devices", String.valueOf(Header.b()));
            jSONObject2.put("has_meminfo_file", String.valueOf(com.apm.insight.l.j.d(com.apm.insight.e.f()).exists()));
            jSONObject2.put("is_root", com.apm.insight.nativecrash.a.k() ? InneractiveMediationDefs.SHOW_HOUSE_AD_YES : "false");
            jSONObject2.put("anr_normal_trace", String.valueOf(!this.f21437v));
            jSONObject2.put("anr_no_run", String.valueOf(z11));
            jSONObject2.put("crash_after_crash", Npth.hasCrash() ? InneractiveMediationDefs.SHOW_HOUSE_AD_YES : "false");
            jSONObject2.put("from_file", String.valueOf(d.b()));
            jSONObject2.put("has_dump", InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
            jSONObject2.put("from_kill", "false");
            jSONObject2.put("last_resume_activity", com.apm.insight.runtime.a.b.d().h());
            int i11 = this.o;
            if (i11 > 0) {
                jSONObject2.put("may_have_stack_overflow", String.valueOf(i11));
            }
            try {
                a(strA, jSONObject2);
            } catch (Throwable th2) {
                com.apm.insight.c.a();
                com.apm.insight.runtime.j.a(th2, "NPTH_CATCH");
            }
            com.apm.insight.a.a.a();
            CrashType crashType222 = CrashType.LAUNCH;
            com.apm.insight.e.e();
            try {
                if (com.apm.insight.a.e().length() > 1024) {
                    aVarA.a("has_system_traces", InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
                }
            } catch (Throwable unused6) {
            }
            try {
                jSONArrayA2 = com.apm.insight.nativecrash.b.a(com.apm.insight.l.j.e(com.apm.insight.e.f()), com.apm.insight.l.j.f(com.apm.insight.e.f()));
                jSONObject2.put("leak_threads_count", String.valueOf(jSONArrayA2.length()));
                if (jSONArrayA2.length() > 0) {
                    com.apm.insight.l.f.a(com.apm.insight.l.j.g(com.apm.insight.e.f()), jSONArrayA2);
                }
            } catch (Throwable unused7) {
            }
            String strOptString22 = jSONObject9.optString("mainStackFromTrace");
            JSONArray jSONArrayA322 = com.apm.insight.entity.b.a(strOptString22);
            com.apm.insight.entity.b.a(aVarA.c(), jSONArrayA322, new b.a() { // from class: com.apm.insight.b.b.2
                @Override // com.apm.insight.entity.b.a
                public final void a(JSONObject jSONObject11) {
                    com.apm.insight.k.d.a().a(jSONObject11, j11, b.this.f21423f);
                }
            });
            b(strOptString22, jSONArrayA322);
            return z15;
        } catch (Throwable th3) {
            com.apm.insight.c.a();
            com.apm.insight.runtime.j.a(th3, "NPTH_CATCH");
            return z15;
        }
    }

    public final void a() {
        if (this.f21420c) {
            return;
        }
        this.f21418a = new c(this);
        this.f21421d = com.apm.insight.e.j();
        this.f21420c = true;
    }

    private JSONObject c(JSONArray jSONArray) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        JSONArray jSONArrayB = com.apm.insight.a.b(jSONArray);
        if (jSONArrayB.length() != jSONArray.length()) {
            this.o++;
        }
        try {
            jSONObject.put("thread_number", 1);
            StringBuilder sb2 = new StringBuilder();
            for (int i5 = 0; i5 < jSONArrayB.length(); i5++) {
                sb2.append(jSONArrayB.getString(i5));
                sb2.append('\n');
            }
            jSONObject.put("mainStackFromTrace", sb2.toString());
            return jSONObject;
        } catch (JSONException unused) {
            return null;
        }
    }

    private boolean a(long j11) {
        if (this.f21437v) {
            this.f21437v = false;
            b(j11);
        }
        return false;
    }

    private void b(long j11) {
        if (this.f21439x != this.f21438w) {
            try {
                this.f21431p = System.currentTimeMillis();
                if (com.apm.insight.e.x()) {
                    this.f21433r = f.b().b();
                    this.f21432q = j.a(j11);
                    this.f21425h = f.b().a(j11).a();
                }
                JSONObject jSONObject = new JSONObject();
                this.f21434s = jSONObject;
                com.apm.insight.l.a.a(this.f21419b, jSONObject);
                this.f21435t = h();
                this.f21423f = !Npth.hasCrash();
            } catch (Throwable unused) {
            }
            try {
                this.f21421d = this.f21431p;
                String strB = com.apm.insight.l.j.b();
                File file = new File(new File(com.apm.insight.l.j.f(this.f21419b), strB), "trace_" + com.apm.insight.l.a.b().replace(AbstractJsonLexerKt.COLON, '_') + ".txt");
                file.getParentFile().mkdirs();
                com.apm.insight.l.f.a(file, com.apm.insight.l.b.a().format(new Date(System.currentTimeMillis())) + "\n", false);
                n.a("anr_trace", strB);
                NativeImpl.i(file.getAbsolutePath());
                try {
                    JSONArray jSONArrayA = com.apm.insight.l.f.a(file.getAbsolutePath());
                    this.f21430m = jSONArrayA;
                    a(jSONArrayA);
                } catch (IOException unused2) {
                } catch (Throwable th2) {
                    com.apm.insight.c.a();
                    com.apm.insight.runtime.j.a(th2, "NPTH_CATCH");
                }
                if (this.f21424g == null) {
                    this.f21424g = d.a();
                }
            } catch (Throwable th3) {
                com.apm.insight.c.a();
                com.apm.insight.runtime.j.a(th3, "NPTH_CATCH");
            }
            com.apm.insight.a.d();
        } else {
            try {
                this.f21421d = this.f21431p;
                String strB2 = com.apm.insight.l.j.b();
                File file2 = new File(new File(com.apm.insight.l.j.f(this.f21419b), strB2), "trace" + com.apm.insight.l.a.b().replace(AbstractJsonLexerKt.COLON, '_') + ".txt");
                file2.getParentFile().mkdirs();
                com.apm.insight.l.f.a(file2, com.apm.insight.l.b.a().format(new Date(System.currentTimeMillis())) + "\n", false);
                n.a("anr_trace", strB2);
                NativeImpl.i(file2.getAbsolutePath());
                try {
                    JSONArray jSONArrayA2 = com.apm.insight.l.f.a(file2.getAbsolutePath());
                    this.f21430m = jSONArrayA2;
                    a(jSONArrayA2);
                } catch (IOException unused3) {
                } catch (Throwable th4) {
                    com.apm.insight.c.a();
                    com.apm.insight.runtime.j.a(th4, "NPTH_CATCH");
                }
                if (this.f21424g == null) {
                    this.f21424g = d.a();
                }
            } catch (Throwable th5) {
                com.apm.insight.c.a();
                com.apm.insight.runtime.j.a(th5, "NPTH_CATCH");
            }
        }
        long j12 = this.f21438w;
        this.f21439x = j12;
        this.f21438w = -1L;
        if (j12 == -1) {
            this.f21439x = (-1) - 1;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00be  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0125  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0153  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0171  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x017a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void a(JSONArray jSONArray) throws JSONException {
        String strSubstring;
        int[] iArrB;
        int[] iArrB2;
        if (jSONArray == null) {
            return;
        }
        this.f21424g = null;
        this.n = null;
        this.o = 0;
        JSONArray jSONArray2 = new JSONArray();
        JSONArray jSONArray3 = new JSONArray();
        JSONArray jSONArray4 = new JSONArray();
        this.f21426i = "unknown";
        this.f21427j = "unknown";
        this.f21428k = "unknown";
        int[] iArr = new int[3];
        iArr[0] = 0;
        iArr[1] = 0;
        int i5 = 2;
        iArr[2] = 0;
        JSONArray jSONArray5 = jSONArray4;
        String string = null;
        boolean z11 = false;
        for (int i11 = 0; i11 < jSONArray.length(); i11++) {
            String strOptString = jSONArray.optString(i11);
            int i12 = i5;
            if (TextUtils.isEmpty(strOptString)) {
                if (jSONArray5.length() > 0 && !TextUtils.isEmpty(string)) {
                    if (this.f21424g == null && "main".equals(string)) {
                        this.f21424g = c(jSONArray5);
                    } else {
                        jSONArray2.put(a(string, jSONArray5));
                    }
                    try {
                        if (!"main".equals(string)) {
                            string = string.substring(0, string.indexOf(40)).trim();
                        }
                    } catch (Throwable unused) {
                    }
                    String str = string;
                    if (!a(str)) {
                        try {
                            iArrB2 = b(jSONArray5);
                        } catch (IllegalArgumentException e3) {
                            com.apm.insight.c.a();
                            com.apm.insight.runtime.j.a(e3, "NPTH_CATCH");
                            iArrB2 = null;
                            if (iArrB2 != null) {
                            }
                            if (jSONArray5.length() > 0) {
                            }
                            i5 = i12;
                            string = null;
                        } catch (Throwable unused2) {
                            iArrB2 = null;
                            if (iArrB2 != null) {
                            }
                            if (jSONArray5.length() > 0) {
                            }
                            i5 = i12;
                            string = null;
                        }
                        if (iArrB2 != null) {
                            int i13 = iArrB2[0];
                            if (i13 > iArr[0]) {
                                iArr[0] = i13;
                                this.f21426i = str;
                            }
                            int i14 = iArrB2[1];
                            if (i14 > iArr[1]) {
                                iArr[1] = i14;
                                this.f21427j = str;
                            }
                            int i15 = iArrB2[i12];
                            if (i15 > iArr[i12]) {
                                iArr[i12] = i15;
                                this.f21428k = str;
                            }
                        }
                    }
                }
                if (jSONArray5.length() > 0) {
                    jSONArray5 = new JSONArray();
                }
                i5 = i12;
                string = null;
            } else if (!z11) {
                i5 = i12;
                if (strOptString.startsWith("DALVIK THREADS") || strOptString.startsWith("suspend") || strOptString.startsWith("\"")) {
                    z11 = true;
                }
                jSONArray3.put(strOptString);
            } else if (!z11) {
                i5 = i12;
            } else if (strOptString.contains(" prio=")) {
                if (jSONArray5.length() > 0 && !TextUtils.isEmpty(string)) {
                    if (this.f21424g == null && "main".equals(string)) {
                        this.f21424g = c(jSONArray5);
                    } else {
                        jSONArray2.put(a(string, jSONArray5));
                    }
                    try {
                        if (!"main".equals(string)) {
                            string = string.substring(0, string.indexOf(40)).trim();
                        }
                    } catch (Throwable unused3) {
                    }
                    String str2 = string;
                    if (!a(str2)) {
                        try {
                            iArrB = b(jSONArray5);
                        } catch (IllegalArgumentException e11) {
                            com.apm.insight.c.a();
                            com.apm.insight.runtime.j.a(e11, "NPTH_CATCH");
                            iArrB = null;
                            if (iArrB != null) {
                            }
                            strSubstring = strOptString.substring(1, strOptString.indexOf(34, 1));
                            if ("main".equals(strSubstring)) {
                            }
                            if (jSONArray5.length() > 0) {
                            }
                            jSONArray5.put(strOptString);
                        } catch (Throwable unused4) {
                            iArrB = null;
                            if (iArrB != null) {
                            }
                            strSubstring = strOptString.substring(1, strOptString.indexOf(34, 1));
                            if ("main".equals(strSubstring)) {
                            }
                            if (jSONArray5.length() > 0) {
                            }
                            jSONArray5.put(strOptString);
                        }
                        if (iArrB != null) {
                            int i16 = iArrB[0];
                            if (i16 > iArr[0]) {
                                iArr[0] = i16;
                                this.f21426i = str2;
                            }
                            int i17 = iArrB[1];
                            if (i17 > iArr[1]) {
                                iArr[1] = i17;
                                this.f21427j = str2;
                            }
                            int i18 = iArrB[i12];
                            if (i18 > iArr[i12]) {
                                iArr[i12] = i18;
                                this.f21428k = str2;
                            }
                        }
                    }
                }
                strSubstring = strOptString.substring(1, strOptString.indexOf(34, 1));
                if ("main".equals(strSubstring)) {
                    i5 = i12;
                    string = strSubstring;
                } else {
                    StringBuilder sbK = k2.k(strSubstring, "  (");
                    i5 = i12;
                    sbK.append(strOptString.substring(strOptString.indexOf(34, i5) + 1));
                    sbK.append(" )");
                    string = sbK.toString();
                }
                if (jSONArray5.length() > 0) {
                    jSONArray5 = new JSONArray();
                }
                jSONArray5.put(strOptString);
            } else {
                i5 = i12;
                if (TextUtils.isEmpty(string)) {
                    jSONArray3.put(strOptString);
                } else {
                    jSONArray5.put(strOptString);
                }
            }
        }
        if (jSONArray2.length() > 0) {
            this.f21430m = jSONArray3;
            try {
                JSONObject jSONObject = new JSONObject();
                this.n = jSONObject;
                jSONObject.put("thread_all_count", jSONArray2.length());
                this.n.put("thread_stacks", jSONArray2);
            } catch (JSONException e12) {
                e12.printStackTrace();
            }
        }
    }

    private int[] b(JSONArray jSONArray) throws IllegalArgumentException {
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            String strOptString = jSONArray.optString(i5);
            int iIndexOf = (strOptString == null || strOptString.isEmpty()) ? -1 : strOptString.indexOf("utm=");
            if (iIndexOf > 0) {
                if (this.C == null) {
                    this.C = Pattern.compile("[^0-9]+");
                }
                String[] strArrSplit = this.C.split(strOptString.substring(iIndexOf));
                if (strArrSplit == null || strArrSplit.length < 2) {
                    return null;
                }
                int iIntValue = Integer.decode(strArrSplit[1]).intValue();
                int iIntValue2 = Integer.decode(strArrSplit[2]).intValue();
                return new int[]{iIntValue, iIntValue2, iIntValue + iIntValue2};
            }
        }
        return null;
    }

    private static String b(float f11) {
        return a(f11 / 100.0f);
    }

    private static void b(String str, JSONArray jSONArray) {
        for (ICrashCallback iCrashCallback : l.a().e()) {
            try {
                if (iCrashCallback instanceof com.apm.insight.b) {
                    ((com.apm.insight.b) iCrashCallback).a(CrashType.ANR, str, (Thread) null, jSONArray);
                } else {
                    iCrashCallback.onCrash(CrashType.ANR, str, null);
                }
            } catch (Throwable th2) {
                com.apm.insight.c.a();
                com.apm.insight.runtime.j.a(th2, "NPTH_CATCH");
            }
        }
    }

    private boolean a(String str) {
        if (this.B == null) {
            JSONArray jSONArrayB = com.apm.insight.runtime.a.b();
            if (jSONArrayB != null) {
                this.B = new LinkedList();
                this.f21429l = jSONArrayB.optString(0);
                for (int i5 = 1; i5 < jSONArrayB.length(); i5++) {
                    try {
                        this.B.add(Pattern.compile(jSONArrayB.optString(i5)));
                    } catch (Throwable unused) {
                    }
                }
            }
            if (this.B == null) {
                LinkedList linkedList = new LinkedList();
                this.B = linkedList;
                linkedList.add(Pattern.compile("^main$"));
                this.B.add(Pattern.compile("^default_npth_thread$"));
                this.B.add(Pattern.compile("^RenderThread$"));
                this.B.add(Pattern.compile("^Jit thread pool worker thread.*$"));
            }
        }
        Iterator<Pattern> it = this.B.iterator();
        while (it.hasNext()) {
            if (it.next().matcher(str).matches()) {
                return true;
            }
        }
        return false;
    }

    private JSONObject a(String str, JSONArray jSONArray) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        JSONArray jSONArrayB = com.apm.insight.a.b(jSONArray);
        if (jSONArrayB.length() != jSONArray.length()) {
            this.o++;
        }
        try {
            jSONObject.put("thread_name", str);
            jSONObject.put("thread_stack", jSONArrayB);
            return jSONObject;
        } catch (JSONException unused) {
            return null;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:100:0x01f1, code lost:
    
        r10 = r24 + 3;
        r24 = r12;
        r8 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:103:0x01fb, code lost:
    
        r12 = "softirq";
     */
    /* JADX WARN: Code restructure failed: missing block: B:104:0x01fd, code lost:
    
        if (r8 != 0) goto L105;
     */
    /* JADX WARN: Code restructure failed: missing block: B:105:0x01ff, code lost:
    
        r28 = r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:106:0x0202, code lost:
    
        if (r8 != 1) goto L107;
     */
    /* JADX WARN: Code restructure failed: missing block: B:108:0x0205, code lost:
    
        if (r8 != 2) goto L109;
     */
    /* JADX WARN: Code restructure failed: missing block: B:110:0x0208, code lost:
    
        if (r8 != 3) goto L111;
     */
    /* JADX WARN: Code restructure failed: missing block: B:112:0x020b, code lost:
    
        if (r8 != 4) goto L113;
     */
    /* JADX WARN: Code restructure failed: missing block: B:113:0x020d, code lost:
    
        r29 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x0210, code lost:
    
        if (r8 != 5) goto L138;
     */
    /* JADX WARN: Code restructure failed: missing block: B:116:0x0214, code lost:
    
        r29 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:117:0x0217, code lost:
    
        r29 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:118:0x021a, code lost:
    
        r29 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:119:0x021d, code lost:
    
        r29 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:120:0x0220, code lost:
    
        r28 = r4;
        r29 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:0x022c, code lost:
    
        if ("user".equalsIgnoreCase(r28[r10]) != false) goto L122;
     */
    /* JADX WARN: Code restructure failed: missing block: B:122:0x022e, code lost:
    
        r12 = "user";
        r8 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:124:0x0239, code lost:
    
        if ("kernel".equalsIgnoreCase(r28[r10]) != false) goto L125;
     */
    /* JADX WARN: Code restructure failed: missing block: B:125:0x023b, code lost:
    
        r12 = "kernel";
        r8 = 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:127:0x0246, code lost:
    
        if ("iowait".equalsIgnoreCase(r28[r10]) == false) goto L129;
     */
    /* JADX WARN: Code restructure failed: missing block: B:128:0x0248, code lost:
    
        r12 = "iowait";
        r8 = 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:130:0x0253, code lost:
    
        if ("irq".equalsIgnoreCase(r28[r10]) == false) goto L132;
     */
    /* JADX WARN: Code restructure failed: missing block: B:131:0x0255, code lost:
    
        r12 = "irq";
        r8 = 4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:133:0x025e, code lost:
    
        if ("softirq".equalsIgnoreCase(r28[r10]) == false) goto L135;
     */
    /* JADX WARN: Code restructure failed: missing block: B:134:0x0260, code lost:
    
        r8 = 5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:136:0x0268, code lost:
    
        if ("softirq".equalsIgnoreCase(r28[r10]) != false) goto L137;
     */
    /* JADX WARN: Code restructure failed: missing block: B:137:0x026a, code lost:
    
        r8 = 6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:138:0x026c, code lost:
    
        r8 = r29;
        r12 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:139:0x026f, code lost:
    
        if (r12 != null) goto L140;
     */
    /* JADX WARN: Code restructure failed: missing block: B:141:0x0273, code lost:
    
        r4 = java.lang.Float.valueOf(r28[r10 - 1].replace(r3, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)).floatValue();
     */
    /* JADX WARN: Code restructure failed: missing block: B:142:0x0281, code lost:
    
        r27 = r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:143:0x0283, code lost:
    
        r3 = r7 + r12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:144:0x0292, code lost:
    
        if (r0 == r5) goto L145;
     */
    /* JADX WARN: Code restructure failed: missing block: B:146:0x0295, code lost:
    
        r4 = r4 / com.apm.insight.l.d.d();
     */
    /* JADX WARN: Code restructure failed: missing block: B:147:0x029e, code lost:
    
        r0.put(r3, java.lang.Float.valueOf(r4));
     */
    /* JADX WARN: Code restructure failed: missing block: B:149:0x02a7, code lost:
    
        r27 = r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:150:0x02a9, code lost:
    
        r0.put(r7 + r12, r6);
     */
    /* JADX WARN: Code restructure failed: missing block: B:151:0x02bc, code lost:
    
        r27 = r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:152:0x02bf, code lost:
    
        if (r8 >= 6) goto L237;
     */
    /* JADX WARN: Code restructure failed: missing block: B:153:0x02c1, code lost:
    
        r10 = r10 + 3;
        r3 = r27;
        r4 = r28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x01aa, code lost:
    
        r10 = java.lang.Float.valueOf(r4[r8].replace("%", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)).floatValue();
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x01b8, code lost:
    
        r24 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x01ba, code lost:
    
        r8 = r7 + "total";
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x01c9, code lost:
    
        if (r0 != r5) goto L95;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x01cc, code lost:
    
        r10 = r10 / com.apm.insight.l.d.d();
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x01d5, code lost:
    
        r0.put(r8, java.lang.Float.valueOf(r10));
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x01dd, code lost:
    
        r24 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x01df, code lost:
    
        r0.put(r7 + "total", r6);
     */
    /* JADX WARN: Removed duplicated region for block: B:128:0x0248  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x024b A[PHI: r28 r29
      0x024b: PHI (r28v3 java.lang.String[]) = (r28v2 java.lang.String[]), (r28v8 java.lang.String[]) binds: [B:127:0x0246, B:117:0x0217] A[DONT_GENERATE, DONT_INLINE]
      0x024b: PHI (r29v3 char) = (r29v2 char), (r29v10 char) binds: [B:127:0x0246, B:117:0x0217] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:131:0x0255  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x0258 A[PHI: r28 r29
      0x0258: PHI (r28v4 java.lang.String[]) = (r28v3 java.lang.String[]), (r28v8 java.lang.String[]) binds: [B:130:0x0253, B:116:0x0214] A[DONT_GENERATE, DONT_INLINE]
      0x0258: PHI (r29v4 char) = (r29v3 char), (r29v11 char) binds: [B:130:0x0253, B:116:0x0214] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:134:0x0260  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x0262 A[PHI: r28 r29
      0x0262: PHI (r28v7 java.lang.String[]) = (r28v4 java.lang.String[]), (r28v8 java.lang.String[]) binds: [B:133:0x025e, B:114:0x0210] A[DONT_GENERATE, DONT_INLINE]
      0x0262: PHI (r29v7 char) = (r29v4 char), (r29v12 char) binds: [B:133:0x025e, B:114:0x0210] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:140:0x0271  */
    /* JADX WARN: Removed duplicated region for block: B:151:0x02bc  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x02c1 A[LOOP:2: B:101:0x01f8->B:153:0x02c1, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:182:0x0358  */
    /* JADX WARN: Removed duplicated region for block: B:185:0x0368  */
    /* JADX WARN: Removed duplicated region for block: B:193:0x0391  */
    /* JADX WARN: Removed duplicated region for block: B:233:0x03cf A[EDGE_INSN: B:233:0x03cf->B:204:0x03cf BREAK  A[LOOP:0: B:3:0x0047->B:206:0x03e3], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:235:0x03e3 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:237:0x02c9 A[EDGE_INSN: B:237:0x02c9->B:154:0x02c9 BREAK  A[LOOP:2: B:101:0x01f8->B:153:0x02c1], SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void a(String str, JSONObject jSONObject) throws JSONException {
        HashMap map;
        HashMap map2;
        String[] strArr;
        float[] fArr;
        int i5;
        char c11;
        String str2;
        char c12;
        boolean z11;
        String str3;
        String str4;
        String strTrim;
        String string;
        HashMap map3;
        int i11;
        b bVar = this;
        SystemClock.uptimeMillis();
        String[] strArrSplit = str.split("\n");
        Float fValueOf = Float.valueOf(-1.0f);
        int i12 = 0;
        float[] fArr2 = {-1.0f, -1.0f, -1.0f};
        HashMap map4 = new HashMap();
        HashMap map5 = new HashMap();
        HashMap map6 = new HashMap();
        HashMap map7 = new HashMap();
        HashMap map8 = new HashMap();
        int length = strArrSplit.length;
        char c13 = 0;
        boolean z12 = false;
        String strTrim2 = "unknown";
        String str5 = strTrim2;
        while (true) {
            if (i12 >= length) {
                map = map5;
                map2 = map7;
                break;
            }
            String strTrim3 = strArrSplit[i12];
            if (TextUtils.isEmpty(strTrim3)) {
                strArr = strArrSplit;
                fArr = fArr2;
                i5 = i12;
                map = map5;
                map2 = map7;
            } else {
                strArr = strArrSplit;
                fArr = fArr2;
                if (c13 == 0) {
                    c11 = c13;
                    i5 = i12;
                    map = map5;
                    map2 = map7;
                    str2 = strTrim2;
                    String strTrim4 = strTrim3.trim();
                    if (strTrim4.startsWith("tag:")) {
                        strTrim2 = strTrim4.replace("tag:", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).trim();
                        c12 = 4;
                        c13 = 1;
                        if (c13 >= c12) {
                        }
                    }
                    strTrim2 = str2;
                    c13 = c11;
                } else if (c13 == 1) {
                    c11 = c13;
                    i5 = i12;
                    map = map5;
                    map2 = map7;
                    strTrim3 = strTrim3.trim();
                    String lowerCase = strTrim3.toLowerCase();
                    if (lowerCase.startsWith("shortmsg")) {
                        z11 = false;
                    } else if (lowerCase.startsWith("reason:")) {
                        z11 = true;
                    } else {
                        str2 = strTrim2;
                        if (lowerCase.contains("appfreeze")) {
                            str5 = "AppFreeze";
                            c13 = '\n';
                            strTrim2 = str2;
                        }
                        strTrim2 = str2;
                        c13 = c11;
                    }
                    if (lowerCase.contains("input dispatch")) {
                        str4 = "Input dispatching timed out";
                    } else if (lowerCase.contains("broadcast of intent")) {
                        str4 = "Broadcast of Intent";
                    } else if (lowerCase.contains("executing service")) {
                        str3 = strTrim2;
                        if (!AbstractJsonLexerKt.NULL.equalsIgnoreCase(str3)) {
                            str5 = "executing service";
                            strTrim2 = str3;
                            if (z11) {
                            }
                            strTrim = strTrim3.trim();
                            if (strTrim.startsWith("Load:")) {
                            }
                        } else {
                            strTrim2 = strTrim3.substring(strTrim3.indexOf("service ") + 8).trim();
                            str5 = "executing service";
                            if (z11) {
                                c12 = 4;
                                c13 = 2;
                                if (c13 >= c12) {
                                }
                            }
                            strTrim = strTrim3.trim();
                            if (strTrim.startsWith("Load:")) {
                            }
                        }
                    } else {
                        str3 = strTrim2;
                        if (lowerCase.contains("service.startforeground")) {
                            str5 = "not call Service.startForeground";
                            strTrim2 = str3;
                            if (z11) {
                            }
                            strTrim = strTrim3.trim();
                            if (strTrim.startsWith("Load:")) {
                            }
                        } else {
                            strTrim2 = str3;
                            str5 = "unknown";
                            if (z11) {
                            }
                            strTrim = strTrim3.trim();
                            if (strTrim.startsWith("Load:")) {
                            }
                        }
                    }
                    str5 = str4;
                    if (z11) {
                    }
                    strTrim = strTrim3.trim();
                    if (strTrim.startsWith("Load:")) {
                    }
                } else if (c13 != 2) {
                    if (c13 != 3) {
                        c11 = c13;
                        i5 = i12;
                        map = map5;
                        map2 = map7;
                        str2 = strTrim2;
                    } else {
                        String[] strArrSplit2 = strTrim3.split("\\s");
                        c11 = c13;
                        i5 = i12;
                        if (strArrSplit2.length >= 2) {
                            if ("CPU".equalsIgnoreCase(strArrSplit2[0]) && "usage".equalsIgnoreCase(strArrSplit2[1])) {
                                if (strTrim3.contains("ago")) {
                                    z12 = true;
                                }
                                if (map4.isEmpty() && map5.isEmpty() && map6.isEmpty() && map8.isEmpty() && map7.isEmpty()) {
                                    map = map5;
                                    map2 = map7;
                                    c13 = c11;
                                    c12 = 4;
                                }
                                if (c13 >= c12) {
                                    break;
                                }
                            } else if (map4.isEmpty() || map5.isEmpty() || map6.isEmpty() || map8.isEmpty() || map7.isEmpty()) {
                                if (map4.isEmpty() && strArrSplit2[1].equalsIgnoreCase("TOTAL:")) {
                                    string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                    map3 = map4;
                                } else if (strTrim3.contains(bVar.f21419b.getPackageName())) {
                                    int i13 = 0;
                                    string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                    while (i13 < strArrSplit2.length) {
                                        int i14 = i13;
                                        if (strArrSplit2[i13].contains(bVar.f21419b.getPackageName())) {
                                            StringBuilder sb2 = new StringBuilder();
                                            String str6 = strArrSplit2[i14];
                                            sb2.append(str6.substring(str6.indexOf(47) + 1, strArrSplit2[i14].length() - 1));
                                            sb2.append('_');
                                            string = sb2.toString();
                                        }
                                        i13 = i14 + 1;
                                        bVar = this;
                                    }
                                    map3 = map6;
                                } else if (map5.isEmpty() && strTrim3.contains("system_server:")) {
                                    string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                    map3 = map5;
                                } else if (map8.isEmpty() && strTrim3.contains("kswapd")) {
                                    string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                    map3 = map8;
                                } else if (!map7.isEmpty() || !strTrim3.contains("dex2oat")) {
                                    string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                    map3 = null;
                                } else {
                                    string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                    map3 = map7;
                                }
                                if (map3 != null) {
                                    int i15 = 0;
                                    while (true) {
                                        String str7 = strArrSplit2[i15];
                                        int i16 = i15;
                                        String str8 = "%";
                                        if (str7.contains("%")) {
                                            map = map5;
                                            i11 = i16;
                                            break;
                                        } else {
                                            i11 = i16 + 1;
                                            map = map5;
                                            if (i11 < strArrSplit2.length) {
                                                i15 = i11;
                                                map5 = map;
                                            }
                                        }
                                    }
                                }
                                str2 = strTrim2;
                            }
                            map = map5;
                            map2 = map7;
                            c12 = 4;
                            c13 = 4;
                            if (c13 >= c12) {
                            }
                        }
                        map = map5;
                        map2 = map7;
                        str2 = strTrim2;
                    }
                    strTrim2 = str2;
                    c13 = c11;
                } else {
                    c11 = c13;
                    i5 = i12;
                    map = map5;
                    map2 = map7;
                    strTrim = strTrim3.trim();
                    if (strTrim.startsWith("Load:")) {
                        c13 = c11;
                    } else {
                        String[] strArrSplit3 = strTrim.replace("Load:", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).trim().split("/");
                        if (3 == strArrSplit3.length) {
                            for (int i17 = 0; i17 < strArrSplit3.length; i17++) {
                                fArr[i17] = Float.valueOf(strArrSplit3[i17]).floatValue();
                            }
                        }
                        c13 = 3;
                    }
                }
                c12 = 4;
                if (c13 >= c12) {
                }
            }
            i12 = i5 + 1;
            bVar = this;
            strArrSplit = strArr;
            fArr2 = fArr;
            map7 = map2;
            map5 = map;
        }
        String str9 = str5;
        jSONObject.put("anr_tag", strTrim2);
        jSONObject.put("anr_has_ago", String.valueOf(z12));
        jSONObject.put("anr_reason", str9);
        a(map6, jSONObject, "app");
        a(map4, jSONObject, "total");
        if (map.isEmpty()) {
            jSONObject.put("npth_anr_systemserver_total", "not found");
        } else {
            jSONObject.put("npth_anr_systemserver_total", b(c.AnonymousClass1.a(map).floatValue()));
        }
        if (map8.isEmpty()) {
            jSONObject.put("npth_anr_kswapd_total", "not found");
        } else {
            jSONObject.put("npth_anr_kswapd_total", b(c.AnonymousClass1.a(map8).floatValue()));
        }
        if (map2.isEmpty()) {
            jSONObject.put("npth_anr_dex2oat_total", "not found");
        } else {
            jSONObject.put("npth_anr_dex2oat_total", b(c.AnonymousClass1.a(map2).floatValue()));
        }
    }

    private static void a(HashMap<String, Float> map, JSONObject jSONObject, String str) throws JSONException {
        String strConcat = "npth_anr_".concat(String.valueOf(str));
        if (map.isEmpty()) {
            jSONObject.put(strConcat + "_total", "not found");
            return;
        }
        float fFloatValue = 0.0f;
        float fFloatValue2 = 0.0f;
        float fFloatValue3 = 0.0f;
        float fFloatValue4 = 0.0f;
        float fFloatValue5 = 0.0f;
        for (Map.Entry<String, Float> entry : map.entrySet()) {
            String key = entry.getKey();
            if (key.endsWith("user")) {
                fFloatValue += entry.getValue().floatValue();
            } else if (key.endsWith("kernel")) {
                fFloatValue2 += entry.getValue().floatValue();
            } else if (key.endsWith("iowait")) {
                fFloatValue3 += entry.getValue().floatValue();
            } else if (key.endsWith("irq")) {
                fFloatValue4 += entry.getValue().floatValue();
            } else if (key.endsWith("softirq")) {
                fFloatValue5 = entry.getValue().floatValue() + fFloatValue5;
            }
        }
        float f11 = fFloatValue + fFloatValue2 + fFloatValue3 + fFloatValue4 + fFloatValue5;
        jSONObject.put(c0.E(strConcat, "_total"), b(f11));
        jSONObject.put(strConcat + "_kernel_user_ratio", a(fFloatValue2, f11));
        jSONObject.put(strConcat + "_iowait_user_ratio", a(fFloatValue3, f11));
    }

    private static String a(float f11, float f12) {
        if (f12 > 0.0f) {
            return a(f11 / f12);
        }
        return f11 > 0.0f ? "100%" : "0%";
    }

    private static String a(float f11) {
        if (f11 <= 0.0f) {
            return "0%";
        }
        if (f11 <= 0.1f) {
            return "0% - 10%";
        }
        if (f11 <= 0.3f) {
            return "10% - 30%";
        }
        if (f11 <= 0.6f) {
            return "30% - 60%";
        }
        if (f11 <= 0.9f) {
            return "60% - 90%";
        }
        return "90% - 100%";
    }
}
