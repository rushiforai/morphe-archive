package com.instabridge.ai.prompts;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\t\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\bj\u0002\b\t¨\u0006\n"}, d2 = {"Lcom/instabridge/ai/prompts/PromptCategory;", b.f42142b, "<init>", "(Ljava/lang/String;I)V", "CROSS_CONTEXT", "ANTICIPATORY", "TASTE", "SOCIAL", "REFLECTIVE", "LOCAL_DISCOVERY", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class PromptCategory {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ PromptCategory[] $VALUES;
    public static final PromptCategory CROSS_CONTEXT = new PromptCategory("CROSS_CONTEXT", 0);
    public static final PromptCategory ANTICIPATORY = new PromptCategory("ANTICIPATORY", 1);
    public static final PromptCategory TASTE = new PromptCategory("TASTE", 2);
    public static final PromptCategory SOCIAL = new PromptCategory("SOCIAL", 3);
    public static final PromptCategory REFLECTIVE = new PromptCategory("REFLECTIVE", 4);
    public static final PromptCategory LOCAL_DISCOVERY = new PromptCategory("LOCAL_DISCOVERY", 5);

    private static final /* synthetic */ PromptCategory[] $values() {
        return new PromptCategory[]{CROSS_CONTEXT, ANTICIPATORY, TASTE, SOCIAL, REFLECTIVE, LOCAL_DISCOVERY};
    }

    static {
        PromptCategory[] promptCategoryArr$values = $values();
        $VALUES = promptCategoryArr$values;
        $ENTRIES = EnumEntriesKt.a(promptCategoryArr$values);
    }

    private PromptCategory(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<PromptCategory> getEntries() {
        return $ENTRIES;
    }

    public static PromptCategory valueOf(String str) {
        return (PromptCategory) Enum.valueOf(PromptCategory.class, str);
    }

    public static PromptCategory[] values() {
        return (PromptCategory[]) $VALUES.clone();
    }
}
