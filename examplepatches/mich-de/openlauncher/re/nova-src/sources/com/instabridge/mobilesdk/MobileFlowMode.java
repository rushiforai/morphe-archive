package com.instabridge.mobilesdk;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0006\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/MobileFlowMode;", b.f42142b, "<init>", "(Ljava/lang/String;I)V", "BASE", "BOOSTER", "TRAVEL", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class MobileFlowMode {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ MobileFlowMode[] $VALUES;
    public static final MobileFlowMode BASE = new MobileFlowMode("BASE", 0);
    public static final MobileFlowMode BOOSTER = new MobileFlowMode("BOOSTER", 1);
    public static final MobileFlowMode TRAVEL = new MobileFlowMode("TRAVEL", 2);

    private static final /* synthetic */ MobileFlowMode[] $values() {
        return new MobileFlowMode[]{BASE, BOOSTER, TRAVEL};
    }

    static {
        MobileFlowMode[] mobileFlowModeArr$values = $values();
        $VALUES = mobileFlowModeArr$values;
        $ENTRIES = EnumEntriesKt.a(mobileFlowModeArr$values);
    }

    private MobileFlowMode(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<MobileFlowMode> getEntries() {
        return $ENTRIES;
    }

    public static MobileFlowMode valueOf(String str) {
        return (MobileFlowMode) Enum.valueOf(MobileFlowMode.class, str);
    }

    public static MobileFlowMode[] values() {
        return (MobileFlowMode[]) $VALUES.clone();
    }
}
