package defpackage;

import android.app.Application;
import android.content.Context;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.File;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yu2 implements l66 {
    public final String a;
    public final String b;
    public oa2 c;
    public Thread d;
    public final ConcurrentHashMap e;
    public final Context f;
    public j92 g;
    public a2a h;
    public final f66 i;

    public yu2(Context context, String str, String str2) {
        fn fnVar = fn.C;
        l01.a.getClass();
        k01 k01Var = k01.a;
        context.getClass();
        this.a = str;
        this.b = str2;
        this.e = new ConcurrentHashMap();
        Context applicationContext = context.getApplicationContext();
        applicationContext.getClass();
        this.f = applicationContext;
        this.g = new pg8();
        Collections.newSetFromMap(new ConcurrentHashMap()).getClass();
        this.i = (f66) fnVar.invoke(this);
    }

    @Override // defpackage.l66
    public final List a() {
        return bu1.m1(this.e.values());
    }

    @Override // defpackage.l66
    public final void b(String str) {
        str.getClass();
        ysb ysbVar = (ysb) this.e.get(str);
        if (ysbVar != null) {
            ysbVar.f.set(null);
        }
    }

    @Override // defpackage.l66
    public final String c() {
        return i().s;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.l66
    public final void d(ea4 ea4Var) {
        boolean z;
        z5e zi5Var;
        oa2 oa2VarI = i();
        j92 j92Var = this.g;
        f66 f66Var = this.i;
        ysb ysbVar = new ysb(oa2VarI, j92Var, ea4Var, f66Var);
        this.e.put(ea4Var.getName(), ysbVar);
        Context context = this.f;
        String str = this.a;
        context.getClass();
        str.getClass();
        if (!ysbVar.e.get()) {
            if (ea4Var instanceof ha7) {
                v5e v5eVar = oa2VarI.z;
                int maxBatchesPerUploadJob = oa2VarI.A.getMaxBatchesPerUploadJob();
                ou2 ou2Var = new ou2(v5eVar, maxBatchesPerUploadJob);
                lig ligVar = new lig(ou2Var);
                ha7 ha7Var = (ha7) ea4Var;
                jb4 jb4Var = ha7Var.j;
                long windowDurationMs$dd_sdk_android_core_release = oa2VarI.y.getWindowDurationMs$dd_sdk_android_core_release();
                oa2VarI.y.getWindowDurationMs$dd_sdk_android_core_release();
                jb4Var.getClass();
                rg4 rg4Var = new rg4(windowDurationMs$dd_sdk_android_core_release, 4194304L, 524288L, 500, 64800000L, 536870912L, 5000L);
                uz5 uz5Var = new uz5(ha7Var.h, ou2Var, rg4Var, f66Var, oa2VarI.j);
                if (context instanceof Application) {
                    a2a a2aVar = new a2a(uz5Var);
                    ysbVar.k = a2aVar;
                    ((Application) context).registerActivityLifecycleCallbacks(a2aVar);
                }
                ysbVar.j = uz5Var;
                String str2 = ha7Var.h;
                e52 e52Var = oa2VarI.k;
                File fileC = oa2VarI.c();
                dm0 dm0VarB = oa2VarI.b();
                h08 h08Var = ysbVar.j;
                rv8 rv8Var = oa2VarI.j;
                e52Var.getClass();
                str2.getClass();
                rv8Var.getClass();
                Locale locale = Locale.US;
                xp0 xp0Var = new xp0(new File(fileC, String.format(locale, "%s-pending-v2", Arrays.copyOf(new Object[]{str2}, 1))), rg4Var, f66Var, h08Var, rv8Var);
                xp0 xp0Var2 = new xp0(new File(fileC, String.format(locale, "%s-v2", Arrays.copyOf(new Object[]{str2}, 1))), rg4Var, f66Var, h08Var, rv8Var);
                new ga4(e52Var, xp0Var, xp0Var2, new m50(new pkf(f66Var), f66Var, rv8Var), dm0VarB, f66Var);
                ysbVar.g = new tl(oa2VarI.b(), xp0Var2, xp0Var, new ba9(f66Var, 2), new ba9(f66Var, 0), new pkf(f66Var), f66Var, rg4Var, ysbVar.j, str2);
                ha7Var.b(context);
                if (oa2VarI.v) {
                    ia7 ia7Var = (ia7) ha7Var.i.getValue();
                    la2 la2Var = oa2VarI.p;
                    if (la2Var == null) {
                        g76.g0("callFactory");
                        throw null;
                    }
                    String str3 = oa2VarI.u;
                    yp ypVar = oa2VarI.o;
                    String str4 = ha7Var.h;
                    rv8 rv8Var2 = oa2VarI.j;
                    str4.getClass();
                    rv8Var2.getClass();
                    pt2 pt2Var = new pt2(ia7Var, f66Var, la2Var, str3, ypVar, new z46());
                    ysbVar.h = pt2Var;
                    String str5 = ha7Var.h;
                    asc ascVar = ysbVar.g;
                    ge8 ge8Var = oa2VarI.h;
                    u6d u6dVar = oa2VarI.i;
                    k87 k87Var = oa2VarI.E;
                    if (k87Var == null) {
                        g76.g0("uploadExecutorService");
                        throw null;
                    }
                    z = true;
                    zi5Var = new n0c(maxBatchesPerUploadJob, j92Var, pt2Var, f66Var, ge8Var, ascVar, u6dVar, str5, k87Var, ligVar);
                } else {
                    z = true;
                    zi5Var = new zi5(20);
                }
                ysbVar.i = zi5Var;
            } else {
                z = true;
                ea4Var.b(context);
            }
            if (ea4Var instanceof b52) {
                oa2VarI.k.e((b52) ea4Var);
            }
            String name = ea4Var.getName();
            oa2VarI.c();
            name.getClass();
            oa2VarI.b();
            Collections.singletonMap("track", ea4Var.getName()).getClass();
            ysbVar.e.set(z);
            ysbVar.i.h();
        }
        if (g76.L(ea4Var.getName(), "rum")) {
            i().B.b(this);
        }
    }

    @Override // defpackage.l66
    public final f66 e() {
        return this.i;
    }

    @Override // defpackage.l66
    public final vu2 f(Set set) {
        Future futureSubmit;
        set.getClass();
        ThreadPoolExecutor threadPoolExecutorA = i().a();
        String str = "getDatadogContext";
        wu2 wu2Var = new wu2(this, 1, set);
        f66 f66Var = this.i;
        f66Var.getClass();
        Object obj = null;
        try {
            futureSubmit = threadPoolExecutorA.submit(wu2Var);
        } catch (RejectedExecutionException e) {
            f49.L(f66Var, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new hm0(str, 7), e, 48);
            futureSubmit = null;
        }
        if (futureSubmit != null) {
            try {
                obj = futureSubmit.get();
            } catch (InterruptedException e2) {
                f49.L(f66Var, d66.ERROR, d46.R(e66.USER, e66.TELEMETRY), new hm0(str, 3), e2, 48);
            } catch (CancellationException e3) {
                f49.L(f66Var, d66.ERROR, d46.R(e66.USER, e66.TELEMETRY), new hm0(str, 4), e3, 48);
            } catch (ExecutionException e4) {
                f49.L(f66Var, d66.ERROR, d46.R(e66.USER, e66.TELEMETRY), new hm0(str, 5), e4, 48);
            }
        }
        return (vu2) obj;
    }

    @Override // defpackage.l66
    public final rv8 g() {
        return i().j;
    }

    @Override // defpackage.l66
    public final ysb getFeature(String str) {
        str.getClass();
        return (ysb) this.e.get(str);
    }

    @Override // defpackage.l66
    public final String getName() {
        return this.b;
    }

    @Override // defpackage.l66
    public final void h(String str, ha7 ha7Var) {
        str.getClass();
        ysb ysbVar = (ysb) this.e.get(str);
        if (ysbVar == null) {
            f49.K(this.i, d66.WARN, e66.USER, new hm0(str, 8), null, false, 56);
            return;
        }
        AtomicReference atomicReference = ysbVar.f;
        if (atomicReference.get() != null) {
            f49.K(this.i, d66.WARN, e66.USER, new hm0(str, 9), null, false, 56);
        }
        atomicReference.set(ha7Var);
    }

    public final oa2 i() {
        oa2 oa2Var = this.c;
        if (oa2Var != null) {
            return oa2Var;
        }
        g76.g0("coreFeature");
        throw null;
    }

    public final void j(q32 q32Var) {
        q32 q32Var2;
        Runtime runtime;
        Thread thread;
        String str = q32Var.c;
        Pattern patternCompile = Pattern.compile("[a-zA-Z0-9_:./-]{0,195}[a-zA-Z0-9_./-]");
        patternCompile.getClass();
        if (!patternCompile.matcher(str).matches()) {
            ay0.e("The environment name should contain maximum 196 of the following allowed characters [a-zA-Z0-9_:./-] and should never finish with a semicolon.In this case the Datadog SDK will not be initialised.");
            return;
        }
        boolean z = false;
        boolean z2 = (this.f.getApplicationInfo().flags & 2) != 0;
        o32 o32Var = q32Var.a;
        if (z2 && o32Var.a) {
            q32Var2 = new q32(o32.a(o32Var, aq0.SMALL, v5e.FREQUENT, 8167), q32Var.b, q32Var.c, q32Var.d, q32Var.e, q32Var.f, q32Var.g, q32Var.h);
            uu2.c = 2;
        } else {
            q32Var2 = q32Var;
        }
        z72 z72Var = oa2.L;
        f66 f66Var = this.i;
        bx2 bx2Var = new bx2(new ir(8, this));
        z72 z72Var2 = oa2.L;
        this.c = new oa2(f66Var, bx2Var, z72Var);
        i().d(this.f, this.a, q32Var2, tqd.PENDING);
        int i = 17;
        this.g = new lig(i(), new f70(i, this), z, 18);
        Map map = q32Var2.g;
        Object obj = map.get("_dd.source");
        if (obj != null && (obj instanceof String) && !muc.b0((CharSequence) obj)) {
            i().t = (String) obj;
        }
        Object obj2 = map.get("_dd.sdk_version");
        if (obj2 != null && (obj2 instanceof String) && !muc.b0((CharSequence) obj2)) {
            i().u = (String) obj2;
        }
        Object obj3 = map.get("_dd.version");
        if (obj3 != null && (obj3 instanceof String) && !muc.b0((CharSequence) obj3)) {
            i().n.o((String) obj3);
        }
        if (q32Var2.f) {
            d(new m50(this));
        }
        Context context = this.f;
        if (context instanceof Application) {
            a2a a2aVar = new a2a(new ku3(context, this.b, this.i));
            ((Application) context).registerActivityLifecycleCallbacks(a2aVar);
            this.h = a2aVar;
        }
        try {
            this.d = new Thread(new v0(i, this), "datadog_shutdown");
            runtime = Runtime.getRuntime();
            thread = this.d;
        } catch (IllegalArgumentException e) {
            f49.K(this.i, d66.ERROR, e66.MAINTAINER, ot2.j, e, false, 48);
        } catch (IllegalStateException e2) {
            f49.K(this.i, d66.ERROR, e66.MAINTAINER, ot2.i, e2, false, 48);
            k();
        } catch (SecurityException e3) {
            f49.K(this.i, d66.ERROR, e66.MAINTAINER, ot2.k, e3, false, 48);
        }
        if (thread == null) {
            g76.g0("shutdownHook");
            throw null;
        }
        runtime.addShutdownHook(thread);
        fi2 fi2Var = new fi2(this, 4, q32Var);
        k87 k87Var = i().E;
        if (k87Var != null) {
            r40.M(k87Var, "Configuration telemetry", 5000L, this.i, fi2Var);
        } else {
            g76.g0("uploadExecutorService");
            throw null;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void k() {
        int i;
        k87 k87Var;
        a2a a2aVar;
        Iterator it2 = this.e.keySet().iterator();
        while (true) {
            i = 20;
            if (!it2.hasNext()) {
                break;
            }
            ysb ysbVar = (ysb) this.e.remove((String) it2.next());
            if (ysbVar != null) {
                oa2 oa2Var = ysbVar.a;
                ea4 ea4Var = ysbVar.c;
                AtomicBoolean atomicBoolean = ysbVar.e;
                if (atomicBoolean.get()) {
                    ea4Var.a();
                    if (ea4Var instanceof b52) {
                        oa2Var.k.b((b52) ea4Var);
                    }
                    ysbVar.i.o();
                    ysbVar.i = new zi5(i);
                    ysbVar.g = new hpe(i);
                    ysbVar.h = new fa4(i);
                    ysbVar.j = new wz7(i);
                    Object obj = oa2Var.f.get();
                    Application application = obj instanceof Application ? (Application) obj : null;
                    if (application != null) {
                        application.unregisterActivityLifecycleCallbacks(ysbVar.k);
                    }
                    ysbVar.k = null;
                    ysbVar.m.clear();
                    atomicBoolean.set(false);
                }
            }
        }
        Context context = this.f;
        if ((context instanceof Application) && (a2aVar = this.h) != null) {
            ((Application) context).unregisterActivityLifecycleCallbacks(a2aVar);
        }
        this.g = new pg8();
        oa2 oa2VarI = i();
        if (oa2VarI.e.get()) {
            Context context2 = (Context) oa2VarI.f.get();
            if (context2 != null) {
                oa2VarI.h.a(context2);
                oa2VarI.i.a(context2);
            }
            oa2VarI.f.clear();
            oa2VarI.k.a();
            oa2VarI.r = "";
            oa2VarI.n = new xsa(19);
            oa2VarI.s = "";
            oa2VarI.t = "android";
            oa2VarI.u = "3.10.0";
            oa2VarI.v = true;
            oa2VarI.w = "";
            oa2VarI.x = "";
            oa2VarI.g = new ct2(1, false);
            oa2VarI.h = new h1c(i);
            oa2VarI.i = new no3(i);
            oa2VarI.j = new p23();
            oa2VarI.k = new dq1(i);
            oa2VarI.l = new y3b(i);
            oa2VarI.o = new my6(9, false);
            k87 k87Var2 = oa2VarI.E;
            if (k87Var2 == null) {
                g76.g0("uploadExecutorService");
                throw null;
            }
            k87Var2.shutdownNow();
            oa2VarI.a().shutdownNow();
            oa2VarI.b().shutdownNow();
            try {
                try {
                    k87Var = oa2VarI.E;
                } catch (SecurityException e) {
                    f49.K(oa2VarI.a, d66.ERROR, e66.MAINTAINER, x22.C, e, false, 48);
                }
            } catch (InterruptedException unused) {
                Thread.currentThread().interrupt();
            }
            if (k87Var == null) {
                g76.g0("uploadExecutorService");
                throw null;
            }
            TimeUnit timeUnit = TimeUnit.SECONDS;
            k87Var.awaitTermination(1L, timeUnit);
            oa2VarI.a().awaitTermination(1L, timeUnit);
            oa2VarI.b().awaitTermination(1L, timeUnit);
            try {
                un6 un6Var = oa2VarI.q;
                if (un6Var != null) {
                    ljc ljcVar = un6Var.a;
                    ljcVar.a();
                    ljcVar.a.set(jjc.STOPPED);
                    ljcVar.c.shutdown();
                }
            } catch (IllegalStateException e2) {
                f49.K(oa2VarI.a, d66.WARN, e66.MAINTAINER, x22.D, e2, false, 48);
            }
            oa2VarI.e.set(false);
            oa2VarI.B = new jzb();
            oa2VarI.k = new dq1(i);
        }
        if (this.d != null) {
            try {
                Runtime runtime = Runtime.getRuntime();
                Thread thread = this.d;
                if (thread != null) {
                    runtime.removeShutdownHook(thread);
                } else {
                    g76.g0("shutdownHook");
                    throw null;
                }
            } catch (IllegalStateException e3) {
                f49.K(this.i, d66.ERROR, e66.MAINTAINER, ot2.g, e3, false, 48);
            } catch (SecurityException e4) {
                f49.K(this.i, d66.ERROR, e66.MAINTAINER, ot2.h, e4, false, 48);
            }
        }
    }
}
