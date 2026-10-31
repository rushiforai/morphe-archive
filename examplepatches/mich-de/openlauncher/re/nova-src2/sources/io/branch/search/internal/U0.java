package io.branch.search.internal;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class U0 implements InterfaceC3232k9 {

    /* renamed from: a, reason: collision with root package name */
    public final long f63403a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Function0<Long> f63404b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final w70.l1 f63405c;

    /* renamed from: d, reason: collision with root package name */
    public long f63406d;

    @DebugMetadata(c = "io.branch.search.internal.util.AtMaxTimeoutMethodDebouncer$add$1", f = "Coros.kt", l = {Sdk.SDKError.Reason.INVALID_GZIP_BID_PAYLOAD_VALUE}, m = "invokeSuspend")
    public static final class a extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f63407a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ Function0<Unit> f63409c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(Function0<Unit> function0, Continuation<? super a> continuation) {
            super(2, continuation);
            this.f63409c = function0;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return U0.this.new a(this.f63409c, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return U0.this.new a(this.f63409c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f63407a;
            if (i5 == 0) {
                ResultKt.b(obj);
                w70.l1 l1Var = U0.this.f63405c;
                Function0<Unit> function0 = this.f63409c;
                this.f63407a = 1;
                if (l1Var.emit(function0, this) == coroutineSingletons) {
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

    public U0(int i5, @NotNull t70.j0 scope, @NotNull Function0 clock) {
        Intrinsics.g(scope, "scope");
        Intrinsics.g(clock, "clock");
        this.f63403a = 3000L;
        this.f63404b = clock;
        w70.t1 t1VarA = w70.u1.a(1, i5, v70.a.f92142b);
        this.f63405c = t1VarA;
        w70.u1.u(new W0(new n8.q(new w70.u(new V0(this), t1VarA, null), 4), this), scope);
    }

    @Override // io.branch.search.internal.InterfaceC3232k9
    public final void a(@NotNull Function0<Unit> t6) throws Throwable {
        Intrinsics.g(t6, "t");
        t70.m0.u(EmptyCoroutineContext.f71803a, new a(t6, null));
    }
}
