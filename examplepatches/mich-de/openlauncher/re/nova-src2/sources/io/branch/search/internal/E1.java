package io.branch.search.internal;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.util.BncExecutor$execute$3", f = "BncExecutor.kt", l = {23}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class E1 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f62385a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f62386b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0<Object> f62387c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function1<Object, Unit> f62388d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Function0<Unit> f62389e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public E1(Function0<Object> function0, Function1<Object, Unit> function1, Function0<Unit> function02, Continuation<? super E1> continuation) {
        super(2, continuation);
        this.f62387c = function0;
        this.f62388d = function1;
        this.f62389e = function02;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        E1 e12 = new E1(this.f62387c, this.f62388d, this.f62389e, continuation);
        e12.f62386b = obj;
        return e12;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((E1) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f62385a;
        if (i5 == 0) {
            ResultKt.b(obj);
            t70.j0 j0Var = (t70.j0) this.f62386b;
            H1 h1 = H1.f62552a;
            Function0<Object> function0 = this.f62387c;
            Function1<Object, Unit> function1 = this.f62388d;
            Function0<Unit> function02 = this.f62389e;
            this.f62385a = 1;
            if (H1.a(h1, j0Var, function0, function1, function02, this) == coroutineSingletons) {
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
