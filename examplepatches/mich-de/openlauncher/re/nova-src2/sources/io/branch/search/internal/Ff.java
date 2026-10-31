package io.branch.search.internal;

import java.io.FileNotFoundException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Ff {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public static final Cf f62481e = new Cf(ag.INIT);

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Df f62482a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final t70.j0 f62483b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public Cf f62484c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final c80.a f62485d;

    public static final class a {
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheConfigRepository", f = "ZeroStateCacheConfig.kt", l = {48, 143}, m = "getConfig")
    public static final class b extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Ff f62486a;

        /* renamed from: b, reason: collision with root package name */
        public Cf f62487b;

        /* renamed from: c, reason: collision with root package name */
        public c80.a f62488c;

        /* renamed from: d, reason: collision with root package name */
        public /* synthetic */ Object f62489d;

        /* renamed from: f, reason: collision with root package name */
        public int f62491f;

        public b(Continuation<? super b> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f62489d = obj;
            this.f62491f |= Integer.MIN_VALUE;
            return Ff.this.a(this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheConfigRepository", f = "ZeroStateCacheConfig.kt", l = {76}, m = "loadConfig")
    public static final class c extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f62492a;

        /* renamed from: c, reason: collision with root package name */
        public int f62494c;

        public c(Continuation<? super c> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f62492a = obj;
            this.f62494c |= Integer.MIN_VALUE;
            Ff ff = Ff.this;
            a aVar = Ff.Companion;
            return ff.b(this);
        }
    }

    public Ff(@NotNull Df dataSource, @NotNull t70.j0 scope) {
        Intrinsics.g(dataSource, "dataSource");
        Intrinsics.g(scope, "scope");
        this.f62482a = dataSource;
        this.f62483b = scope;
        this.f62485d = new c80.d();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(Ff ff, Nf nf2, Continuation continuation) {
        Gf gf2;
        Object objA;
        ff.getClass();
        if (continuation instanceof Gf) {
            gf2 = (Gf) continuation;
            int i5 = gf2.f62550c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gf2.f62550c = i5 - Integer.MIN_VALUE;
            } else {
                gf2 = new Gf(ff, continuation);
            }
        }
        Object obj = gf2.f62548a;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = gf2.f62550c;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                int i12 = Result.f71687b;
                Df df = ff.f62482a;
                gf2.f62550c = 1;
                df.getClass();
                a80.e eVar = t70.y0.f88884a;
                Object objY = t70.m0.y(a80.d.f488c, new Ef(df, nf2, null), gf2);
                if (objY != obj2) {
                    objY = Unit.f71706a;
                }
                if (objY == obj2) {
                    return obj2;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            objA = Unit.f71706a;
            int i13 = Result.f71687b;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            C3309p1 c3309p1 = C3309p1.f65465a;
            C3309p1.a(a50.b.f402c, "ZeroStateCacheConfig", "Failed to persist zero state cache config to disk", thA);
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(Continuation<? super Cf> continuation) {
        c cVar;
        Object objA;
        if (continuation instanceof c) {
            cVar = (c) continuation;
            int i5 = cVar.f62494c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f62494c = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(continuation);
            }
        }
        Object obj = cVar.f62492a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f62494c;
        if (i11 == 0) {
            ResultKt.b(obj);
            Df df = this.f62482a;
            cVar.f62494c = 1;
            objA = df.a(cVar);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objA = ((Result) obj).f71688a;
        }
        int i12 = Result.f71687b;
        if (!(objA instanceof Result.Failure)) {
            try {
                Nf remote = (Nf) objA;
                Cf.Companion.getClass();
                Intrinsics.g(remote, "remote");
                objA = new Cf(ag.valueOf(remote.f62997a));
            } catch (Throwable th2) {
                int i13 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            if (thA instanceof FileNotFoundException) {
                C3309p1 c3309p1 = C3309p1.f65465a;
                C3309p1.a(a50.b.f400a, "ZeroStateCacheConfig", "Unable to load zero state cache config from disk", thA);
            } else {
                C3309p1 c3309p12 = C3309p1.f65465a;
                C3309p1.a(a50.b.f402c, "ZeroStateCacheConfig", "Unable to load zero state cache config from disk", thA);
            }
        }
        return objA instanceof Result.Failure ? f62481e : objA;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0070 A[Catch: all -> 0x0073, TRY_LEAVE, TryCatch #0 {all -> 0x0073, blocks: (B:28:0x006c, B:30:0x0070), top: B:39:0x006c }] */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull Continuation<? super Cf> continuation) {
        b bVar;
        Ff ff;
        Ff ff2;
        c80.a aVar;
        Cf cf2;
        Cf cf3;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f62491f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f62491f = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuation);
            }
        }
        Object objB = bVar.f62489d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f62491f;
        if (i11 == 0) {
            ResultKt.b(objB);
            Cf cf4 = this.f62484c;
            if (cf4 != null) {
                return cf4;
            }
            bVar.f62486a = this;
            bVar.f62491f = 1;
            objB = b(bVar);
            if (objB != coroutineSingletons) {
                ff = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            aVar = bVar.f62488c;
            cf2 = bVar.f62487b;
            ff2 = bVar.f62486a;
            ResultKt.b(objB);
            try {
                cf3 = ff2.f62484c;
                if (cf3 != null) {
                    ff2.f62484c = cf2;
                } else {
                    cf2 = cf3;
                }
                return cf2;
            } finally {
                ((c80.d) aVar).g(null);
            }
        }
        ff = bVar.f62486a;
        ResultKt.b(objB);
        Cf cf5 = (Cf) objB;
        c80.a aVar2 = ff.f62485d;
        bVar.f62486a = ff;
        bVar.f62487b = cf5;
        bVar.f62488c = aVar2;
        bVar.f62491f = 2;
        c80.d dVar = (c80.d) aVar2;
        if (dVar.e(bVar) != coroutineSingletons) {
            ff2 = ff;
            aVar = dVar;
            cf2 = cf5;
            cf3 = ff2.f62484c;
            if (cf3 != null) {
            }
            return cf2;
        }
        return coroutineSingletons;
    }
}
