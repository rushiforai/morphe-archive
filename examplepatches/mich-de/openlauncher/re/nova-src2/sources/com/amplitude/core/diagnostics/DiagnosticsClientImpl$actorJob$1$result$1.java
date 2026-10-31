package com.amplitude.core.diagnostics;

import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import v70.m;
import v70.r;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lt70/j0;", "Lv70/r;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update;", "<anonymous>", "(Lt70/j0;)Lv70/r;"}, k = 3, mv = {1, 9, 0})
@DebugMetadata(c = "com.amplitude.core.diagnostics.DiagnosticsClientImpl$actorJob$1$result$1", f = "DiagnosticsClientImpl.kt", l = {168}, m = "invokeSuspend")
/* loaded from: classes2.dex */
public final class DiagnosticsClientImpl$actorJob$1$result$1 extends SuspendLambda implements Function2<j0, Continuation<? super r>, Object> {
    int label;
    final /* synthetic */ DiagnosticsClientImpl this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public DiagnosticsClientImpl$actorJob$1$result$1(DiagnosticsClientImpl diagnosticsClientImpl, Continuation<? super DiagnosticsClientImpl$actorJob$1$result$1> continuation) {
        super(2, continuation);
        this.this$0 = diagnosticsClientImpl;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new DiagnosticsClientImpl$actorJob$1$result$1(this.this$0, continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        Object objM;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.label;
        if (i5 == 0) {
            ResultKt.b(obj);
            m mVar = this.this$0.channel;
            this.label = 1;
            objM = mVar.m(this);
            if (objM == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objM = ((r) obj).f92194a;
        }
        return new r(objM);
    }

    @Override // kotlin.jvm.functions.Function2
    @Nullable
    public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super r> continuation) {
        return ((DiagnosticsClientImpl$actorJob$1$result$1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
