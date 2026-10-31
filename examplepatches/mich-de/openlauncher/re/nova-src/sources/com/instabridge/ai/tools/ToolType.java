package com.instabridge.ai.tools;

import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\t¨\u0006\n"}, d2 = {"Lcom/instabridge/ai/tools/ToolType;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "apiValue", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getApiValue", "()Ljava/lang/String;", "INFO_RETRIEVAL", "ACTION", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ToolType {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ ToolType[] $VALUES;

    @NotNull
    private final String apiValue;
    public static final ToolType INFO_RETRIEVAL = new ToolType("INFO_RETRIEVAL", 0, "info_retrieval");
    public static final ToolType ACTION = new ToolType("ACTION", 1, "action");

    private static final /* synthetic */ ToolType[] $values() {
        return new ToolType[]{INFO_RETRIEVAL, ACTION};
    }

    static {
        ToolType[] toolTypeArr$values = $values();
        $VALUES = toolTypeArr$values;
        $ENTRIES = EnumEntriesKt.a(toolTypeArr$values);
    }

    private ToolType(String str, int i5, String str2) {
        this.apiValue = str2;
    }

    @NotNull
    public static EnumEntries<ToolType> getEntries() {
        return $ENTRIES;
    }

    public static ToolType valueOf(String str) {
        return (ToolType) Enum.valueOf(ToolType.class, str);
    }

    public static ToolType[] values() {
        return (ToolType[]) $VALUES.clone();
    }

    @NotNull
    public final String getApiValue() {
        return this.apiValue;
    }
}
