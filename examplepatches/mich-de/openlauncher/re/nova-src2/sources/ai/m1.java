package ai;

import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import android.os.SystemClock;
import b.kc;
import com.google.android.gms.internal.measurement.ab;
import com.google.android.gms.internal.measurement.fb;
import com.google.android.gms.internal.measurement.ib;
import com.google.android.gms.internal.measurement.jb;
import com.google.android.gms.internal.measurement.l6;
import com.google.android.gms.internal.measurement.ob;
import com.google.android.gms.internal.measurement.pb;
import com.google.android.gms.internal.measurement.vb;
import com.google.android.gms.internal.measurement.xb;
import com.google.android.gms.internal.measurement.zzdb;
import java.util.Iterator;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.logging.Level;

/* loaded from: classes3.dex */
public final class m1 implements w1 {
    public static volatile m1 F;
    public int A;
    public int B;
    public final long D;
    public final long E;

    /* renamed from: a, reason: collision with root package name */
    public final Context f13133a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f13134b;

    /* renamed from: c, reason: collision with root package name */
    public final kc f13135c;

    /* renamed from: d, reason: collision with root package name */
    public final e f13136d;

    /* renamed from: e, reason: collision with root package name */
    public final z0 f13137e;

    /* renamed from: f, reason: collision with root package name */
    public final o0 f13138f;

    /* renamed from: g, reason: collision with root package name */
    public final k1 f13139g;

    /* renamed from: h, reason: collision with root package name */
    public final x3 f13140h;

    /* renamed from: i, reason: collision with root package name */
    public final p4 f13141i;

    /* renamed from: j, reason: collision with root package name */
    public final i0 f13142j;

    /* renamed from: k, reason: collision with root package name */
    public final xg.a f13143k;

    /* renamed from: l, reason: collision with root package name */
    public final f3 f13144l;

    /* renamed from: m, reason: collision with root package name */
    public final t2 f13145m;
    public final u n;
    public final x2 o;

    /* renamed from: p, reason: collision with root package name */
    public final String f13146p;

    /* renamed from: q, reason: collision with root package name */
    public h0 f13147q;

    /* renamed from: r, reason: collision with root package name */
    public p3 f13148r;

    /* renamed from: s, reason: collision with root package name */
    public o f13149s;

    /* renamed from: t, reason: collision with root package name */
    public f0 f13150t;

    /* renamed from: u, reason: collision with root package name */
    public y2 f13151u;

    /* renamed from: w, reason: collision with root package name */
    public Boolean f13153w;

    /* renamed from: x, reason: collision with root package name */
    public long f13154x;

    /* renamed from: y, reason: collision with root package name */
    public volatile Boolean f13155y;

    /* renamed from: z, reason: collision with root package name */
    public volatile boolean f13156z;

    /* renamed from: v, reason: collision with root package name */
    public boolean f13152v = false;
    public final AtomicInteger C = new AtomicInteger(0);

    /* JADX WARN: Code restructure failed: missing block: B:35:0x008b, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0091, code lost:
    
        throw r0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public m1(e2 e2Var) {
        Context applicationContext;
        long jCurrentTimeMillis;
        long jElapsedRealtime;
        Context context = e2Var.f12902a;
        kc kcVar = new kc(1);
        this.f13135c = kcVar;
        b2.n = kcVar;
        this.f13133a = context;
        this.f13134b = e2Var.f12906e;
        this.f13155y = e2Var.f12903b;
        this.f13146p = e2Var.f12909h;
        this.f13156z = true;
        if (vb.f33141b == null && context != null) {
            Object obj = vb.f33140a;
            synchronized (obj) {
                try {
                    if (vb.f33141b == null) {
                        synchronized (obj) {
                            ib ibVar = vb.f33141b;
                            Context applicationContext2 = context.getApplicationContext();
                            if (applicationContext2 == null) {
                                applicationContext2 = context;
                            }
                            if (ibVar == null || ibVar.f32650a != applicationContext2) {
                                if (ibVar != null) {
                                    Iterator it = jb.f32686a.values().iterator();
                                    if (it.hasNext()) {
                                        if (it.next() != null) {
                                            throw new ClassCastException();
                                        }
                                        throw null;
                                    }
                                    xb.a();
                                }
                                vb.f33141b = new ib(applicationContext2, vk.b0.q(new pb(applicationContext2, 2)));
                                vb.f33142c.incrementAndGet();
                            }
                        }
                    }
                } finally {
                }
            }
        }
        this.f13143k = xg.a.f95830a;
        ab abVar = new ab(context, null, com.google.android.gms.internal.measurement.j1.f32674a, qg.b.f84048kp, qg.e.f84049c);
        String strConcat = "com.google.android.gms.measurement#".concat(String.valueOf(context.getPackageName()));
        cz.b bVarB = rg.m.b();
        bVarB.f48575c = new l6(2, strConcat, new String[0]);
        abVar.c(0, bVarB.a());
        AtomicReference atomicReference = ob.f32918k;
        if (atomicReference.get() == null) {
            try {
                applicationContext = context.getApplicationContext();
            } catch (NullPointerException unused) {
                ob.b();
                fb.g(Level.WARNING, (Executor) ob.f32920m.get(), null, "context.getApplicationContext() yielded NullPointerException", new Object[0]);
                applicationContext = null;
            }
            if (applicationContext != null) {
                while (!atomicReference.compareAndSet(null, applicationContext) && atomicReference.get() == null) {
                }
            }
        }
        Long l9 = e2Var.f12907f;
        if (l9 != null) {
            jCurrentTimeMillis = l9.longValue();
        } else {
            this.f13143k.getClass();
            jCurrentTimeMillis = System.currentTimeMillis();
        }
        this.D = jCurrentTimeMillis;
        Long l11 = e2Var.f12908g;
        if (l11 != null) {
            jElapsedRealtime = l11.longValue();
        } else {
            this.f13143k.getClass();
            jElapsedRealtime = SystemClock.elapsedRealtime();
        }
        this.E = jElapsedRealtime;
        e eVar = new e(this);
        eVar.f12898d = bk.e.f17941b;
        this.f13136d = eVar;
        z0 z0Var = new z0(this);
        z0Var.G();
        this.f13137e = z0Var;
        o0 o0Var = new o0(this);
        o0Var.G();
        this.f13138f = o0Var;
        p4 p4Var = new p4(this);
        p4Var.G();
        this.f13141i = p4Var;
        this.f13142j = new i0(new b1(e2Var, this));
        this.n = new u(this);
        f3 f3Var = new f3(this);
        f3Var.F();
        this.f13144l = f3Var;
        t2 t2Var = new t2(this);
        t2Var.F();
        this.f13145m = t2Var;
        x3 x3Var = new x3(this);
        x3Var.F();
        this.f13140h = x3Var;
        x2 x2Var = new x2(this);
        x2Var.G();
        this.o = x2Var;
        k1 k1Var = new k1(this);
        k1Var.G();
        this.f13139g = k1Var;
        zzdb zzdbVar = e2Var.f12905d;
        boolean z11 = zzdbVar == null || zzdbVar.f33304g == 0;
        if (this.f13133a.getApplicationContext() instanceof Application) {
            k(t2Var);
            if (((m1) t2Var.f13368a).f13133a.getApplicationContext() instanceof Application) {
                Application application = (Application) ((m1) t2Var.f13368a).f13133a.getApplicationContext();
                if (t2Var.f13337c == null) {
                    t2Var.f13337c = new p2(t2Var);
                }
                if (z11) {
                    application.unregisterActivityLifecycleCallbacks(t2Var.f13337c);
                    application.registerActivityLifecycleCallbacks(t2Var.f13337c);
                    o0 o0Var2 = ((m1) t2Var.f13368a).f13138f;
                    l(o0Var2);
                    o0Var2.n.a("Registered activity lifecycle callback");
                }
            }
        } else {
            l(o0Var);
            o0Var.f13193i.a("Application context is not an Application");
        }
        k1Var.M(new ab.z(3, this, e2Var));
    }

    public static final void i(v vVar) {
        if (vVar == null) {
            throw new IllegalStateException("Component not created");
        }
    }

    public static final void j(u1 u1Var) {
        if (u1Var == null) {
            throw new IllegalStateException("Component not created");
        }
    }

    public static final void k(z zVar) {
        if (zVar == null) {
            throw new IllegalStateException("Component not created");
        }
        if (!zVar.f13484b) {
            throw new IllegalStateException("Component not initialized: ".concat(String.valueOf(zVar.getClass())));
        }
    }

    public static final void l(v1 v1Var) {
        if (v1Var == null) {
            throw new IllegalStateException("Component not created");
        }
        if (!v1Var.f13377b) {
            throw new IllegalStateException("Component not initialized: ".concat(String.valueOf(v1Var.getClass())));
        }
    }

    public static m1 r(Context context, zzdb zzdbVar, Long l9, Long l11) {
        Bundle bundle;
        if (zzdbVar != null) {
            Bundle bundle2 = zzdbVar.f33306i;
            zzdbVar = new zzdb(zzdbVar.f33303f, zzdbVar.f33304g, zzdbVar.f33305h, bundle2, null);
        }
        sg.w.h(context);
        sg.w.h(context.getApplicationContext());
        if (F == null) {
            synchronized (m1.class) {
                try {
                    if (F == null) {
                        F = new m1(new e2(context, zzdbVar, l9, l11));
                    }
                } finally {
                }
            }
        } else if (zzdbVar != null && (bundle = zzdbVar.f33306i) != null && bundle.containsKey("dataCollectionDefaultEnabled")) {
            sg.w.h(F);
            F.f13155y = Boolean.valueOf(bundle.getBoolean("dataCollectionDefaultEnabled"));
        }
        sg.w.h(F);
        return F;
    }

    @Override // ai.w1
    public final kc a() {
        return this.f13135c;
    }

    @Override // ai.w1
    public final o0 b() {
        o0 o0Var = this.f13138f;
        l(o0Var);
        return o0Var;
    }

    @Override // ai.w1
    public final k1 c() {
        k1 k1Var = this.f13139g;
        l(k1Var);
        return k1Var;
    }

    @Override // ai.w1
    public final Context d() {
        return this.f13133a;
    }

    @Override // ai.w1
    public final xg.a e() {
        return this.f13143k;
    }

    public final boolean f() {
        return g() == 0;
    }

    public final int g() {
        k1 k1Var = this.f13139g;
        l(k1Var);
        k1Var.D();
        e eVar = this.f13136d;
        if (eVar.R()) {
            return 1;
        }
        l(k1Var);
        k1Var.D();
        if (!this.f13156z) {
            return 8;
        }
        z0 z0Var = this.f13137e;
        j(z0Var);
        z0Var.D();
        Boolean boolValueOf = z0Var.H().contains("measurement_enabled") ? Boolean.valueOf(z0Var.H().getBoolean("measurement_enabled", true)) : null;
        if (boolValueOf != null) {
            return boolValueOf.booleanValue() ? 0 : 3;
        }
        kc kcVar = ((m1) eVar.f13368a).f13135c;
        Boolean boolQ = eVar.Q("firebase_analytics_collection_enabled");
        return boolQ != null ? boolQ.booleanValue() ? 0 : 4 : (this.f13155y == null || this.f13155y.booleanValue()) ? 0 : 7;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0034  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean h() {
        if (!this.f13152v) {
            throw new IllegalStateException("AppMeasurement is not initialized");
        }
        k1 k1Var = this.f13139g;
        l(k1Var);
        k1Var.D();
        Boolean bool = this.f13153w;
        xg.a aVar = this.f13143k;
        if (bool == null || this.f13154x == 0) {
            aVar.getClass();
            this.f13154x = SystemClock.elapsedRealtime();
            p4 p4Var = this.f13141i;
            j(p4Var);
            boolean z11 = false;
            if (p4Var.g0("android.permission.INTERNET") && p4Var.g0("android.permission.ACCESS_NETWORK_STATE")) {
                Context context = this.f13133a;
                if (zg.b.a(context).d() || this.f13136d.G() || (p4.y0(context) && p4.Y(context))) {
                    z11 = true;
                }
            }
            this.f13153w = Boolean.valueOf(z11);
            if (z11) {
                this.f13153w = Boolean.valueOf(p4Var.J(q().K()));
            }
        } else if (!bool.booleanValue()) {
            aVar.getClass();
            if (Math.abs(SystemClock.elapsedRealtime() - this.f13154x) > 1000) {
            }
        }
        return this.f13153w.booleanValue();
    }

    public final i0 m() {
        return this.f13142j;
    }

    public final h0 n() {
        k(this.f13147q);
        return this.f13147q;
    }

    public final p3 o() {
        k(this.f13148r);
        return this.f13148r;
    }

    public final o p() {
        l(this.f13149s);
        return this.f13149s;
    }

    public final f0 q() {
        k(this.f13150t);
        return this.f13150t;
    }
}
