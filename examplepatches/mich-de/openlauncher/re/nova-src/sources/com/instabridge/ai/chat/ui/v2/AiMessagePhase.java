package com.instabridge.ai.chat.ui.v2;

import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0006\b\u0080\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006¨\u0006\u0007"}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/AiMessagePhase;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;I)V", "THINKING", "STREAMING", "DONE", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AiMessagePhase {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ AiMessagePhase[] $VALUES;
    public static final AiMessagePhase THINKING = new AiMessagePhase("THINKING", 0);
    public static final AiMessagePhase STREAMING = new AiMessagePhase("STREAMING", 1);
    public static final AiMessagePhase DONE = new AiMessagePhase("DONE", 2);

    private static final /* synthetic */ AiMessagePhase[] $values() {
        return new AiMessagePhase[]{THINKING, STREAMING, DONE};
    }

    static {
        AiMessagePhase[] aiMessagePhaseArr$values = $values();
        $VALUES = aiMessagePhaseArr$values;
        $ENTRIES = EnumEntriesKt.a(aiMessagePhaseArr$values);
    }

    private AiMessagePhase(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<AiMessagePhase> getEntries() {
        return $ENTRIES;
    }

    public static AiMessagePhase valueOf(String str) {
        return (AiMessagePhase) Enum.valueOf(AiMessagePhase.class, str);
    }

    public static AiMessagePhase[] values() {
        return (AiMessagePhase[]) $VALUES.clone();
    }
}
