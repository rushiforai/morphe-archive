package com.amplitude;

import com.amplitude.android.sessionreplay.config.ConfigManager;
import com.amplitude.android.sessionreplay.config.MaskLevel;
import com.amplitude.android.sessionreplay.config.PrivacyConfig;
import com.amplitude.android.sessionreplay.config.SamplingConfig;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class X extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f20428a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ConfigManager f20429b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public X(ConfigManager configManager, String str) {
        super(0);
        this.f20428a = str;
        this.f20429b = configManager;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        String str = this.f20428a;
        String str2 = this.f20429b.configSource;
        String str3 = this.f20429b.apiKey;
        boolean z11 = this.f20429b.optOut;
        boolean z12 = this.f20429b.enableRemoteConfig;
        SamplingConfig samplingConfig = this.f20429b.sessionReplayConfig.getSamplingConfig();
        Boolean captureEnabled = samplingConfig != null ? samplingConfig.getCaptureEnabled() : null;
        SamplingConfig samplingConfig2 = this.f20429b.sessionReplayConfig.getSamplingConfig();
        Double sampleRate = samplingConfig2 != null ? samplingConfig2.getSampleRate() : null;
        PrivacyConfig privacyConfig = this.f20429b.sessionReplayConfig.getPrivacyConfig();
        MaskLevel maskLevel = privacyConfig != null ? privacyConfig.getMaskLevel() : null;
        StringBuilder sbW = b.c0.w("\n            -------------------------------------------\n            ", str, "\n              configSource: ", str2, "\n              apiKey: ");
        a80.m.q(str3, "\n              optOut: ", "\n              enableRemoteConfig: ", sbW, z11);
        sbW.append(z12);
        sbW.append("\n              captureEnabled: ");
        sbW.append(captureEnabled);
        sbW.append("\n              sampleRate: ");
        sbW.append(sampleRate);
        sbW.append("\n              maskLevel: ");
        sbW.append(maskLevel);
        sbW.append("\n            -------------------------------------------\n            ");
        return r70.f.o0(sbW.toString());
    }
}
