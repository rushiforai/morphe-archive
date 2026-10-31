package com.instabridge.ai.proactive;

import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.FunctionReferenceImpl;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public /* synthetic */ class AiProactiveManager$generateInsights$6$1$1$1$insight$1 extends FunctionReferenceImpl implements Function0<Boolean> {
    public AiProactiveManager$generateInsights$6$1$1$1$insight$1(Object obj) {
        super(0, 0, AiProactiveManager.class, obj, "generationReady", "generationReady()Z");
    }

    @Override // kotlin.jvm.functions.Function0
    public final Boolean invoke() {
        return Boolean.valueOf(((AiProactiveManager) this.receiver).generationReady());
    }
}
