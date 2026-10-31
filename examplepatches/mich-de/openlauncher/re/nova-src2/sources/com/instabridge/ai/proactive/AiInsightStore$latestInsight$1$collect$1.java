package com.instabridge.ai.proactive;

import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.instabridge.ai.proactive.AiInsightStore$latestInsight$1", f = "AiInsightStore.kt", l = {51}, m = "collect")
/* loaded from: classes3.dex */
public final class AiInsightStore$latestInsight$1$collect$1 extends ContinuationImpl {
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ AiInsightStore$latestInsight$1 this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AiInsightStore$latestInsight$1$collect$1(AiInsightStore$latestInsight$1 aiInsightStore$latestInsight$1, Continuation<? super AiInsightStore$latestInsight$1$collect$1> continuation) {
        super(continuation);
        this.this$0 = aiInsightStore$latestInsight$1;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        return this.this$0.collect(null, this);
    }
}
