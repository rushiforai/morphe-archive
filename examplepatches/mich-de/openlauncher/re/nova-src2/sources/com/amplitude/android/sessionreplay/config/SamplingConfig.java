package com.amplitude.android.sessionreplay.config;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import gn.c;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0006\n\u0002\b\u000e\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0002\u0010\u0006J\u0010\u0010\r\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\bJ\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000bJ&\u0010\u000f\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0002\u0010\u0010J\u0013\u0010\u0011\u001a\u00020\u00032\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001R\u001a\u0010\u0002\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\n\n\u0002\u0010\t\u001a\u0004\b\u0007\u0010\bR\u001a\u0010\u0004\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\n\n\u0002\u0010\f\u001a\u0004\b\n\u0010\u000b¨\u0006\u0017"}, d2 = {"Lcom/amplitude/android/sessionreplay/config/SamplingConfig;", b.f42142b, "captureEnabled", b.f42142b, "sampleRate", b.f42142b, "(Ljava/lang/Boolean;Ljava/lang/Double;)V", "getCaptureEnabled", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "getSampleRate", "()Ljava/lang/Double;", "Ljava/lang/Double;", "component1", "component2", "copy", "(Ljava/lang/Boolean;Ljava/lang/Double;)Lcom/amplitude/android/sessionreplay/config/SamplingConfig;", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "session-replay_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class SamplingConfig {

    @c("capture_enabled")
    private final Boolean captureEnabled;

    @c("sample_rate")
    private final Double sampleRate;

    /* JADX WARN: Multi-variable type inference failed */
    public SamplingConfig() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    public static /* synthetic */ SamplingConfig copy$default(SamplingConfig samplingConfig, Boolean bool, Double d5, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            bool = samplingConfig.captureEnabled;
        }
        if ((i5 & 2) != 0) {
            d5 = samplingConfig.sampleRate;
        }
        return samplingConfig.copy(bool, d5);
    }

    /* renamed from: component1, reason: from getter */
    public final Boolean getCaptureEnabled() {
        return this.captureEnabled;
    }

    /* renamed from: component2, reason: from getter */
    public final Double getSampleRate() {
        return this.sampleRate;
    }

    public final SamplingConfig copy(Boolean captureEnabled, Double sampleRate) {
        return new SamplingConfig(captureEnabled, sampleRate);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SamplingConfig)) {
            return false;
        }
        SamplingConfig samplingConfig = (SamplingConfig) other;
        return Intrinsics.b(this.captureEnabled, samplingConfig.captureEnabled) && Intrinsics.b(this.sampleRate, samplingConfig.sampleRate);
    }

    public final Boolean getCaptureEnabled() {
        return this.captureEnabled;
    }

    public final Double getSampleRate() {
        return this.sampleRate;
    }

    public int hashCode() {
        Boolean bool = this.captureEnabled;
        int iHashCode = (bool == null ? 0 : bool.hashCode()) * 31;
        Double d5 = this.sampleRate;
        return iHashCode + (d5 != null ? d5.hashCode() : 0);
    }

    public String toString() {
        return "SamplingConfig(captureEnabled=" + this.captureEnabled + ", sampleRate=" + this.sampleRate + ")";
    }

    public SamplingConfig(Boolean bool, Double d5) {
        this.captureEnabled = bool;
        this.sampleRate = d5;
    }

    public /* synthetic */ SamplingConfig(Boolean bool, Double d5, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? Boolean.TRUE : bool, (i5 & 2) != 0 ? Double.valueOf(1.0d) : d5);
    }
}
