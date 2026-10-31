package com.bytedance.sdk.openadsdk.api.banner;

import android.content.Context;
import androidx.recyclerview.widget.n0;
import com.bytedance.sdk.openadsdk.utils.sya;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes2.dex */
public final class PAGBannerSize {

    /* renamed from: dj, reason: collision with root package name */
    private int f24653dj;
    private int sya = 1;
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f24654zb;
    public static final PAGBannerSize BANNER_W_320_H_50 = new PAGBannerSize(Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 50);
    public static final PAGBannerSize BANNER_W_300_H_250 = new PAGBannerSize(300, n0.DEFAULT_SWIPE_ANIMATION_DURATION);
    public static final PAGBannerSize BANNER_W_728_H_90 = new PAGBannerSize(728, 90);

    public PAGBannerSize(int i5, int i11) {
        this.ycx = i5;
        this.f24654zb = i11;
    }

    public static PAGBannerSize getCurrentOrientationAnchoredAdaptiveBannerAdSize(Context context, int i5) {
        int iYcx = sya.ycx(context, i5, 0);
        if (iYcx == sya.ycx) {
            return new PAGBannerSize(-1, -1);
        }
        PAGBannerSize pAGBannerSize = new PAGBannerSize(i5, iYcx);
        pAGBannerSize.sya = 2;
        return pAGBannerSize;
    }

    public static PAGBannerSize getCurrentOrientationInlineAdaptiveBannerAdSize(Context context, int i5) {
        int iYcx = sya.ycx(context, 0);
        if (iYcx == sya.ycx) {
            return new PAGBannerSize(-1, -1);
        }
        PAGBannerSize pAGBannerSize = new PAGBannerSize(i5, 0);
        pAGBannerSize.f24653dj = iYcx;
        pAGBannerSize.sya = 3;
        return pAGBannerSize;
    }

    public static PAGBannerSize getInlineAdaptiveBannerAdSize(int i5, int i11) {
        PAGBannerSize pAGBannerSize = new PAGBannerSize(i5, 0);
        pAGBannerSize.f24653dj = i11;
        pAGBannerSize.sya = 3;
        return pAGBannerSize;
    }

    public int getHeight() {
        return this.f24654zb;
    }

    public int getMaxHeight() {
        return this.f24653dj;
    }

    public int getType() {
        return this.sya;
    }

    public int getWidth() {
        return this.ycx;
    }
}
