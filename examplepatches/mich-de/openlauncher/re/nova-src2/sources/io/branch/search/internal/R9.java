package io.branch.search.internal;

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
public final class R9 implements InterfaceC3232k9 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final w70.l1 f63272a;

    @DebugMetadata(c = "io.branch.search.internal.util.OnlyLatestMethodDebouncer$add$1", f = "Coros.kt", l = {171}, m = "invokeSuspend")
    public static final class a extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f63273a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ Function0<Unit> f63275c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(Function0<Unit> function0, Continuation<? super a> continuation) {
            super(2, continuation);
            this.f63275c = function0;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return R9.this.new a(this.f63275c, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return R9.this.new a(this.f63275c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f63273a;
            if (i5 == 0) {
                ResultKt.b(obj);
                w70.l1 l1Var = R9.this.f63272a;
                Function0<Unit> function0 = this.f63275c;
                this.f63273a = 1;
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

    public R9(int i5, long j11, @NotNull t70.j0 scope) {
        Intrinsics.g(scope, "scope");
        w70.t1 t1VarA = w70.u1.a(1, i5, v70.a.f92142b);
        this.f63272a = t1VarA;
        w70.m mVar = t1VarA;
        if (j11 < 0) {
            throw new IllegalArgumentException("Debounce timeout should not be negative");
        }
        w70.u1.u(new S9(j11 != 0 ? new n8.q(new w70.u(new lm.i(j11, 1), t1VarA, null), 4) : mVar), scope);
    }

    @Override // io.branch.search.internal.InterfaceC3232k9
    public final void a(@NotNull Function0<Unit> t6) {
        Intrinsics.g(t6, "t");
        t70.m0.u(EmptyCoroutineContext.f71803a, new a(t6, null));
    }
}
