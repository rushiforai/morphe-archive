package com.instabridge.ai.auth;

import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0006\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006¨\u0006\u0007"}, d2 = {"Lcom/instabridge/ai/auth/AiAccessDecision;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;I)V", "Allowed", "PromptRequired", "BlockedUnavailable", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AiAccessDecision {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ AiAccessDecision[] $VALUES;
    public static final AiAccessDecision Allowed = new AiAccessDecision("Allowed", 0);
    public static final AiAccessDecision PromptRequired = new AiAccessDecision("PromptRequired", 1);
    public static final AiAccessDecision BlockedUnavailable = new AiAccessDecision("BlockedUnavailable", 2);

    private static final /* synthetic */ AiAccessDecision[] $values() {
        return new AiAccessDecision[]{Allowed, PromptRequired, BlockedUnavailable};
    }

    static {
        AiAccessDecision[] aiAccessDecisionArr$values = $values();
        $VALUES = aiAccessDecisionArr$values;
        $ENTRIES = EnumEntriesKt.a(aiAccessDecisionArr$values);
    }

    private AiAccessDecision(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<AiAccessDecision> getEntries() {
        return $ENTRIES;
    }

    public static AiAccessDecision valueOf(String str) {
        return (AiAccessDecision) Enum.valueOf(AiAccessDecision.class, str);
    }

    public static AiAccessDecision[] values() {
        return (AiAccessDecision[]) $VALUES.clone();
    }
}
