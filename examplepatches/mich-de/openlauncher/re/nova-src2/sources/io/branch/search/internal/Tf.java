package io.branch.search.internal;

import io.branch.search.internal.Pf;
import io.branch.search.internal.Pf.C3048d;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheRepository$regenerateCacheForService$2", f = "ZeroStateCache.kt", l = {293}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class Tf extends SuspendLambda implements Function2<t70.j0, Continuation<? super O3>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f63395a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Pf f63396b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Tf(Pf pf2, Continuation<? super Tf> continuation) {
        super(2, continuation);
        this.f63396b = pf2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new Tf(this.f63396b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new Tf(this.f63396b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f63395a;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        ResultKt.b(obj);
        Pf pf2 = this.f63396b;
        Jf jf2 = pf2.f63106g;
        Pf.C3048d c3048d = pf2.new C3048d();
        this.f63395a = 1;
        Object objA = jf2.a(c3048d, this);
        return objA == coroutineSingletons ? coroutineSingletons : objA;
    }
}
