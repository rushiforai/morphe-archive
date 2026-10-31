package com.bytedance.sdk.openadsdk.core.ry.lud.ycx;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.text.TextUtils;
import com.bytedance.adsdk.ugeno.lud.lt;
import com.bytedance.adsdk.ugeno.zb.sya;
import java.util.Map;

/* loaded from: classes2.dex */
public class ycx extends com.bytedance.adsdk.ugeno.lud.zb.ycx {
    public ycx(sya syaVar, String str, lt.ycx ycxVar) {
        super(syaVar, str, ycxVar);
    }

    @Override // com.bytedance.adsdk.ugeno.lud.zb.ycx
    public void ycx() {
        Object obj;
        sya syaVar;
        sya syaVarZb;
        Map<String, Object> map = this.f22485lt;
        if (map == null || map.isEmpty() || (obj = this.f22485lt.get("id")) == null) {
            return;
        }
        String strValueOf = String.valueOf(obj);
        if (TextUtils.isEmpty(strValueOf) || (syaVarZb = (syaVar = this.sya).zb(syaVar)) == null) {
            return;
        }
        sya syaVarLud = syaVarZb.lud(strValueOf);
        if (syaVarLud instanceof com.bytedance.sdk.openadsdk.core.ry.zb.sya.ycx) {
            com.bytedance.sdk.openadsdk.core.ry.zb.sya.ycx ycxVar = (com.bytedance.sdk.openadsdk.core.ry.zb.sya.ycx) syaVarLud;
            ycxVar.dj();
            ycxVar.ycx(new AnimatorListenerAdapter() { // from class: com.bytedance.sdk.openadsdk.core.ry.lud.ycx.ycx.1
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animator) {
                    super.onAnimationEnd(animator);
                    ycx.this.sya();
                }
            });
        }
    }

    @Override // com.bytedance.adsdk.ugeno.lud.zb.ycx
    public void zb() {
    }
}
