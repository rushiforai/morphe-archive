package io.branch.search.internal;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.util.BncExecutor$internalExecutor$2", f = "BncExecutor.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class G1 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Function1<Object, Unit> f62503a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f62504b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public G1(Function1<Object, Unit> function1, Object obj, Continuation<? super G1> continuation) {
        super(2, continuation);
        this.f62503a = function1;
        this.f62504b = obj;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new G1(this.f62503a, this.f62504b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new G1(this.f62503a, this.f62504b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        this.f62503a.invoke(this.f62504b);
        return Unit.f71706a;
    }
}
