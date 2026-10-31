package com.instabridge.ai.tools;

import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.instabridge.ai.tools.SendMessageTool", f = "SendMessageTool.kt", l = {473}, m = "resolveContactWithDisambiguation$instabridge_ai_sdk_release")
/* loaded from: classes3.dex */
public final class SendMessageTool$resolveContactWithDisambiguation$1 extends ContinuationImpl {
    Object L$0;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ SendMessageTool this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SendMessageTool$resolveContactWithDisambiguation$1(SendMessageTool sendMessageTool, Continuation<? super SendMessageTool$resolveContactWithDisambiguation$1> continuation) {
        super(continuation);
        this.this$0 = sendMessageTool;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        return this.this$0.resolveContactWithDisambiguation$instabridge_ai_sdk_release(null, null, false, this);
    }
}
