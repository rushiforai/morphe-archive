package com.instabridge.ai.auth;

import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
@DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager$logout$refreshToken$1$1", f = "AiAuthManager.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes3.dex */
public final class AiAuthManager$logout$refreshToken$1$1 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
    int label;
    final /* synthetic */ AiAuthManager this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AiAuthManager$logout$refreshToken$1$1(AiAuthManager aiAuthManager, Continuation<? super AiAuthManager$logout$refreshToken$1$1> continuation) {
        super(2, continuation);
        this.this$0 = aiAuthManager;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new AiAuthManager$logout$refreshToken$1$1(this.this$0, continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        if (this.label != 0) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(obj);
        this.this$0.clearCachedPersonData();
        return Unit.f71706a;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
        return ((AiAuthManager$logout$refreshToken$1$1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
