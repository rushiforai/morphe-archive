package io.branch.search.internal;

import io.branch.search.internal.multiprocess.LifecycleNotifier;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.LifecycleNotifier$unregister$1", f = "LifecycleNotifier.kt", l = {41}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class B8 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f62136a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ LifecycleNotifier f62137b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public B8(LifecycleNotifier lifecycleNotifier, Continuation<? super B8> continuation) {
        super(2, continuation);
        this.f62137b = lifecycleNotifier;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new B8(this.f62137b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new B8(this.f62137b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f62136a;
        if (i5 == 0) {
            ResultKt.b(obj);
            C3309p1.c(EnumC3131e9.ProcessLifecycle, "Stopped observing (sending ON_STOP)");
            LifecycleNotifier lifecycleNotifier = this.f62137b;
            this.f62136a = 1;
            if (LifecycleNotifier.a(lifecycleNotifier, this) == coroutineSingletons) {
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
