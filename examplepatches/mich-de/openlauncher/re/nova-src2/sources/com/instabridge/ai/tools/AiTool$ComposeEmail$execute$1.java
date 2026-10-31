package com.instabridge.ai.tools;

import androidx.room.o;
import com.instabridge.ai.tools.AiTool;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.instabridge.ai.tools.AiTool$ComposeEmail", f = "AiTool.kt", l = {991, o.MAX_BIND_PARAMETER_CNT}, m = "execute")
/* loaded from: classes3.dex */
public final class AiTool$ComposeEmail$execute$1 extends ContinuationImpl {
    Object L$0;
    Object L$1;
    Object L$2;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ AiTool.ComposeEmail this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AiTool$ComposeEmail$execute$1(AiTool.ComposeEmail composeEmail, Continuation<? super AiTool$ComposeEmail$execute$1> continuation) {
        super(continuation);
        this.this$0 = composeEmail;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        return this.this$0.execute(null, null, false, this);
    }
}
