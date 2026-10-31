package com.instabridge.ai.tools;

import com.instabridge.ai.tools.AiTool;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.instabridge.ai.tools.AiTool$SearchContacts", f = "AiTool.kt", l = {872, 873}, m = "execute")
/* loaded from: classes3.dex */
public final class AiTool$SearchContacts$execute$1 extends ContinuationImpl {
    Object L$0;
    Object L$1;
    boolean Z$0;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ AiTool.SearchContacts this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AiTool$SearchContacts$execute$1(AiTool.SearchContacts searchContacts, Continuation<? super AiTool$SearchContacts$execute$1> continuation) {
        super(continuation);
        this.this$0 = searchContacts;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        return this.this$0.execute(null, null, false, this);
    }
}
