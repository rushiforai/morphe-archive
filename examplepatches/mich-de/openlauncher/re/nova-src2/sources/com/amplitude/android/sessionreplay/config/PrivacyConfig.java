package com.amplitude.android.sessionreplay.config;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import gn.c;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0004J\u000b\u0010\u0007\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\f\u001a\u00020\rHÖ\u0001J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001R\u0018\u0010\u0002\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0010"}, d2 = {"Lcom/amplitude/android/sessionreplay/config/PrivacyConfig;", b.f42142b, "maskLevel", "Lcom/amplitude/android/sessionreplay/config/MaskLevel;", "(Lcom/amplitude/android/sessionreplay/config/MaskLevel;)V", "getMaskLevel", "()Lcom/amplitude/android/sessionreplay/config/MaskLevel;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "session-replay_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class PrivacyConfig {

    @c("defaultMaskLevel")
    private final MaskLevel maskLevel;

    /* JADX WARN: Multi-variable type inference failed */
    public PrivacyConfig() {
        this(null, 1, 0 == true ? 1 : 0);
    }

    public static /* synthetic */ PrivacyConfig copy$default(PrivacyConfig privacyConfig, MaskLevel maskLevel, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            maskLevel = privacyConfig.maskLevel;
        }
        return privacyConfig.copy(maskLevel);
    }

    /* renamed from: component1, reason: from getter */
    public final MaskLevel getMaskLevel() {
        return this.maskLevel;
    }

    public final PrivacyConfig copy(MaskLevel maskLevel) {
        return new PrivacyConfig(maskLevel);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof PrivacyConfig) && this.maskLevel == ((PrivacyConfig) other).maskLevel;
    }

    public final MaskLevel getMaskLevel() {
        return this.maskLevel;
    }

    public int hashCode() {
        MaskLevel maskLevel = this.maskLevel;
        if (maskLevel == null) {
            return 0;
        }
        return maskLevel.hashCode();
    }

    public String toString() {
        return "PrivacyConfig(maskLevel=" + this.maskLevel + ")";
    }

    public PrivacyConfig(MaskLevel maskLevel) {
        this.maskLevel = maskLevel;
    }

    public /* synthetic */ PrivacyConfig(MaskLevel maskLevel, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? MaskLevel.MEDIUM : maskLevel);
    }
}
