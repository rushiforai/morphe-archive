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

@DebugMetadata(c = "io.branch.search.internal.ExtensionsKt$awaitBlockingDependencyProviderInternal$1", f = "Extensions.kt", l = {112}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class E6 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Y1>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f62403a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ F4 f62404b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f62405c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public E6(F4 f42, long j11, Continuation<? super E6> continuation) {
        super(2, continuation);
        this.f62404b = f42;
        this.f62405c = j11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new E6(this.f62404b, this.f62405c, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new E6(this.f62404b, this.f62405c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f62403a;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        ResultKt.b(obj);
        F4 f42 = this.f62404b;
        long j11 = this.f62405c;
        this.f62403a = 1;
        Object objA = D6.a(f42, j11, this);
        return objA == coroutineSingletons ? coroutineSingletons : objA;
    }
}
