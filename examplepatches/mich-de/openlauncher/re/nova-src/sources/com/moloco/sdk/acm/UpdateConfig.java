package com.moloco.sdk.acm;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000bJ&\u0010\u000f\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0002\u0010\u0010J\u0013\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\f\u001a\u0004\b\n\u0010\u000b¨\u0006\u0017"}, d2 = {"Lcom/moloco/sdk/acm/UpdateConfig;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "postAnalyticsUrl", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "requestPeriodSeconds", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/Long;)V", "getPostAnalyticsUrl", "()Ljava/lang/String;", "getRequestPeriodSeconds", "()Ljava/lang/Long;", "Ljava/lang/Long;", "component1", "component2", "copy", "(Ljava/lang/String;Ljava/lang/Long;)Lcom/moloco/sdk/acm/UpdateConfig;", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "moloco-android-client-metrics_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public final /* data */ class UpdateConfig {

    @Nullable
    private final String postAnalyticsUrl;

    @Nullable
    private final Long requestPeriodSeconds;

    /* JADX WARN: Multi-variable type inference failed */
    public UpdateConfig() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    public static /* synthetic */ UpdateConfig copy$default(UpdateConfig updateConfig, String str, Long l9, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = updateConfig.postAnalyticsUrl;
        }
        if ((i5 & 2) != 0) {
            l9 = updateConfig.requestPeriodSeconds;
        }
        return updateConfig.copy(str, l9);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final String getPostAnalyticsUrl() {
        return this.postAnalyticsUrl;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final Long getRequestPeriodSeconds() {
        return this.requestPeriodSeconds;
    }

    @NotNull
    public final UpdateConfig copy(@Nullable String postAnalyticsUrl, @Nullable Long requestPeriodSeconds) {
        return new UpdateConfig(postAnalyticsUrl, requestPeriodSeconds);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UpdateConfig)) {
            return false;
        }
        UpdateConfig updateConfig = (UpdateConfig) other;
        return Intrinsics.b(this.postAnalyticsUrl, updateConfig.postAnalyticsUrl) && Intrinsics.b(this.requestPeriodSeconds, updateConfig.requestPeriodSeconds);
    }

    @Nullable
    public final String getPostAnalyticsUrl() {
        return this.postAnalyticsUrl;
    }

    @Nullable
    public final Long getRequestPeriodSeconds() {
        return this.requestPeriodSeconds;
    }

    public int hashCode() {
        String str = this.postAnalyticsUrl;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        Long l9 = this.requestPeriodSeconds;
        return iHashCode + (l9 != null ? l9.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        return "UpdateConfig(postAnalyticsUrl=" + this.postAnalyticsUrl + ", requestPeriodSeconds=" + this.requestPeriodSeconds + ')';
    }

    public UpdateConfig(@Nullable String str, @Nullable Long l9) {
        this.postAnalyticsUrl = str;
        this.requestPeriodSeconds = l9;
    }

    public /* synthetic */ UpdateConfig(String str, Long l9, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : str, (i5 & 2) != 0 ? null : l9);
    }
}
