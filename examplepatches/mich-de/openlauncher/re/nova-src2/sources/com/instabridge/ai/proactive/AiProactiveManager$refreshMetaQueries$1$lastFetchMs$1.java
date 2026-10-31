package com.instabridge.ai.proactive;

import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)J"}, k = 3, mv = {2, 1, 0})
@DebugMetadata(c = "com.instabridge.ai.proactive.AiProactiveManager$refreshMetaQueries$1$lastFetchMs$1", f = "AiProactiveManager.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes3.dex */
public final class AiProactiveManager$refreshMetaQueries$1$lastFetchMs$1 extends SuspendLambda implements Function2<j0, Continuation<? super Long>, Object> {
    int label;
    final /* synthetic */ AiProactiveManager this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AiProactiveManager$refreshMetaQueries$1$lastFetchMs$1(AiProactiveManager aiProactiveManager, Continuation<? super AiProactiveManager$refreshMetaQueries$1$lastFetchMs$1> continuation) {
        super(2, continuation);
        this.this$0 = aiProactiveManager;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new AiProactiveManager$refreshMetaQueries$1$lastFetchMs$1(this.this$0, continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        if (this.label != 0) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(obj);
        return new Long(this.this$0.getMetaStore().lastFetchTime());
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(j0 j0Var, Continuation<? super Long> continuation) {
        return ((AiProactiveManager$refreshMetaQueries$1$lastFetchMs$1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
