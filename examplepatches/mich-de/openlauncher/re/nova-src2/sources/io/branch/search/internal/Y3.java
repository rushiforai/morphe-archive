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

@DebugMetadata(c = "io.branch.search.internal.util.ChampagneQueue$close$1", f = "Coros.kt", l = {479}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class Y3 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public c80.a f63718a;

    /* renamed from: b, reason: collision with root package name */
    public X3 f63719b;

    /* renamed from: c, reason: collision with root package name */
    public int f63720c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ X3<Object> f63721d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Y3(X3<Object> x32, Continuation<? super Y3> continuation) {
        super(2, continuation);
        this.f63721d = x32;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new Y3(this.f63721d, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new Y3(this.f63721d, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        X3<Object> x32;
        Object obj2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f63720c;
        if (i5 == 0) {
            ResultKt.b(obj);
            X3<Object> x33 = this.f63721d;
            c80.a aVar = x33.f63632c;
            this.f63718a = aVar;
            this.f63719b = x33;
            this.f63720c = 1;
            c80.d dVar = (c80.d) aVar;
            if (dVar.e(this) == coroutineSingletons) {
                return coroutineSingletons;
            }
            x32 = x33;
            obj2 = dVar;
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            x32 = this.f63719b;
            Object obj3 = this.f63718a;
            ResultKt.b(obj);
            obj2 = obj3;
        }
        try {
            if (!x32.f63635f) {
                return Unit.f71706a;
            }
            x32.f63635f = false;
            return Unit.f71706a;
        } finally {
            ((c80.d) obj2).g(null);
        }
    }
}
