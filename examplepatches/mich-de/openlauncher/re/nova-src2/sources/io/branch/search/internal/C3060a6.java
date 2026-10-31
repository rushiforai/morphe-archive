package io.branch.search.internal;

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

@DebugMetadata(c = "io.branch.search.internal.DirectBootGuard$launchWhenUnlocked$1", f = "DirectBootGuard.kt", l = {53, 54}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.a6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3060a6 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f63892a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C3077b6 f63893b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function1<Continuation<? super Unit>, Object> f63894c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public C3060a6(C3077b6 c3077b6, Function1<? super Continuation<? super Unit>, ? extends Object> function1, Continuation<? super C3060a6> continuation) {
        super(2, continuation);
        this.f63893b = c3077b6;
        this.f63894c = function1;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3060a6(this.f63893b, this.f63894c, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C3060a6(this.f63893b, this.f63894c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0034, code lost:
    
        if (r5.invoke(r4) == r0) goto L15;
     */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f63892a;
        if (i5 == 0) {
            ResultKt.b(obj);
            t70.r rVar = this.f63893b.f64016b;
            this.f63892a = 1;
            if (rVar.l(this) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i5 != 1) {
            if (i5 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        ResultKt.b(obj);
        Function1<Continuation<? super Unit>, Object> function1 = this.f63894c;
        this.f63892a = 2;
    }
}
