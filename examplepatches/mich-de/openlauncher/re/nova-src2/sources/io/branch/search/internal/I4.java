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

@DebugMetadata(c = "io.branch.search.internal.services.CoroutinesJobManager$cancel$1", f = "RunningJobMonitor.kt", l = {85}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class I4 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f62667a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ J4 f62668b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f62669c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public I4(J4 j42, int i5, Continuation<? super I4> continuation) {
        super(2, continuation);
        this.f62668b = j42;
        this.f62669c = i5;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new I4(this.f62668b, this.f62669c, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new I4(this.f62668b, this.f62669c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f62667a;
        if (i5 == 0) {
            ResultKt.b(obj);
            J4 j42 = this.f62668b;
            int i11 = this.f62669c;
            this.f62667a = 1;
            if (j42.a(i11, this) == coroutineSingletons) {
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
