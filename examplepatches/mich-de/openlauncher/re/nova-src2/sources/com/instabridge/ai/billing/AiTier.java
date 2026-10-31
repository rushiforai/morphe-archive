package com.instabridge.ai.billing;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0006\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006¨\u0006\u0007"}, d2 = {"Lcom/instabridge/ai/billing/AiTier;", b.f42142b, "<init>", "(Ljava/lang/String;I)V", "FREE", "PLUS", "PRO", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AiTier {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ AiTier[] $VALUES;
    public static final AiTier FREE = new AiTier("FREE", 0);
    public static final AiTier PLUS = new AiTier("PLUS", 1);
    public static final AiTier PRO = new AiTier("PRO", 2);

    private static final /* synthetic */ AiTier[] $values() {
        return new AiTier[]{FREE, PLUS, PRO};
    }

    static {
        AiTier[] aiTierArr$values = $values();
        $VALUES = aiTierArr$values;
        $ENTRIES = EnumEntriesKt.a(aiTierArr$values);
    }

    private AiTier(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<AiTier> getEntries() {
        return $ENTRIES;
    }

    public static AiTier valueOf(String str) {
        return (AiTier) Enum.valueOf(AiTier.class, str);
    }

    public static AiTier[] values() {
        return (AiTier[]) $VALUES.clone();
    }
}
