package com.instabridge.ai.chat.ui;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n"}, d2 = {"<anonymous>", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "permission", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.instabridge.ai.chat.ui.AiChatActivity$onCreate$requester$1", f = "AiChatActivity.kt", l = {Sdk.SDKError.Reason.PLACEMENT_AD_TYPE_MISMATCH_VALUE}, m = "invokeSuspend")
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class AiChatActivity$onCreate$requester$1 extends SuspendLambda implements Function2<String, Continuation<? super Boolean>, Object> {
    /* synthetic */ Object L$0;
    Object L$1;
    int label;
    final /* synthetic */ AiChatActivity this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AiChatActivity$onCreate$requester$1(AiChatActivity aiChatActivity, Continuation<? super AiChatActivity$onCreate$requester$1> continuation) {
        super(2, continuation);
        this.this$0 = aiChatActivity;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        AiChatActivity$onCreate$requester$1 aiChatActivity$onCreate$requester$1 = new AiChatActivity$onCreate$requester$1(this.this$0, continuation);
        aiChatActivity$onCreate$requester$1.L$0 = obj;
        return aiChatActivity$onCreate$requester$1;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.label;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        ResultKt.b(obj);
        String str = (String) this.L$0;
        final AiChatActivity aiChatActivity = this.this$0;
        this.L$0 = str;
        this.L$1 = aiChatActivity;
        this.label = 1;
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(this));
        mVar.t();
        aiChatActivity.permissionContinuation = mVar;
        mVar.v(new Function1<Throwable, Unit>() { // from class: com.instabridge.ai.chat.ui.AiChatActivity$onCreate$requester$1$1$1
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object obj2) {
                invoke((Throwable) obj2);
                return Unit.f71706a;
            }

            public final void invoke(Throwable th2) {
                aiChatActivity.permissionContinuation = null;
            }
        });
        aiChatActivity.permissionLauncher.a(str, null);
        Object objS = mVar.s();
        return objS == coroutineSingletons ? coroutineSingletons : objS;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(String str, Continuation<? super Boolean> continuation) {
        return ((AiChatActivity$onCreate$requester$1) create(str, continuation)).invokeSuspend(Unit.f71706a);
    }
}
