package io.branch.search.internal;

import io.branch.search.internal.Ne;
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

@DebugMetadata(c = "io.branch.search.internal.TrackingQueue$installPermanentHandler$job$1", f = "TrackingStatusManager.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class Oe extends SuspendLambda implements Function2<Ne.a<Object>, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f63029a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1<Object, Unit> f63030b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Oe(Function1<Object, Unit> function1, Continuation<? super Oe> continuation) {
        super(2, continuation);
        this.f63030b = function1;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        Oe oe2 = new Oe(this.f63030b, continuation);
        oe2.f63029a = obj;
        return oe2;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        Oe oe2 = new Oe(this.f63030b, (Continuation) obj2);
        oe2.f63029a = (Ne.a) obj;
        return oe2.invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        Ne.a aVar = (Ne.a) this.f63029a;
        if (aVar instanceof Ne.a.b) {
            this.f63030b.invoke(((Ne.a.b) aVar).f62996a);
        }
        return Unit.f71706a;
    }
}
