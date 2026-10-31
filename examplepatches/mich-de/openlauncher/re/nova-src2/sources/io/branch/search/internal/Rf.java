package io.branch.search.internal;

import io.branch.search.internal.Pf;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheRepository$regenerateCacheForApi$2", f = "ZeroStateCache.kt", l = {289}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class Rf extends SuspendLambda implements Function2<t70.j0, Continuation<? super O3>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f63311a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Pf f63312b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ y40.d0 f63313c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Rf(y40.d0 d0Var, Pf pf2, Continuation continuation) {
        super(2, continuation);
        this.f63312b = pf2;
        this.f63313c = d0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new Rf(this.f63313c, this.f63312b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        Pf pf2 = this.f63312b;
        return new Rf(this.f63313c, pf2, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f63311a;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        ResultKt.b(obj);
        Pf pf2 = this.f63312b;
        Jf jf2 = pf2.f63106g;
        Pf.C3045a c3045a = new Pf.C3045a(pf2, this.f63313c);
        this.f63311a = 1;
        Object objA = jf2.a(c3045a, this);
        return objA == coroutineSingletons ? coroutineSingletons : objA;
    }
}
