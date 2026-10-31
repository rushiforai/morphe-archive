package com.instabridge.ai.chat.ui.v2;

import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;
import t70.r;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
@DebugMetadata(c = "com.instabridge.ai.chat.ui.v2.AiChatViewV2$executeAndCollectToolResults$completed$1", f = "AiChatViewV2.kt", l = {1741}, m = "invokeSuspend")
/* loaded from: classes3.dex */
public final class AiChatViewV2$executeAndCollectToolResults$completed$1 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
    final /* synthetic */ r $latch;
    int label;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AiChatViewV2$executeAndCollectToolResults$completed$1(r rVar, Continuation<? super AiChatViewV2$executeAndCollectToolResults$completed$1> continuation) {
        super(2, continuation);
        this.$latch = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new AiChatViewV2$executeAndCollectToolResults$completed$1(this.$latch, continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.label;
        if (i5 == 0) {
            ResultKt.b(obj);
            r rVar = this.$latch;
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
    public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
        return ((AiChatViewV2$executeAndCollectToolResults$completed$1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
