package com.apm.insight.b;

import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.text.TextUtils;
import com.apm.insight.runtime.p;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class g {

    /* renamed from: r, reason: collision with root package name */
    private static int f21462r = 2;

    /* renamed from: a, reason: collision with root package name */
    private c f21463a;

    /* renamed from: b, reason: collision with root package name */
    private int f21464b;

    /* renamed from: c, reason: collision with root package name */
    private volatile int f21465c;

    /* renamed from: d, reason: collision with root package name */
    private int f21466d;

    /* renamed from: e, reason: collision with root package name */
    private int f21467e;

    /* renamed from: f, reason: collision with root package name */
    private f f21468f;

    /* renamed from: g, reason: collision with root package name */
    private long f21469g;

    /* renamed from: h, reason: collision with root package name */
    private long f21470h;

    /* renamed from: i, reason: collision with root package name */
    private int f21471i;

    /* renamed from: j, reason: collision with root package name */
    private long f21472j;

    /* renamed from: k, reason: collision with root package name */
    private String f21473k;

    /* renamed from: l, reason: collision with root package name */
    private String f21474l;

    /* renamed from: m, reason: collision with root package name */
    private com.apm.insight.b.e f21475m;
    private volatile boolean n;
    private boolean o;

    /* renamed from: p, reason: collision with root package name */
    private final p f21476p;

    /* renamed from: q, reason: collision with root package name */
    private volatile boolean f21477q;

    /* renamed from: s, reason: collision with root package name */
    private Runnable f21478s;

    /* loaded from: classes2.dex */
    public static class a {

        /* renamed from: a, reason: collision with root package name */
        long f21487a;

        /* renamed from: b, reason: collision with root package name */
        long f21488b;

        /* renamed from: c, reason: collision with root package name */
        long f21489c;

        /* renamed from: d, reason: collision with root package name */
        boolean f21490d;

        /* renamed from: e, reason: collision with root package name */
        int f21491e;

        /* renamed from: f, reason: collision with root package name */
        StackTraceElement[] f21492f;

        private a() {
        }

        public /* synthetic */ a(byte b11) {
            this();
        }
    }

    /* loaded from: classes2.dex */
    public static class b {

        /* renamed from: a, reason: collision with root package name */
        a f21493a;

        /* renamed from: b, reason: collision with root package name */
        private int f21494b;

        public final void a(a aVar) {
            throw null;
        }
    }

    public interface c {
    }

    /* loaded from: classes2.dex */
    public static class d {
    }

    /* loaded from: classes2.dex */
    public static class e {

        /* renamed from: a, reason: collision with root package name */
        public long f21495a;

        /* renamed from: b, reason: collision with root package name */
        long f21496b;

        /* renamed from: c, reason: collision with root package name */
        long f21497c;

        /* renamed from: d, reason: collision with root package name */
        int f21498d;

        /* renamed from: e, reason: collision with root package name */
        int f21499e;

        /* renamed from: f, reason: collision with root package name */
        long f21500f;

        /* renamed from: g, reason: collision with root package name */
        long f21501g;

        /* renamed from: h, reason: collision with root package name */
        String f21502h;

        /* renamed from: i, reason: collision with root package name */
        public String f21503i;

        /* renamed from: j, reason: collision with root package name */
        private String f21504j;

        /* renamed from: k, reason: collision with root package name */
        private d f21505k;

        public final JSONObject a() throws JSONException {
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put("msg", g.a(this.f21502h));
                jSONObject.put("cpuDuration", this.f21501g);
                jSONObject.put("duration", this.f21500f);
                jSONObject.put(TTConst.TRACK_TYPE, this.f21498d);
                jSONObject.put("count", this.f21499e);
                jSONObject.put("messageCount", this.f21499e);
                jSONObject.put("lastDuration", this.f21496b - this.f21497c);
                jSONObject.put("start", this.f21495a);
                jSONObject.put("end", this.f21496b);
                jSONObject.put("block_uuid", (Object) null);
                jSONObject.put("sblock_uuid", (Object) null);
                jSONObject.put("belong_frame", false);
                return jSONObject;
            } catch (JSONException e3) {
                e3.printStackTrace();
                return jSONObject;
            }
        }

        public final void b() {
            this.f21498d = -1;
            this.f21499e = -1;
            this.f21500f = -1L;
            this.f21502h = null;
            this.f21504j = null;
            this.f21505k = null;
            this.f21503i = null;
        }
    }

    public g() {
        this((byte) 0);
    }

    public static /* synthetic */ b c() {
        return null;
    }

    public static /* synthetic */ p e() {
        return null;
    }

    private g(byte b11) {
        this.f21464b = 0;
        this.f21465c = 0;
        this.f21466d = 100;
        this.f21467e = 200;
        this.f21469g = -1L;
        this.f21470h = -1L;
        this.f21471i = -1;
        this.f21472j = -1L;
        this.n = false;
        this.o = false;
        this.f21477q = false;
        this.f21478s = new Runnable() { // from class: com.apm.insight.b.g.2

            /* renamed from: b, reason: collision with root package name */
            private long f21481b;

            /* renamed from: a, reason: collision with root package name */
            private long f21480a = 0;

            /* renamed from: c, reason: collision with root package name */
            private int f21482c = -1;

            /* renamed from: d, reason: collision with root package name */
            private int f21483d = 0;

            /* renamed from: e, reason: collision with root package name */
            private int f21484e = 0;

            @Override // java.lang.Runnable
            public final void run() {
                long jUptimeMillis = SystemClock.uptimeMillis();
                if (g.c().f21493a != null) {
                    throw null;
                }
                a aVar = new a((byte) 0);
                if (this.f21482c == g.this.f21465c) {
                    this.f21483d++;
                } else {
                    this.f21483d = 0;
                    this.f21484e = 0;
                    this.f21481b = jUptimeMillis;
                }
                this.f21482c = g.this.f21465c;
                int i5 = this.f21483d;
                if (i5 > 0 && i5 - this.f21484e >= g.f21462r && this.f21480a != 0 && jUptimeMillis - this.f21481b > 700 && g.this.f21477q) {
                    aVar.f21492f = Looper.getMainLooper().getThread().getStackTrace();
                    this.f21484e = this.f21483d;
                }
                aVar.f21490d = g.this.f21477q;
                aVar.f21489c = (jUptimeMillis - this.f21480a) - 300;
                aVar.f21487a = jUptimeMillis;
                long jUptimeMillis2 = SystemClock.uptimeMillis();
                this.f21480a = jUptimeMillis2;
                aVar.f21488b = jUptimeMillis2 - jUptimeMillis;
                aVar.f21491e = g.this.f21465c;
                g.e().a(g.this.f21478s, 300L);
                g.c().a(aVar);
            }
        };
        this.f21463a = new c() { // from class: com.apm.insight.b.g.1
        };
        this.f21476p = null;
    }

    public static /* synthetic */ int d(g gVar) {
        int i5 = gVar.f21464b;
        gVar.f21464b = i5 + 1;
        return i5;
    }

    public final JSONArray b() {
        JSONArray jSONArray = new JSONArray();
        try {
            int i5 = 0;
            for (e eVar : this.f21468f.a()) {
                if (eVar != null) {
                    i5++;
                    jSONArray.put(eVar.a().put("id", i5));
                }
            }
        } catch (Throwable unused) {
        }
        return jSONArray;
    }

    public final void a() {
        if (this.n) {
            return;
        }
        this.n = true;
        this.f21466d = 100;
        this.f21467e = 300;
        this.f21468f = new f(100);
        this.f21475m = new com.apm.insight.b.e() { // from class: com.apm.insight.b.g.3
            @Override // com.apm.insight.b.e
            public final boolean a() {
                return true;
            }

            @Override // com.apm.insight.b.e
            public final void b(String str) {
                super.b(str);
                g.d(g.this);
                g.a(g.this, false, com.apm.insight.b.e.f21456a);
                g gVar = g.this;
                gVar.f21473k = gVar.f21474l;
                g.this.f21474l = "no message running";
                g.this.f21477q = false;
            }

            @Override // com.apm.insight.b.e
            public final void a(String str) {
                g.this.f21477q = true;
                g.this.f21474l = str;
                super.a(str);
                g.a(g.this, true, com.apm.insight.b.e.f21456a);
            }
        };
        h.a();
        h.a(this.f21475m);
        j.a(j.a());
    }

    public static class f {

        /* renamed from: a, reason: collision with root package name */
        private int f21506a;

        /* renamed from: b, reason: collision with root package name */
        private int f21507b;

        /* renamed from: c, reason: collision with root package name */
        private e f21508c;

        /* renamed from: d, reason: collision with root package name */
        private List<e> f21509d = new ArrayList();

        public f(int i5) {
            this.f21506a = i5;
        }

        public final e a(int i5) {
            e eVar = this.f21508c;
            if (eVar != null) {
                eVar.f21498d = i5;
                this.f21508c = null;
                return eVar;
            }
            e eVar2 = new e();
            eVar2.f21498d = i5;
            return eVar2;
        }

        public final void a(e eVar) {
            int size = this.f21509d.size();
            int i5 = this.f21506a;
            if (size < i5) {
                this.f21509d.add(eVar);
                this.f21507b = this.f21509d.size();
                return;
            }
            int i11 = this.f21507b % i5;
            this.f21507b = i11;
            e eVar2 = this.f21509d.set(i11, eVar);
            eVar2.b();
            this.f21508c = eVar2;
            this.f21507b++;
        }

        public final List<e> a() {
            ArrayList arrayList = new ArrayList();
            int i5 = 0;
            if (this.f21509d.size() == this.f21506a) {
                for (int i11 = this.f21507b; i11 < this.f21509d.size(); i11++) {
                    arrayList.add(this.f21509d.get(i11));
                }
                while (i5 < this.f21507b - 1) {
                    arrayList.add(this.f21509d.get(i5));
                    i5++;
                }
            } else {
                while (i5 < this.f21509d.size()) {
                    arrayList.add(this.f21509d.get(i5));
                    i5++;
                }
            }
            return arrayList;
        }
    }

    private void a(int i5, long j11, String str) {
        a(i5, j11, str, true);
    }

    private void a(int i5, long j11, String str, boolean z11) {
        this.o = true;
        e eVarA = this.f21468f.a(i5);
        eVarA.f21500f = j11 - this.f21469g;
        if (z11) {
            long jCurrentThreadTimeMillis = SystemClock.currentThreadTimeMillis();
            eVarA.f21501g = jCurrentThreadTimeMillis - this.f21472j;
            this.f21472j = jCurrentThreadTimeMillis;
        } else {
            eVarA.f21501g = -1L;
        }
        eVarA.f21499e = this.f21464b;
        eVarA.f21502h = str;
        eVarA.f21503i = this.f21473k;
        eVarA.f21495a = this.f21469g;
        eVarA.f21496b = j11;
        eVarA.f21497c = this.f21470h;
        this.f21468f.a(eVarA);
        this.f21464b = 0;
        this.f21469g = j11;
    }

    public final e a(long j11) {
        e eVar = new e();
        eVar.f21502h = this.f21474l;
        eVar.f21503i = this.f21473k;
        eVar.f21500f = j11 - this.f21470h;
        eVar.f21501g = 0 - this.f21472j;
        eVar.f21499e = this.f21464b;
        return eVar;
    }

    public static String a(String str) {
        String str2;
        if (TextUtils.isEmpty(str)) {
            return "unknown message";
        }
        try {
            String[] strArrSplit = str.split(":");
            String str3 = strArrSplit.length == 2 ? strArrSplit[1] : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            if (str.contains("{") && str.contains("}")) {
                str2 = str.split("\\{")[0];
                try {
                    str = str2 + str.split("\\}")[1];
                } catch (Throwable unused) {
                    return str2;
                }
            } else {
                str2 = str;
            }
            if (str.contains("@")) {
                String[] strArrSplit2 = str.split("@");
                if (strArrSplit2.length > 1) {
                    str = strArrSplit2[0];
                }
            }
            if (str.contains("(") && str.contains(")") && !str.endsWith(" null")) {
                String[] strArrSplit3 = str.split("\\(");
                if (strArrSplit3.length > 1) {
                    str = strArrSplit3[1];
                }
                str = str.replace(")", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            }
            if (str.startsWith(" ")) {
                str = str.replace(" ", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            }
            return str + str3;
        } catch (Throwable unused2) {
            return str;
        }
    }

    public static /* synthetic */ void a(g gVar, boolean z11, long j11) {
        int i5 = gVar.f21465c + 1;
        gVar.f21465c = i5;
        gVar.f21465c = i5 & 65535;
        gVar.o = false;
        if (gVar.f21469g < 0) {
            gVar.f21469g = j11;
        }
        if (gVar.f21470h < 0) {
            gVar.f21470h = j11;
        }
        if (gVar.f21471i < 0) {
            gVar.f21471i = Process.myTid();
            gVar.f21472j = SystemClock.currentThreadTimeMillis();
        }
        long j12 = j11 - gVar.f21469g;
        int i11 = gVar.f21467e;
        if (j12 > i11) {
            long j13 = gVar.f21470h;
            if (j11 - j13 <= i11) {
                gVar.a(9, j11, gVar.f21474l);
            } else if (z11) {
                if (gVar.f21464b == 0) {
                    gVar.a(1, j11, "no message running");
                } else {
                    gVar.a(9, j13, gVar.f21473k);
                    gVar.a(1, j11, "no message running", false);
                }
            } else if (gVar.f21464b == 0) {
                gVar.a(8, j11, gVar.f21474l, true);
            } else {
                gVar.a(9, j13, gVar.f21473k, false);
                gVar.a(8, j11, gVar.f21474l, true);
            }
        }
        gVar.f21470h = j11;
    }
}
