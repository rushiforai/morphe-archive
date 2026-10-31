package ads_mobile_sdk;

import b.o2;
import b.t4;
import c80.d;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import t70.m0;
import t70.s1;

/* loaded from: classes.dex */
public final class mc2 implements b.db {

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f7099a;

    /* renamed from: b, reason: collision with root package name */
    public final b.m5 f7100b;

    /* renamed from: c, reason: collision with root package name */
    public final t4 f7101c;

    /* renamed from: d, reason: collision with root package name */
    public final kz2 f7102d;

    /* renamed from: e, reason: collision with root package name */
    public final o2 f7103e;

    /* renamed from: f, reason: collision with root package name */
    public final d f7104f;

    /* renamed from: g, reason: collision with root package name */
    public final ConcurrentHashMap f7105g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f7106h;

    /* renamed from: i, reason: collision with root package name */
    public s1 f7107i;

    public mc2(t70.j0 backgroundScope, b.m5 m5Var, t4 flags, kz2 rootTraceCreator, o2 clock) {
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(clock, "clock");
        this.f7099a = backgroundScope;
        this.f7100b = m5Var;
        this.f7101c = flags;
        this.f7102d = rootTraceCreator;
        this.f7103e = clock;
        this.f7104f = new d();
        this.f7105g = new ConcurrentHashMap();
        this.f7106h = true;
        s1 s1VarC = m0.c();
        if (this.f7106h || !flags.k()) {
            s1VarC.j0();
        }
        this.f7107i = s1VarC;
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x0074, code lost:
    
        if (r5.K(r0) == r1) goto L33;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(mc2 mc2Var, ContinuationImpl continuationImpl) {
        lc2 lc2Var;
        d dVar;
        if (continuationImpl instanceof lc2) {
            lc2Var = (lc2) continuationImpl;
            int i5 = lc2Var.f6205e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lc2Var.f6205e = i5 - Integer.MIN_VALUE;
            } else {
                lc2Var = new lc2(mc2Var, continuationImpl);
            }
        }
        Object obj = lc2Var.f6203c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = lc2Var.f6205e;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                dVar = mc2Var.f7104f;
                lc2Var.f6201a = mc2Var;
                lc2Var.f6202b = dVar;
                lc2Var.f6205e = 1;
                if (dVar.e(lc2Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            d dVar2 = lc2Var.f6202b;
            mc2 mc2Var2 = lc2Var.f6201a;
            ResultKt.b(obj);
            dVar = dVar2;
            mc2Var = mc2Var2;
            s1 s1Var = (!mc2Var.f7101c.k() || mc2Var.f7107i.isCompleted()) ? null : mc2Var.f7107i;
            if (s1Var != null) {
                lc2Var.f6201a = null;
                lc2Var.f6202b = null;
                lc2Var.f6205e = 2;
            }
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(mc2 mc2Var, ContinuationImpl continuationImpl) {
        jc2 jc2Var;
        d dVar;
        if (continuationImpl instanceof jc2) {
            jc2Var = (jc2) continuationImpl;
            int i5 = jc2Var.f5224e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jc2Var.f5224e = i5 - Integer.MIN_VALUE;
            } else {
                jc2Var = new jc2(mc2Var, continuationImpl);
            }
        }
        Object obj = jc2Var.f5222c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jc2Var.f5224e;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = mc2Var.f7104f;
            jc2Var.f5220a = mc2Var;
            jc2Var.f5221b = dVar;
            jc2Var.f5224e = 1;
            if (dVar.e(jc2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = jc2Var.f5221b;
            mc2 mc2Var2 = jc2Var.f5220a;
            ResultKt.b(obj);
            dVar = dVar2;
            mc2Var = mc2Var2;
        }
        try {
            mc2Var.f7106h = false;
            if (mc2Var.f7101c.k() && mc2Var.f7107i.isCompleted()) {
                mc2Var.f7107i = m0.c();
            }
            Unit unit = Unit.f71706a;
            dVar.g(null);
            return unit;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object c(mc2 mc2Var, ContinuationImpl continuationImpl) {
        kc2 kc2Var;
        d dVar;
        if (continuationImpl instanceof kc2) {
            kc2Var = (kc2) continuationImpl;
            int i5 = kc2Var.f5674e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kc2Var.f5674e = i5 - Integer.MIN_VALUE;
            } else {
                kc2Var = new kc2(mc2Var, continuationImpl);
            }
        }
        Object obj = kc2Var.f5672c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kc2Var.f5674e;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = mc2Var.f7104f;
            kc2Var.f5670a = mc2Var;
            kc2Var.f5671b = dVar;
            kc2Var.f5674e = 1;
            if (dVar.e(kc2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = kc2Var.f5671b;
            mc2 mc2Var2 = kc2Var.f5670a;
            ResultKt.b(obj);
            dVar = dVar2;
            mc2Var = mc2Var2;
        }
        try {
            t4 t4Var = mc2Var.f7101c;
            t4Var.getClass();
            if (((Boolean) t4Var.a("gads:pc:reschedule_auto_refresh_on_app_foreground", Boolean.FALSE, jn.a$10)).booleanValue()) {
                mc2Var.a$1();
            }
            mc2Var.f7106h = true;
            mc2Var.f7107i.j0();
            Unit unit = Unit.f71706a;
            dVar.g(null);
            return unit;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    public final void a$1() {
        this.f7103e.getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        for (sk skVar : this.f7105g.values()) {
            if (skVar.f9593h.b()) {
                long j11 = skVar.f9592g - jCurrentTimeMillis;
                long jH = 0;
                if (j11 <= 0) {
                    Duration.f72038b.getClass();
                } else {
                    Duration.Companion companion = Duration.f72038b;
                    jH = DurationKt.h(j11, DurationUnit.f72045d);
                }
                skVar.f9593h.c(null);
                skVar.f9593h = a(skVar, jH);
            }
        }
    }

    @Override // b.db
    public final Object d(long j11, SuspendLambda suspendLambda) {
        return b(this, suspendLambda);
    }

    @Override // b.db
    public final Object b(long j11, SuspendLambda suspendLambda) {
        return c(this, suspendLambda);
    }

    public final void a(String filename) {
        Intrinsics.g(filename, "filename");
        sk skVar = (sk) this.f7105g.remove(filename);
        if (skVar != null) {
            skVar.f9593h.c(null);
        }
    }

    public final t70.g2 a(sk skVar, long j11) {
        f22 f22Var = new f22(j11, this, skVar, (Continuation) null);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        t70.j0 j0Var = this.f7099a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        return m0.t(j0Var, context, null, new ar.a(f22Var, null), 2);
    }
}
