package com.userleap.internal.data;

import defpackage.ch5;
import defpackage.g76;
import defpackage.gy2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u000e\n\u0002\b\u0014\b\u0081\b\u0018\u0000 &2\u00020\u0001:\u0001'BI\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0005\u0012\u0010\b\u0002\u0010\u000f\u001a\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\b\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b$\u0010%J\u0012\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0003\u0010\u0004J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u0011\u0010\t\u001a\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\bHÆ\u0003J\u0012\u0010\n\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0004\b\n\u0010\u0007J\u000b\u0010\f\u001a\u0004\u0018\u00010\u000bHÆ\u0003JR\u0010\u0012\u001a\u00020\u00002\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00052\u0010\b\u0002\u0010\u000f\u001a\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\b2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u000bHÆ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\t\u0010\u0015\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0005HÖ\u0001J\u0013\u0010\u0018\u001a\u00020\u00022\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003R\u0019\u0010\r\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\r\u0010\u0019\u001a\u0004\b\u001a\u0010\u0004R\u0019\u0010\u000e\u001a\u0004\u0018\u00010\u00058\u0006¢\u0006\f\n\u0004\b\u000e\u0010\u001b\u001a\u0004\b\u001c\u0010\u0007R\u001f\u0010\u000f\u001a\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\b8\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u001d\u001a\u0004\b\u001e\u0010\u001fR\u0019\u0010\u0010\u001a\u0004\u0018\u00010\u00058\u0006¢\u0006\f\n\u0004\b\u0010\u0010\u001b\u001a\u0004\b \u0010\u0007R\u0019\u0010\u0011\u001a\u0004\u0018\u00010\u000b8\u0006¢\u0006\f\n\u0004\b\u0011\u0010!\u001a\u0004\b\"\u0010#¨\u0006("}, d2 = {"Lcom/userleap/internal/data/SdkConfig;", "", "", "component1", "()Ljava/lang/Boolean;", "", "component2", "()Ljava/lang/Integer;", "", "component3", "component4", "Lcom/userleap/internal/data/MobileReplaySettings;", "component5", "mobileMetricsReportingEnabled", "metricsReportingInterval", "metricsThresholds", "maxMobileReplayDurationSeconds", "mobileReplaySettings", "copy", "(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/util/List;Ljava/lang/Integer;Lcom/userleap/internal/data/MobileReplaySettings;)Lcom/userleap/internal/data/SdkConfig;", "", "toString", "hashCode", "other", "equals", "Ljava/lang/Boolean;", "getMobileMetricsReportingEnabled", "Ljava/lang/Integer;", "getMetricsReportingInterval", "Ljava/util/List;", "getMetricsThresholds", "()Ljava/util/List;", "getMaxMobileReplayDurationSeconds", "Lcom/userleap/internal/data/MobileReplaySettings;", "getMobileReplaySettings", "()Lcom/userleap/internal/data/MobileReplaySettings;", "<init>", "(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/util/List;Ljava/lang/Integer;Lcom/userleap/internal/data/MobileReplaySettings;)V", "Companion", "a", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final /* data */ class SdkConfig {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private static boolean _isReady;
    private static SdkConfig instance;
    private final Integer maxMobileReplayDurationSeconds;
    private final Integer metricsReportingInterval;
    private final List<Object> metricsThresholds;
    private final Boolean mobileMetricsReportingEnabled;
    private final MobileReplaySettings mobileReplaySettings;

    public /* synthetic */ SdkConfig(Boolean bool, Integer num, List list, Integer num2, MobileReplaySettings mobileReplaySettings, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : bool, (i & 2) != 0 ? null : num, (i & 4) != 0 ? null : list, (i & 8) != 0 ? null : num2, (i & 16) != 0 ? null : mobileReplaySettings);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ SdkConfig copy$default(SdkConfig sdkConfig, Boolean bool, Integer num, List list, Integer num2, MobileReplaySettings mobileReplaySettings, int i, Object obj) {
        if ((i & 1) != 0) {
            bool = sdkConfig.mobileMetricsReportingEnabled;
        }
        if ((i & 2) != 0) {
            num = sdkConfig.metricsReportingInterval;
        }
        if ((i & 4) != 0) {
            list = sdkConfig.metricsThresholds;
        }
        if ((i & 8) != 0) {
            num2 = sdkConfig.maxMobileReplayDurationSeconds;
        }
        if ((i & 16) != 0) {
            mobileReplaySettings = sdkConfig.mobileReplaySettings;
        }
        MobileReplaySettings mobileReplaySettings2 = mobileReplaySettings;
        List list2 = list;
        return sdkConfig.copy(bool, num, list2, num2, mobileReplaySettings2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final Boolean getMobileMetricsReportingEnabled() {
        return this.mobileMetricsReportingEnabled;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final Integer getMetricsReportingInterval() {
        return this.metricsReportingInterval;
    }

    public final List<Object> component3() {
        return this.metricsThresholds;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final Integer getMaxMobileReplayDurationSeconds() {
        return this.maxMobileReplayDurationSeconds;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final MobileReplaySettings getMobileReplaySettings() {
        return this.mobileReplaySettings;
    }

    public final SdkConfig copy(Boolean mobileMetricsReportingEnabled, Integer metricsReportingInterval, List<? extends Object> metricsThresholds, Integer maxMobileReplayDurationSeconds, MobileReplaySettings mobileReplaySettings) {
        return new SdkConfig(mobileMetricsReportingEnabled, metricsReportingInterval, metricsThresholds, maxMobileReplayDurationSeconds, mobileReplaySettings);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SdkConfig)) {
            return false;
        }
        SdkConfig sdkConfig = (SdkConfig) other;
        return g76.L(this.mobileMetricsReportingEnabled, sdkConfig.mobileMetricsReportingEnabled) && g76.L(this.metricsReportingInterval, sdkConfig.metricsReportingInterval) && g76.L(this.metricsThresholds, sdkConfig.metricsThresholds) && g76.L(this.maxMobileReplayDurationSeconds, sdkConfig.maxMobileReplayDurationSeconds) && g76.L(this.mobileReplaySettings, sdkConfig.mobileReplaySettings);
    }

    public final Integer getMaxMobileReplayDurationSeconds() {
        return this.maxMobileReplayDurationSeconds;
    }

    public final Integer getMetricsReportingInterval() {
        return this.metricsReportingInterval;
    }

    public final List<Object> getMetricsThresholds() {
        return this.metricsThresholds;
    }

    public final Boolean getMobileMetricsReportingEnabled() {
        return this.mobileMetricsReportingEnabled;
    }

    public final MobileReplaySettings getMobileReplaySettings() {
        return this.mobileReplaySettings;
    }

    public int hashCode() {
        Boolean bool = this.mobileMetricsReportingEnabled;
        int iHashCode = (bool == null ? 0 : bool.hashCode()) * 31;
        Integer num = this.metricsReportingInterval;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        List<Object> list = this.metricsThresholds;
        int iHashCode3 = (iHashCode2 + (list == null ? 0 : list.hashCode())) * 31;
        Integer num2 = this.maxMobileReplayDurationSeconds;
        int iHashCode4 = (iHashCode3 + (num2 == null ? 0 : num2.hashCode())) * 31;
        MobileReplaySettings mobileReplaySettings = this.mobileReplaySettings;
        return iHashCode4 + (mobileReplaySettings != null ? mobileReplaySettings.hashCode() : 0);
    }

    public String toString() {
        return "SdkConfig(mobileMetricsReportingEnabled=" + this.mobileMetricsReportingEnabled + ", metricsReportingInterval=" + this.metricsReportingInterval + ", metricsThresholds=" + this.metricsThresholds + ", maxMobileReplayDurationSeconds=" + this.maxMobileReplayDurationSeconds + ", mobileReplaySettings=" + this.mobileReplaySettings + ")";
    }

    /* JADX INFO: renamed from: com.userleap.internal.data.SdkConfig$a, reason: from kotlin metadata */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\t\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0007\u0010\bJ\u0011\u0010\f\u001a\u0004\u0018\u00010\tH\u0000¢\u0006\u0004\b\n\u0010\u000bJ\u0017\u0010\u0010\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\tH\u0000¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0012\u001a\u00020\u0006H\u0000¢\u0006\u0004\b\u0011\u0010\u0003R\u0011\u0010\u0014\u001a\u00020\u00138F¢\u0006\u0006\u001a\u0004\b\u0014\u0010\u0015R(\u0010\u0017\u001a\u0004\u0018\u00010\t2\b\u0010\u0016\u001a\u0004\u0018\u00010\t8\u0002@BX\u0082\u000e¢\u0006\f\n\u0004\b\u0017\u0010\u0018\"\u0004\b\u0019\u0010\u000fR\u0016\u0010\u001a\u001a\u00020\u00138\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u001a\u0010\u001b¨\u0006\u001c"}, d2 = {"Lcom/userleap/internal/data/SdkConfig$a;", "", "<init>", "()V", "", "json", "Lc1e;", "setFromWebSdkJson", "(Ljava/lang/String;)V", "Lcom/userleap/internal/data/SdkConfig;", "get$userleap_release", "()Lcom/userleap/internal/data/SdkConfig;", "get", "override", "set$userleap_release", "(Lcom/userleap/internal/data/SdkConfig;)V", "set", "resetForReconfig$userleap_release", "resetForReconfig", "", "isReady", "()Z", "value", "instance", "Lcom/userleap/internal/data/SdkConfig;", "a", "_isReady", "Z", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        public final void a(SdkConfig sdkConfig) {
            SdkConfig.instance = sdkConfig;
            SdkConfig._isReady = true;
        }

        public final SdkConfig get$userleap_release() {
            return SdkConfig.instance;
        }

        public final boolean isReady() {
            return SdkConfig._isReady;
        }

        public final void resetForReconfig$userleap_release() {
            SdkConfig._isReady = false;
        }

        public final void set$userleap_release(SdkConfig override) {
            override.getClass();
            a(override);
        }

        public final void setFromWebSdkJson(String json) {
            json.getClass();
            a((SdkConfig) new ch5().c(SdkConfig.class, json));
        }

        private Companion() {
        }
    }

    public SdkConfig(Boolean bool, Integer num, List<? extends Object> list, Integer num2, MobileReplaySettings mobileReplaySettings) {
        this.mobileMetricsReportingEnabled = bool;
        this.metricsReportingInterval = num;
        this.metricsThresholds = list;
        this.maxMobileReplayDurationSeconds = num2;
        this.mobileReplaySettings = mobileReplaySettings;
    }

    public SdkConfig() {
        this(null, null, null, null, null, 31, null);
    }
}
