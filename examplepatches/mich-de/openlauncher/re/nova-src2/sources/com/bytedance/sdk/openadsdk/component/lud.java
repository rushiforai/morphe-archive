package com.bytedance.sdk.openadsdk.component;

import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.api.open.PAGAppOpenAdInteractionListener;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.dj.jc;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class lud implements com.bytedance.sdk.openadsdk.ycx.dj.zb {
    private final tn ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final PAGAppOpenAdInteractionListener f24832zb;
    private final AtomicBoolean sya = new AtomicBoolean(false);

    /* renamed from: dj, reason: collision with root package name */
    private final AtomicBoolean f24831dj = new AtomicBoolean(false);

    public lud(PAGAppOpenAdInteractionListener pAGAppOpenAdInteractionListener, tn tnVar) {
        this.ycx = tnVar;
        this.f24832zb = pAGAppOpenAdInteractionListener;
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGAdWrapperListener
    public void onAdClicked() {
        htf.ycx("BVA", "onAdClicked");
        PAGAppOpenAdInteractionListener pAGAppOpenAdInteractionListener = this.f24832zb;
        if (pAGAppOpenAdInteractionListener != null) {
            pAGAppOpenAdInteractionListener.onAdClicked();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.ycx.dj.zb
    public void sya() {
        if (this.sya.getAndSet(true)) {
            jc.ycx("close_callback_repeat", this.sya.get(), this.f24831dj.get(), this.ycx);
            return;
        }
        jc.ycx("close_callback", this.sya.get(), this.f24831dj.get(), this.ycx);
        PAGAppOpenAdInteractionListener pAGAppOpenAdInteractionListener = this.f24832zb;
        if (pAGAppOpenAdInteractionListener != null) {
            pAGAppOpenAdInteractionListener.onAdDismissed();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.ycx.dj.zb
    public void ycx() {
        if (!this.f24831dj.compareAndSet(false, true)) {
            jc.ycx("show_callback_repeat", this.sya.get(), this.f24831dj.get(), this.ycx);
            return;
        }
        jc.ycx("show_callback", this.sya.get(), this.f24831dj.get(), this.ycx);
        htf.ycx("BVA", "onAdShow");
        PAGAppOpenAdInteractionListener pAGAppOpenAdInteractionListener = this.f24832zb;
        if (pAGAppOpenAdInteractionListener != null) {
            pAGAppOpenAdInteractionListener.onAdShowed();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.ycx.dj.zb
    public void zb() {
        htf.ycx("BVA", "onAdSkip");
        if (this.sya.getAndSet(true)) {
            jc.ycx("close_callback_repeat", this.sya.get(), this.f24831dj.get(), this.ycx);
            return;
        }
        jc.ycx("close_callback", this.sya.get(), this.f24831dj.get(), this.ycx);
        PAGAppOpenAdInteractionListener pAGAppOpenAdInteractionListener = this.f24832zb;
        if (pAGAppOpenAdInteractionListener != null) {
            pAGAppOpenAdInteractionListener.onAdDismissed();
        }
    }
}
