package com.bytedance.sdk.openadsdk.component.reward;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import com.bytedance.sdk.openadsdk.activity.TTFullWebActivity;
import com.bytedance.sdk.openadsdk.activity.single.TTAdActivity;
import com.bytedance.sdk.openadsdk.activity.single.TTFullScreenExpressVideoActivity;
import com.bytedance.sdk.openadsdk.activity.single.TTFullScreenVideoActivity;
import com.bytedance.sdk.openadsdk.api.interstitial.PAGInterstitialAd;
import com.bytedance.sdk.openadsdk.api.interstitial.PAGInterstitialAdInteractionCallback;
import com.bytedance.sdk.openadsdk.api.interstitial.PAGInterstitialAdInteractionListener;
import com.bytedance.sdk.openadsdk.component.reward.ry;
import com.bytedance.sdk.openadsdk.core.av;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.tru;
import java.util.Map;

/* loaded from: classes2.dex */
class fby extends PAGInterstitialAd {

    /* renamed from: dj, reason: collision with root package name */
    private final ry f24856dj;
    private final String sya = tru.ycx();
    private final com.bytedance.sdk.openadsdk.core.model.ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.ycx.sya.zb f24857zb;

    public fby(Context context, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
        this.ycx = ycxVar;
        this.f24856dj = new ry(context, ycxVar, "fullscreen_interstitial_ad", new ry.ycx() { // from class: com.bytedance.sdk.openadsdk.component.reward.fby.1
            @Override // com.bytedance.sdk.openadsdk.component.reward.ry.ycx
            public Intent ycx(Context context2, tn tnVar, Activity activity) {
                return com.bytedance.sdk.openadsdk.component.reward.sya.fby.ycx(tnVar) ? new Intent(context2, (Class<?>) TTFullWebActivity.class) : tnVar.xym() ? new Intent(context2, (Class<?>) TTAdActivity.class) : tnVar.lt() ? new Intent(context2, (Class<?>) TTFullScreenExpressVideoActivity.class) : new Intent(context2, (Class<?>) TTFullScreenVideoActivity.class);
            }

            @Override // com.bytedance.sdk.openadsdk.component.reward.ry.ycx
            public void ycx(Intent intent, Activity activity, tn tnVar, boolean z11) {
                com.bytedance.sdk.openadsdk.component.reward.ycx.sya.ycx(intent, activity, fby.this.f24856dj.sya(), fby.this.ycx, fby.this.sya);
            }

            @Override // com.bytedance.sdk.openadsdk.component.reward.ry.ycx
            public void ycx(boolean z11) {
                if (fby.this.f24857zb == null) {
                    return;
                }
                if (z11) {
                    av.ycx().ycx(fby.this.sya, (String) fby.this.f24857zb);
                } else {
                    av.ycx().ycx(fby.this.f24857zb);
                }
                fby.this.f24857zb = null;
            }

            @Override // com.bytedance.sdk.openadsdk.component.reward.ry.ycx
            public void ycx(tn tnVar) {
                zb.ycx(tnVar, fby.this.f24856dj.sya(), false);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.api.PangleAd
    public Object getExtraInfo(String str) {
        return this.f24856dj.ycx(str);
    }

    @Override // com.bytedance.sdk.openadsdk.api.PangleAd
    public Map<String, Object> getMediaExtraInfo() {
        return this.f24856dj.zb();
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGClientBidding
    public void loss(Double d5, String str, String str2) {
        this.f24856dj.ycx(d5, str, str2);
    }

    @Override // com.bytedance.sdk.openadsdk.api.interstitial.PAGInterstitialAd
    public void setAdInteractionCallback(PAGInterstitialAdInteractionCallback pAGInterstitialAdInteractionCallback) {
        this.f24857zb = new com.bytedance.sdk.openadsdk.component.sya.ycx(pAGInterstitialAdInteractionCallback, this.ycx);
    }

    @Override // com.bytedance.sdk.openadsdk.api.interstitial.PAGInterstitialAd
    public void setAdInteractionListener(PAGInterstitialAdInteractionListener pAGInterstitialAdInteractionListener) {
        this.f24857zb = new com.bytedance.sdk.openadsdk.component.sya.ycx(pAGInterstitialAdInteractionListener, this.ycx);
    }

    @Override // com.bytedance.sdk.openadsdk.api.interstitial.PAGInterstitialAd
    public void show(Activity activity) {
        this.f24856dj.ycx(activity);
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGClientBidding
    public void win(Double d5) {
        this.f24856dj.ycx(d5);
    }

    public void ycx() {
        this.f24856dj.ycx();
    }
}
