package com.stripe.android.financialconnections.model;

import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\r\b\u0087\u0081\u0002\u0018\u0000 \t2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0002\n\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0006\u001a\u0004\b\u0007\u0010\bj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u000f"}, d2 = {"Lcom/stripe/android/financialconnections/model/ManualEntryMode;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "Ljava/lang/String;", "getValue", "()Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "xr/p", "xr/o", "AUTOMATIC", "CUSTOM", "UNKNOWN", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable(with = xr.p.class)
/* loaded from: classes4.dex */
public final class ManualEntryMode {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ ManualEntryMode[] $VALUES;

    @NotNull
    public static final xr.o Companion;

    @NotNull
    private final String value;

    @SerialName("automatic")
    public static final ManualEntryMode AUTOMATIC = new ManualEntryMode("AUTOMATIC", 0, "automatic");

    @SerialName("custom")
    public static final ManualEntryMode CUSTOM = new ManualEntryMode("CUSTOM", 1, "custom");

    @SerialName("unknown")
    public static final ManualEntryMode UNKNOWN = new ManualEntryMode("UNKNOWN", 2, "unknown");

    private static final /* synthetic */ ManualEntryMode[] $values() {
        return new ManualEntryMode[]{AUTOMATIC, CUSTOM, UNKNOWN};
    }

    static {
        ManualEntryMode[] manualEntryModeArr$values = $values();
        $VALUES = manualEntryModeArr$values;
        $ENTRIES = EnumEntriesKt.a(manualEntryModeArr$values);
        Companion = new xr.o();
    }

    private ManualEntryMode(String str, int i5, String str2) {
        this.value = str2;
    }

    @NotNull
    public static EnumEntries<ManualEntryMode> getEntries() {
        return $ENTRIES;
    }

    public static ManualEntryMode valueOf(String str) {
        return (ManualEntryMode) Enum.valueOf(ManualEntryMode.class, str);
    }

    public static ManualEntryMode[] values() {
        return (ManualEntryMode[]) $VALUES.clone();
    }

    @NotNull
    public final String getValue() {
        return this.value;
    }
}
