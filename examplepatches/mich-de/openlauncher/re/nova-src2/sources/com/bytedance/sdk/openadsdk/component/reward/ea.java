package com.bytedance.sdk.openadsdk.component.reward;

import com.bytedance.sdk.openadsdk.api.model.PAGErrorModel;
import com.bytedance.sdk.openadsdk.api.reward.PAGRewardItem;
import com.bytedance.sdk.openadsdk.api.reward.PAGRewardedAdInteractionCallback;
import com.bytedance.sdk.openadsdk.api.reward.PAGRewardedAdInteractionListener;
import com.bytedance.sdk.openadsdk.core.model.tn;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class ea implements com.bytedance.sdk.openadsdk.ycx.lud.ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final AtomicBoolean f24853dj;

    /* renamed from: lt, reason: collision with root package name */
    private final tn f24854lt;
    private final AtomicBoolean lud;
    private final AtomicBoolean sya;
    private final PAGRewardedAdInteractionListener ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final PAGRewardedAdInteractionCallback f24855zb;

    public ea(PAGRewardedAdInteractionListener pAGRewardedAdInteractionListener, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
        this.sya = new AtomicBoolean(false);
        this.f24853dj = new AtomicBoolean(false);
        this.lud = new AtomicBoolean(false);
        this.ycx = pAGRewardedAdInteractionListener;
        this.f24855zb = null;
        this.f24854lt = ycxVar != null ? ycxVar.ul() : null;
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGAdWrapperListener
    public void onAdClicked() {
        PAGRewardedAdInteractionListener pAGRewardedAdInteractionListener = this.ycx;
        if (pAGRewardedAdInteractionListener != null) {
            pAGRewardedAdInteractionListener.onAdClicked();
            return;
        }
        PAGRewardedAdInteractionCallback pAGRewardedAdInteractionCallback = this.f24855zb;
        if (pAGRewardedAdInteractionCallback != null) {
            pAGRewardedAdInteractionCallback.onAdClicked();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.ycx.lud.ycx
    public void ycx() {
        this.sya.get();
        if (!this.sya.compareAndSet(false, true)) {
            com.bytedance.sdk.openadsdk.dj.jc.ycx("show_callback_repeat", this.f24853dj.get(), this.sya.get(), this.f24854lt);
            return;
        }
        com.bytedance.sdk.openadsdk.dj.jc.ycx("show_callback", this.f24853dj.get(), this.sya.get(), this.f24854lt);
        com.bytedance.sdk.component.utils.htf.ycx("BVA", "reward video onAdShow");
        PAGRewardedAdInteractionListener pAGRewardedAdInteractionListener = this.ycx;
        if (pAGRewardedAdInteractionListener != null) {
            pAGRewardedAdInteractionListener.onAdShowed();
            return;
        }
        PAGRewardedAdInteractionCallback pAGRewardedAdInteractionCallback = this.f24855zb;
        if (pAGRewardedAdInteractionCallback != null) {
            pAGRewardedAdInteractionCallback.onAdShowed();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.ycx.lud.ycx
    public void zb() {
        this.f24853dj.get();
        if (!this.f24853dj.compareAndSet(false, true)) {
            com.bytedance.sdk.openadsdk.dj.jc.ycx("close_callback_repeat", this.f24853dj.get(), this.sya.get(), this.f24854lt);
            return;
        }
        com.bytedance.sdk.openadsdk.dj.jc.ycx("close_callback", this.f24853dj.get(), this.sya.get(), this.f24854lt);
        com.bytedance.sdk.component.utils.htf.ycx("BVA", "reward video onAdClose");
        PAGRewardedAdInteractionListener pAGRewardedAdInteractionListener = this.ycx;
        if (pAGRewardedAdInteractionListener != null) {
            pAGRewardedAdInteractionListener.onAdDismissed();
            return;
        }
        PAGRewardedAdInteractionCallback pAGRewardedAdInteractionCallback = this.f24855zb;
        if (pAGRewardedAdInteractionCallback != null) {
            pAGRewardedAdInteractionCallback.onAdDismissed();
        }
    }

    public ea(PAGRewardedAdInteractionCallback pAGRewardedAdInteractionCallback, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
        this.sya = new AtomicBoolean(false);
        this.f24853dj = new AtomicBoolean(false);
        this.lud = new AtomicBoolean(false);
        this.f24855zb = pAGRewardedAdInteractionCallback;
        this.ycx = null;
        this.f24854lt = ycxVar != null ? ycxVar.ul() : null;
    }

    @Override // com.bytedance.sdk.openadsdk.ycx.lud.ycx
    public void ycx(boolean z11, int i5, String str, int i11, String str2) {
        if (this.lud.compareAndSet(false, true)) {
            com.bytedance.sdk.component.utils.htf.ycx("BVA", "reward video onRewardVerify");
            PAGRewardedAdInteractionListener pAGRewardedAdInteractionListener = this.ycx;
            if (pAGRewardedAdInteractionListener != null) {
                if (z11) {
                    pAGRewardedAdInteractionListener.onUserEarnedReward(new PAGRewardItem(i5, str));
                    return;
                } else {
                    pAGRewardedAdInteractionListener.onUserEarnedRewardFail(i11, str2);
                    return;
                }
            }
            PAGRewardedAdInteractionCallback pAGRewardedAdInteractionCallback = this.f24855zb;
            if (pAGRewardedAdInteractionCallback != null) {
                if (z11) {
                    pAGRewardedAdInteractionCallback.onUserEarnedReward(new PAGRewardItem(i5, str));
                } else {
                    pAGRewardedAdInteractionCallback.onUserEarnedRewardFail(new PAGErrorModel(i11, str2));
                }
            }
        }
    }
}
