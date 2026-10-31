package io.branch.search.internal;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.services.CoroutinesJobManager$launchJob$job$1", f = "RunningJobMonitor.kt", l = {75}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class L4 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f62836a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function2<Object, Continuation<? super Unit>, Object> f62837b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f62838c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public L4(Function2<Object, ? super Continuation<? super Unit>, ? extends Object> function2, Object obj, Continuation<? super L4> continuation) {
        super(2, continuation);
        this.f62837b = function2;
        this.f62838c = obj;
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [io.branch.search.internal.Cd, java.lang.Object] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new L4(this.f62837b, this.f62838c, continuation);
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [io.branch.search.internal.Cd, java.lang.Object] */
    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new L4(this.f62837b, this.f62838c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f62836a;
        if (i5 == 0) {
            ResultKt.b(obj);
            Function2<Object, Continuation<? super Unit>, Object> function2 = this.f62837b;
            Object obj2 = this.f62838c;
            this.f62836a = 1;
            if (function2.invoke(obj2, this) == coroutineSingletons) {
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
