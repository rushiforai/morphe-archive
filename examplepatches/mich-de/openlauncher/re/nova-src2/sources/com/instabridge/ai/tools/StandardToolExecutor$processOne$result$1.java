package com.instabridge.ai.tools;

import android.content.Context;
import com.instabridge.ai.protocol.PendingToolCall;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Map;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", "Lcom/instabridge/ai/tools/ToolResult;", "<anonymous>", "(Lt70/j0;)Lcom/instabridge/ai/tools/ToolResult;"}, k = 3, mv = {2, 1, 0})
@DebugMetadata(c = "com.instabridge.ai.tools.StandardToolExecutor$processOne$result$1", f = "StandardToolExecutor.kt", l = {Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE}, m = "invokeSuspend")
/* loaded from: classes3.dex */
public final class StandardToolExecutor$processOne$result$1 extends SuspendLambda implements Function2<j0, Continuation<? super ToolResult>, Object> {
    final /* synthetic */ Map<String, Object> $args;
    final /* synthetic */ PendingToolCall $call;
    final /* synthetic */ Context $context;
    final /* synthetic */ AiTool $tool;
    int label;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public StandardToolExecutor$processOne$result$1(AiTool aiTool, Context context, Map<String, ? extends Object> map, PendingToolCall pendingToolCall, Continuation<? super StandardToolExecutor$processOne$result$1> continuation) {
        super(2, continuation);
        this.$tool = aiTool;
        this.$context = context;
        this.$args = map;
        this.$call = pendingToolCall;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new StandardToolExecutor$processOne$result$1(this.$tool, this.$context, this.$args, this.$call, continuation);
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
        AiTool aiTool = this.$tool;
        Context context = this.$context;
        Map<String, ? extends Object> map = this.$args;
        boolean userInitiated = this.$call.getUserInitiated();
        this.label = 1;
        Object objExecute = aiTool.execute(context, map, userInitiated, this);
        return objExecute == coroutineSingletons ? coroutineSingletons : objExecute;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(j0 j0Var, Continuation<? super ToolResult> continuation) {
        return ((StandardToolExecutor$processOne$result$1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
