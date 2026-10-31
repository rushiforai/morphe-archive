package com.fyber.inneractive.sdk.external;

/* loaded from: classes.dex */
public interface OnFyberMarketplaceInitializedListener {

    public enum FyberInitStatus {
        SUCCESSFULLY,
        FAILED_NO_KITS_DETECTED,
        FAILED,
        INVALID_APP_ID
    }

    void onFyberMarketplaceInitialized(FyberInitStatus fyberInitStatus);
}
