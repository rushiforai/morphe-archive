package com.instabridge.ai.tools;

import com.instabridge.ai.tools.AiTool;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.instabridge.ai.tools.AiTool$MakeCall", f = "AiTool.kt", l = {693, Sdk.SDKError.Reason.DOH_FETCH_FAILED_VALUE}, m = "execute$suspendImpl")
/* loaded from: classes3.dex */
public final class AiTool$MakeCall$execute$1 extends ContinuationImpl {
    Object L$0;
    Object L$1;
    Object L$2;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ AiTool.MakeCall this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AiTool$MakeCall$execute$1(AiTool.MakeCall makeCall, Continuation<? super AiTool$MakeCall$execute$1> continuation) {
        super(continuation);
        this.this$0 = makeCall;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        return AiTool.MakeCall.execute$suspendImpl(this.this$0, null, null, false, this);
    }
}
