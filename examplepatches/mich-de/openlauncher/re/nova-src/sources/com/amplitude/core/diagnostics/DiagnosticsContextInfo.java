package com.amplitude.core.diagnostics;

import b.c0;
import com.amplitude.android.TrackingOptions;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0015\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B7\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\tJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0003HÆ\u0003JG\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0018\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001b\u001a\u00020\u001cHÖ\u0001J\t\u0010\u001d\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000bR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000bR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000bR\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000b¨\u0006\u001e"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsContextInfo;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "manufacturer", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "model", "osName", "osVersion", TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, "appVersion", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getAppVersion", "()Ljava/lang/String;", "getManufacturer", "getModel", "getOsName", "getOsVersion", "getPlatform", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class DiagnosticsContextInfo {

    @Nullable
    private final String appVersion;

    @NotNull
    private final String manufacturer;

    @NotNull
    private final String model;

    @NotNull
    private final String osName;

    @NotNull
    private final String osVersion;

    @NotNull
    private final String platform;

    public DiagnosticsContextInfo(@NotNull String manufacturer, @NotNull String model, @NotNull String osName, @NotNull String osVersion, @NotNull String platform, @Nullable String str) {
        Intrinsics.g(manufacturer, "manufacturer");
        Intrinsics.g(model, "model");
        Intrinsics.g(osName, "osName");
        Intrinsics.g(osVersion, "osVersion");
        Intrinsics.g(platform, "platform");
        this.manufacturer = manufacturer;
        this.model = model;
        this.osName = osName;
        this.osVersion = osVersion;
        this.platform = platform;
        this.appVersion = str;
    }

    public static /* synthetic */ DiagnosticsContextInfo copy$default(DiagnosticsContextInfo diagnosticsContextInfo, String str, String str2, String str3, String str4, String str5, String str6, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = diagnosticsContextInfo.manufacturer;
        }
        if ((i5 & 2) != 0) {
            str2 = diagnosticsContextInfo.model;
        }
        if ((i5 & 4) != 0) {
            str3 = diagnosticsContextInfo.osName;
        }
        if ((i5 & 8) != 0) {
            str4 = diagnosticsContextInfo.osVersion;
        }
        if ((i5 & 16) != 0) {
            str5 = diagnosticsContextInfo.platform;
        }
        if ((i5 & 32) != 0) {
            str6 = diagnosticsContextInfo.appVersion;
        }
        String str7 = str5;
        String str8 = str6;
        return diagnosticsContextInfo.copy(str, str2, str3, str4, str7, str8);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getManufacturer() {
        return this.manufacturer;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getModel() {
        return this.model;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getOsName() {
        return this.osName;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final String getOsVersion() {
        return this.osVersion;
    }

    @NotNull
    /* renamed from: component5, reason: from getter */
    public final String getPlatform() {
        return this.platform;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getAppVersion() {
        return this.appVersion;
    }

    @NotNull
    public final DiagnosticsContextInfo copy(@NotNull String manufacturer, @NotNull String model, @NotNull String osName, @NotNull String osVersion, @NotNull String platform, @Nullable String appVersion) {
        Intrinsics.g(manufacturer, "manufacturer");
        Intrinsics.g(model, "model");
        Intrinsics.g(osName, "osName");
        Intrinsics.g(osVersion, "osVersion");
        Intrinsics.g(platform, "platform");
        return new DiagnosticsContextInfo(manufacturer, model, osName, osVersion, platform, appVersion);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof DiagnosticsContextInfo)) {
            return false;
        }
        DiagnosticsContextInfo diagnosticsContextInfo = (DiagnosticsContextInfo) other;
        return Intrinsics.b(this.manufacturer, diagnosticsContextInfo.manufacturer) && Intrinsics.b(this.model, diagnosticsContextInfo.model) && Intrinsics.b(this.osName, diagnosticsContextInfo.osName) && Intrinsics.b(this.osVersion, diagnosticsContextInfo.osVersion) && Intrinsics.b(this.platform, diagnosticsContextInfo.platform) && Intrinsics.b(this.appVersion, diagnosticsContextInfo.appVersion);
    }

    @Nullable
    public final String getAppVersion() {
        return this.appVersion;
    }

    @NotNull
    public final String getManufacturer() {
        return this.manufacturer;
    }

    @NotNull
    public final String getModel() {
        return this.model;
    }

    @NotNull
    public final String getOsName() {
        return this.osName;
    }

    @NotNull
    public final String getOsVersion() {
        return this.osVersion;
    }

    @NotNull
    public final String getPlatform() {
        return this.platform;
    }

    public int hashCode() {
        int iE = c0.e(c0.e(c0.e(c0.e(this.manufacturer.hashCode() * 31, 31, this.model), 31, this.osName), 31, this.osVersion), 31, this.platform);
        String str = this.appVersion;
        return iE + (str == null ? 0 : str.hashCode());
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("DiagnosticsContextInfo(manufacturer=");
        sb2.append(this.manufacturer);
        sb2.append(", model=");
        sb2.append(this.model);
        sb2.append(", osName=");
        sb2.append(this.osName);
        sb2.append(", osVersion=");
        sb2.append(this.osVersion);
        sb2.append(", platform=");
        sb2.append(this.platform);
        sb2.append(", appVersion=");
        return c1.t(sb2, this.appVersion, ')');
    }
}
