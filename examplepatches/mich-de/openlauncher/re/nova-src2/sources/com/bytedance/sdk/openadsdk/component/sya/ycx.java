package com.bytedance.sdk.openadsdk.component.sya;

import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.api.interstitial.PAGInterstitialAdInteractionListener;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.dj.jc;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class ycx implements com.bytedance.sdk.openadsdk.ycx.sya.zb {

    /* renamed from: dj, reason: collision with root package name */
    private final tn f25234dj;
    private final PAGInterstitialAdInteractionListener ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final AtomicBoolean f25235zb = new AtomicBoolean(false);
    private final AtomicBoolean sya = new AtomicBoolean(false);

    public ycx(PAGInterstitialAdInteractionListener pAGInterstitialAdInteractionListener, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
        this.ycx = pAGInterstitialAdInteractionListener;
        this.f25234dj = ycxVar != null ? ycxVar.ul() : null;
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGAdWrapperListener
    public void onAdClicked() {
        PAGInterstitialAdInteractionListener pAGInterstitialAdInteractionListener = this.ycx;
        if (pAGInterstitialAdInteractionListener != null) {
            pAGInterstitialAdInteractionListener.onAdClicked();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.ycx.sya.zb
    public void ycx() {
        if (!this.f25235zb.compareAndSet(false, true)) {
            jc.ycx("show_callback_repeat", this.sya.get(), this.f25235zb.get(), this.f25234dj);
            return;
        }
        jc.ycx("show_callback", this.sya.get(), this.f25235zb.get(), this.f25234dj);
        htf.ycx("BVA", "full video onAdShow");
        PAGInterstitialAdInteractionListener pAGInterstitialAdInteractionListener = this.ycx;
        if (pAGInterstitialAdInteractionListener != null) {
            pAGInterstitialAdInteractionListener.onAdShowed();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.ycx.sya.zb
    public void zb() {
        if (!this.sya.compareAndSet(false, true)) {
            jc.ycx("close_callback_repeat", this.sya.get(), this.f25235zb.get(), this.f25234dj);
            return;
        }
        jc.ycx("close_callback", this.sya.get(), this.f25235zb.get(), this.f25234dj);
        htf.ycx("BVA", "full video onAdClose");
        PAGInterstitialAdInteractionListener pAGInterstitialAdInteractionListener = this.ycx;
        if (pAGInterstitialAdInteractionListener != null) {
            pAGInterstitialAdInteractionListener.onAdDismissed();
        }
    }
}
