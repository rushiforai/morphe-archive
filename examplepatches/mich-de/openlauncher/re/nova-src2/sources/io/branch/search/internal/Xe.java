package io.branch.search.internal;

import io.branch.search.internal.P1;
import io.branch.search.internal.We;
import io.branch.search.internal.util.CorosKt;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public interface Xe {
    void a(@NotNull C3095c7 c3095c7);

    void b(@NotNull C3095c7 c3095c7);

    public static final class a implements Xe {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final P1 f63676a;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final Re f63677b;

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public final L1 f63678c;

        @DebugMetadata(c = "io.branch.search.internal.TrackingStatusManagerActions$Default$fetchLastPersisted$1", f = "TrackingStatusManager.kt", l = {}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.Xe$a$a, reason: collision with other inner class name */
        public static final class C0331a extends SuspendLambda implements Function2<t70.j0, Continuation<? super C3095c7>, Object> {
            public C0331a(Continuation<? super C0331a> continuation) {
                super(2, continuation);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                return a.this.new C0331a(continuation);
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                return a.this.new C0331a((Continuation) obj2).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                Re re2 = a.this.f63677b;
                if (re2.f63292a.h()) {
                    return null;
                }
                return (C3095c7) re2.f63297f.a(Se.f63359a);
            }
        }

        public a(@NotNull P1 config, @NotNull Re trackingRepository, @NotNull L1 analytics) {
            Intrinsics.g(config, "config");
            Intrinsics.g(trackingRepository, "trackingRepository");
            Intrinsics.g(analytics, "analytics");
            this.f63676a = config;
            this.f63677b = trackingRepository;
            this.f63678c = analytics;
        }

        @Override // io.branch.search.internal.Xe
        public final void a(@NotNull C3095c7 status) {
            Intrinsics.g(status, "status");
            Re re2 = this.f63677b;
            re2.getClass();
            t70.m0.t(re2.f63298g, null, null, new Pe(re2, status, null), 3);
            re2.f63292a.getClass();
            t70.m0.t(re2.f63298g, null, null, new Qe(re2, status, null), 3);
        }

        @Override // io.branch.search.internal.Xe
        public final void b(@NotNull C3095c7 status) {
            Intrinsics.g(status, "status");
            We.a aVar = We.Companion;
            P1 p12 = this.f63676a;
            P1.a status2 = status.d();
            long j11 = status.f64099b;
            aVar.getClass();
            Intrinsics.g(p12, "<this>");
            Intrinsics.g(status2, "status");
            p12.f63055x.set(status2);
            p12.f63053v = new C3095c7(System.currentTimeMillis(), status2.f63061a);
            p12.f63056y.set(j11);
            L1 l12 = this.f63678c;
            boolean z11 = status.d() == P1.a.OPTED_IN;
            l12.getClass();
            l12.f62817e.a(z11);
            C3240l0 c3240l0 = l12.f62818f;
            c3240l0.getClass();
            String sessionId = c3240l0.f64939d.b("io.branch.search");
            if (!l12.f62817e.a()) {
                Intrinsics.g(sessionId, "sessionId");
                l12.f62817e.a(sessionId, false);
            }
            l12.f62820h.a(sessionId, l12.f62822j, l12.f62817e, false);
        }

        @Nullable
        public final C3095c7 a() {
            return (C3095c7) t70.m0.u(CorosKt.f66061b, new C0331a(null));
        }
    }
}
