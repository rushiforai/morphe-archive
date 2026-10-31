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

@DebugMetadata(c = "io.branch.search.internal.util.CancellationUtilKt$cancelAfter$job$1", f = "CancellationUtil.kt", l = {11}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class V3 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f63469a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f63470b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ w4.d f63471c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public V3(long j11, w4.d dVar, Continuation<? super V3> continuation) {
        super(2, continuation);
        this.f63470b = j11;
        this.f63471c = dVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new V3(this.f63470b, this.f63471c, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new V3(this.f63470b, this.f63471c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f63469a;
        if (i5 == 0) {
            ResultKt.b(obj);
            long j11 = this.f63470b;
            this.f63469a = 1;
            if (t70.t0.b(j11, this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        this.f63471c.a();
        return Unit.f71706a;
    }
}
