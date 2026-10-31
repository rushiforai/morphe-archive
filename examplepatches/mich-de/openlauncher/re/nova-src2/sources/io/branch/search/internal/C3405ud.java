package io.branch.search.internal;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import io.branch.search.internal.InterfaceC3376t1;
import io.branch.search.internal.multiprocess.CannotBindException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.ud, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3405ud implements InterfaceC3376t1.a {

    /* renamed from: a, reason: collision with root package name */
    public long f66030a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C3456xd f66031b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f66032c;

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ServiceConnector$1$onBindingDied$1", f = "Interfaces.kt", l = {TTAdConstant.DEEPLINK_FALLBACK_TYPE_CODE}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.ud$a */
    public static final class a extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public c80.a f66033a;

        /* renamed from: b, reason: collision with root package name */
        public C3456xd f66034b;

        /* renamed from: c, reason: collision with root package name */
        public int f66035c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ C3456xd f66036d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(C3456xd c3456xd, Continuation<? super a> continuation) {
            super(2, continuation);
            this.f66036d = c3456xd;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return new a(this.f66036d, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return new a(this.f66036d, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            C3456xd c3456xd;
            Object obj2;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f66035c;
            if (i5 == 0) {
                ResultKt.b(obj);
                C3456xd c3456xd2 = this.f66036d;
                c80.a aVar = c3456xd2.f66294b;
                this.f66033a = aVar;
                this.f66034b = c3456xd2;
                this.f66035c = 1;
                c80.d dVar = (c80.d) aVar;
                if (dVar.e(this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                c3456xd = c3456xd2;
                obj2 = dVar;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                c3456xd = this.f66034b;
                Object obj3 = this.f66033a;
                ResultKt.b(obj);
                obj2 = obj3;
            }
            try {
                if (c3456xd.f66297e) {
                    return Unit.f71706a;
                }
                if (c3456xd.f66295c.isCompleted()) {
                    C3456xd.b(c3456xd);
                    C3456xd.a(c3456xd);
                } else {
                    C3456xd.c(c3456xd);
                }
                return Unit.f71706a;
            } finally {
                ((c80.d) obj2).g(null);
            }
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ServiceConnector$1$onNullBinding$1", f = "Interfaces.kt", l = {TTAdConstant.DEEPLINK_FALLBACK_TYPE_CODE}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.ud$b */
    public static final class b extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public c80.a f66037a;

        /* renamed from: b, reason: collision with root package name */
        public C3456xd f66038b;

        /* renamed from: c, reason: collision with root package name */
        public int f66039c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ C3456xd f66040d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(C3456xd c3456xd, Continuation<? super b> continuation) {
            super(2, continuation);
            this.f66040d = c3456xd;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return new b(this.f66040d, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return new b(this.f66040d, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            C3456xd c3456xd;
            Object obj2;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f66039c;
            if (i5 == 0) {
                ResultKt.b(obj);
                C3456xd c3456xd2 = this.f66040d;
                c80.a aVar = c3456xd2.f66294b;
                this.f66037a = aVar;
                this.f66038b = c3456xd2;
                this.f66039c = 1;
                c80.d dVar = (c80.d) aVar;
                if (dVar.e(this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                c3456xd = c3456xd2;
                obj2 = dVar;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                c3456xd = this.f66038b;
                Object obj3 = this.f66037a;
                ResultKt.b(obj);
                obj2 = obj3;
            }
            try {
                if (c3456xd.f66297e) {
                    return Unit.f71706a;
                }
                ((t70.s) c3456xd.f66295c).j0(new CannotBindException("Binder service possibly disabled"));
                C3456xd.b(c3456xd);
                return Unit.f71706a;
            } finally {
                ((c80.d) obj2).g(null);
            }
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ServiceConnector$1$onServiceConnected$1", f = "Interfaces.kt", l = {TTAdConstant.DEEPLINK_FALLBACK_TYPE_CODE}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.ud$c */
    public static final class c extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public c80.a f66041a;

        /* renamed from: b, reason: collision with root package name */
        public C3456xd f66042b;

        /* renamed from: c, reason: collision with root package name */
        public InterfaceC3315p7 f66043c;

        /* renamed from: d, reason: collision with root package name */
        public int f66044d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ C3456xd f66045e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ InterfaceC3315p7 f66046f;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(C3456xd c3456xd, InterfaceC3315p7 interfaceC3315p7, Continuation<? super c> continuation) {
            super(2, continuation);
            this.f66045e = c3456xd;
            this.f66046f = interfaceC3315p7;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return new c(this.f66045e, this.f66046f, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return new c(this.f66045e, this.f66046f, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            C3456xd c3456xd;
            InterfaceC3315p7 interfaceC3315p7;
            Object obj2;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f66044d;
            if (i5 == 0) {
                ResultKt.b(obj);
                c3456xd = this.f66045e;
                c80.a aVar = c3456xd.f66294b;
                InterfaceC3315p7 interfaceC3315p72 = this.f66046f;
                this.f66041a = aVar;
                this.f66042b = c3456xd;
                this.f66043c = interfaceC3315p72;
                this.f66044d = 1;
                c80.d dVar = (c80.d) aVar;
                if (dVar.e(this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                interfaceC3315p7 = interfaceC3315p72;
                obj2 = dVar;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                interfaceC3315p7 = this.f66043c;
                c3456xd = this.f66042b;
                Object obj3 = this.f66041a;
                ResultKt.b(obj);
                obj2 = obj3;
            }
            try {
                if (c3456xd.f66297e) {
                    return Unit.f71706a;
                }
                ((t70.s) c3456xd.f66295c).X(interfaceC3315p7);
                return Unit.f71706a;
            } finally {
                ((c80.d) obj2).g(null);
            }
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ServiceConnector$1$onServiceDisconnected$1", f = "Interfaces.kt", l = {TTAdConstant.DEEPLINK_FALLBACK_TYPE_CODE}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.ud$d */
    public static final class d extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public c80.a f66047a;

        /* renamed from: b, reason: collision with root package name */
        public C3456xd f66048b;

        /* renamed from: c, reason: collision with root package name */
        public C3405ud f66049c;

        /* renamed from: d, reason: collision with root package name */
        public int f66050d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ C3456xd f66051e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ C3405ud f66052f;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(C3456xd c3456xd, C3405ud c3405ud, Continuation<? super d> continuation) {
            super(2, continuation);
            this.f66051e = c3456xd;
            this.f66052f = c3405ud;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return new d(this.f66051e, this.f66052f, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return new d(this.f66051e, this.f66052f, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            C3456xd c3456xd;
            C3405ud c3405ud;
            Object obj2;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f66050d;
            if (i5 == 0) {
                ResultKt.b(obj);
                c3456xd = this.f66051e;
                c80.a aVar = c3456xd.f66294b;
                C3405ud c3405ud2 = this.f66052f;
                this.f66047a = aVar;
                this.f66048b = c3456xd;
                this.f66049c = c3405ud2;
                this.f66050d = 1;
                c80.d dVar = (c80.d) aVar;
                if (dVar.e(this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                c3405ud = c3405ud2;
                obj2 = dVar;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                c3405ud = this.f66049c;
                c3456xd = this.f66048b;
                Object obj3 = this.f66047a;
                ResultKt.b(obj);
                obj2 = obj3;
            }
            try {
                if (c3456xd.f66297e) {
                    return Unit.f71706a;
                }
                if (c3405ud.f66030a + c3405ud.f66032c > System.currentTimeMillis()) {
                    C3456xd.b(c3456xd);
                    return Unit.f71706a;
                }
                c3405ud.f66030a = System.currentTimeMillis();
                c3456xd.f66295c = t70.m0.b();
                return Unit.f71706a;
            } finally {
                ((c80.d) obj2).g(null);
            }
        }
    }

    public C3405ud(C3456xd c3456xd, long j11) {
        this.f66031b = c3456xd;
        this.f66032c = j11;
    }

    @Override // io.branch.search.internal.InterfaceC3376t1.a
    public final void a(@NotNull InterfaceC3315p7 svc) throws Throwable {
        Intrinsics.g(svc, "svc");
        t70.m0.u(EmptyCoroutineContext.f71803a, new c(this.f66031b, svc, null));
    }

    @Override // io.branch.search.internal.InterfaceC3376t1.a
    public final void b() throws Throwable {
        t70.m0.u(EmptyCoroutineContext.f71803a, new a(this.f66031b, null));
    }

    @Override // io.branch.search.internal.InterfaceC3376t1.a
    public final void c() throws Throwable {
        t70.m0.u(EmptyCoroutineContext.f71803a, new b(this.f66031b, null));
    }

    @Override // io.branch.search.internal.InterfaceC3376t1.a
    public final void a() throws Throwable {
        t70.m0.u(EmptyCoroutineContext.f71803a, new d(this.f66031b, this, null));
    }
}
