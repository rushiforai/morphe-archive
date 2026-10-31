package com.amplitude.core;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0004\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004¨\u0006\u0005"}, d2 = {"Lcom/amplitude/core/ServerZone;", b.f42142b, "(Ljava/lang/String;I)V", "US", "EU", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class ServerZone {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ ServerZone[] $VALUES;
    public static final ServerZone US = new ServerZone("US", 0);
    public static final ServerZone EU = new ServerZone("EU", 1);

    private static final /* synthetic */ ServerZone[] $values() {
        return new ServerZone[]{US, EU};
    }

    static {
        ServerZone[] serverZoneArr$values = $values();
        $VALUES = serverZoneArr$values;
        $ENTRIES = EnumEntriesKt.a(serverZoneArr$values);
    }

    private ServerZone(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<ServerZone> getEntries() {
        return $ENTRIES;
    }

    public static ServerZone valueOf(String str) {
        return (ServerZone) Enum.valueOf(ServerZone.class, str);
    }

    public static ServerZone[] values() {
        return (ServerZone[]) $VALUES.clone();
    }
}
