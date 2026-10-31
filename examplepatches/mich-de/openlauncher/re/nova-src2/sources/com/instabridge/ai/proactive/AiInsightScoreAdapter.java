package com.instabridge.ai.proactive;

import aq.n;
import aq.n0;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0006\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0007J\u0012\u0010\b\u001a\u00020\u00052\b\b\u0001\u0010\u0006\u001a\u00020\u0005H\u0007¨\u0006\t"}, d2 = {"Lcom/instabridge/ai/proactive/AiInsightScoreAdapter;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "fromJson", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toJson", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AiInsightScoreAdapter {
    public static final int $stable = 0;

    @n
    @ScoreJson
    public final int fromJson(double value) {
        return value <= 1.0d ? kotlin.ranges.a.e0((int) (value * 100), 0, 100) : kotlin.ranges.a.e0((int) value, 0, 100);
    }

    @n0
    public final int toJson(@ScoreJson int value) {
        return value;
    }
}
