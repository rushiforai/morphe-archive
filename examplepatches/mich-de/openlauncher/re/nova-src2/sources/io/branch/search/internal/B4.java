package io.branch.search.internal;

import io.branch.search.internal.E2;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.ContentProviderQuery$runQueryBlock$response$1", f = "BncContentProviderPaths.kt", l = {169}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class B4 extends SuspendLambda implements Function2<t70.j0, Continuation<? super y40.w>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f62123a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1<Continuation<? super y40.w>, Object> f62124b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public B4(Function1<? super Continuation<? super y40.w>, ? extends Object> function1, Continuation<? super B4> continuation) {
        super(2, continuation);
        this.f62124b = function1;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new B4(this.f62124b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new B4(this.f62124b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f62123a;
        try {
            if (i5 == 0) {
                ResultKt.b(obj);
                Function1<Continuation<? super y40.w>, Object> function1 = this.f62124b;
                this.f62123a = 1;
                obj = function1.invoke(this);
                if (obj == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            return (y40.w) obj;
        } catch (Kb e3) {
            y40.v vVar = y40.w.Companion;
            EmptyList emptyList = EmptyList.f71733a;
            E2.Companion.getClass();
            return y40.v.b(vVar, emptyList, E2.b.a(e3));
        }
    }
}
