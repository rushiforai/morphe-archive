package io.branch.search.internal;

import io.branch.search.internal.C4;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;

/* renamed from: io.branch.search.internal.ic, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3202ic {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final L1 f64748a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final A9 f64749b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final C3160g4 f64750c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final C3250la f64751d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final InterfaceC3164g8 f64752e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final t70.j0 f64753f;

    @DebugMetadata(c = "io.branch.search.internal.SDKLifecycleController$onAppBackgrounded$1", f = "SDKLifecycleController.kt", l = {36}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.ic$a */
    public static final class a extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f64754a;

        public a(Continuation<? super a> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3202ic.this.new a(continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return C3202ic.this.new a((Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f64754a;
            if (i5 == 0) {
                ResultKt.b(obj);
                InterfaceC3164g8 interfaceC3164g8 = C3202ic.this.f64752e;
                this.f64754a = 1;
                if (interfaceC3164g8.a(false) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.SDKLifecycleController$onAppForegrounded$1", f = "SDKLifecycleController.kt", l = {40}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.ic$b */
    public static final class b extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f64756a;

        public b(Continuation<? super b> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3202ic.this.new b(continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return C3202ic.this.new b((Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f64756a;
            if (i5 == 0) {
                ResultKt.b(obj);
                InterfaceC3164g8 interfaceC3164g8 = C3202ic.this.f64752e;
                this.f64756a = 1;
                if (interfaceC3164g8.a(true) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            return Unit.f71706a;
        }
    }

    @JvmOverloads
    public C3202ic(@NotNull C3269mc ssml, @NotNull L1 analytics, @NotNull B9 networkRepository, @NotNull C3160g4 clickTracker, @NotNull C3250la pkgSyncManager, @NotNull InterfaceC3164g8 jobManager, @NotNull t70.j0 coroutineScope) {
        Intrinsics.g(ssml, "ssml");
        Intrinsics.g(analytics, "analytics");
        Intrinsics.g(networkRepository, "networkRepository");
        Intrinsics.g(clickTracker, "clickTracker");
        Intrinsics.g(pkgSyncManager, "pkgSyncManager");
        Intrinsics.g(jobManager, "jobManager");
        Intrinsics.g(coroutineScope, "coroutineScope");
        this.f64748a = analytics;
        this.f64749b = networkRepository;
        this.f64750c = clickTracker;
        this.f64751d = pkgSyncManager;
        this.f64752e = jobManager;
        this.f64753f = coroutineScope;
    }

    public final void a(@NotNull String callerId, @NotNull C4.i.d impressions) throws JSONException {
        int i5;
        boolean z11;
        Intrinsics.g(callerId, "callerId");
        Intrinsics.g(impressions, "impressions");
        L1 l12 = this.f64748a;
        l12.getClass();
        E8 e82 = l12.f62827q;
        e82.getClass();
        Integer num = (Integer) e82.f62409b.get(callerId);
        int iIntValue = num != null ? num.intValue() : 0;
        synchronized (e82) {
            i5 = iIntValue - 1;
            z11 = i5 < 0;
            e82.f62409b.put(callerId, Integer.valueOf(i5));
            Unit unit = Unit.f71706a;
        }
        if (z11) {
            e82.f62408a.b(callerId, i5);
            synchronized (e82) {
                e82.f62409b.put(callerId, 0);
            }
        }
        C3240l0 c3240l0 = l12.f62818f;
        c3240l0.getClass();
        l12.a(c3240l0.f64939d.b(callerId), impressions);
        C3240l0 c3240l02 = l12.f62818f;
        c3240l02.getClass();
        String sessionId = c3240l02.f64939d.b("io.branch.search");
        EmptyList emptyList = EmptyList.f71733a;
        l12.b(sessionId, new C4.i.d(emptyList, emptyList, emptyList));
        Intrinsics.g(sessionId, "sessionId");
        l12.f62817e.a(sessionId, false);
        l12.f62818f.a(sessionId);
        this.f64749b.d();
        C3160g4 c3160g4 = this.f64750c;
        ReentrantLock reentrantLock = c3160g4.f64568g;
        reentrantLock.lock();
        try {
            c3160g4.f64570i.set(false);
            if (c3160g4.f64569h.compareAndSet(true, false)) {
                Thread thread = c3160g4.f64567f;
                if (thread != null) {
                    thread.interrupt();
                }
                try {
                    Thread thread2 = c3160g4.f64567f;
                    if (thread2 != null) {
                        thread2.join();
                    }
                } catch (InterruptedException unused) {
                }
                c3160g4.f64567f = null;
            }
            reentrantLock.unlock();
            t70.m0.t(this.f64753f, null, null, new a(null), 3);
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    public final void a(@NotNull String callerId) {
        int i5;
        boolean z11;
        Intrinsics.g(callerId, "callerId");
        t70.m0.t(this.f64753f, null, null, new b(null), 3);
        L1 l12 = this.f64748a;
        l12.getClass();
        E8 e82 = l12.f62827q;
        e82.getClass();
        Integer num = (Integer) e82.f62409b.get(callerId);
        int iIntValue = num != null ? num.intValue() : 0;
        synchronized (e82) {
            i5 = iIntValue + 1;
            z11 = i5 > 1;
            e82.f62409b.put(callerId, Integer.valueOf(i5));
            Unit unit = Unit.f71706a;
        }
        if (z11) {
            e82.f62408a.a(callerId, i5);
            synchronized (e82) {
                e82.f62409b.put(callerId, 1);
            }
        }
        l12.a(callerId);
        C3250la c3250la = this.f64751d;
        if (!c3250la.f64975l) {
            c3250la.f64972i.j(t70.m0.s(c3250la.f64965b, a80.d.f488c, t70.l0.f88814b, new C3385ta(c3250la, null)));
        }
        C3160g4 c3160g4 = this.f64750c;
        ReentrantLock reentrantLock = c3160g4.f64568g;
        reentrantLock.lock();
        try {
            c3160g4.f64570i.set(true);
            c3160g4.c();
        } finally {
            reentrantLock.unlock();
        }
    }
}
