package com.instabridge.ai.proactive;

import com.instabridge.ai.proactive.AiProactiveManager;
import com.instabridge.ai.protocol.AGUIEvent;
import kotlin.jvm.functions.Function1;
import kotlin.text.MatchResult;
import t70.r1;

/* loaded from: classes3.dex */
public final /* synthetic */ class b implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35523a;

    public /* synthetic */ b(int i5) {
        this.f35523a = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f35523a) {
            case 0:
                return Boolean.valueOf(AiProactiveManager.C28501.invokeSuspend$lambda$3$lambda$1$lambda$0((r1) obj));
            case 1:
                return AiProactiveManager.C28511.invokeSuspend$lambda$0((AiMetaQueryLead) obj);
            case 2:
                return AiInsightStore.chipTokens$lambda$15((MatchResult) obj);
            case 3:
                return AiInsightStore.emitSorted$lambda$7((AiInsightData) obj);
            case 4:
                return Boolean.valueOf(AiProactiveManager.isGenerationInFlight$lambda$1$lambda$0((r1) obj));
            case 5:
                return InsightGenerator.generateInsight$lambda$11((AGUIEvent.QuotaExceeded) obj);
            default:
                return Integer.valueOf(InsightScorer.score$lambda$7((MatchResult) obj));
        }
    }
}
