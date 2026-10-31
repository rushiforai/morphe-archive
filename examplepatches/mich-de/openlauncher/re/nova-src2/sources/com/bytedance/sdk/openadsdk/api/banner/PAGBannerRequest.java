package com.bytedance.sdk.openadsdk.api.banner;

import com.bytedance.sdk.openadsdk.api.PAGRequest;

/* loaded from: classes2.dex */
public class PAGBannerRequest extends PAGRequest {
    private PAGBannerSize ycx;

    public PAGBannerRequest(PAGBannerSize pAGBannerSize) {
        this.ycx = pAGBannerSize;
    }

    public PAGBannerSize getAdSize() {
        return this.ycx;
    }

    public void setAdSize(PAGBannerSize pAGBannerSize) {
        this.ycx = pAGBannerSize;
    }
}
