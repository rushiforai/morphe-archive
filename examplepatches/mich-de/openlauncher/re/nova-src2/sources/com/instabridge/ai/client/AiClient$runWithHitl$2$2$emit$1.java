package com.instabridge.ai.client;

import com.instabridge.ai.client.AiClient;
import com.instabridge.ai.protocol.AGUIEvent;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.instabridge.ai.client.AiClient$runWithHitl$2$2", f = "AiClient.kt", l = {849}, m = "emit")
/* loaded from: classes3.dex */
public final class AiClient$runWithHitl$2$2$emit$1 extends ContinuationImpl {
    Object L$0;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ AiClient.C28352.C01322<T> this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public AiClient$runWithHitl$2$2$emit$1(AiClient.C28352.C01322<? super T> c01322, Continuation<? super AiClient$runWithHitl$2$2$emit$1> continuation) {
        super(continuation);
        this.this$0 = c01322;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        return this.this$0.emit((AGUIEvent) null, (Continuation<? super Unit>) this);
    }
}
