package com.instabridge.ai.proactive;

import b70.g;
import java.util.List;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import w70.g2;
import w70.i2;
import w70.m1;
import w70.n;

@Metadata(d1 = {"\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0001\n\u0002\b\u0005\n\u0002\u0010 \n\u0002\b\u0004*\u0001\u0000\b\n\u0018\u00002\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0001J \u0010\u0006\u001a\u00020\u00052\u000e\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0003H\u0096@¢\u0006\u0004\b\u0006\u0010\u0007R\u0016\u0010\n\u001a\u0004\u0018\u00010\u00028VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\b\u0010\tR\u001c\u0010\u000e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u000b8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\f\u0010\r¨\u0006\u000f"}, d2 = {"com/instabridge/ai/proactive/AiInsightStore$latestInsight$1", "Lw70/g2;", "Lcom/instabridge/ai/proactive/AiInsightData;", "Lw70/n;", "collector", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "collect", "(Lw70/n;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getValue", "()Lcom/instabridge/ai/proactive/AiInsightData;", "value", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getReplayCache", "()Ljava/util/List;", "replayCache", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AiInsightStore$latestInsight$1 implements g2 {
    final /* synthetic */ AiInsightStore this$0;

    public AiInsightStore$latestInsight$1(AiInsightStore aiInsightStore) {
        this.this$0 = aiInsightStore;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // w70.m
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object collect(final n nVar, Continuation<?> continuation) {
        AiInsightStore$latestInsight$1$collect$1 aiInsightStore$latestInsight$1$collect$1;
        if (continuation instanceof AiInsightStore$latestInsight$1$collect$1) {
            aiInsightStore$latestInsight$1$collect$1 = (AiInsightStore$latestInsight$1$collect$1) continuation;
            int i5 = aiInsightStore$latestInsight$1$collect$1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aiInsightStore$latestInsight$1$collect$1.label = i5 - Integer.MIN_VALUE;
            } else {
                aiInsightStore$latestInsight$1$collect$1 = new AiInsightStore$latestInsight$1$collect$1(this, continuation);
            }
        }
        Object obj = aiInsightStore$latestInsight$1$collect$1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aiInsightStore$latestInsight$1$collect$1.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            m1 m1Var = this.this$0._insightPool;
            n nVar2 = new n() { // from class: com.instabridge.ai.proactive.AiInsightStore$latestInsight$1$collect$2
                @Override // w70.n
                public /* bridge */ /* synthetic */ Object emit(Object obj2, Continuation continuation2) {
                    return emit((List<AiInsightData>) obj2, (Continuation<? super Unit>) continuation2);
                }

                public final Object emit(List<AiInsightData> list, Continuation<? super Unit> continuation2) {
                    Object objEmit = nVar.emit(g.Y0(list), continuation2);
                    return objEmit == CoroutineSingletons.f71806a ? objEmit : Unit.f71706a;
                }
            };
            aiInsightStore$latestInsight$1$collect$1.label = 1;
            if (((i2) m1Var).collect(nVar2, aiInsightStore$latestInsight$1$collect$1) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        throw new KotlinNothingValueException();
    }

    @Override // w70.q1
    public List<AiInsightData> getReplayCache() {
        return ul.b.P(g.Y0((List) ((i2) this.this$0._insightPool).getValue()));
    }

    @Override // w70.g2
    public AiInsightData getValue() {
        return (AiInsightData) g.Y0((List) ((i2) this.this$0._insightPool).getValue());
    }
}
