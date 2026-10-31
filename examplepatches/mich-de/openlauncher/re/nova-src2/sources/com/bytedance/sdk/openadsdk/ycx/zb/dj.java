package com.bytedance.sdk.openadsdk.ycx.zb;

import android.view.View;
import com.bytedance.sdk.openadsdk.api.nativeAd.PAGImageItem;
import com.bytedance.sdk.openadsdk.api.nativeAd.PAGMediaView;
import com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAdData;
import com.bytedance.sdk.openadsdk.core.model.tn;

/* loaded from: classes2.dex */
public class dj implements PAGNativeAdData {
    private final ycx ycx;

    public dj(ycx ycxVar) {
        this.ycx = ycxVar;
    }

    @Override // com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAdData
    public View getAdChoicesView() {
        ycx ycxVar = this.ycx;
        if (ycxVar != null) {
            return ycxVar.ea();
        }
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAdData
    public View getAdLogoView() {
        ycx ycxVar = this.ycx;
        if (ycxVar != null) {
            return ycxVar.jc();
        }
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAdData
    public String getButtonText() {
        ycx ycxVar = this.ycx;
        if (ycxVar != null) {
            return ycxVar.lt();
        }
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAdData
    public String getDescription() {
        ycx ycxVar = this.ycx;
        if (ycxVar != null) {
            return ycxVar.lud();
        }
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAdData
    public PAGImageItem getIcon() {
        ycx ycxVar = this.ycx;
        if (ycxVar != null) {
            return ycxVar.sya();
        }
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAdData
    public PAGNativeAdData.PAGNativeMediaType getMediaType() {
        return tn.lud(this.ycx.ycx) ? PAGNativeAdData.PAGNativeMediaType.PAGNativeMediaTypeVideo : PAGNativeAdData.PAGNativeMediaType.PAGNativeMediaTypeImage;
    }

    @Override // com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAdData
    public PAGMediaView getMediaView() {
        ycx ycxVar = this.ycx;
        if (ycxVar != null) {
            return ycxVar.ul();
        }
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAdData
    public String getTitle() {
        ycx ycxVar = this.ycx;
        if (ycxVar != null) {
            return ycxVar.dj();
        }
        return null;
    }
}
