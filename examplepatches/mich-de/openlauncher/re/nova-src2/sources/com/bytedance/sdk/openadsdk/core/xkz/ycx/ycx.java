package com.bytedance.sdk.openadsdk.core.xkz.ycx;

import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes2.dex */
public enum ycx {
    XML_PARSING_ERROR(100),
    SCHEMA_VALIDATION_ERROR(101),
    WRAPPER_TIMEOUT(301),
    NO_ADS_VAST_RESPONSE(303),
    GENERAL_LINEAR_AD_ERROR(Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE),
    GENERAL_COMPANION_AD_ERROR(600),
    UNDEFINED_ERROR(900);

    private final int fby;

    ycx(int i5) {
        this.fby = i5;
    }

    public String ycx() {
        return String.valueOf(this.fby);
    }
}
