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

@DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$debounce$1$1", f = "PackageSyncManager.kt", l = {422}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.ra, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3351ra extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f65628a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f65629b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function2<t70.j0, Continuation<? super Unit>, Object> f65630c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public C3351ra(Function2<? super t70.j0, ? super Continuation<? super Unit>, ? extends Object> function2, Continuation<? super C3351ra> continuation) {
        super(2, continuation);
        this.f65630c = function2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        C3351ra c3351ra = new C3351ra(this.f65630c, continuation);
        c3351ra.f65629b = obj;
        return c3351ra;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        C3351ra c3351ra = new C3351ra(this.f65630c, (Continuation) obj2);
        c3351ra.f65629b = (t70.j0) obj;
        return c3351ra.invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f65628a;
        if (i5 == 0) {
            ResultKt.b(obj);
            t70.j0 j0Var = (t70.j0) this.f65629b;
            Function2<t70.j0, Continuation<? super Unit>, Object> function2 = this.f65630c;
            this.f65628a = 1;
            if (function2.invoke(j0Var, this) == coroutineSingletons) {
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
