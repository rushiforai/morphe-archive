package ads_mobile_sdk;

import android.os.SystemClock;
import androidx.recyclerview.widget.c0;
import b.ed;
import b.o2;
import b.x;
import b4.i;
import c80.d;
import java.io.Closeable;
import java.util.Iterator;
import java.util.PriorityQueue;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.random.Random;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import ni.a0;
import t70.e0;
import t70.k0;
import t70.m0;
import t70.q1;
import t70.s1;
import t70.x1;

/* loaded from: classes.dex */
public abstract class f5 implements b.db, x {
    public static final Set J = kotlin.collections.c.f1(new ni.u[]{ni.u.f78327c, ni.u.f78334j, ni.u.f78333i, ni.u.f78332h, ni.u.f78335k});
    public x1 A;
    public final Queue B;
    public s1 C;
    public final s1 D;
    public s1 E;
    public s1 F;
    public s1 G;
    public s1 H;
    public s1 I;

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f3158a;

    /* renamed from: b, reason: collision with root package name */
    public final String f3159b;

    /* renamed from: d, reason: collision with root package name */
    public final ni.z f3160d;

    /* renamed from: e, reason: collision with root package name */
    public final kz2 f3161e;

    /* renamed from: f, reason: collision with root package name */
    public final o2 f3162f;

    /* renamed from: g, reason: collision with root package name */
    public final jr0 f3163g;

    /* renamed from: h, reason: collision with root package name */
    public final b.m6 f3164h;

    /* renamed from: i, reason: collision with root package name */
    public final fl2 f3165i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f3166j;

    /* renamed from: k, reason: collision with root package name */
    public final qw2 f3167k;

    /* renamed from: l, reason: collision with root package name */
    public final long f3168l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f3169m;
    public final long n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public final int f3170p;

    /* renamed from: q, reason: collision with root package name */
    public final double f3171q;

    /* renamed from: r, reason: collision with root package name */
    public final long f3172r;

    /* renamed from: s, reason: collision with root package name */
    public final double f3173s;

    /* renamed from: t, reason: collision with root package name */
    public final d f3174t;

    /* renamed from: u, reason: collision with root package name */
    public y3 f3175u;

    /* renamed from: v, reason: collision with root package name */
    public int f3176v;

    /* renamed from: w, reason: collision with root package name */
    public long f3177w;

    /* renamed from: x, reason: collision with root package name */
    public boolean f3178x;

    /* renamed from: y, reason: collision with root package name */
    public x1 f3179y;

    /* renamed from: z, reason: collision with root package name */
    public x1 f3180z;

    public f5(ni.z zVar, a0 preloadConfiguration, qw2 qw2Var, jr0 flags, fl2 fl2Var, kz2 rootTraceCreator, o2 clock, b.m6 randomGenerator, String preloadId, t70.j0 backgroundScope, boolean z11, boolean z12, boolean z13) {
        jn jnVar = jn.a$15;
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(preloadId, "preloadId");
        Intrinsics.g(preloadConfiguration, "preloadConfiguration");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(randomGenerator, "randomGenerator");
        this.f3158a = backgroundScope;
        this.f3159b = preloadId;
        this.f3160d = zVar;
        this.f3161e = rootTraceCreator;
        this.f3162f = clock;
        this.f3163g = flags;
        this.f3164h = randomGenerator;
        this.f3165i = fl2Var;
        this.f3166j = z13;
        this.f3167k = qw2Var;
        Duration.Companion companion = Duration.f72038b;
        DurationUnit durationUnit = DurationUnit.f72047f;
        this.f3168l = ((Duration) flags.a("gads:preload_ad_ttl:minutes", ed.k(60, durationUnit, "gads:preload_ad_ttl:minutes"), u.a$2)).f72041a;
        Boolean bool = Boolean.FALSE;
        jn jnVar2 = jn.a$10;
        this.f3169m = ((Boolean) flags.a("gads:reschedule_preload_expiration_on_foreground:enabled", bool, jnVar2)).booleanValue();
        DurationUnit durationUnit2 = DurationUnit.f72046e;
        Duration durationK = ed.k(10, durationUnit2, "gads:preload_ad_default_refresh_interval:millis");
        u uVar = u.a$1;
        long j11 = ((Duration) flags.a("gads:preload_ad_default_refresh_interval:millis", durationK, uVar)).f72041a;
        this.n = j11;
        Integer numA = preloadConfiguration.a();
        this.o = Math.max(Math.min(numA != null ? numA.intValue() : ((Number) flags.a("gads:preload_default_buffer_size", 2, jnVar)).intValue(), ((Number) flags.a("gads:preload_max_buffer_size", 15, jnVar)).intValue()), ((Number) flags.a("gads:preload_min_buffer_size", 1, jnVar)).intValue());
        this.f3170p = ((Number) flags.a("gads:preload_ad_max_backoff:times", 10, jnVar)).intValue();
        long j12 = ((Duration) flags.a("gads:preload_delay_after_removal:seconds", ed.k(10, durationUnit2, "gads:preload_delay_after_removal:seconds"), u.a$3)).f72041a;
        Double dValueOf = Double.valueOf(0.2d);
        jn jnVar3 = jn.a$12;
        this.f3171q = ((Number) flags.a("gads:preload_retry_jitter", dValueOf, jnVar3)).doubleValue();
        this.f3172r = ((Duration) flags.a("gads:preload_ad_default_refresh_max_interval:millis", new Duration(DurationKt.g(5, durationUnit)), uVar)).f72041a;
        this.f3173s = ((Number) flags.a("gads:preload_retry_multiplier", Double.valueOf(2.0d), jnVar3)).doubleValue();
        this.f3174t = new d();
        this.f3175u = y3.f11934a;
        this.f3177w = j11;
        s1 s1VarC = m0.c();
        s1VarC.j0();
        this.f3179y = s1VarC;
        s1 s1VarC2 = m0.c();
        s1VarC2.j0();
        this.f3180z = s1VarC2;
        this.A = m0.c();
        this.B = ((Boolean) flags.a("gads:enable_preload_sorting_by_type:enabled", bool, jnVar2)).booleanValue() ? new ml2() : new PriorityQueue(new z4(new c0(3)));
        s1 s1VarC3 = m0.c();
        s1VarC3.j0();
        this.C = s1VarC3;
        s1 s1VarC4 = m0.c();
        s1VarC4.j0();
        this.D = s1VarC4;
        s1 s1VarC5 = m0.c();
        s1VarC5.j0();
        this.E = s1VarC5;
        s1 s1VarC6 = m0.c();
        s1VarC6.j0();
        this.F = s1VarC6;
        s1 s1VarC7 = m0.c();
        s1VarC7.j0();
        this.G = s1VarC7;
        s1 s1VarC8 = m0.c();
        if (z11) {
            s1VarC8.j0();
        }
        this.H = s1VarC8;
        s1 s1VarC9 = m0.c();
        if (z12) {
            s1VarC9.j0();
        }
        this.I = s1VarC9;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0068 A[Catch: all -> 0x0031, TryCatch #0 {all -> 0x0031, blocks: (B:13:0x002d, B:25:0x0062, B:27:0x0068, B:29:0x008d, B:32:0x009c, B:24:0x005a), top: B:37:0x0021 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v0, types: [int] */
    /* JADX WARN: Type inference failed for: r2v1 */
    /* JADX WARN: Type inference failed for: r2v11 */
    /* JADX WARN: Type inference failed for: r2v12 */
    /* JADX WARN: Type inference failed for: r2v6, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(f5 f5Var, ContinuationImpl continuationImpl) {
        b4 b4Var;
        Object obj;
        f5 f5Var2;
        Iterator it;
        if (continuationImpl instanceof b4) {
            b4Var = (b4) continuationImpl;
            int i5 = b4Var.f1247f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b4Var.f1247f = i5 - Integer.MIN_VALUE;
            } else {
                b4Var = new b4(f5Var, continuationImpl);
            }
        }
        Object obj2 = b4Var.f1245d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r22 = b4Var.f1247f;
        try {
            if (r22 == 0) {
                ResultKt.b(obj2);
                d dVar = f5Var.f3174t;
                b4Var.f1242a = f5Var;
                b4Var.f1243b = dVar;
                b4Var.f1247f = 1;
                if (dVar.e(b4Var) != coroutineSingletons) {
                    obj = dVar;
                }
                return coroutineSingletons;
            }
            if (r22 != 1) {
                if (r22 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                it = b4Var.f1244c;
                c80.a aVar = b4Var.f1243b;
                f5Var2 = b4Var.f1242a;
                ResultKt.b(obj2);
                r22 = aVar;
                while (it.hasNext()) {
                    kl2 kl2Var = (kl2) it.next();
                    Duration.Companion companion = Duration.f72038b;
                    f5Var2.f3162f.getClass();
                    if (Duration.c(DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d), Duration.m(kl2Var.f5770b, f5Var2.f3168l)) >= 0) {
                        b4Var.f1242a = f5Var2;
                        b4Var.f1243b = r22;
                        b4Var.f1244c = it;
                        b4Var.f1247f = 2;
                        if (f5Var2.a(it, kl2Var, b4Var) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    }
                }
                return Unit.f71706a;
            }
            Object obj3 = b4Var.f1243b;
            f5 f5Var3 = b4Var.f1242a;
            ResultKt.b(obj2);
            obj = obj3;
            f5Var = f5Var3;
            f5Var2 = f5Var;
            it = f5Var.B.iterator();
            r22 = obj;
            while (it.hasNext()) {
            }
            return Unit.f71706a;
        } finally {
            ((d) r22).g(null);
        }
    }

    /*  JADX ERROR: JadxOverflowException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxOverflowException: Regions count limit reached
        	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:59)
        	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:31)
        	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:19)
        */
    /* JADX WARN: Removed duplicated region for block: B:142:0x0258 A[Catch: all -> 0x0265, TryCatch #4 {all -> 0x0265, blocks: (B:140:0x0254, B:142:0x0258, B:145:0x0268), top: B:214:0x0254 }] */
    /* JADX WARN: Removed duplicated region for block: B:148:0x0273  */
    /* JADX WARN: Removed duplicated region for block: B:151:0x028a  */
    /* JADX WARN: Removed duplicated region for block: B:161:0x02c3 A[ORIG_RETURN, RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:239:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:240:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:246:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:249:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00f1  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:160:0x02c1 -> B:162:0x02c4). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:52:0x00ef -> B:45:0x00cb). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void b(ads_mobile_sdk.f5 r14, kotlin.coroutines.jvm.internal.ContinuationImpl r15) {
        /*
            Method dump skipped, instructions count: 850
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: ads_mobile_sdk.f5.b(ads_mobile_sdk.f5, kotlin.coroutines.jvm.internal.ContinuationImpl):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object c(f5 f5Var, ContinuationImpl continuationImpl) {
        z3 z3Var;
        f5 f5Var2;
        d dVar;
        if (continuationImpl instanceof z3) {
            z3Var = (z3) continuationImpl;
            int i5 = z3Var.f12435e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                z3Var.f12435e = i5 - Integer.MIN_VALUE;
            } else {
                z3Var = new z3(f5Var, continuationImpl);
            }
        }
        Object objD = z3Var.f12433c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = z3Var.f12435e;
        if (i11 == 0) {
            ResultKt.b(objD);
            z3Var.f12431a = f5Var;
            z3Var.f12435e = 1;
            objD = d(f5Var, z3Var);
            if (objD != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = z3Var.f12432b;
            f5Var2 = z3Var.f12431a;
            ResultKt.b(objD);
            try {
                f5Var2.G.j0();
                f5Var2.f3175u = y3.f11935b;
                return Unit.f71706a;
            } finally {
                dVar.g(null);
            }
        }
        f5Var = z3Var.f12431a;
        ResultKt.b(objD);
        if (!((Boolean) objD).booleanValue()) {
            return Unit.f71706a;
        }
        d dVar2 = f5Var.f3174t;
        z3Var.f12431a = f5Var;
        z3Var.f12432b = dVar2;
        z3Var.f12435e = 2;
        if (dVar2.e(z3Var) != coroutineSingletons) {
            f5Var2 = f5Var;
            dVar = dVar2;
            f5Var2.G.j0();
            f5Var2.f3175u = y3.f11935b;
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object d(f5 f5Var, ContinuationImpl continuationImpl) {
        a4 a4Var;
        d dVar;
        if (continuationImpl instanceof a4) {
            a4Var = (a4) continuationImpl;
            int i5 = a4Var.f829e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a4Var.f829e = i5 - Integer.MIN_VALUE;
            } else {
                a4Var = new a4(f5Var, continuationImpl);
            }
        }
        Object obj = a4Var.f827c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = a4Var.f829e;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = f5Var.f3174t;
            a4Var.f825a = f5Var;
            a4Var.f826b = dVar;
            a4Var.f829e = 1;
            if (dVar.e(a4Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = a4Var.f826b;
            f5 f5Var2 = a4Var.f825a;
            ResultKt.b(obj);
            dVar = dVar2;
            f5Var = f5Var2;
        }
        try {
            if (f5Var.f3178x || f5Var.B.size() >= f5Var.o || f5Var.f3175u == y3.f11936c || !f5Var.D.isCompleted() || !f5Var.H.isCompleted() || !f5Var.I.isCompleted() || !f5Var.E.isCompleted() || !f5Var.F.isCompleted()) {
                z11 = false;
            }
            Boolean boolValueOf = Boolean.valueOf(z11);
            dVar.g(null);
            return boolValueOf;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object e(f5 f5Var, ContinuationImpl continuationImpl) {
        l4 l4Var;
        d dVar;
        if (continuationImpl instanceof l4) {
            l4Var = (l4) continuationImpl;
            int i5 = l4Var.f6064e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                l4Var.f6064e = i5 - Integer.MIN_VALUE;
            } else {
                l4Var = new l4(f5Var, continuationImpl);
            }
        }
        Object obj = l4Var.f6062c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = l4Var.f6064e;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = f5Var.f3174t;
            l4Var.f6060a = f5Var;
            l4Var.f6061b = dVar;
            l4Var.f6064e = 1;
            if (dVar.e(l4Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = l4Var.f6061b;
            f5 f5Var2 = l4Var.f6060a;
            ResultKt.b(obj);
            dVar = dVar2;
            f5Var = f5Var2;
        }
        try {
            if (f5Var.f3175u != y3.f11936c) {
                z11 = false;
            }
            return Boolean.valueOf(z11);
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object f(f5 f5Var, ContinuationImpl continuationImpl) {
        m4 m4Var;
        d dVar;
        if (continuationImpl instanceof m4) {
            m4Var = (m4) continuationImpl;
            int i5 = m4Var.f7006e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                m4Var.f7006e = i5 - Integer.MIN_VALUE;
            } else {
                m4Var = new m4(f5Var, continuationImpl);
            }
        }
        Object obj = m4Var.f7004c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = m4Var.f7006e;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = f5Var.f3174t;
            m4Var.f7002a = f5Var;
            m4Var.f7003b = dVar;
            m4Var.f7006e = 1;
            if (dVar.e(m4Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = m4Var.f7003b;
            f5 f5Var2 = m4Var.f7002a;
            ResultKt.b(obj);
            dVar = dVar2;
            f5Var = f5Var2;
        }
        try {
            return new Integer(f5Var.B.size());
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object g(f5 f5Var, ContinuationImpl continuationImpl) {
        p4 p4Var;
        d dVar;
        if (continuationImpl instanceof p4) {
            p4Var = (p4) continuationImpl;
            int i5 = p4Var.f8088e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                p4Var.f8088e = i5 - Integer.MIN_VALUE;
            } else {
                p4Var = new p4(f5Var, continuationImpl);
            }
        }
        Object obj = p4Var.f8086c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = p4Var.f8088e;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = f5Var.f3174t;
            p4Var.f8084a = f5Var;
            p4Var.f8085b = dVar;
            p4Var.f8088e = 1;
            if (dVar.e(p4Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = p4Var.f8085b;
            f5 f5Var2 = p4Var.f8084a;
            ResultKt.b(obj);
            dVar = dVar2;
            f5Var = f5Var2;
        }
        try {
            if (!f5Var.I.isCompleted()) {
                return Unit.f71706a;
            }
            f5Var.I = m0.c();
            if (f5Var.f3166j && f5Var.f3175u == y3.f11935b) {
                f5Var.f3175u = y3.f11934a;
                f5Var.G = m0.c();
            }
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x006a, code lost:
    
        if (r7.g(r0) == r1) goto L27;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r7v14, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r7v15 */
    /* JADX WARN: Type inference failed for: r7v3 */
    /* JADX WARN: Type inference failed for: r7v6 */
    /* JADX WARN: Type inference failed for: r7v8 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object h(f5 f5Var, ContinuationImpl continuationImpl) throws Throwable {
        q4 q4Var;
        d dVar;
        ?? r72;
        if (continuationImpl instanceof q4) {
            q4Var = (q4) continuationImpl;
            int i5 = q4Var.f8490e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                q4Var.f8490e = i5 - Integer.MIN_VALUE;
            } else {
                q4Var = new q4(f5Var, continuationImpl);
            }
        }
        Object obj = q4Var.f8488c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = q4Var.f8490e;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                dVar = f5Var.f3174t;
                q4Var.f8486a = f5Var;
                q4Var.f8487b = dVar;
                q4Var.f8490e = 1;
                if (dVar.e(q4Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                r72 = (c80.a) q4Var.f8486a;
                try {
                    ResultKt.b(obj);
                    r72 = r72;
                    Unit unit = Unit.f71706a;
                    ((d) r72).g(null);
                    return unit;
                } catch (Throwable th2) {
                    dVar = r72;
                    th = th2;
                    dVar.g(null);
                    throw th;
                }
            }
            d dVar2 = q4Var.f8487b;
            f5 f5Var2 = (f5) q4Var.f8486a;
            ResultKt.b(obj);
            dVar = dVar2;
            f5Var = f5Var2;
            f5Var.I.j0();
            if (f5Var.f3169m) {
                q4Var.f8486a = dVar;
                q4Var.f8487b = null;
                q4Var.f8490e = 2;
            }
            r72 = dVar;
            Unit unit2 = Unit.f71706a;
            ((d) r72).g(null);
            return unit2;
        } catch (Throwable th3) {
            th = th3;
            dVar.g(null);
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object i(f5 f5Var, ContinuationImpl continuationImpl) {
        r4 r4Var;
        d dVar;
        if (continuationImpl instanceof r4) {
            r4Var = (r4) continuationImpl;
            int i5 = r4Var.f8925e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                r4Var.f8925e = i5 - Integer.MIN_VALUE;
            } else {
                r4Var = new r4(f5Var, continuationImpl);
            }
        }
        Object obj = r4Var.f8923c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = r4Var.f8925e;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = f5Var.f3174t;
            r4Var.f8921a = f5Var;
            r4Var.f8922b = dVar;
            r4Var.f8925e = 1;
            if (dVar.e(r4Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = r4Var.f8922b;
            f5 f5Var2 = r4Var.f8921a;
            ResultKt.b(obj);
            dVar = dVar2;
            f5Var = f5Var2;
        }
        try {
            f5Var.H.j0();
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object j(f5 f5Var, ContinuationImpl continuationImpl) {
        s4 s4Var;
        d dVar;
        if (continuationImpl instanceof s4) {
            s4Var = (s4) continuationImpl;
            int i5 = s4Var.f9412e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                s4Var.f9412e = i5 - Integer.MIN_VALUE;
            } else {
                s4Var = new s4(f5Var, continuationImpl);
            }
        }
        Object obj = s4Var.f9410c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = s4Var.f9412e;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = f5Var.f3174t;
            s4Var.f9408a = f5Var;
            s4Var.f9409b = dVar;
            s4Var.f9412e = 1;
            if (dVar.e(s4Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = s4Var.f9409b;
            f5 f5Var2 = s4Var.f9408a;
            ResultKt.b(obj);
            dVar = dVar2;
            f5Var = f5Var2;
        }
        try {
            if (!f5Var.H.isCompleted()) {
                return Unit.f71706a;
            }
            f5Var.H = m0.c();
            if (f5Var.f3166j && f5Var.f3175u == y3.f11935b) {
                f5Var.f3175u = y3.f11934a;
                f5Var.G = m0.c();
            }
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    public abstract Object c(Continuation continuation);

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:116:0x0201 A[Catch: all -> 0x01db, TRY_LEAVE, TryCatch #16 {all -> 0x01db, blocks: (B:94:0x01c8, B:96:0x01cf, B:98:0x01d3, B:100:0x01d7, B:103:0x01de, B:105:0x01e2, B:107:0x01e6, B:109:0x01ea, B:110:0x01eb, B:111:0x01f0, B:112:0x01f1, B:113:0x01f8, B:114:0x01f9, B:115:0x0200, B:116:0x0201), top: B:238:0x01c8 }] */
    /* JADX WARN: Removed duplicated region for block: B:129:0x0237 A[Catch: all -> 0x025a, TRY_ENTER, TRY_LEAVE, TryCatch #15 {all -> 0x025a, blocks: (B:126:0x0224, B:129:0x0237, B:132:0x0248, B:140:0x0265, B:143:0x0279, B:147:0x0287, B:148:0x028c, B:150:0x0290), top: B:236:0x0224 }] */
    /* JADX WARN: Removed duplicated region for block: B:142:0x0278  */
    /* JADX WARN: Removed duplicated region for block: B:145:0x0283 A[Catch: all -> 0x0257, TRY_ENTER, TRY_LEAVE, TryCatch #12 {all -> 0x0257, blocks: (B:127:0x0226, B:130:0x0239, B:134:0x0250, B:139:0x025f, B:145:0x0283, B:149:0x028e, B:151:0x0297), top: B:232:0x0226 }] */
    /* JADX WARN: Removed duplicated region for block: B:159:0x02b5  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x02bf A[Catch: all -> 0x02e4, TryCatch #2 {all -> 0x02e4, blocks: (B:160:0x02b7, B:162:0x02bf, B:164:0x02c3, B:166:0x02c7), top: B:214:0x02b7 }] */
    /* JADX WARN: Removed duplicated region for block: B:169:0x02da  */
    /* JADX WARN: Removed duplicated region for block: B:185:0x02fe A[Catch: all -> 0x030a, TryCatch #5 {all -> 0x030a, blocks: (B:183:0x02f7, B:185:0x02fe, B:187:0x0302, B:189:0x0306, B:192:0x030d, B:194:0x0311, B:196:0x0315, B:198:0x0319, B:199:0x031a, B:200:0x031f, B:201:0x0320, B:202:0x0327, B:203:0x0328, B:204:0x032f, B:205:0x0330), top: B:220:0x02f7 }] */
    /* JADX WARN: Removed duplicated region for block: B:205:0x0330 A[Catch: all -> 0x030a, TRY_LEAVE, TryCatch #5 {all -> 0x030a, blocks: (B:183:0x02f7, B:185:0x02fe, B:187:0x0302, B:189:0x0306, B:192:0x030d, B:194:0x0311, B:196:0x0315, B:198:0x0319, B:199:0x031a, B:200:0x031f, B:201:0x0320, B:202:0x0327, B:203:0x0328, B:204:0x032f, B:205:0x0330), top: B:220:0x02f7 }] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x010e A[Catch: all -> 0x012e, TryCatch #6 {all -> 0x012e, blocks: (B:47:0x00fb, B:49:0x010e, B:51:0x011f, B:53:0x0127, B:56:0x0133, B:57:0x0139, B:60:0x014d, B:62:0x0157, B:64:0x015b, B:65:0x0160), top: B:221:0x00fb }] */
    /* JADX WARN: Removed duplicated region for block: B:59:0x014c  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0157 A[Catch: all -> 0x012e, TryCatch #6 {all -> 0x012e, blocks: (B:47:0x00fb, B:49:0x010e, B:51:0x011f, B:53:0x0127, B:56:0x0133, B:57:0x0139, B:60:0x014d, B:62:0x0157, B:64:0x015b, B:65:0x0160), top: B:221:0x00fb }] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0188  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0192 A[Catch: all -> 0x01b8, TryCatch #13 {all -> 0x01b8, blocks: (B:72:0x018a, B:74:0x0192, B:76:0x0196, B:78:0x019a, B:90:0x01bf, B:91:0x01c5), top: B:225:0x002c }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x01ae  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01cf A[Catch: all -> 0x01db, TryCatch #16 {all -> 0x01db, blocks: (B:94:0x01c8, B:96:0x01cf, B:98:0x01d3, B:100:0x01d7, B:103:0x01de, B:105:0x01e2, B:107:0x01e6, B:109:0x01ea, B:110:0x01eb, B:111:0x01f0, B:112:0x01f1, B:113:0x01f8, B:114:0x01f9, B:115:0x0200, B:116:0x0201), top: B:238:0x01c8 }] */
    /* JADX WARN: Type inference failed for: r12v9, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r4v10, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r4v7 */
    /* JADX WARN: Type inference failed for: r4v8 */
    /* JADX WARN: Type inference failed for: r4v9 */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v2, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r5v21 */
    /* JADX WARN: Type inference failed for: r5v35 */
    /* JADX WARN: Type inference failed for: r6v1, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r6v13 */
    /* JADX WARN: Type inference failed for: r6v16 */
    /* JADX WARN: Type inference failed for: r6v19 */
    /* JADX WARN: Type inference failed for: r6v2 */
    /* JADX WARN: Type inference failed for: r6v20 */
    /* JADX WARN: Type inference failed for: r6v23 */
    /* JADX WARN: Type inference failed for: r6v24 */
    /* JADX WARN: Type inference failed for: r6v25, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r6v26 */
    /* JADX WARN: Type inference failed for: r6v27, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r6v28, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r6v29 */
    /* JADX WARN: Type inference failed for: r6v31 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(Continuation continuation) {
        u4 u4Var;
        ?? r52;
        ?? r62;
        th3 th3Var;
        th3 th3Var2;
        c80.a aVar;
        f5 f5Var;
        th3 th3Var3;
        f5 f5Var2;
        Closeable closeable;
        Closeable closeable2;
        c80.a aVar2;
        jr0 jr0Var;
        Boolean bool;
        kl2 kl2Var;
        Closeable closeable3;
        Closeable closeable4;
        Closeable closeable5;
        Closeable closeable6;
        jl2 jl2Var;
        b.ja jaVar;
        th3 th3Var4;
        ?? r63;
        th3 th3Var5;
        jr0 jr0Var2;
        Boolean bool2;
        kl2 kl2Var2;
        jl2 jl2Var2;
        b.ja jaVar2;
        ?? r42;
        th3 th3Var6;
        jn jnVar = jn.a$10;
        if (continuation instanceof u4) {
            u4Var = (u4) continuation;
            int i5 = u4Var.f10202g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                u4Var.f10202g = i5 - Integer.MIN_VALUE;
            } else {
                u4Var = new u4(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = u4Var.f10200e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        try {
            try {
                switch (u4Var.f10202g) {
                    case 0:
                        ResultKt.b(obj);
                        kz2 kz2Var = this.f3161e;
                        wv0 wv0Var = wv0.CUI_NAME_POLL_PRELOADED_AD;
                        EmptyList emptyList = EmptyList.f71733a;
                        mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                        if (ji3.b().f4777a == null) {
                            em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                            try {
                                d dVar = this.f3174t;
                                u4Var.f10196a = this;
                                u4Var.f10197b = em2VarA;
                                u4Var.f10198c = em2VarA;
                                u4Var.f10199d = dVar;
                                u4Var.f10202g = 1;
                                if (dVar.e(u4Var) != coroutineSingletons) {
                                    f5Var2 = this;
                                    closeable = em2VarA;
                                    closeable2 = closeable;
                                    aVar2 = dVar;
                                    try {
                                        jr0Var = f5Var2.f3163g;
                                        jr0Var.getClass();
                                        bool = Boolean.FALSE;
                                        if (((Boolean) jr0Var.a("gads:resetExponentialBackoffOnPollAd:enabled", bool, jnVar)).booleanValue()) {
                                            jr0 jr0Var3 = f5Var2.f3163g;
                                            jr0Var3.getClass();
                                            if (!((Boolean) jr0Var3.a("gads:resetExponentialBackoffOnSingleAd:enabled", bool, jnVar)).booleanValue() || f5Var2.B.size() == 1) {
                                                f5Var2.f3176v = 0;
                                                f5Var2.f3177w = f5Var2.n;
                                            }
                                        }
                                        kl2Var = (kl2) f5Var2.B.poll();
                                        ji3.a().e().C = a(f5Var2, kl2Var != null, null, 2);
                                        if (kl2Var == null) {
                                            t70.g2 g2Var = kl2Var.f5771c;
                                            if (g2Var != null) {
                                                g2Var.c(null);
                                                Unit unit = Unit.f71706a;
                                            }
                                            u4Var.f10196a = closeable2;
                                            u4Var.f10197b = closeable;
                                            u4Var.f10198c = aVar2;
                                            u4Var.f10199d = kl2Var;
                                            u4Var.f10202g = 2;
                                            if (f5Var2.a(true, (ContinuationImpl) u4Var) != coroutineSingletons) {
                                                closeable3 = closeable;
                                                closeable4 = closeable2;
                                                ji3.a().f9923a.f7227d.f9458b = kl2Var.f5769a.f5297a.f();
                                                ((d) aVar2).g(null);
                                                if (kl2Var != null && (jl2Var = kl2Var.f5769a) != null && (jaVar = jl2Var.f5297a) != null) {
                                                    u4Var.f10196a = closeable4;
                                                    u4Var.f10197b = closeable3;
                                                    u4Var.f10198c = kl2Var;
                                                    u4Var.f10199d = null;
                                                    u4Var.f10202g = 3;
                                                    if (jaVar.a(u4Var) != coroutineSingletons) {
                                                        closeable5 = closeable3;
                                                        closeable6 = closeable4;
                                                        Unit unit2 = Unit.f71706a;
                                                        closeable3 = closeable5;
                                                    }
                                                }
                                                CloseableKt.a(closeable3, null);
                                                return kl2Var;
                                            }
                                        } else {
                                            closeable3 = closeable;
                                            closeable4 = closeable2;
                                            ((d) aVar2).g(null);
                                            if (kl2Var != null) {
                                                u4Var.f10196a = closeable4;
                                                u4Var.f10197b = closeable3;
                                                u4Var.f10198c = kl2Var;
                                                u4Var.f10199d = null;
                                                u4Var.f10202g = 3;
                                                if (jaVar.a(u4Var) != coroutineSingletons) {
                                                }
                                            }
                                            CloseableKt.a(closeable3, null);
                                            return kl2Var;
                                        }
                                    } catch (Throwable th2) {
                                        th = th2;
                                        ((d) aVar2).g(null);
                                        throw th;
                                    }
                                }
                            } catch (Throwable th3) {
                                th = th3;
                                r62 = em2VarA;
                                r52 = em2VarA;
                                try {
                                    r52.b(th);
                                    if (!(th instanceof b.a4)) {
                                    }
                                } finally {
                                }
                            }
                        } else {
                            th3 th3VarA = ji3.a(wv0Var, emptyList, true);
                            try {
                                d dVar2 = this.f3174t;
                                u4Var.f10196a = this;
                                u4Var.f10197b = th3VarA;
                                u4Var.f10198c = th3VarA;
                                u4Var.f10199d = dVar2;
                                u4Var.f10202g = 4;
                                if (dVar2.e(u4Var) != coroutineSingletons) {
                                    aVar = dVar2;
                                    f5Var = this;
                                    th3Var3 = th3VarA;
                                    th3Var4 = th3VarA;
                                    try {
                                        jr0Var2 = f5Var.f3163g;
                                        try {
                                            jr0Var2.getClass();
                                            bool2 = Boolean.FALSE;
                                            if (((Boolean) jr0Var2.a("gads:resetExponentialBackoffOnPollAd:enabled", bool2, jnVar)).booleanValue()) {
                                                jr0 jr0Var4 = f5Var.f3163g;
                                                jr0Var4.getClass();
                                                if (!((Boolean) jr0Var4.a("gads:resetExponentialBackoffOnSingleAd:enabled", bool2, jnVar)).booleanValue() || f5Var.B.size() == 1) {
                                                    f5Var.f3176v = 0;
                                                    f5Var.f3177w = f5Var.n;
                                                }
                                            }
                                            kl2Var2 = (kl2) f5Var.B.poll();
                                            ji3.a().e().C = a(f5Var, kl2Var2 != null, null, 2);
                                            if (kl2Var2 == null) {
                                                t70.g2 g2Var2 = kl2Var2.f5771c;
                                                if (g2Var2 != null) {
                                                    g2Var2.c(null);
                                                    Unit unit3 = Unit.f71706a;
                                                }
                                                u4Var.f10196a = th3Var3;
                                                u4Var.f10197b = th3Var4;
                                                u4Var.f10198c = aVar;
                                                u4Var.f10199d = kl2Var2;
                                                u4Var.f10202g = 5;
                                                if (f5Var.a(true, (ContinuationImpl) u4Var) != coroutineSingletons) {
                                                    r63 = th3Var4;
                                                    th3Var5 = th3Var3;
                                                    ji3.a().f9923a.f7227d.f9458b = kl2Var2.f5769a.f5297a.f();
                                                    try {
                                                        ((d) aVar).g(null);
                                                        if (kl2Var2 != null && (jl2Var2 = kl2Var2.f5769a) != null && (jaVar2 = jl2Var2.f5297a) != null) {
                                                            u4Var.f10196a = th3Var5;
                                                            u4Var.f10197b = r63;
                                                            u4Var.f10198c = kl2Var2;
                                                            u4Var.f10199d = null;
                                                            u4Var.f10202g = 6;
                                                            if (jaVar2.a(u4Var) != coroutineSingletons) {
                                                                r42 = r63;
                                                                th3Var6 = th3Var5;
                                                                Unit unit4 = Unit.f71706a;
                                                                r63 = r42;
                                                            }
                                                        }
                                                        CloseableKt.a(r63, null);
                                                        return kl2Var2;
                                                    } catch (Throwable th4) {
                                                        th = th4;
                                                        th3Var2 = r63;
                                                        th3Var = th3Var5;
                                                        try {
                                                            th3Var.b(th);
                                                            if (!(th instanceof b.a4)) {
                                                                if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                                                    th3Var.a(th);
                                                                }
                                                                if (!(th instanceof TimeoutCancellationException)) {
                                                                    if (!(th instanceof CancellationException)) {
                                                                        if (th instanceof dv0) {
                                                                            throw th;
                                                                        }
                                                                        throw new iu0(th);
                                                                    }
                                                                    throw new du0(th);
                                                                }
                                                                throw new lw0(th);
                                                            }
                                                            throw th;
                                                        } finally {
                                                            try {
                                                                throw th;
                                                            } finally {
                                                            }
                                                        }
                                                    }
                                                }
                                            } else {
                                                r63 = th3Var4;
                                                th3Var5 = th3Var3;
                                                ((d) aVar).g(null);
                                                if (kl2Var2 != null) {
                                                    u4Var.f10196a = th3Var5;
                                                    u4Var.f10197b = r63;
                                                    u4Var.f10198c = kl2Var2;
                                                    u4Var.f10199d = null;
                                                    u4Var.f10202g = 6;
                                                    if (jaVar2.a(u4Var) != coroutineSingletons) {
                                                    }
                                                }
                                                CloseableKt.a(r63, null);
                                                return kl2Var2;
                                            }
                                        } catch (Throwable th5) {
                                            th = th5;
                                            ((d) aVar).g(null);
                                            throw th;
                                        }
                                    } catch (Throwable th6) {
                                        th = th6;
                                        r63 = th3Var4;
                                        th3Var5 = th3Var3;
                                        ((d) aVar).g(null);
                                        throw th;
                                    }
                                }
                            } catch (Throwable th7) {
                                th = th7;
                                th3Var = th3VarA;
                                th3Var2 = th3VarA;
                                th3Var.b(th);
                                if (!(th instanceof b.a4)) {
                                }
                            }
                        }
                        return coroutineSingletons;
                    case 1:
                        aVar2 = (c80.a) u4Var.f10199d;
                        closeable = (Closeable) u4Var.f10198c;
                        closeable2 = (th3) u4Var.f10197b;
                        f5Var2 = (f5) u4Var.f10196a;
                        try {
                            ResultKt.b(obj);
                            jr0Var = f5Var2.f3163g;
                            jr0Var.getClass();
                            bool = Boolean.FALSE;
                            if (((Boolean) jr0Var.a("gads:resetExponentialBackoffOnPollAd:enabled", bool, jnVar)).booleanValue()) {
                            }
                            kl2Var = (kl2) f5Var2.B.poll();
                            ji3.a().e().C = a(f5Var2, kl2Var != null, null, 2);
                            if (kl2Var == null) {
                            }
                        } catch (Throwable th8) {
                            th = th8;
                            closeable5 = closeable;
                            closeable6 = closeable2;
                            r52 = closeable6;
                            r62 = closeable5;
                            r52.b(th);
                            if (!(th instanceof b.a4)) {
                            }
                        }
                        break;
                    case 2:
                        kl2Var = (kl2) u4Var.f10199d;
                        aVar2 = (c80.a) u4Var.f10198c;
                        closeable3 = u4Var.f10197b;
                        closeable4 = (th3) u4Var.f10196a;
                        try {
                            ResultKt.b(obj);
                            ji3.a().f9923a.f7227d.f9458b = kl2Var.f5769a.f5297a.f();
                            ((d) aVar2).g(null);
                            if (kl2Var != null) {
                            }
                            CloseableKt.a(closeable3, null);
                            return kl2Var;
                        } catch (Throwable th9) {
                            th = th9;
                            ((d) aVar2).g(null);
                            throw th;
                        }
                    case 3:
                        kl2Var = (kl2) u4Var.f10198c;
                        closeable5 = u4Var.f10197b;
                        closeable6 = (th3) u4Var.f10196a;
                        try {
                            ResultKt.b(obj);
                            Unit unit22 = Unit.f71706a;
                            closeable3 = closeable5;
                            CloseableKt.a(closeable3, null);
                            return kl2Var;
                        } catch (Throwable th10) {
                            th = th10;
                            r52 = closeable6;
                            r62 = closeable5;
                            r52.b(th);
                            if (!(th instanceof b.a4)) {
                                if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                    r52.a(th);
                                }
                                if (!(th instanceof TimeoutCancellationException)) {
                                    if (!(th instanceof CancellationException)) {
                                        if (th instanceof dv0) {
                                            throw th;
                                        }
                                        throw new iu0(th);
                                    }
                                    throw new du0(th);
                                }
                                throw new lw0(th);
                            }
                            throw th;
                        }
                    case 4:
                        aVar = (c80.a) u4Var.f10199d;
                        ?? r12 = (Closeable) u4Var.f10198c;
                        th3Var3 = (th3) u4Var.f10197b;
                        f5Var = (f5) u4Var.f10196a;
                        ResultKt.b(obj);
                        th3Var4 = r12;
                        jr0Var2 = f5Var.f3163g;
                        jr0Var2.getClass();
                        bool2 = Boolean.FALSE;
                        if (((Boolean) jr0Var2.a("gads:resetExponentialBackoffOnPollAd:enabled", bool2, jnVar)).booleanValue()) {
                        }
                        kl2Var2 = (kl2) f5Var.B.poll();
                        ji3.a().e().C = a(f5Var, kl2Var2 != null, null, 2);
                        if (kl2Var2 == null) {
                        }
                        break;
                    case 5:
                        kl2Var2 = (kl2) u4Var.f10199d;
                        aVar = (c80.a) u4Var.f10198c;
                        r63 = u4Var.f10197b;
                        th3Var5 = (th3) u4Var.f10196a;
                        try {
                            ResultKt.b(obj);
                            ji3.a().f9923a.f7227d.f9458b = kl2Var2.f5769a.f5297a.f();
                            ((d) aVar).g(null);
                            if (kl2Var2 != null) {
                            }
                            CloseableKt.a(r63, null);
                            return kl2Var2;
                        } catch (Throwable th11) {
                            th = th11;
                            ((d) aVar).g(null);
                            throw th;
                        }
                    case 6:
                        kl2Var2 = (kl2) u4Var.f10198c;
                        r42 = u4Var.f10197b;
                        th3Var6 = (th3) u4Var.f10196a;
                        try {
                            ResultKt.b(obj);
                            Unit unit42 = Unit.f71706a;
                            r63 = r42;
                            CloseableKt.a(r63, null);
                            return kl2Var2;
                        } catch (Throwable th12) {
                            th = th12;
                            th3Var = th3Var6;
                            th3Var2 = r42;
                            th3Var.b(th);
                            if (!(th instanceof b.a4)) {
                            }
                        }
                        break;
                    default:
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
            } catch (Throwable th13) {
                th = th13;
            }
        } catch (Throwable th14) {
            th = th14;
            r52 = "gads:resetExponentialBackoffOnPollAd:enabled";
            r62 = "gads:resetExponentialBackoffOnSingleAd:enabled";
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:96:0x01bc, code lost:
    
        if (r14.a(0, false) == r3) goto L97;
     */
    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:107:0x01d2 A[Catch: all -> 0x01de, TryCatch #9 {all -> 0x01de, blocks: (B:105:0x01cb, B:107:0x01d2, B:109:0x01d6, B:111:0x01da, B:114:0x01e1, B:116:0x01e5, B:118:0x01e9, B:120:0x01ed, B:121:0x01ee, B:122:0x01f3, B:123:0x01f4, B:124:0x01fb, B:125:0x01fc, B:126:0x0203, B:127:0x0204), top: B:147:0x01cb }] */
    /* JADX WARN: Removed duplicated region for block: B:127:0x0204 A[Catch: all -> 0x01de, TRY_LEAVE, TryCatch #9 {all -> 0x01de, blocks: (B:105:0x01cb, B:107:0x01d2, B:109:0x01d6, B:111:0x01da, B:114:0x01e1, B:116:0x01e5, B:118:0x01e9, B:120:0x01ed, B:121:0x01ee, B:122:0x01f3, B:123:0x01f4, B:124:0x01fb, B:125:0x01fc, B:126:0x0203, B:127:0x0204), top: B:147:0x01cb }] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00be  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00c0 A[Catch: all -> 0x00cb, TryCatch #7 {all -> 0x00cb, blocks: (B:33:0x00a7, B:36:0x00c0, B:38:0x00c4, B:41:0x00cd), top: B:144:0x00a7, outer: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0102 A[Catch: all -> 0x010e, TryCatch #8 {all -> 0x010e, blocks: (B:48:0x00fb, B:50:0x0102, B:52:0x0106, B:54:0x010a, B:57:0x0111, B:59:0x0115, B:61:0x0119, B:63:0x011d, B:64:0x011e, B:65:0x0123, B:66:0x0124, B:67:0x012b, B:68:0x012c, B:69:0x0133, B:70:0x0134), top: B:146:0x00fb }] */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0134 A[Catch: all -> 0x010e, TRY_LEAVE, TryCatch #8 {all -> 0x010e, blocks: (B:48:0x00fb, B:50:0x0102, B:52:0x0106, B:54:0x010a, B:57:0x0111, B:59:0x0115, B:61:0x0119, B:63:0x011d, B:64:0x011e, B:65:0x0123, B:66:0x0124, B:67:0x012b, B:68:0x012c, B:69:0x0133, B:70:0x0134), top: B:146:0x00fb }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x016c  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x016e A[Catch: all -> 0x0179, TryCatch #6 {all -> 0x0179, blocks: (B:80:0x0155, B:83:0x016e, B:85:0x0172, B:88:0x017b), top: B:142:0x0155, outer: #1 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object h(Continuation continuation) {
        a5 a5Var;
        th3 th3VarA;
        th3 th3Var;
        d dVar;
        f5 f5Var;
        th3 th3VarA2;
        th3 th3Var2;
        d dVar2;
        Boolean boolValueOf;
        boolean z11;
        if (continuation instanceof a5) {
            a5Var = (a5) continuation;
            int i5 = a5Var.f850h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a5Var.f850h = i5 - Integer.MIN_VALUE;
            } else {
                a5Var = new a5(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = a5Var.f848f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = a5Var.f850h;
        boolean z12 = true;
        Continuation continuation2 = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            kz2 kz2Var = this.f3161e;
            wv0 wv0Var = wv0.CUI_NAME_START_PRELOAD;
            EmptyList emptyList = EmptyList.f71733a;
            mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
            if (ji3.b().f4777a == null) {
                th3VarA2 = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    dVar2 = this.f3174t;
                    a5Var.f843a = this;
                    a5Var.f844b = th3VarA2;
                    a5Var.f845c = th3VarA2;
                    a5Var.f846d = dVar2;
                    a5Var.f850h = 1;
                    if (dVar2.e(a5Var) != coroutineSingletons) {
                        f5Var = this;
                        th3Var2 = th3VarA2;
                        ji3.a().e().C = a(f5Var, false, null, 3);
                        if (f5Var.f3179y.b()) {
                        }
                        dVar.g(null);
                        boolValueOf = Boolean.valueOf(z12);
                        CloseableKt.a(th3VarA2, null);
                    }
                } catch (Throwable th2) {
                    th = th2;
                    th3Var2 = th3VarA2;
                    th3Var2.b(th);
                    if (th instanceof b.a4) {
                    }
                }
            } else {
                th3VarA = ji3.a(wv0Var, emptyList, true);
                try {
                    dVar = this.f3174t;
                    a5Var.f843a = this;
                    a5Var.f844b = th3VarA;
                    a5Var.f845c = th3VarA;
                    a5Var.f846d = dVar;
                    a5Var.f850h = 2;
                    if (dVar.e(a5Var) != coroutineSingletons) {
                        f5Var = this;
                        th3Var = th3VarA;
                        ji3.a().e().C = a(f5Var, false, null, 3);
                        if (f5Var.f3179y.b()) {
                        }
                        dVar.g(null);
                        boolValueOf = Boolean.valueOf(z12);
                        CloseableKt.a(th3VarA, null);
                    }
                } catch (Throwable th3) {
                    th = th3;
                    th3Var = th3VarA;
                    th3Var.b(th);
                    if (th instanceof b.a4) {
                    }
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            dVar2 = a5Var.f846d;
            th3VarA2 = a5Var.f845c;
            th3Var2 = a5Var.f844b;
            f5Var = a5Var.f843a;
            try {
                ResultKt.b(obj);
                try {
                    ji3.a().e().C = a(f5Var, false, null, 3);
                    if (f5Var.f3179y.b()) {
                        if (f5Var.f3166j) {
                            f5Var.G = m0.c();
                        }
                        t70.j0 j0Var = f5Var.f3158a;
                        b5 b5Var = new b5(f5Var, continuation2, 0);
                        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                        Intrinsics.g(j0Var, "<this>");
                        Intrinsics.g(context, "context");
                        f5Var.f3179y = m0.t(j0Var, context, null, new ar.a(b5Var, null), 2);
                    } else {
                        z12 = false;
                    }
                    dVar.g(null);
                    boolValueOf = Boolean.valueOf(z12);
                    CloseableKt.a(th3VarA2, null);
                } catch (Throwable th4) {
                    throw th4;
                }
            } catch (Throwable th5) {
                th = th5;
                try {
                    th3Var2.b(th);
                    if (th instanceof b.a4) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            th3Var2.a(th);
                        }
                        if (!(th instanceof TimeoutCancellationException)) {
                            if (!(th instanceof CancellationException)) {
                                if (th instanceof dv0) {
                                    throw th;
                                }
                                throw new iu0(th);
                            }
                            throw new du0(th);
                        }
                        throw new lw0(th);
                    }
                    throw th;
                } finally {
                }
            }
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                z11 = a5Var.f847e;
                ResultKt.b(obj);
                return Boolean.valueOf(z11);
            }
            dVar = a5Var.f846d;
            th3VarA = a5Var.f845c;
            th3Var = a5Var.f844b;
            f5Var = a5Var.f843a;
            try {
                ResultKt.b(obj);
                try {
                    ji3.a().e().C = a(f5Var, false, null, 3);
                    if (f5Var.f3179y.b()) {
                        if (f5Var.f3166j) {
                            f5Var.G = m0.c();
                        }
                        t70.j0 j0Var2 = f5Var.f3158a;
                        b5 b5Var2 = new b5(f5Var, continuation2, 0);
                        EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
                        Intrinsics.g(j0Var2, "<this>");
                        Intrinsics.g(context2, "context");
                        f5Var.f3179y = m0.t(j0Var2, context2, null, new ar.a(b5Var2, null), 2);
                    } else {
                        z12 = false;
                    }
                    dVar.g(null);
                    boolValueOf = Boolean.valueOf(z12);
                    CloseableKt.a(th3VarA, null);
                } finally {
                    dVar.g(null);
                }
            } catch (Throwable th6) {
                th = th6;
                try {
                    th3Var.b(th);
                    if (th instanceof b.a4) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            th3Var.a(th);
                        }
                        if (!(th instanceof TimeoutCancellationException)) {
                            if (!(th instanceof CancellationException)) {
                                if (th instanceof dv0) {
                                    throw th;
                                }
                                throw new iu0(th);
                            }
                            throw new du0(th);
                        }
                        throw new lw0(th);
                    }
                    throw th;
                } finally {
                    try {
                        throw th;
                    } finally {
                    }
                }
            }
        }
        boolean zBooleanValue = boolValueOf.booleanValue();
        if (zBooleanValue && f5Var.f3166j) {
            a5Var.f843a = null;
            a5Var.f844b = null;
            a5Var.f845c = null;
            a5Var.f846d = null;
            a5Var.f847e = zBooleanValue;
            a5Var.f850h = 3;
        }
        z11 = zBooleanValue;
        return Boolean.valueOf(z11);
    }

    @Override // b.x
    public final Object c(long j11, i iVar) {
        return j(this, iVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(Continuation continuation) {
        w4 w4Var;
        long jH;
        Iterator it;
        f5 f5Var;
        if (continuation instanceof w4) {
            w4Var = (w4) continuation;
            int i5 = w4Var.f11027f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                w4Var.f11027f = i5 - Integer.MIN_VALUE;
            } else {
                w4Var = new w4(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = w4Var.f11025d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = w4Var.f11027f;
        if (i11 == 0) {
            ResultKt.b(obj);
            Duration.Companion companion = Duration.f72038b;
            this.f3162f.getClass();
            jH = DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d);
            it = this.B.iterator();
            f5Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            jH = w4Var.f11024c;
            it = w4Var.f11023b;
            f5 f5Var2 = w4Var.f11022a;
            ResultKt.b(obj);
            f5Var = f5Var2;
        }
        while (it.hasNext()) {
            kl2 kl2Var = (kl2) it.next();
            long jL = Duration.l(Duration.m(kl2Var.f5770b, f5Var.f3168l), jH);
            Duration.f72038b.getClass();
            if (Duration.c(jL, 0L) <= 0) {
                w4Var.f11022a = f5Var;
                w4Var.f11023b = it;
                w4Var.f11024c = jH;
                w4Var.f11027f = 1;
                if (f5Var.a(it, kl2Var, w4Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                t70.g2 g2Var = kl2Var.f5771c;
                Continuation continuation2 = null;
                if (g2Var != null) {
                    g2Var.c(null);
                }
                t70.j0 j0Var = f5Var.f3158a;
                b4.j jVar = new b4.j(jL, f5Var, continuation2, 3);
                EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                Intrinsics.g(j0Var, "<this>");
                Intrinsics.g(context, "context");
                kl2Var.f5771c = m0.t(j0Var, context, null, new ar.a(jVar, null), 2);
            }
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:51:0x00b6, code lost:
    
        if (r7.K(r0) == r1) goto L52;
     */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0063 A[Catch: all -> 0x0066, TryCatch #0 {all -> 0x0066, blocks: (B:23:0x0059, B:25:0x0063, B:28:0x0068, B:31:0x006f, B:33:0x0077, B:34:0x007a, B:36:0x0082, B:37:0x0085, B:39:0x008d, B:40:0x0090, B:42:0x0098, B:43:0x009b, B:45:0x00a3), top: B:57:0x0059 }] */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0068 A[Catch: all -> 0x0066, TryCatch #0 {all -> 0x0066, blocks: (B:23:0x0059, B:25:0x0063, B:28:0x0068, B:31:0x006f, B:33:0x0077, B:34:0x007a, B:36:0x0082, B:37:0x0085, B:39:0x008d, B:40:0x0090, B:42:0x0098, B:43:0x009b, B:45:0x00a3), top: B:57:0x0059 }] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:51:0x00b6 -> B:13:0x002d). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object j(Continuation continuation) {
        e5 e5Var;
        f5 f5Var;
        d dVar;
        f5 f5Var2;
        s1 s1Var;
        s1 s1Var2;
        d dVar2;
        if (continuation instanceof e5) {
            e5Var = (e5) continuation;
            int i5 = e5Var.f2743e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                e5Var.f2743e = i5 - Integer.MIN_VALUE;
            } else {
                e5Var = new e5(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = e5Var.f2741c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = e5Var.f2743e;
        if (i11 == 0) {
            ResultKt.b(obj);
            f5Var = this;
            dVar2 = f5Var.f3174t;
            e5Var.f2739a = f5Var;
            e5Var.f2740b = dVar2;
            e5Var.f2743e = 1;
            if (dVar2.e(e5Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            f5Var2 = e5Var.f2739a;
            ResultKt.b(obj);
            f5Var = f5Var2;
            dVar2 = f5Var.f3174t;
            e5Var.f2739a = f5Var;
            e5Var.f2740b = dVar2;
            e5Var.f2743e = 1;
            if (dVar2.e(e5Var) != coroutineSingletons) {
                try {
                    f5Var2 = f5Var;
                    dVar = dVar2;
                    s1Var = f5Var2.C;
                    s1Var2 = f5Var2.D;
                    if (!s1Var.isCompleted()) {
                        s1Var2 = f5Var2.C;
                    } else if (s1Var2.isCompleted()) {
                        if (!f5Var2.E.isCompleted()) {
                            s1Var2 = f5Var2.E;
                        } else if (!f5Var2.H.isCompleted()) {
                            s1Var2 = f5Var2.H;
                        } else if (!f5Var2.I.isCompleted()) {
                            s1Var2 = f5Var2.I;
                        } else if (!f5Var2.F.isCompleted()) {
                            s1Var2 = f5Var2.F;
                        } else {
                            s1Var2 = !f5Var2.G.isCompleted() ? f5Var2.G : null;
                        }
                    }
                    if (s1Var2 == null) {
                        e5Var.f2739a = f5Var2;
                        e5Var.f2740b = null;
                        e5Var.f2743e = 2;
                    } else {
                        return Unit.f71706a;
                    }
                } finally {
                    dVar.g(null);
                }
            }
            return coroutineSingletons;
        }
        d dVar3 = e5Var.f2740b;
        f5 f5Var3 = e5Var.f2739a;
        ResultKt.b(obj);
        dVar = dVar3;
        f5Var2 = f5Var3;
        s1Var = f5Var2.C;
        s1Var2 = f5Var2.D;
        if (!s1Var.isCompleted()) {
        }
        if (s1Var2 == null) {
        }
    }

    @Override // b.db
    public final Object d(long j11, SuspendLambda suspendLambda) {
        return g(this, suspendLambda);
    }

    public static ri2 a(f5 f5Var, boolean z11, String value, int i5) {
        if ((i5 & 1) != 0) {
            z11 = false;
        }
        if ((i5 & 2) != 0) {
            value = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        f5Var.getClass();
        b.i9 i9VarO = ri2.o();
        Intrinsics.f(i9VarO, "newBuilder(...)");
        String value2 = f5Var.f3159b;
        Intrinsics.g(value2, "value");
        i9VarO.b();
        ((ri2) i9VarO.f1095b).c(value2);
        i9VarO.c(f5Var.o);
        i9VarO.e(f5Var.B.size());
        i9VarO.d(z11);
        Intrinsics.g(value, "value");
        i9VarO.b();
        ((ri2) i9VarO.f1095b).b(value);
        i9VarO.f(f5Var.f3175u == y3.f11936c);
        return (ri2) i9VarO.a();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:103:0x017b A[Catch: all -> 0x0155, TRY_LEAVE, TryCatch #1 {all -> 0x0155, blocks: (B:81:0x0142, B:83:0x0149, B:85:0x014d, B:87:0x0151, B:90:0x0158, B:92:0x015c, B:94:0x0160, B:96:0x0164, B:97:0x0165, B:98:0x016a, B:99:0x016b, B:100:0x0172, B:101:0x0173, B:102:0x017a, B:103:0x017b), top: B:110:0x0142 }] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00c3 A[Catch: all -> 0x00cf, TryCatch #7 {all -> 0x00cf, blocks: (B:39:0x00bc, B:41:0x00c3, B:43:0x00c7, B:45:0x00cb, B:48:0x00d2, B:50:0x00d6, B:52:0x00da, B:54:0x00de, B:55:0x00df, B:56:0x00e4, B:57:0x00e5, B:58:0x00ec, B:59:0x00ed, B:60:0x00f4, B:61:0x00f5), top: B:121:0x00bc }] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00f5 A[Catch: all -> 0x00cf, TRY_LEAVE, TryCatch #7 {all -> 0x00cf, blocks: (B:39:0x00bc, B:41:0x00c3, B:43:0x00c7, B:45:0x00cb, B:48:0x00d2, B:50:0x00d6, B:52:0x00da, B:54:0x00de, B:55:0x00df, B:56:0x00e4, B:57:0x00e5, B:58:0x00ec, B:59:0x00ed, B:60:0x00f4, B:61:0x00f5), top: B:121:0x00bc }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0149 A[Catch: all -> 0x0155, TryCatch #1 {all -> 0x0155, blocks: (B:81:0x0142, B:83:0x0149, B:85:0x014d, B:87:0x0151, B:90:0x0158, B:92:0x015c, B:94:0x0160, B:96:0x0164, B:97:0x0165, B:98:0x016a, B:99:0x016b, B:100:0x0172, B:101:0x0173, B:102:0x017a, B:103:0x017b), top: B:110:0x0142 }] */
    /* JADX WARN: Type inference failed for: r16v0, types: [ads_mobile_sdk.f5] */
    /* JADX WARN: Type inference failed for: r3v15, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r3v19 */
    /* JADX WARN: Type inference failed for: r3v20 */
    /* JADX WARN: Type inference failed for: r3v8 */
    /* JADX WARN: Type inference failed for: r3v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Iterator it, kl2 kl2Var, ContinuationImpl continuationImpl) {
        c4 c4Var;
        th3 th3VarA;
        th3 th3Var;
        th3 th3Var2;
        em2 em2VarA;
        th3 th3Var3;
        ?? r32;
        if (continuationImpl instanceof c4) {
            c4Var = (c4) continuationImpl;
            int i5 = c4Var.f1656e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c4Var.f1656e = i5 - Integer.MIN_VALUE;
            } else {
                c4Var = new c4(this, continuationImpl);
            }
        }
        Object obj = c4Var.f1654c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c4Var.f1656e;
        if (i11 == 0) {
            ResultKt.b(obj);
            kz2 kz2Var = this.f3161e;
            wv0 wv0Var = wv0.CUI_NAME_EVICT_AD;
            EmptyList emptyList = EmptyList.f71733a;
            mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
            if (ji3.b().f4777a == null) {
                em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    ji3.a().e().C = a(this, false, kl2Var.f5769a.f5297a.f(), 1);
                    it.remove();
                    t70.g2 g2Var = kl2Var.f5771c;
                    if (g2Var != null) {
                        g2Var.c(null);
                    }
                    kl2Var.f5769a.f5297a.destroy();
                    c4Var.f1652a = em2VarA;
                    c4Var.f1653b = em2VarA;
                    c4Var.f1656e = 1;
                    if (a(false, c4Var) != coroutineSingletons) {
                        em2 em2Var = em2VarA;
                        th3Var3 = em2Var;
                        r32 = em2Var;
                        Unit unit = Unit.f71706a;
                        CloseableKt.a(th3Var3, null);
                    }
                } catch (Throwable th2) {
                    th = th2;
                    th3Var3 = em2VarA;
                    em2VarA.b(th);
                    if (th instanceof b.a4) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            em2VarA.a(th);
                        }
                        if (!(th instanceof TimeoutCancellationException)) {
                            if (!(th instanceof CancellationException)) {
                                if (th instanceof dv0) {
                                    throw th;
                                }
                                throw new iu0(th);
                            }
                            throw new du0(th);
                        }
                        throw new lw0(th);
                    }
                    throw th;
                }
            } else {
                th3VarA = ji3.a(wv0Var, emptyList, true);
                try {
                    ji3.a().e().C = a(this, false, kl2Var.f5769a.f5297a.f(), 1);
                    it.remove();
                    t70.g2 g2Var2 = kl2Var.f5771c;
                    if (g2Var2 != null) {
                        g2Var2.c(null);
                    }
                    kl2Var.f5769a.f5297a.destroy();
                    c4Var.f1652a = th3VarA;
                    c4Var.f1653b = th3VarA;
                    c4Var.f1656e = 2;
                    if (a(false, c4Var) != coroutineSingletons) {
                        th3Var2 = th3VarA;
                        th3Var = th3Var2;
                        Unit unit2 = Unit.f71706a;
                        CloseableKt.a(th3Var, null);
                    }
                } catch (Throwable th3) {
                    th = th3;
                    th3Var = th3VarA;
                    th3VarA.b(th);
                    if (th instanceof b.a4) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            th3VarA.a(th);
                        }
                        if (!(th instanceof TimeoutCancellationException)) {
                            if (!(th instanceof CancellationException)) {
                                if (th instanceof dv0) {
                                    throw th;
                                }
                                throw new iu0(th);
                            }
                            throw new du0(th);
                        }
                        throw new lw0(th);
                    }
                    throw th;
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            th3Var3 = c4Var.f1653b;
            r32 = c4Var.f1652a;
            try {
                ResultKt.b(obj);
                r32 = r32;
                Unit unit3 = Unit.f71706a;
                CloseableKt.a(th3Var3, null);
            } catch (Throwable th4) {
                th = th4;
                em2VarA = r32;
                try {
                    em2VarA.b(th);
                    if (th instanceof b.a4) {
                    }
                } finally {
                }
            }
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            th3Var = c4Var.f1653b;
            th3Var2 = c4Var.f1652a;
            try {
                ResultKt.b(obj);
                Unit unit22 = Unit.f71706a;
                CloseableKt.a(th3Var, null);
            } catch (Throwable th5) {
                th = th5;
                th3VarA = th3Var2;
                try {
                    th3VarA.b(th);
                    if (th instanceof b.a4) {
                    }
                } finally {
                    try {
                        throw th;
                    } finally {
                    }
                }
            }
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:112:0x018b, code lost:
    
        if (r15 == r1) goto L113;
     */
    /* JADX WARN: Removed duplicated region for block: B:105:0x0175 A[Catch: all -> 0x0150, TRY_LEAVE, TryCatch #0 {all -> 0x0150, blocks: (B:83:0x013d, B:85:0x0144, B:87:0x0148, B:89:0x014c, B:92:0x0152, B:94:0x0156, B:96:0x015a, B:98:0x015e, B:99:0x015f, B:100:0x0164, B:101:0x0165, B:102:0x016c, B:103:0x016d, B:104:0x0174, B:105:0x0175), top: B:120:0x013d }] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00d2 A[Catch: all -> 0x00de, TryCatch #9 {all -> 0x00de, blocks: (B:43:0x00cb, B:45:0x00d2, B:47:0x00d6, B:49:0x00da, B:52:0x00e0, B:54:0x00e4, B:56:0x00e8, B:58:0x00ec, B:59:0x00ed, B:60:0x00f2, B:61:0x00f3, B:62:0x00fa, B:63:0x00fb, B:64:0x0102, B:65:0x0103), top: B:135:0x00cb }] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0103 A[Catch: all -> 0x00de, TRY_LEAVE, TryCatch #9 {all -> 0x00de, blocks: (B:43:0x00cb, B:45:0x00d2, B:47:0x00d6, B:49:0x00da, B:52:0x00e0, B:54:0x00e4, B:56:0x00e8, B:58:0x00ec, B:59:0x00ed, B:60:0x00f2, B:61:0x00f3, B:62:0x00fa, B:63:0x00fb, B:64:0x0102, B:65:0x0103), top: B:135:0x00cb }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0144 A[Catch: all -> 0x0150, TryCatch #0 {all -> 0x0150, blocks: (B:83:0x013d, B:85:0x0144, B:87:0x0148, B:89:0x014c, B:92:0x0152, B:94:0x0156, B:96:0x015a, B:98:0x015e, B:99:0x015f, B:100:0x0164, B:101:0x0165, B:102:0x016c, B:103:0x016d, B:104:0x0174, B:105:0x0175), top: B:120:0x013d }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(Continuation continuation) {
        k4 k4Var;
        f5 f5Var;
        th3 th3Var;
        th3 th3Var2;
        TimeoutCancellationException th2;
        d dVar;
        th3 th3VarA;
        th3 th3Var3;
        d dVar2;
        if (continuation instanceof k4) {
            k4Var = (k4) continuation;
            int i5 = k4Var.f5497g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                k4Var.f5497g = i5 - Integer.MIN_VALUE;
            } else {
                k4Var = new k4(this, (ContinuationImpl) continuation);
            }
        }
        Object objF = k4Var.f5495e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = k4Var.f5497g;
        if (i11 == 0) {
            ResultKt.b(objF);
            jr0 jr0Var = this.f3163g;
            jr0Var.getClass();
            if (((Boolean) jr0Var.a("gads:resetExponentialBackoffOnAdAvailable:enabled", Boolean.FALSE, jn.a$10)).booleanValue()) {
                kz2 kz2Var = this.f3161e;
                wv0 wv0Var = wv0.CUI_NAME_RESET_PRELOAD_BACKOFF;
                EmptyList emptyList = EmptyList.f71733a;
                mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                if (ji3.b().f4777a == null) {
                    th3VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                    try {
                        dVar2 = this.f3174t;
                        k4Var.f5491a = this;
                        k4Var.f5492b = th3VarA;
                        k4Var.f5493c = th3VarA;
                        k4Var.f5494d = dVar2;
                        k4Var.f5497g = 1;
                        if (dVar2.e(k4Var) != coroutineSingletons) {
                            f5Var = this;
                            th3Var3 = th3VarA;
                            f5Var.f3176v = 0;
                            f5Var.f3177w = f5Var.n;
                            Unit unit = Unit.f71706a;
                            CloseableKt.a(th3VarA, null);
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        th3Var3 = th3VarA;
                        th3Var3.b(th);
                        if (th instanceof b.a4) {
                        }
                    }
                } else {
                    th3 th3VarA2 = ji3.a(wv0Var, emptyList, true);
                    try {
                        dVar = this.f3174t;
                        k4Var.f5491a = this;
                        k4Var.f5492b = th3VarA2;
                        k4Var.f5493c = th3VarA2;
                        k4Var.f5494d = dVar;
                        k4Var.f5497g = 2;
                        if (dVar.e(k4Var) != coroutineSingletons) {
                            f5Var = this;
                            th3Var = th3VarA2;
                            th3Var2 = th3Var;
                            f5Var.f3176v = 0;
                            f5Var.f3177w = f5Var.n;
                            Unit unit2 = Unit.f71706a;
                            CloseableKt.a(th3Var, null);
                        }
                    } catch (Throwable th4) {
                        th3Var = th3VarA2;
                        th3Var2 = th3Var;
                        th2 = th4;
                        th3Var2.b(th2);
                        if (th2 instanceof b.a4) {
                        }
                    }
                }
                return coroutineSingletons;
            }
            f5Var = this;
        } else if (i11 == 1) {
            dVar2 = k4Var.f5494d;
            th3VarA = k4Var.f5493c;
            th3Var3 = k4Var.f5492b;
            f5Var = k4Var.f5491a;
            try {
                ResultKt.b(objF);
                try {
                    f5Var.f3176v = 0;
                    f5Var.f3177w = f5Var.n;
                    Unit unit3 = Unit.f71706a;
                    CloseableKt.a(th3VarA, null);
                } finally {
                }
            } catch (Throwable th5) {
                th = th5;
                try {
                    th3Var3.b(th);
                    if (th instanceof b.a4) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            th3Var3.a(th);
                        }
                        if (!(th instanceof TimeoutCancellationException)) {
                            if (!(th instanceof CancellationException)) {
                                if (th instanceof dv0) {
                                    throw th;
                                }
                                throw new iu0(th);
                            }
                            throw new du0(th);
                        }
                        throw new lw0(th);
                    }
                    throw th;
                } finally {
                }
            }
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objF);
                return Boolean.valueOf(((Number) objF).intValue() > 0);
            }
            dVar = k4Var.f5494d;
            th3Var = k4Var.f5493c;
            th3Var2 = k4Var.f5492b;
            f5Var = k4Var.f5491a;
            try {
                ResultKt.b(objF);
                try {
                    f5Var.f3176v = 0;
                    f5Var.f3177w = f5Var.n;
                    Unit unit22 = Unit.f71706a;
                    CloseableKt.a(th3Var, null);
                } finally {
                }
            } catch (Throwable th6) {
                th2 = th6;
                try {
                    th3Var2.b(th2);
                    if (th2 instanceof b.a4) {
                        if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                            th3Var2.a(th2);
                        }
                        if (!(th2 instanceof TimeoutCancellationException)) {
                            if (!(th2 instanceof CancellationException)) {
                                if (th2 instanceof dv0) {
                                    throw th2;
                                }
                                throw new iu0(th2);
                            }
                            throw new du0(th2);
                        }
                        throw new lw0(th2);
                    }
                    throw th2;
                } finally {
                    try {
                        throw th;
                    } finally {
                    }
                }
            }
        }
        k4Var.f5491a = null;
        k4Var.f5492b = null;
        k4Var.f5493c = null;
        k4Var.f5494d = null;
        k4Var.f5497g = 3;
        objF = f(f5Var, k4Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Continuation continuation) {
        d4 d4Var;
        f5 f5Var;
        d dVar;
        if (continuation instanceof d4) {
            d4Var = (d4) continuation;
            int i5 = d4Var.f2173e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                d4Var.f2173e = i5 - Integer.MIN_VALUE;
            } else {
                d4Var = new d4(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = d4Var.f2171c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = d4Var.f2173e;
        if (i11 == 0) {
            ResultKt.b(obj);
            d4Var.f2169a = this;
            d dVar2 = this.f3174t;
            d4Var.f2170b = dVar2;
            d4Var.f2173e = 1;
            if (dVar2.e(d4Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            f5Var = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = d4Var.f2170b;
            f5Var = d4Var.f2169a;
            ResultKt.b(obj);
        }
        try {
            int size = f5Var.B.size();
            int i12 = size - 1;
            y3 y3Var = f5Var.f3175u;
            if (y3Var != y3.f11936c && y3Var != y3.f11935b) {
                size = i12;
            }
            Integer num = new Integer(Math.max(0, size));
            dVar.g(null);
            return num;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:47:0x013f, code lost:
    
        if (r11.a(r2, r5) != r4) goto L49;
     */
    /* JADX WARN: Removed duplicated region for block: B:43:0x011f  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0121  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(xo2 xo2Var, ContinuationImpl continuationImpl) {
        f4 f4Var;
        Ref.IntRef intRef;
        Ref.BooleanRef booleanRef;
        d dVar;
        f5 f5Var;
        Ref.IntRef intRef2;
        boolean z11;
        xo2 xo2Var2 = xo2Var;
        if (continuationImpl instanceof f4) {
            f4Var = (f4) continuationImpl;
            int i5 = f4Var.f3147h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                f4Var.f3147h = i5 - Integer.MIN_VALUE;
            } else {
                f4Var = new f4(this, continuationImpl);
            }
        }
        Object obj = f4Var.f3145f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = f4Var.f3147h;
        Continuation continuation = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                b.i8 i8Var = rw0.f9327f;
                m0.t(k0.a(t70.c2.f88780b.plus(f4Var.getContext()).minusKey(ti3.f9938b).minusKey(e0.f88787a).minusKey(q1.f88853a)), null, null, new mx.e(this, xo2Var2, continuation, 3), 3);
                intRef = new Ref.IntRef();
                booleanRef = new Ref.BooleanRef();
                f4Var.f3140a = this;
                f4Var.f3141b = xo2Var2;
                f4Var.f3142c = intRef;
                f4Var.f3143d = booleanRef;
                dVar = this.f3174t;
                f4Var.f3144e = dVar;
                f4Var.f3147h = 1;
                if (dVar.e(f4Var) != coroutineSingletons) {
                    f5Var = this;
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
            d dVar2 = f4Var.f3144e;
            booleanRef = f4Var.f3143d;
            intRef = f4Var.f3142c;
            xo2 xo2Var3 = f4Var.f3141b;
            f5Var = f4Var.f3140a;
            ResultKt.b(obj);
            dVar = dVar2;
            xo2Var2 = xo2Var3;
            f5Var.f3175u = y3.f11934a;
            long j11 = f5Var.f3172r;
            double d5 = f5Var.f3171q;
            f5Var.f3176v++;
            if (J.contains(xo2Var2.f11792a.getCom.tiktok.appevents.edp.TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE java.lang.String())) {
                intRef2 = intRef;
                z11 = true;
            } else {
                int i12 = f5Var.f3176v;
                if (i12 > f5Var.f3170p) {
                    z11 = true;
                    intRef2 = intRef;
                } else {
                    if (i12 > 1) {
                        double dB = 1.0d;
                        if (d5 > 0.01d) {
                            intRef2 = intRef;
                            f5Var.f3164h.getClass();
                            Random.f71890a.getClass();
                            dB = ((Random.f71891b.b() * (2 * d5)) + 1.0d) - d5;
                        } else {
                            intRef2 = intRef;
                        }
                        long jO = Duration.o(Duration.o(f5Var.f3177w, f5Var.f3173s), dB);
                        f5Var.f3177w = jO;
                        if (Duration.c(jO, j11) > 0) {
                            f5Var.f3177w = j11;
                        }
                        z11 = true;
                    } else {
                        intRef2 = intRef;
                        z11 = true;
                    }
                    intRef2.f71861a = f5Var.B.size();
                    booleanRef.f71859a = f5Var.f3175u != y3.f11936c ? z11 : false;
                    Unit unit = Unit.f71706a;
                    dVar.g(null);
                    int i13 = intRef2.f71861a;
                    boolean z12 = booleanRef.f71859a;
                    f4Var.f3140a = null;
                    f4Var.f3141b = null;
                    f4Var.f3142c = null;
                    f4Var.f3143d = null;
                    f4Var.f3144e = null;
                    f4Var.f3147h = 2;
                }
            }
            f5Var.f3178x = z11;
            f5Var.f3179y.c(null);
            intRef2.f71861a = f5Var.B.size();
            booleanRef.f71859a = f5Var.f3175u != y3.f11936c ? z11 : false;
            Unit unit2 = Unit.f71706a;
            dVar.g(null);
            int i132 = intRef2.f71861a;
            boolean z122 = booleanRef.f71859a;
            f4Var.f3140a = null;
            f4Var.f3141b = null;
            f4Var.f3142c = null;
            f4Var.f3143d = null;
            f4Var.f3144e = null;
            f4Var.f3147h = 2;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(jl2 jl2Var, ContinuationImpl continuationImpl) {
        g4 g4Var;
        jl2 jl2Var2;
        d dVar;
        f5 f5Var;
        kl2 kl2Var;
        if (continuationImpl instanceof g4) {
            g4Var = (g4) continuationImpl;
            int i5 = g4Var.f3632g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                g4Var.f3632g = i5 - Integer.MIN_VALUE;
            } else {
                g4Var = new g4(this, continuationImpl);
            }
        }
        Object obj = g4Var.f3630e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = g4Var.f3632g;
        int i12 = 1;
        if (i11 == 0) {
            ResultKt.b(obj);
            Duration.Companion companion = Duration.f72038b;
            this.f3162f.getClass();
            kl2 kl2Var2 = new kl2(jl2Var, DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d));
            g4Var.f3626a = this;
            g4Var.f3627b = jl2Var;
            g4Var.f3628c = kl2Var2;
            d dVar2 = this.f3174t;
            g4Var.f3629d = dVar2;
            g4Var.f3632g = 1;
            if (dVar2.e(g4Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            jl2Var2 = jl2Var;
            dVar = dVar2;
            f5Var = this;
            kl2Var = kl2Var2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = g4Var.f3629d;
            kl2Var = g4Var.f3628c;
            jl2Var2 = g4Var.f3627b;
            f5Var = g4Var.f3626a;
            ResultKt.b(obj);
        }
        Continuation continuation = null;
        try {
            f5Var.f3175u = y3.f11934a;
            t70.j0 j0Var = f5Var.f3158a;
            Queue queue = f5Var.B;
            queue.add(kl2Var);
            b5 b5Var = new b5(f5Var, continuation, i12);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            t70.g2 g2VarT = m0.t(j0Var, context, null, new ar.a(b5Var, null), 2);
            if (f5Var.f3169m) {
                kl2Var.f5771c = g2VarT;
            }
            if (queue.size() >= f5Var.o) {
                f5Var.C = m0.c();
            }
            f5Var.f3176v = 0;
            f5Var.f3177w = f5Var.n;
            Unit unit = Unit.f71706a;
            dVar.g(null);
            m0.t(j0Var, context, null, new ar.a(new ar.d(f5Var, jl2Var2, continuation, 4), null), 2);
            return unit;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    @Override // b.db
    public final Object b(long j11, SuspendLambda suspendLambda) {
        return h(this, suspendLambda);
    }

    public final Unit a(int i5, boolean z11) {
        if (!this.f3166j) {
            return Unit.f71706a;
        }
        fl2 fl2Var = this.f3165i;
        t70.j0 j0Var = fl2Var.f3405c;
        ij2 ij2Var = new ij2(fl2Var, this, i5, z11, null);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        m0.t(j0Var, context, null, new ar.a(ij2Var, null), 2);
        Unit unit = Unit.f71706a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return unit;
    }

    public final Unit a(boolean z11, ContinuationImpl continuationImpl) {
        Continuation continuation = null;
        if (this.B.isEmpty()) {
            b.i8 i8Var = rw0.f9327f;
            m0.t(k0.a(t70.c2.f88780b.plus(continuationImpl.getContext()).minusKey(ti3.f9938b).minusKey(e0.f88787a).minusKey(q1.f88853a)), null, null, new e20.c(this, continuation, 6), 3);
        }
        this.C.j0();
        if (!z11 && this.f3180z.b()) {
            return Unit.f71706a;
        }
        this.f3180z.c(null);
        this.E.j0();
        this.E = m0.c();
        if (this.f3166j && this.f3175u == y3.f11935b) {
            this.f3175u = y3.f11934a;
            this.G = m0.c();
        }
        m8.i iVar = new m8.i(this, continuation, 5);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        t70.j0 j0Var = this.f3158a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        this.f3180z = m0.t(j0Var, context, null, new ar.a(iVar, null), 2);
        return Unit.f71706a;
    }

    @Override // b.x
    public final Object a(long j11, i iVar) {
        return i(this, iVar);
    }

    public final Unit a() {
        this.A.c(null);
        this.F.j0();
        this.F = m0.c();
        m8.i iVar = new m8.i(this, (Continuation) null, 1);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        t70.j0 j0Var = this.f3158a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        this.A = m0.t(j0Var, context, null, new ar.a(iVar, null), 2);
        return Unit.f71706a;
    }
}
