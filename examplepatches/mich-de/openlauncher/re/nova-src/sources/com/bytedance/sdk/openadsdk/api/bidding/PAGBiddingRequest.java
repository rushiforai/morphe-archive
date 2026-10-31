package com.bytedance.sdk.openadsdk.api.bidding;

import com.bytedance.sdk.openadsdk.api.banner.PAGBannerSize;

/* loaded from: classes.dex */
public class PAGBiddingRequest {
    private PAGBannerSize ycx = null;

    /* renamed from: zb, reason: collision with root package name */
    private String f24655zb = null;
    private String sya = null;

    public String getAdxId() {
        return this.sya;
    }

    public PAGBannerSize getBannerSize() {
        return this.ycx;
    }

    public String getSlotId() {
        return this.f24655zb;
    }

    public void setAdxId(String str) {
        this.sya = str;
    }

    public void setBannerSize(PAGBannerSize pAGBannerSize) {
        this.ycx = pAGBannerSize;
    }

    public void setSlotId(String str) {
        this.f24655zb = str;
    }
}
