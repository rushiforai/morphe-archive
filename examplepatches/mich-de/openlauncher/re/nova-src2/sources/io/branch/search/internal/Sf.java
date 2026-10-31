package io.branch.search.internal;

import io.branch.search.internal.Pf;
import io.branch.search.internal.multiprocess.ZeroStateCacheModel;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheRepository$regenerateCacheForInvalid$2", f = "ZeroStateCache.kt", l = {297}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class Sf extends SuspendLambda implements Function2<t70.j0, Continuation<? super O3>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f63360a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Pf f63361b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ZeroStateCacheModel f63362c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Sf(Pf pf2, ZeroStateCacheModel zeroStateCacheModel, Continuation<? super Sf> continuation) {
        super(2, continuation);
        this.f63361b = pf2;
        this.f63362c = zeroStateCacheModel;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new Sf(this.f63361b, this.f63362c, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new Sf(this.f63361b, this.f63362c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f63360a;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        ResultKt.b(obj);
        Pf pf2 = this.f63361b;
        Jf jf2 = pf2.f63106g;
        Pf.C3047c c3047c = new Pf.C3047c(pf2, this.f63362c);
        this.f63360a = 1;
        Object objA = jf2.a(c3047c, this);
        return objA == coroutineSingletons ? coroutineSingletons : objA;
    }
}
