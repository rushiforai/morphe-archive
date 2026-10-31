package io.branch.search.internal;

import io.branch.search.internal.O3;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Jf {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final t70.j0 f62752a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final t70.c0 f62753b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public t70.r1 f62754c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final v70.m f62755d;

    public static final class a {
    }

    public static abstract class b {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final t70.r f62756a = t70.m0.b();

        @DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheQueue$RegenerateTask", f = "ZeroStateCache.kt", l = {742}, m = "regenerateCache")
        public static final class a extends ContinuationImpl {

            /* renamed from: a, reason: collision with root package name */
            public t70.r f62757a;

            /* renamed from: b, reason: collision with root package name */
            public /* synthetic */ Object f62758b;

            /* renamed from: d, reason: collision with root package name */
            public int f62760d;

            public a(Continuation<? super a> continuation) {
                super(continuation);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                this.f62758b = obj;
                this.f62760d |= Integer.MIN_VALUE;
                return b.this.b(this);
            }
        }

        @Nullable
        public abstract Object a(@NotNull Continuation<? super O3> continuation);

        /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object b(@NotNull Continuation<? super Unit> continuation) {
            a aVar;
            t70.r rVar;
            if (continuation instanceof a) {
                aVar = (a) continuation;
                int i5 = aVar.f62760d;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    aVar.f62760d = i5 - Integer.MIN_VALUE;
                } else {
                    aVar = new a(continuation);
                }
            }
            Object obj = aVar.f62758b;
            Object obj2 = CoroutineSingletons.f71806a;
            int i11 = aVar.f62760d;
            if (i11 == 0) {
                ResultKt.b(obj);
                t70.r rVar2 = this.f62756a;
                aVar.f62757a = rVar2;
                aVar.f62760d = 1;
                Object objA = a(aVar);
                if (objA == obj2) {
                    return obj2;
                }
                rVar = rVar2;
                obj = objA;
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                rVar = aVar.f62757a;
                ResultKt.b(obj);
            }
            ((t70.s) rVar).X(obj);
            return Unit.f71706a;
        }
    }

    public static final class c extends Lambda implements Function1<b, Unit> {

        /* renamed from: a, reason: collision with root package name */
        public static final c f62761a = new c();

        public c() {
            super(1);
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            b droppedTask = (b) obj;
            Intrinsics.g(droppedTask, "droppedTask");
            C3309p1.a("ZeroStateCacheQueue", new Kf(droppedTask));
            ((t70.s) droppedTask.f62756a).X(O3.a.C0325a.f63005a);
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheQueue", f = "ZeroStateCache.kt", l = {752, 753}, m = "scheduleAndAwaitResult")
    public static final class d extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public b f62762a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f62763b;

        /* renamed from: d, reason: collision with root package name */
        public int f62765d;

        public d(Continuation<? super d> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f62763b = obj;
            this.f62765d |= Integer.MIN_VALUE;
            return Jf.this.a(null, this);
        }
    }

    public static final class e extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ b f62766a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public e(b bVar) {
            super(0);
            this.f62766a = bVar;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Scheduling task ".concat(this.f62766a.getClass().getSimpleName());
        }
    }

    public Jf(@NotNull t70.j0 bgScope, @NotNull t70.c0 ioDispatcher) {
        Intrinsics.g(bgScope, "bgScope");
        Intrinsics.g(ioDispatcher, "ioDispatcher");
        this.f62752a = bgScope;
        this.f62753b = ioDispatcher;
        this.f62755d = v70.o.a(1, v70.a.f92142b, c.f62761a);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull b bVar, @NotNull Continuation<? super O3> continuation) {
        d dVar;
        if (continuation instanceof d) {
            dVar = (d) continuation;
            int i5 = dVar.f62765d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f62765d = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(continuation);
            }
        }
        Object obj = dVar.f62763b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar.f62765d;
        if (i11 == 0) {
            ResultKt.b(obj);
            C3309p1.a("ZeroStateCacheQueue", new e(bVar));
            v70.m mVar = this.f62755d;
            dVar.f62762a = bVar;
            dVar.f62765d = 1;
            if (mVar.t(bVar, dVar) != coroutineSingletons) {
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        bVar = dVar.f62762a;
        ResultKt.b(obj);
        dVar.f62762a = null;
        dVar.f62765d = 2;
        Object objL = bVar.f62756a.l(dVar);
        return objL == coroutineSingletons ? coroutineSingletons : objL;
    }
}
