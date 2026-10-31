package com.amplitude.core.platform;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0004\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004¨\u0006\u0005"}, d2 = {"Lcom/amplitude/core/platform/WriteQueueMessageType;", b.f42142b, "(Ljava/lang/String;I)V", "EVENT", "FLUSH", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class WriteQueueMessageType {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ WriteQueueMessageType[] $VALUES;
    public static final WriteQueueMessageType EVENT = new WriteQueueMessageType("EVENT", 0);
    public static final WriteQueueMessageType FLUSH = new WriteQueueMessageType("FLUSH", 1);

    private static final /* synthetic */ WriteQueueMessageType[] $values() {
        return new WriteQueueMessageType[]{EVENT, FLUSH};
    }

    static {
        WriteQueueMessageType[] writeQueueMessageTypeArr$values = $values();
        $VALUES = writeQueueMessageTypeArr$values;
        $ENTRIES = EnumEntriesKt.a(writeQueueMessageTypeArr$values);
    }

    private WriteQueueMessageType(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<WriteQueueMessageType> getEntries() {
        return $ENTRIES;
    }

    public static WriteQueueMessageType valueOf(String str) {
        return (WriteQueueMessageType) Enum.valueOf(WriteQueueMessageType.class, str);
    }

    public static WriteQueueMessageType[] values() {
        return (WriteQueueMessageType[]) $VALUES.clone();
    }
}
