package com.moloco.sdk.publisher;

import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0005\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005¨\u0006\u0006"}, d2 = {"Lcom/moloco/sdk/publisher/Initialization;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;I)V", "SUCCESS", "FAILURE", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public final class Initialization {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ Initialization[] $VALUES;
    public static final Initialization SUCCESS = new Initialization("SUCCESS", 0);
    public static final Initialization FAILURE = new Initialization("FAILURE", 1);

    private static final /* synthetic */ Initialization[] $values() {
        return new Initialization[]{SUCCESS, FAILURE};
    }

    static {
        Initialization[] initializationArr$values = $values();
        $VALUES = initializationArr$values;
        $ENTRIES = EnumEntriesKt.a(initializationArr$values);
    }

    private Initialization(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<Initialization> getEntries() {
        return $ENTRIES;
    }

    public static Initialization valueOf(String str) {
        return (Initialization) Enum.valueOf(Initialization.class, str);
    }

    public static Initialization[] values() {
        return (Initialization[]) $VALUES.clone();
    }
}
