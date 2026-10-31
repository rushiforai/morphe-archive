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

@DebugMetadata(c = "io.branch.search.internal.multiprocess.LifecycleNotifier$onStop$1", f = "LifecycleNotifier.kt", l = {58}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class A8 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f62030a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ LifecycleNotifier f62031b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public A8(LifecycleNotifier lifecycleNotifier, Continuation<? super A8> continuation) {
        super(2, continuation);
        this.f62031b = lifecycleNotifier;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new A8(this.f62031b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new A8(this.f62031b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f62030a;
        if (i5 == 0) {
            ResultKt.b(obj);
            LifecycleNotifier lifecycleNotifier = this.f62031b;
            this.f62030a = 1;
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
