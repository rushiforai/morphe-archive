package com.instabridge.ai.tools;

import com.instabridge.ai.tools.AiTool;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.instabridge.ai.tools.AiTool$ReadCalendarEvents", f = "AiTool.kt", l = {1443}, m = "execute")
/* loaded from: classes3.dex */
public final class AiTool$ReadCalendarEvents$execute$1 extends ContinuationImpl {
    Object L$0;
    Object L$1;
    Object L$2;
    Object L$3;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ AiTool.ReadCalendarEvents this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AiTool$ReadCalendarEvents$execute$1(AiTool.ReadCalendarEvents readCalendarEvents, Continuation<? super AiTool$ReadCalendarEvents$execute$1> continuation) {
        super(continuation);
        this.this$0 = readCalendarEvents;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        return this.this$0.execute(null, null, false, this);
    }
}
