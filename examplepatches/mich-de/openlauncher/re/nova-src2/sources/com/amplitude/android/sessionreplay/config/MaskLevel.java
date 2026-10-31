package com.amplitude.android.sessionreplay.config;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import gn.c;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0005\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004j\u0002\b\u0005¨\u0006\u0006"}, d2 = {"Lcom/amplitude/android/sessionreplay/config/MaskLevel;", b.f42142b, "(Ljava/lang/String;I)V", "LIGHT", "MEDIUM", "CONSERVATIVE", "session-replay_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class MaskLevel {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ MaskLevel[] $VALUES;

    @c("light")
    public static final MaskLevel LIGHT = new MaskLevel("LIGHT", 0);

    @c("medium")
    public static final MaskLevel MEDIUM = new MaskLevel("MEDIUM", 1);

    @c("conservative")
    public static final MaskLevel CONSERVATIVE = new MaskLevel("CONSERVATIVE", 2);

    private static final /* synthetic */ MaskLevel[] $values() {
        return new MaskLevel[]{LIGHT, MEDIUM, CONSERVATIVE};
    }

    static {
        MaskLevel[] maskLevelArr$values = $values();
        $VALUES = maskLevelArr$values;
        $ENTRIES = EnumEntriesKt.a(maskLevelArr$values);
    }

    private MaskLevel(String str, int i5) {
    }

    public static EnumEntries<MaskLevel> getEntries() {
        return $ENTRIES;
    }

    public static MaskLevel valueOf(String str) {
        return (MaskLevel) Enum.valueOf(MaskLevel.class, str);
    }

    public static MaskLevel[] values() {
        return (MaskLevel[]) $VALUES.clone();
    }
}
