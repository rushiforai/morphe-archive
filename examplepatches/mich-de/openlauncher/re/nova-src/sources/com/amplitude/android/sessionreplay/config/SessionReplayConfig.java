package com.amplitude.android.sessionreplay.config;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import gn.c;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0002\u0010\u0006J\u000b\u0010\u000b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J!\u0010\r\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u000f2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001R\u0018\u0010\u0002\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0018\u0010\u0004\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\n¨\u0006\u0015"}, d2 = {"Lcom/amplitude/android/sessionreplay/config/SessionReplayConfig;", b.f42142b, "privacyConfig", "Lcom/amplitude/android/sessionreplay/config/PrivacyConfig;", "samplingConfig", "Lcom/amplitude/android/sessionreplay/config/SamplingConfig;", "(Lcom/amplitude/android/sessionreplay/config/PrivacyConfig;Lcom/amplitude/android/sessionreplay/config/SamplingConfig;)V", "getPrivacyConfig", "()Lcom/amplitude/android/sessionreplay/config/PrivacyConfig;", "getSamplingConfig", "()Lcom/amplitude/android/sessionreplay/config/SamplingConfig;", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "session-replay_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class SessionReplayConfig {

    @c("sr_android_privacy_config")
    private final PrivacyConfig privacyConfig;

    @c("sr_android_sampling_config")
    private final SamplingConfig samplingConfig;

    /* JADX WARN: Multi-variable type inference failed */
    public SessionReplayConfig() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    public static /* synthetic */ SessionReplayConfig copy$default(SessionReplayConfig sessionReplayConfig, PrivacyConfig privacyConfig, SamplingConfig samplingConfig, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            privacyConfig = sessionReplayConfig.privacyConfig;
        }
        if ((i5 & 2) != 0) {
            samplingConfig = sessionReplayConfig.samplingConfig;
        }
        return sessionReplayConfig.copy(privacyConfig, samplingConfig);
    }

    /* renamed from: component1, reason: from getter */
    public final PrivacyConfig getPrivacyConfig() {
        return this.privacyConfig;
    }

    /* renamed from: component2, reason: from getter */
    public final SamplingConfig getSamplingConfig() {
        return this.samplingConfig;
    }

    public final SessionReplayConfig copy(PrivacyConfig privacyConfig, SamplingConfig samplingConfig) {
        return new SessionReplayConfig(privacyConfig, samplingConfig);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SessionReplayConfig)) {
            return false;
        }
        SessionReplayConfig sessionReplayConfig = (SessionReplayConfig) other;
        return Intrinsics.b(this.privacyConfig, sessionReplayConfig.privacyConfig) && Intrinsics.b(this.samplingConfig, sessionReplayConfig.samplingConfig);
    }

    public final PrivacyConfig getPrivacyConfig() {
        return this.privacyConfig;
    }

    public final SamplingConfig getSamplingConfig() {
        return this.samplingConfig;
    }

    public int hashCode() {
        PrivacyConfig privacyConfig = this.privacyConfig;
        int iHashCode = (privacyConfig == null ? 0 : privacyConfig.hashCode()) * 31;
        SamplingConfig samplingConfig = this.samplingConfig;
        return iHashCode + (samplingConfig != null ? samplingConfig.hashCode() : 0);
    }

    public String toString() {
        return "SessionReplayConfig(privacyConfig=" + this.privacyConfig + ", samplingConfig=" + this.samplingConfig + ")";
    }

    public SessionReplayConfig(PrivacyConfig privacyConfig, SamplingConfig samplingConfig) {
        this.privacyConfig = privacyConfig;
        this.samplingConfig = samplingConfig;
    }

    public /* synthetic */ SessionReplayConfig(PrivacyConfig privacyConfig, SamplingConfig samplingConfig, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : privacyConfig, (i5 & 2) != 0 ? null : samplingConfig);
    }
}
