package com.bytedance.sdk.openadsdk.core.jc;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import com.bytedance.sdk.component.adexpress.zb.ry;
import com.bytedance.sdk.openadsdk.AdSlot;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class dv extends thx {

    /* renamed from: dj, reason: collision with root package name */
    private boolean f25389dj;
    private String sya;
    public int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private lud f25390zb;

    public dv(Activity activity, Context context, com.bytedance.sdk.openadsdk.core.model.tn tnVar, AdSlot adSlot, String str) {
        super(activity, context, tnVar, adSlot, str);
        this.ycx = 1;
        this.f25389dj = true;
    }

    @Override // com.bytedance.sdk.openadsdk.core.jc.thx
    public void fby() {
        this.wie = new com.bytedance.sdk.openadsdk.dj.uh(11, this.f25459jc, this.f25464ok);
    }

    @Override // com.bytedance.sdk.openadsdk.core.jc.thx
    public boolean htf() {
        return this.f25389dj;
    }

    @Override // com.bytedance.sdk.openadsdk.core.jc.thx, com.bytedance.sdk.openadsdk.core.jc.dy
    public void lt() {
        lud ludVar = this.f25390zb;
        if (ludVar != null) {
            ludVar.ycx(this.sya);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.core.jc.thx, android.view.View
    public void onWindowFocusChanged(boolean z11) throws JSONException {
        super.onWindowFocusChanged(z11);
        if (getJsObject() != null) {
            getJsObject().dj(z11);
        }
    }

    public void setAdInteractionListener(com.bytedance.sdk.openadsdk.component.reward.sya.ycx ycxVar) {
        if (getJsObject() != null) {
            getJsObject().ycx(ycxVar);
        }
    }

    public void setDislikeClickListener(lud ludVar) {
        this.f25390zb = ludVar;
    }

    public void setHeartBeatListener(com.bytedance.sdk.openadsdk.component.reward.sya.dj djVar) {
        if (getJsObject() != null) {
            getJsObject().ycx(djVar);
        }
    }

    public void setLandingPageListener(com.bytedance.sdk.openadsdk.component.reward.sya.ycx.sya syaVar) {
        if (getJsObject() != null) {
            getJsObject().ycx(syaVar);
        }
    }

    public void setRewardControlListener(com.bytedance.sdk.openadsdk.component.reward.sya.lt ltVar) {
        if (getJsObject() != null) {
            getJsObject().ycx(ltVar);
        }
    }

    public void setShouldNotifyAdVisibility(boolean z11) {
        this.f25389dj = z11;
    }

    public void setVideoTrackListener(com.bytedance.sdk.openadsdk.component.reward.sya.jw jwVar) {
        if (getJsObject() != null) {
            getJsObject().ycx(jwVar);
        }
    }

    public void setWebTouchProxy(com.bytedance.sdk.component.jw.lud ludVar) {
        if (getWebView() != null) {
            getWebView().setWebTouchProxy(ludVar);
        }
    }

    public boolean syc() {
        com.bytedance.sdk.component.adexpress.zb.dj<? extends View> djVar = this.f25451av;
        if (djVar instanceof oty) {
            return ((oty) djVar).dy();
        }
        return false;
    }

    @Override // com.bytedance.sdk.openadsdk.core.jc.thx
    public void ul() {
        this.syc = true;
        super.ul();
        com.bytedance.sdk.component.jw.fby webView = getWebView();
        if (webView != null) {
            webView.setBackgroundColor(0);
        }
    }

    public void xkz() {
        if (getJsObject() != null) {
            getJsObject().wwx();
        }
    }

    public void ycx(String str, int i5, int i11) throws JSONException {
        if (getJsObject() != null) {
            getJsObject().ycx(str, i5, i11);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.core.jc.thx, com.bytedance.sdk.component.adexpress.zb.syc
    public void ycx(com.bytedance.sdk.component.adexpress.zb.dj<? extends View> djVar, com.bytedance.sdk.component.adexpress.zb.xkz xkzVar) {
        this.f25451av = djVar;
        super.ycx(djVar, xkzVar);
    }

    @Override // com.bytedance.sdk.openadsdk.core.jc.thx, com.bytedance.sdk.component.adexpress.zb.fby
    public void ycx(View view, int i5, com.bytedance.sdk.component.adexpress.sya syaVar) throws JSONException {
        if (i5 != -1 && syaVar != null && i5 == 3) {
            if (syaVar instanceof com.bytedance.sdk.openadsdk.core.model.dy) {
                this.sya = ((com.bytedance.sdk.openadsdk.core.model.dy) syaVar).f25617dy;
            }
            lt();
            return;
        }
        super.ycx(view, i5, syaVar);
    }

    @Override // com.bytedance.sdk.openadsdk.core.jc.thx
    public void ycx(ry.ycx ycxVar) {
        super.ycx(ycxVar);
        ycxVar.lt(com.bytedance.sdk.openadsdk.core.model.htf.lud(this.f25464ok));
    }
}
