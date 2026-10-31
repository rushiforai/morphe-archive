package com.bytedance.sdk.openadsdk.component.reward;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.activity.TTRewardWebActivity;
import com.bytedance.sdk.openadsdk.activity.single.TTAdActivity;
import com.bytedance.sdk.openadsdk.activity.single.TTRewardExpressVideoActivity;
import com.bytedance.sdk.openadsdk.activity.single.TTRewardVideoActivity;
import com.bytedance.sdk.openadsdk.api.reward.PAGRewardedAd;
import com.bytedance.sdk.openadsdk.api.reward.PAGRewardedAdInteractionCallback;
import com.bytedance.sdk.openadsdk.api.reward.PAGRewardedAdInteractionListener;
import com.bytedance.sdk.openadsdk.component.reward.ry;
import com.bytedance.sdk.openadsdk.core.av;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.tru;
import java.util.Map;

/* loaded from: classes2.dex */
class jc extends PAGRewardedAd {

    /* renamed from: dj, reason: collision with root package name */
    private final String f24858dj = tru.ycx();
    private final ry lud;
    private com.bytedance.sdk.openadsdk.ycx.lud.ycx sya;
    private final com.bytedance.sdk.openadsdk.core.model.ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final AdSlot f24859zb;

    public jc(Context context, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar, AdSlot adSlot) {
        this.ycx = ycxVar;
        this.f24859zb = adSlot;
        this.lud = new ry(context, ycxVar, "rewarded_video", new ry.ycx() { // from class: com.bytedance.sdk.openadsdk.component.reward.jc.1
            @Override // com.bytedance.sdk.openadsdk.component.reward.ry.ycx
            public Intent ycx(Context context2, tn tnVar, Activity activity) {
                return com.bytedance.sdk.openadsdk.component.reward.sya.fby.ycx(tnVar) ? new Intent(context2, (Class<?>) TTRewardWebActivity.class) : tnVar.xym() ? new Intent(context2, (Class<?>) TTAdActivity.class) : tnVar.lt() ? new Intent(context2, (Class<?>) TTRewardExpressVideoActivity.class) : new Intent(context2, (Class<?>) TTRewardVideoActivity.class);
            }

            @Override // com.bytedance.sdk.openadsdk.component.reward.ry.ycx
            public void ycx(Intent intent, Activity activity, tn tnVar, boolean z11) {
                com.bytedance.sdk.openadsdk.component.reward.ycx.sya.ycx(intent, activity, jc.this.lud.sya(), jc.this.ycx, jc.this.f24858dj);
                intent.putExtra("media_extra", jc.this.f24859zb.getMediaExtra());
                intent.putExtra("user_id", jc.this.f24859zb.getUserID());
            }

            @Override // com.bytedance.sdk.openadsdk.component.reward.ry.ycx
            public void ycx(boolean z11) {
                if (jc.this.sya == null) {
                    return;
                }
                if (z11) {
                    av.ycx().ycx(jc.this.f24858dj, (String) jc.this.sya);
                } else {
                    av.ycx().ycx(jc.this.sya);
                }
                jc.this.sya = null;
            }

            @Override // com.bytedance.sdk.openadsdk.component.reward.ry.ycx
            public void ycx(tn tnVar) {
                zb.ycx(tnVar, jc.this.lud.sya(), true);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.api.PangleAd
    public Object getExtraInfo(String str) {
        return this.lud.ycx(str);
    }

    @Override // com.bytedance.sdk.openadsdk.api.PangleAd
    public Map<String, Object> getMediaExtraInfo() {
        return this.lud.zb();
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGClientBidding
    public void loss(Double d5, String str, String str2) {
        this.lud.ycx(d5, str, str2);
    }

    @Override // com.bytedance.sdk.openadsdk.api.reward.PAGRewardedAd
    public void setAdInteractionCallback(PAGRewardedAdInteractionCallback pAGRewardedAdInteractionCallback) {
        this.sya = new ea(pAGRewardedAdInteractionCallback, this.ycx);
    }

    @Override // com.bytedance.sdk.openadsdk.api.reward.PAGRewardedAd
    public void setAdInteractionListener(PAGRewardedAdInteractionListener pAGRewardedAdInteractionListener) {
        this.sya = new ea(pAGRewardedAdInteractionListener, this.ycx);
    }

    @Override // com.bytedance.sdk.openadsdk.api.reward.PAGRewardedAd
    public void show(Activity activity) {
        this.lud.ycx(activity);
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGClientBidding
    public void win(Double d5) {
        this.lud.ycx(d5);
    }

    public void ycx() {
        this.lud.ycx();
    }
}
