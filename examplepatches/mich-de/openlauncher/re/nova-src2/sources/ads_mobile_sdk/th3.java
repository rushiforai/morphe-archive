package ads_mobile_sdk;

import b.c0;
import cw.l2;
import java.io.Closeable;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes2.dex */
public abstract class th3 implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    public mi3 f9923a;

    /* renamed from: b, reason: collision with root package name */
    public final th3 f9924b;

    /* renamed from: c, reason: collision with root package name */
    public final long f9925c;

    /* renamed from: d, reason: collision with root package name */
    public final AtomicBoolean f9926d;

    /* renamed from: e, reason: collision with root package name */
    public final AtomicLong f9927e;

    /* renamed from: f, reason: collision with root package name */
    public final AtomicLong f9928f;

    public th3(wv0 cuiName, mi3 traceMetaSet, UUID rootTraceId, th3 th3Var, long j11) {
        Intrinsics.g(cuiName, "cuiName");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(rootTraceId, "rootTraceId");
        this.f9923a = traceMetaSet;
        this.f9924b = th3Var;
        this.f9925c = j11;
        this.f9926d = new AtomicBoolean(false);
        this.f9927e = new AtomicLong();
        this.f9928f = new AtomicLong();
        cz.b bVar = mu0.f7335a;
        a80.m.r("Trace ", cuiName.name(), " started.", null);
    }

    public abstract th3 a(wv0 wv0Var, List list, boolean z11);

    public final void a(Throwable e3) {
        Intrinsics.g(e3, "e");
        if (!this.f9926d.get()) {
            e().f1799m = false;
            e().o = e3;
            return;
        }
        l2.a("This trace " + e().f1789c.name() + " has already finished, can't set causing exception");
    }

    public void a$1() {
        if (this.f9926d.getAndSet(true)) {
            l2.a("This trace " + e().f1789c.name() + " has already finished, can't finish again");
            return;
        }
        cc2 cc2VarE = e();
        Duration.Companion companion = Duration.f72038b;
        long j11 = this.f9927e.get();
        DurationUnit durationUnit = DurationUnit.f72045d;
        cc2VarE.f1801q = DurationKt.h(j11, durationUnit);
        e().f1802r = DurationKt.h(this.f9928f.get(), durationUnit);
        th3 th3Var = this.f9924b;
        if (th3Var != null) {
            th3Var.f9928f.addAndGet(Duration.h(Duration.m(e().f1801q, e().f1802r)));
        }
        h();
        cc2 perTraceMeta = e();
        mi3 unused = this.f9923a;
        Intrinsics.g(perTraceMeta, "perTraceMeta");
        Intrinsics.g(unused, "unused");
        String str = perTraceMeta.f1799m ? "successfully" : "unsuccessfully";
        cz.b bVar = mu0.f7335a;
        String strName = perTraceMeta.f1789c.name();
        long jH = Duration.h(perTraceMeta.f1800p);
        StringBuilder sbW = c0.w("Trace ", strName, " completed ", str, " in ");
        sbW.append(jH);
        sbW.append("ms.");
        mu0.b(sbW.toString(), null);
    }

    public final AtomicBoolean b() {
        return this.f9926d;
    }

    public final int c() {
        return e().f1787a;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        cc2 cc2VarE;
        wv0 wv0Var;
        ii3 ii3VarB = ji3.b();
        th3 th3Var = ii3VarB.f4777a;
        if (th3Var == null) {
            l2.a("Tried to end trace " + e().f1789c.name() + " (" + e().f1787a + "), but there was no active trace. If this is a test, did you forget to add a TraceThreadContextElement to your CoroutineScope?");
        }
        if (this != th3Var) {
            String strName = e().f1789c.name();
            int i5 = e().f1787a;
            String strName2 = (th3Var == null || (cc2VarE = th3Var.e()) == null || (wv0Var = cc2VarE.f1789c) == null) ? null : wv0Var.name();
            Integer numValueOf = th3Var != null ? Integer.valueOf(th3Var.e().f1787a) : null;
            StringBuilder sbV = c0.v("Tried to end trace ", i5, strName, " (", "), but that trace is not the current trace. The current trace is ");
            sbV.append(strName2);
            sbV.append(" (");
            sbV.append(numValueOf);
            sbV.append(").");
            l2.a(sbV.toString());
        }
        ji3.a(ii3VarB, th3Var != null ? th3Var.f9924b : null);
        a$1();
    }

    public abstract cc2 e();

    public final long f() {
        return this.f9925c;
    }

    public final mi3 g() {
        return this.f9923a;
    }

    public abstract void h();

    public final void b(Throwable e3) {
        Intrinsics.g(e3, "e");
        if (!this.f9926d.get()) {
            e().f1799m = false;
            e().n = e3;
            return;
        }
        l2.a("This trace " + e().f1789c.name() + " has already finished, can't set exception");
    }

    public final void a(mi3 mi3Var) {
        Intrinsics.g(mi3Var, "<set-?>");
        this.f9923a = mi3Var;
    }
}
