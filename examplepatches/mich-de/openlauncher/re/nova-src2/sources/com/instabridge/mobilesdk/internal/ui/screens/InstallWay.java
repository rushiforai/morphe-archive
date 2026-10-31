package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.R;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\b\u0080\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u001b\b\u0002\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u000f"}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/screens/InstallWay;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "labelRes", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "analyticsName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;IILjava/lang/String;)V", "getLabelRes", "()I", "getAnalyticsName", "()Ljava/lang/String;", "ONE_TAP", "QR", "MANUAL", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class InstallWay {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ InstallWay[] $VALUES;

    @NotNull
    private final String analyticsName;
    private final int labelRes;
    public static final InstallWay ONE_TAP = new InstallWay("ONE_TAP", 0, R.string.mobile_sdk_travel_way_one_tap, "one_tap");
    public static final InstallWay QR = new InstallWay("QR", 1, R.string.mobile_sdk_travel_way_qr, "qr");
    public static final InstallWay MANUAL = new InstallWay("MANUAL", 2, R.string.mobile_sdk_travel_way_manual, "manual");

    private static final /* synthetic */ InstallWay[] $values() {
        return new InstallWay[]{ONE_TAP, QR, MANUAL};
    }

    static {
        InstallWay[] installWayArr$values = $values();
        $VALUES = installWayArr$values;
        $ENTRIES = EnumEntriesKt.a(installWayArr$values);
    }

    private InstallWay(String str, int i5, int i11, String str2) {
        this.labelRes = i11;
        this.analyticsName = str2;
    }

    @NotNull
    public static EnumEntries<InstallWay> getEntries() {
        return $ENTRIES;
    }

    public static InstallWay valueOf(String str) {
        return (InstallWay) Enum.valueOf(InstallWay.class, str);
    }

    public static InstallWay[] values() {
        return (InstallWay[]) $VALUES.clone();
    }

    @NotNull
    public final String getAnalyticsName() {
        return this.analyticsName;
    }

    public final int getLabelRes() {
        return this.labelRes;
    }
}
