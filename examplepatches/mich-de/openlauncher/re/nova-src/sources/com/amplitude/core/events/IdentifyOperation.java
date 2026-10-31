package com.amplitude.core.events;

import com.amplitude.analytics.connector.IdentityStoreKt;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u000e\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u000f\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006j\u0002\b\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010¨\u0006\u0011"}, d2 = {"Lcom/amplitude/core/events/IdentifyOperation;", b.f42142b, "operationType", b.f42142b, "(Ljava/lang/String;ILjava/lang/String;)V", "getOperationType", "()Ljava/lang/String;", "SET", "SET_ONCE", "ADD", "APPEND", "CLEAR_ALL", "PREPEND", "UNSET", "PRE_INSERT", "POST_INSERT", "REMOVE", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class IdentifyOperation {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ IdentifyOperation[] $VALUES;

    @NotNull
    private final String operationType;
    public static final IdentifyOperation SET = new IdentifyOperation("SET", 0, IdentityStoreKt.ID_OP_SET);
    public static final IdentifyOperation SET_ONCE = new IdentifyOperation("SET_ONCE", 1, "$setOnce");
    public static final IdentifyOperation ADD = new IdentifyOperation("ADD", 2, "$add");
    public static final IdentifyOperation APPEND = new IdentifyOperation("APPEND", 3, "$append");
    public static final IdentifyOperation CLEAR_ALL = new IdentifyOperation("CLEAR_ALL", 4, IdentityStoreKt.ID_OP_CLEAR_ALL);
    public static final IdentifyOperation PREPEND = new IdentifyOperation("PREPEND", 5, "$prepend");
    public static final IdentifyOperation UNSET = new IdentifyOperation("UNSET", 6, IdentityStoreKt.ID_OP_UNSET);
    public static final IdentifyOperation PRE_INSERT = new IdentifyOperation("PRE_INSERT", 7, "$preInsert");
    public static final IdentifyOperation POST_INSERT = new IdentifyOperation("POST_INSERT", 8, "$postInsert");
    public static final IdentifyOperation REMOVE = new IdentifyOperation("REMOVE", 9, "$remove");

    private static final /* synthetic */ IdentifyOperation[] $values() {
        return new IdentifyOperation[]{SET, SET_ONCE, ADD, APPEND, CLEAR_ALL, PREPEND, UNSET, PRE_INSERT, POST_INSERT, REMOVE};
    }

    static {
        IdentifyOperation[] identifyOperationArr$values = $values();
        $VALUES = identifyOperationArr$values;
        $ENTRIES = EnumEntriesKt.a(identifyOperationArr$values);
    }

    private IdentifyOperation(String str, int i5, String str2) {
        this.operationType = str2;
    }

    @NotNull
    public static EnumEntries<IdentifyOperation> getEntries() {
        return $ENTRIES;
    }

    public static IdentifyOperation valueOf(String str) {
        return (IdentifyOperation) Enum.valueOf(IdentifyOperation.class, str);
    }

    public static IdentifyOperation[] values() {
        return (IdentifyOperation[]) $VALUES.clone();
    }

    @NotNull
    public final String getOperationType() {
        return this.operationType;
    }
}
