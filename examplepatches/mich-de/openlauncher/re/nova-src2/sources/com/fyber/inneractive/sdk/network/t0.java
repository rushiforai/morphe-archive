package com.fyber.inneractive.sdk.network;

import android.util.Log;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/* loaded from: classes.dex */
public abstract class t0 {

    /* renamed from: a, reason: collision with root package name */
    public volatile boolean f28777a;

    /* renamed from: b, reason: collision with root package name */
    public final f0 f28778b;

    /* renamed from: c, reason: collision with root package name */
    public final h f28779c;

    /* renamed from: d, reason: collision with root package name */
    public p0 f28780d;

    /* renamed from: e, reason: collision with root package name */
    public l f28781e;

    /* renamed from: f, reason: collision with root package name */
    public volatile i1 f28782f;

    /* renamed from: g, reason: collision with root package name */
    public final String f28783g;

    /* renamed from: h, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.config.global.r f28784h;

    /* renamed from: i, reason: collision with root package name */
    public long f28785i;

    /* renamed from: j, reason: collision with root package name */
    public long f28786j;

    /* renamed from: k, reason: collision with root package name */
    public int f28787k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f28788l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f28789m;
    public final Object n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public HashMap f28790p;

    public t0(f0 f0Var, h hVar, com.fyber.inneractive.sdk.config.global.r rVar) {
        this.f28777a = false;
        this.f28782f = i1.INITIAL;
        this.f28785i = 0L;
        this.f28786j = 0L;
        this.f28787k = 0;
        this.f28788l = false;
        this.f28789m = false;
        this.n = new Object();
        this.o = false;
        this.f28778b = f0Var;
        this.f28779c = hVar;
        this.f28783g = UUID.randomUUID().toString();
        this.f28784h = rVar;
    }

    public abstract o0 a(l lVar, Map map, int i5);

    public void a(o0 o0Var, String str, String str2) {
    }

    public void b(long j11) {
        synchronized (this.n) {
            try {
                if (this.f28789m) {
                    this.f28787k = (int) ((j11 - this.f28785i) + this.f28787k);
                    this.f28789m = false;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public void c() {
        this.f28777a = true;
    }

    public void d() {
        boolean z11;
        synchronized (this.n) {
            z11 = this.f28788l;
        }
        if (z11) {
            a(System.currentTimeMillis());
        } else if (t()) {
            b(System.currentTimeMillis());
        }
    }

    public void e() {
        try {
            l lVar = this.f28781e;
            if (lVar != null) {
                lVar.a();
            }
            this.f28779c.getClass();
        } catch (Exception unused) {
        }
    }

    public byte[] f() {
        return null;
    }

    public abstract int g();

    public String h() {
        return null;
    }

    public a i() {
        return null;
    }

    public int j() {
        return this.f28787k;
    }

    public com.fyber.inneractive.sdk.config.global.r k() {
        return this.f28784h;
    }

    public Map l() {
        return null;
    }

    public abstract m0 m();

    public String n() {
        return "application/json; charset=utf-8";
    }

    public abstract g1 o();

    public l1 p() {
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        return new l1(iAConfigManager.f27761u.f27936b.a("connect_timeout", 5000, 1), iAConfigManager.f27761u.f27936b.a("read_timeout", 5000, 1));
    }

    public int q() {
        int i5;
        synchronized (this.n) {
            i5 = this.f28787k;
        }
        return i5;
    }

    public abstract String r();

    public int s() {
        Integer numA;
        com.fyber.inneractive.sdk.config.global.r rVar = this.f28784h;
        if (rVar == null || (numA = ((com.fyber.inneractive.sdk.config.global.features.l) rVar.a(com.fyber.inneractive.sdk.config.global.features.l.class)).a("watchdog_buffer_time_ms")) == null) {
            return 500;
        }
        return numA.intValue();
    }

    public final boolean t() {
        boolean z11;
        synchronized (this.n) {
            z11 = this.f28789m;
        }
        return z11;
    }

    public abstract boolean u();

    /* JADX WARN: Removed duplicated region for block: B:17:0x0035  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0038 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean v() {
        boolean z11;
        if (this.o) {
            com.fyber.inneractive.sdk.config.global.features.l lVar = (com.fyber.inneractive.sdk.config.global.features.l) IAConfigManager.Q.N.a(com.fyber.inneractive.sdk.config.global.features.l.class);
            Boolean boolC = lVar.c("should_add_request_watchdog");
            if (boolC != null ? boolC.booleanValue() : false) {
                z11 = true;
                if (!z11) {
                    return true;
                }
            } else {
                Boolean boolC2 = lVar.c("should_report_request_watchdog");
                if (!(boolC2 != null ? boolC2.booleanValue() : false)) {
                    z11 = false;
                }
                if (!z11) {
                }
            }
        }
        return false;
    }

    public l a(String str) throws Exception {
        try {
            p0 p0Var = this.f28780d;
            if (p0Var != null) {
                p0Var.a("sdkInitNetworkRequest");
            }
            this.f28781e = this.f28779c.a(this, com.fyber.inneractive.sdk.util.o.e(), str);
            p0 p0Var2 = this.f28780d;
            if (p0Var2 != null) {
                p0Var2.a("sdkGotServerResponse");
            }
            return this.f28781e;
        } catch (b e3) {
            IAlog.a("failed start network request for url: %s msg: %s", r(), e3.getMessage());
            throw e3;
        } catch (q1 e11) {
            IAlog.a("failed read network response for url: %s msg: %s", r(), e11.getMessage());
            throw e11;
        } catch (Exception e12) {
            IAlog.a("failed start network request for url: %s msg: %s", r(), e12.getMessage());
            throw e12;
        }
    }

    public void c(long j11) {
        synchronized (this.n) {
            try {
                if (!this.f28788l) {
                    this.f28788l = true;
                    this.f28786j = j11;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public void d(long j11) {
        synchronized (this.n) {
            try {
                if (!this.f28789m) {
                    this.f28789m = true;
                    this.f28785i = j11;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public t0(t0 t0Var) {
        this.f28777a = false;
        this.f28782f = i1.INITIAL;
        this.f28785i = 0L;
        this.f28786j = 0L;
        this.f28787k = 0;
        this.f28788l = false;
        this.f28789m = false;
        this.n = new Object();
        this.o = false;
        this.f28778b = t0Var.f28778b;
        this.f28779c = t0Var.f28779c;
        this.f28783g = UUID.randomUUID().toString();
        this.f28784h = t0Var.f28784h;
        this.f28787k = t0Var.f28787k;
        this.f28785i = t0Var.f28785i;
        this.f28786j = t0Var.f28786j;
    }

    public void a(Object obj, Exception exc, boolean z11, HashMap map) {
        p0 p0Var;
        if (!z11) {
            i1 i1Var = i1.RESOLVED;
            this.f28782f = i1Var;
            if (i1Var == i1.QUEUED_FOR_RETRY && (p0Var = this.f28780d) != null) {
                p0Var.a("sdkRequestEndedButWillBeRetried");
            }
        }
        com.fyber.inneractive.sdk.util.r.f31216b.post(new s0(this, obj, exc, z11));
    }

    public final com.fyber.inneractive.sdk.response.e a(int i5, o oVar, com.fyber.inneractive.sdk.response.j jVar) throws n0 {
        try {
            com.fyber.inneractive.sdk.response.a aVarA = com.fyber.inneractive.sdk.response.a.a(i5);
            if (aVarA == null) {
                aVarA = com.fyber.inneractive.sdk.response.a.RETURNED_ADTYPE_MRAID;
            }
            com.fyber.inneractive.sdk.factories.f fVar = com.fyber.inneractive.sdk.factories.d.f28022a;
            com.fyber.inneractive.sdk.factories.e eVar = (com.fyber.inneractive.sdk.factories.e) fVar.f28023a.get(aVarA);
            com.fyber.inneractive.sdk.response.b bVarB = eVar != null ? eVar.b() : null;
            if (bVarB == null) {
                IAlog.f("Received ad type %s does not have an appropriate parser!", Integer.valueOf(i5));
                if (fVar.f28023a.size() == 0) {
                    Log.e("Inneractive_error", "Critical error raised while fetching an ad - please make sure you have added all the required fyber libraries (ia-mraid-kit, ia-video-kit) to your project");
                }
                throw new n0("Could not find parser for ad type " + i5);
            }
            IAlog.a("Received ad type %s - Got parser! %s", Integer.valueOf(i5), bVarB);
            if (jVar != null) {
                bVarB.f31033c = jVar;
            }
            bVarB.f31031a = bVarB.a();
            if (oVar != null) {
                bVarB.f31033c = new com.fyber.inneractive.sdk.response.k(oVar);
            }
            com.fyber.inneractive.sdk.response.e eVarA = bVarB.a(null);
            eVarA.H = j();
            p0 p0Var = this.f28780d;
            if (p0Var != null) {
                p0Var.a("sdkParsedResponse");
            }
            return eVarA;
        } catch (Exception e3) {
            IAlog.a("failed parse ad network request url: %s msg: %s", r(), e3.getMessage());
            throw new n0(e3);
        }
    }

    public static int a(Map map) {
        List list = map != null ? (List) map.get("Content-Length") : null;
        if (list == null || list.isEmpty()) {
            return -1;
        }
        return com.fyber.inneractive.sdk.util.v.a((String) list.get(0), -1);
    }

    public void a(long j11) {
        synchronized (this.n) {
            try {
                if (this.f28788l) {
                    this.f28787k = (int) ((j11 - this.f28786j) + this.f28787k);
                    this.f28788l = false;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
