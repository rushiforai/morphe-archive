package com.instabridge.ai.auth;

import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\t\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\bj\u0002\b\t¨\u0006\n"}, d2 = {"Lcom/instabridge/ai/auth/AiConsentErrorCategory;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;I)V", "AUTH", "NETWORK", "SERVER", "UNAVAILABLE", "STALE_SESSION", "UNKNOWN", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AiConsentErrorCategory {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ AiConsentErrorCategory[] $VALUES;
    public static final AiConsentErrorCategory AUTH = new AiConsentErrorCategory("AUTH", 0);
    public static final AiConsentErrorCategory NETWORK = new AiConsentErrorCategory("NETWORK", 1);
    public static final AiConsentErrorCategory SERVER = new AiConsentErrorCategory("SERVER", 2);
    public static final AiConsentErrorCategory UNAVAILABLE = new AiConsentErrorCategory("UNAVAILABLE", 3);
    public static final AiConsentErrorCategory STALE_SESSION = new AiConsentErrorCategory("STALE_SESSION", 4);
    public static final AiConsentErrorCategory UNKNOWN = new AiConsentErrorCategory("UNKNOWN", 5);

    private static final /* synthetic */ AiConsentErrorCategory[] $values() {
        return new AiConsentErrorCategory[]{AUTH, NETWORK, SERVER, UNAVAILABLE, STALE_SESSION, UNKNOWN};
    }

    static {
        AiConsentErrorCategory[] aiConsentErrorCategoryArr$values = $values();
        $VALUES = aiConsentErrorCategoryArr$values;
        $ENTRIES = EnumEntriesKt.a(aiConsentErrorCategoryArr$values);
    }

    private AiConsentErrorCategory(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<AiConsentErrorCategory> getEntries() {
        return $ENTRIES;
    }

    public static AiConsentErrorCategory valueOf(String str) {
        return (AiConsentErrorCategory) Enum.valueOf(AiConsentErrorCategory.class, str);
    }

    public static AiConsentErrorCategory[] values() {
        return (AiConsentErrorCategory[]) $VALUES.clone();
    }
}
