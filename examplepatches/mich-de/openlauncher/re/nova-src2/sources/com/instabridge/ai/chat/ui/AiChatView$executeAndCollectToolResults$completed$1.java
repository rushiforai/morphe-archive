package com.instabridge.ai.chat.ui;

import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
@DebugMetadata(c = "com.instabridge.ai.chat.ui.AiChatView$executeAndCollectToolResults$completed$1", f = "AiChatView.kt", l = {1882}, m = "invokeSuspend")
/* loaded from: classes3.dex */
public final class AiChatView$executeAndCollectToolResults$completed$1 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {
    final /* synthetic */ t70.r $latch;
    int label;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AiChatView$executeAndCollectToolResults$completed$1(t70.r rVar, Continuation<? super AiChatView$executeAndCollectToolResults$completed$1> continuation) {
        super(2, continuation);
        this.$latch = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new AiChatView$executeAndCollectToolResults$completed$1(this.$latch, continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.label;
        if (i5 == 0) {
            ResultKt.b(obj);
            t70.r rVar = this.$latch;
            this.label = 1;
            if (rVar.l(this) == coroutineSingletons) {
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

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(t70.j0 j0Var, Continuation<? super Unit> continuation) {
        return ((AiChatView$executeAndCollectToolResults$completed$1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
