package com.instabridge.ai.proactive;

import com.instabridge.ai.protocol.AGUIEvent;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public /* synthetic */ class AiProactiveManager$generateInsights$insight$2 extends FunctionReferenceImpl implements Function1<AGUIEvent.QuotaExceeded, Unit> {
    public AiProactiveManager$generateInsights$insight$2(Object obj) {
        super(1, 0, AiProactiveManager.class, obj, "pauseForQuota", "pauseForQuota$instabridge_ai_sdk_release(Lcom/instabridge/ai/protocol/AGUIEvent$QuotaExceeded;)V");
    }

    @Override // kotlin.jvm.functions.Function1
    public /* bridge */ /* synthetic */ Object invoke(Object obj) {
        invoke((AGUIEvent.QuotaExceeded) obj);
        return Unit.f71706a;
    }

    public final void invoke(AGUIEvent.QuotaExceeded p02) {
        Intrinsics.g(p02, "p0");
        ((AiProactiveManager) this.receiver).pauseForQuota$instabridge_ai_sdk_release(p02);
    }
}
