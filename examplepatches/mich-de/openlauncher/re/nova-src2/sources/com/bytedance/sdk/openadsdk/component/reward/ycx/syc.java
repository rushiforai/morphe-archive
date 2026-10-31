package com.bytedance.sdk.openadsdk.component.reward.ycx;

import android.app.Activity;
import android.content.Context;
import android.view.ViewGroup;
import com.bytedance.sdk.openadsdk.core.jc.dv;
import com.bytedance.sdk.openadsdk.core.model.tn;

/* loaded from: classes2.dex */
public class syc extends com.bytedance.sdk.openadsdk.core.jc.ycx.ycx {
    public syc(ViewGroup viewGroup, tn tnVar, String str, Activity activity, Context context, com.bytedance.sdk.openadsdk.component.reward.sya.zb zbVar) {
        super(viewGroup, tnVar, str, activity, context, zbVar);
    }

    public void ycx(com.bytedance.sdk.openadsdk.component.reward.sya.lt ltVar) {
        dv dvVar = this.ycx;
        if (dvVar != null) {
            dvVar.setRewardControlListener(ltVar);
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.component.reward.sya.ycx ycxVar) {
        dv dvVar = this.ycx;
        if (dvVar != null) {
            dvVar.setAdInteractionListener(ycxVar);
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.component.reward.sya.jw jwVar) {
        dv dvVar = this.ycx;
        if (dvVar != null) {
            dvVar.setVideoTrackListener(jwVar);
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.component.reward.sya.dj djVar) {
        dv dvVar = this.ycx;
        if (dvVar != null) {
            dvVar.setHeartBeatListener(djVar);
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.component.reward.sya.ycx.sya syaVar) {
        dv dvVar = this.ycx;
        if (dvVar != null) {
            dvVar.setLandingPageListener(syaVar);
        }
    }

    public void ycx() {
        dv dvVar = this.ycx;
        if (dvVar != null) {
            dvVar.xkz();
        }
    }

    public void ycx(String str, int i5, int i11) {
        dv dvVar = this.ycx;
        if (dvVar != null) {
            dvVar.ycx(str, i5, i11);
        }
    }

    public void ycx(com.bytedance.sdk.component.jw.lud ludVar) {
        dv dvVar = this.ycx;
        if (dvVar != null) {
            dvVar.setWebTouchProxy(ludVar);
        }
    }
}
