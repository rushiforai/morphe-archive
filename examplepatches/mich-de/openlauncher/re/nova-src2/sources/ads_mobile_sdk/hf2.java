package ads_mobile_sdk;

import b.ed;
import b.f0;
import c80.d;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.util.LinkedHashMap;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;
import t70.m0;
import t70.t0;

/* loaded from: classes.dex */
public final class hf2 extends c61 {

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f4378c;

    /* renamed from: d, reason: collision with root package name */
    public final jr0 f4379d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f4380e;

    /* renamed from: f, reason: collision with root package name */
    public final d f4381f;

    /* renamed from: g, reason: collision with root package name */
    public final LinkedHashMap f4382g;

    /* renamed from: h, reason: collision with root package name */
    public final ReferenceQueue f4383h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hf2(t70.j0 backgroundScope, jr0 flags) {
        super((wv0) null, 3);
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(flags, "flags");
        this.f4378c = backgroundScope;
        this.f4379d = flags;
        this.f4381f = new d();
        this.f4382g = new LinkedHashMap();
        this.f4383h = new ReferenceQueue();
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x004e  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:29:0x0094 -> B:21:0x004f). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x0097 -> B:22:0x0050). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:35:0x00c3 -> B:17:0x0041). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(hf2 hf2Var, ContinuationImpl continuationImpl) {
        df2 df2Var;
        nu0 nu0Var;
        nu0 nu0Var2;
        if (continuationImpl instanceof df2) {
            df2Var = (df2) continuationImpl;
            int i5 = df2Var.f2498f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                df2Var.f2498f = i5 - Integer.MIN_VALUE;
            } else {
                df2Var = new df2(hf2Var, continuationImpl);
            }
        }
        Object obj = df2Var.f2496d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = df2Var.f2498f;
        Continuation continuation = null;
        if (i11 != 0) {
            if (i11 == 1) {
                d dVar = df2Var.f2495c;
                nu0Var2 = df2Var.f2494b;
                hf2 hf2Var2 = df2Var.f2493a;
                ResultKt.b(obj);
                d dVar2 = dVar;
                hf2Var = hf2Var2;
                try {
                    dVar2.g(null);
                    t70.j0 j0Var = hf2Var.f4378c;
                    a60.d dVar3 = new a60.d(nu0Var2, continuation, 4);
                    EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var, "<this>");
                    Intrinsics.g(context, "context");
                    m0.t(j0Var, context, null, new ar.a(dVar3, null), 2);
                    Reference referencePoll = hf2Var.f4383h.poll();
                    if (!(referencePoll instanceof nu0)) {
                        nu0Var = (nu0) referencePoll;
                        nu0Var2 = nu0Var;
                        if (nu0Var2 == null) {
                            dVar2 = hf2Var.f4381f;
                            df2Var.f2493a = hf2Var;
                            df2Var.f2494b = nu0Var2;
                            df2Var.f2495c = dVar2;
                            df2Var.f2498f = 1;
                            if (dVar2.e(df2Var) == coroutineSingletons) {
                                return;
                            }
                            dVar2.g(null);
                            t70.j0 j0Var2 = hf2Var.f4378c;
                            a60.d dVar32 = new a60.d(nu0Var2, continuation, 4);
                            EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
                            Intrinsics.g(j0Var2, "<this>");
                            Intrinsics.g(context2, "context");
                            m0.t(j0Var2, context2, null, new ar.a(dVar32, null), 2);
                            Reference referencePoll2 = hf2Var.f4383h.poll();
                            if (!(referencePoll2 instanceof nu0)) {
                                nu0Var2 = null;
                                if (nu0Var2 == null) {
                                    jr0 jr0Var = hf2Var.f4379d;
                                    jr0Var.getClass();
                                    Duration.Companion companion = Duration.f72038b;
                                    long j11 = ((Duration) jr0Var.a("gads:phantom_reference_interval:seconds", ed.k(2, DurationUnit.f72047f, "gads:phantom_reference_interval:seconds"), u.a$3)).f72041a;
                                    df2Var.f2493a = hf2Var;
                                    df2Var.f2494b = null;
                                    df2Var.f2495c = null;
                                    df2Var.f2498f = 2;
                                    if (t0.c(j11, df2Var) == coroutineSingletons) {
                                        return;
                                    }
                                    Reference referencePoll3 = hf2Var.f4383h.poll();
                                    nu0Var = !(referencePoll3 instanceof nu0) ? (nu0) referencePoll3 : null;
                                    nu0Var2 = nu0Var;
                                    if (nu0Var2 == null) {
                                    }
                                }
                            }
                        }
                    }
                } catch (Throwable th2) {
                    dVar2.g(null);
                    throw th2;
                }
            } else {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                hf2Var = df2Var.f2493a;
            }
        }
        ResultKt.b(obj);
        Reference referencePoll32 = hf2Var.f4383h.poll();
        if (!(referencePoll32 instanceof nu0)) {
        }
        nu0Var2 = nu0Var;
        if (nu0Var2 == null) {
        }
    }

    @Override // ads_mobile_sdk.c61
    public final Object h(Continuation continuation) {
        jr0 jr0Var = this.f4379d;
        jr0Var.getClass();
        Duration.Companion companion = Duration.f72038b;
        long j11 = ((Duration) jr0Var.a("gads:phantom_reference_interval:seconds", ed.k(2, DurationUnit.f72047f, "gads:phantom_reference_interval:seconds"), u.a$3)).f72041a;
        companion.getClass();
        boolean z11 = Duration.c(j11, 0L) > 0;
        this.f4380e = z11;
        if (z11) {
            a60.d dVar = new a60.d(this, null, 6);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            t70.j0 j0Var = this.f4378c;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(dVar, null), 2);
        }
        return new xu0(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(hf2 hf2Var, Object obj, f0 f0Var, ContinuationImpl continuationImpl) {
        ff2 ff2Var;
        d dVar;
        if (continuationImpl instanceof ff2) {
            ff2Var = (ff2) continuationImpl;
            int i5 = ff2Var.f3341g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ff2Var.f3341g = i5 - Integer.MIN_VALUE;
            } else {
                ff2Var = new ff2(hf2Var, continuationImpl);
            }
        }
        Object obj2 = ff2Var.f3339e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ff2Var.f3341g;
        if (i11 == 0) {
            ResultKt.b(obj2);
            if (!hf2Var.f4380e) {
                return Unit.f71706a;
            }
            dVar = hf2Var.f4381f;
            ff2Var.f3335a = hf2Var;
            ff2Var.f3336b = obj;
            ff2Var.f3337c = f0Var;
            ff2Var.f3338d = dVar;
            ff2Var.f3341g = 1;
            if (dVar.e(ff2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = ff2Var.f3338d;
            f0Var = ff2Var.f3337c;
            obj = ff2Var.f3336b;
            hf2 hf2Var2 = ff2Var.f3335a;
            ResultKt.b(obj2);
            dVar = dVar2;
            hf2Var = hf2Var2;
        }
        try {
            hf2Var.f4382g.put(new nu0(f0Var, obj, hf2Var.f4383h), Boolean.TRUE);
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }
}
