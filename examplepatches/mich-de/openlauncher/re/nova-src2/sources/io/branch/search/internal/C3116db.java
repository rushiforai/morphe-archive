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

@DebugMetadata(c = "io.branch.search.internal.PreInitClient$awaitActualClient$2", f = "PreInitClient.kt", l = {62}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.db, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3116db extends SuspendLambda implements Function2<t70.j0, Continuation<? super C3411v2>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f64292a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C3099cb f64293b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3116db(C3099cb c3099cb, Continuation<? super C3116db> continuation) {
        super(2, continuation);
        this.f64293b = c3099cb;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3116db(this.f64293b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C3116db(this.f64293b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f64292a;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        ResultKt.b(obj);
        t70.r rVar = this.f64293b.f64109a;
        this.f64292a = 1;
        Object objL = rVar.l(this);
        return objL == coroutineSingletons ? coroutineSingletons : objL;
    }
}
