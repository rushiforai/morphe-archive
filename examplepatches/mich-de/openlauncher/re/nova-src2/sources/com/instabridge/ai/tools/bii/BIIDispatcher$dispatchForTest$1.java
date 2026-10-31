package com.instabridge.ai.tools.bii;

import android.content.Context;
import com.instabridge.ai.tools.ToolResult;
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
@DebugMetadata(c = "com.instabridge.ai.tools.bii.BIIDispatcher$dispatchForTest$1", f = "BIIDispatcher.kt", l = {55}, m = "invokeSuspend")
/* loaded from: classes3.dex */
public final class BIIDispatcher$dispatchForTest$1 extends SuspendLambda implements Function2<j0, Continuation<? super ToolResult>, Object> {
    final /* synthetic */ Context $contextOverride;
    final /* synthetic */ BIIEntry $entry;
    final /* synthetic */ Map<String, Object> $params;
    final /* synthetic */ String $toolCallId;
    final /* synthetic */ boolean $userInitiated;
    int label;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public BIIDispatcher$dispatchForTest$1(Context context, BIIEntry bIIEntry, Map<String, ? extends Object> map, boolean z11, String str, Continuation<? super BIIDispatcher$dispatchForTest$1> continuation) {
        super(2, continuation);
        this.$contextOverride = context;
        this.$entry = bIIEntry;
        this.$params = map;
        this.$userInitiated = z11;
        this.$toolCallId = str;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new BIIDispatcher$dispatchForTest$1(this.$contextOverride, this.$entry, this.$params, this.$userInitiated, this.$toolCallId, continuation);
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
        BIIDispatcher bIIDispatcher = BIIDispatcher.INSTANCE;
        Context context = this.$contextOverride;
        BIIEntry bIIEntry = this.$entry;
        Map<String, Object> map = this.$params;
        boolean z11 = this.$userInitiated;
        String str = this.$toolCallId;
        this.label = 1;
        Object objDispatchInternal$default = BIIDispatcher.dispatchInternal$default(bIIDispatcher, context, bIIEntry, map, z11, str, null, this, 32, null);
        return objDispatchInternal$default == coroutineSingletons ? coroutineSingletons : objDispatchInternal$default;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(j0 j0Var, Continuation<? super ToolResult> continuation) {
        return ((BIIDispatcher$dispatchForTest$1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
