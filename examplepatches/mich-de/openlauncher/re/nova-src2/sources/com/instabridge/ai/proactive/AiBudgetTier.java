package com.instabridge.ai.proactive;

import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\b\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\b¨\u0006\t"}, d2 = {"Lcom/instabridge/ai/proactive/AiBudgetTier;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;I)V", "T0", "T1", "T2", "T3", "T4", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AiBudgetTier {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ AiBudgetTier[] $VALUES;
    public static final AiBudgetTier T0 = new AiBudgetTier("T0", 0);
    public static final AiBudgetTier T1 = new AiBudgetTier("T1", 1);
    public static final AiBudgetTier T2 = new AiBudgetTier("T2", 2);
    public static final AiBudgetTier T3 = new AiBudgetTier("T3", 3);
    public static final AiBudgetTier T4 = new AiBudgetTier("T4", 4);

    private static final /* synthetic */ AiBudgetTier[] $values() {
        return new AiBudgetTier[]{T0, T1, T2, T3, T4};
    }

    static {
        AiBudgetTier[] aiBudgetTierArr$values = $values();
        $VALUES = aiBudgetTierArr$values;
        $ENTRIES = EnumEntriesKt.a(aiBudgetTierArr$values);
    }

    private AiBudgetTier(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<AiBudgetTier> getEntries() {
        return $ENTRIES;
    }

    public static AiBudgetTier valueOf(String str) {
        return (AiBudgetTier) Enum.valueOf(AiBudgetTier.class, str);
    }

    public static AiBudgetTier[] values() {
        return (AiBudgetTier[]) $VALUES.clone();
    }
}
