package com.instabridge.ai.tools.bii;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000bj\u0002\b\f¨\u0006\r"}, d2 = {"Lcom/instabridge/ai/tools/bii/BIIParameterType;", b.f42142b, "jsonType", b.f42142b, "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getJsonType", "()Ljava/lang/String;", "STRING", "NUMBER", "INTEGER", "BOOLEAN", "ARRAY", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class BIIParameterType {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ BIIParameterType[] $VALUES;

    @NotNull
    private final String jsonType;
    public static final BIIParameterType STRING = new BIIParameterType("STRING", 0, "string");
    public static final BIIParameterType NUMBER = new BIIParameterType("NUMBER", 1, "number");
    public static final BIIParameterType INTEGER = new BIIParameterType("INTEGER", 2, "integer");
    public static final BIIParameterType BOOLEAN = new BIIParameterType("BOOLEAN", 3, "boolean");
    public static final BIIParameterType ARRAY = new BIIParameterType("ARRAY", 4, "array");

    private static final /* synthetic */ BIIParameterType[] $values() {
        return new BIIParameterType[]{STRING, NUMBER, INTEGER, BOOLEAN, ARRAY};
    }

    static {
        BIIParameterType[] bIIParameterTypeArr$values = $values();
        $VALUES = bIIParameterTypeArr$values;
        $ENTRIES = EnumEntriesKt.a(bIIParameterTypeArr$values);
    }

    private BIIParameterType(String str, int i5, String str2) {
        this.jsonType = str2;
    }

    @NotNull
    public static EnumEntries<BIIParameterType> getEntries() {
        return $ENTRIES;
    }

    public static BIIParameterType valueOf(String str) {
        return (BIIParameterType) Enum.valueOf(BIIParameterType.class, str);
    }

    public static BIIParameterType[] values() {
        return (BIIParameterType[]) $VALUES.clone();
    }

    @NotNull
    public final String getJsonType() {
        return this.jsonType;
    }
}
