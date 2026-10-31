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

@DebugMetadata(c = "io.branch.search.internal.services.CoroutinesJobManager$launchJob$1", f = "RunningJobMonitor.kt", l = {78}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class K4 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f62777a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ J4 f62778b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f62779c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ t70.r1 f62780d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public K4(J4 j42, Object obj, t70.r1 r1Var, Continuation<? super K4> continuation) {
        super(2, continuation);
        this.f62778b = j42;
        this.f62779c = obj;
        this.f62780d = r1Var;
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [io.branch.search.internal.Cd, java.lang.Object] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new K4(this.f62778b, this.f62779c, this.f62780d, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((K4) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Type inference failed for: r1v1, types: [io.branch.search.internal.Cd, java.lang.Object] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f62777a;
        if (i5 == 0) {
            ResultKt.b(obj);
            J4 j42 = this.f62778b;
            int iB = this.f62779c.b();
            t70.r1 r1Var = this.f62780d;
            this.f62777a = 1;
            if (J4.a(j42, iB, r1Var, this) == coroutineSingletons) {
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
