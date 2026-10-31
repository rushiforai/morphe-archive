package io.branch.search.internal;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.DirectBootGuard$execWhenUnlocked$1", f = "DirectBootGuard.kt", l = {62}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class Z5 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f63815a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C3077b6 f63816b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0<Unit> f63817c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Z5(C3077b6 c3077b6, Function0<Unit> function0, Continuation<? super Z5> continuation) {
        super(2, continuation);
        this.f63816b = c3077b6;
        this.f63817c = function0;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new Z5(this.f63816b, this.f63817c, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new Z5(this.f63816b, this.f63817c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f63815a;
        if (i5 == 0) {
            ResultKt.b(obj);
            t70.r rVar = this.f63816b.f64016b;
            this.f63815a = 1;
            if (rVar.l(this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        this.f63817c.invoke();
        return Unit.f71706a;
    }
}
