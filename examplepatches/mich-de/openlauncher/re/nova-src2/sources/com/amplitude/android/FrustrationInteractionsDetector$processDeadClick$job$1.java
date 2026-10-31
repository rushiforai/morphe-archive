package com.amplitude.android;

import com.amplitude.android.FrustrationInteractionsDetector;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
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
import t70.t0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
@DebugMetadata(c = "com.amplitude.android.FrustrationInteractionsDetector$processDeadClick$job$1", f = "FrustrationInteractionsDetector.kt", l = {198}, m = "invokeSuspend")
/* loaded from: classes2.dex */
public final class FrustrationInteractionsDetector$processDeadClick$job$1 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
    final /* synthetic */ String $clickId;
    final /* synthetic */ FrustrationInteractionsDetector.DeadClickSession $deadClickSession;
    int label;
    final /* synthetic */ FrustrationInteractionsDetector this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FrustrationInteractionsDetector$processDeadClick$job$1(FrustrationInteractionsDetector frustrationInteractionsDetector, FrustrationInteractionsDetector.DeadClickSession deadClickSession, String str, Continuation<? super FrustrationInteractionsDetector$processDeadClick$job$1> continuation) {
        super(2, continuation);
        this.this$0 = frustrationInteractionsDetector;
        this.$deadClickSession = deadClickSession;
        this.$clickId = str;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new FrustrationInteractionsDetector$processDeadClick$job$1(this.this$0, this.$deadClickSession, this.$clickId, continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.label;
        if (i5 == 0) {
            ResultKt.b(obj);
            this.label = 1;
            if (t0.b(3000L, this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        if (this.this$0.lastUiChangeTime <= this.$deadClickSession.getPreClickUiChangeTime()) {
            this.this$0.trackDeadClick(this.$deadClickSession);
        }
        this.this$0.pendingDeadClicks.remove(this.$clickId);
        return Unit.f71706a;
    }

    @Override // kotlin.jvm.functions.Function2
    @Nullable
    public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
        return ((FrustrationInteractionsDetector$processDeadClick$job$1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
