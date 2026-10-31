package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.R;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\n\b\u0080\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B%\b\u0002\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rj\u0002\b\u000ej\u0002\b\u000f¨\u0006\u0010"}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/screens/DashboardTab;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "labelRes", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "iconRes", "analyticsName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;IIILjava/lang/String;)V", "getLabelRes", "()I", "getIconRes", "getAnalyticsName", "()Ljava/lang/String;", "MY_PLAN", "TRAVEL", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class DashboardTab {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ DashboardTab[] $VALUES;
    public static final DashboardTab MY_PLAN = new DashboardTab("MY_PLAN", 0, R.string.mobile_sdk_travel_tab_my_plan, R.drawable.mobile_sdk_ic_esim, "my_plan");
    public static final DashboardTab TRAVEL = new DashboardTab("TRAVEL", 1, R.string.mobile_sdk_travel_tab_travel, R.drawable.mobile_sdk_ic_travel, "travel");

    @NotNull
    private final String analyticsName;
    private final int iconRes;
    private final int labelRes;

    private static final /* synthetic */ DashboardTab[] $values() {
        return new DashboardTab[]{MY_PLAN, TRAVEL};
    }

    static {
        DashboardTab[] dashboardTabArr$values = $values();
        $VALUES = dashboardTabArr$values;
        $ENTRIES = EnumEntriesKt.a(dashboardTabArr$values);
    }

    private DashboardTab(String str, int i5, int i11, int i12, String str2) {
        this.labelRes = i11;
        this.iconRes = i12;
        this.analyticsName = str2;
    }

    @NotNull
    public static EnumEntries<DashboardTab> getEntries() {
        return $ENTRIES;
    }

    public static DashboardTab valueOf(String str) {
        return (DashboardTab) Enum.valueOf(DashboardTab.class, str);
    }

    public static DashboardTab[] values() {
        return (DashboardTab[]) $VALUES.clone();
    }

    @NotNull
    public final String getAnalyticsName() {
        return this.analyticsName;
    }

    public final int getIconRes() {
        return this.iconRes;
    }

    public final int getLabelRes() {
        return this.labelRes;
    }
}
