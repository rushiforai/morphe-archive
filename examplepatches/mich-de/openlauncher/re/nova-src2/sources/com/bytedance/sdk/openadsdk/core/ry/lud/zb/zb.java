package com.bytedance.sdk.openadsdk.core.ry.lud.zb;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.content.Context;
import android.text.TextUtils;
import java.util.Map;

/* loaded from: classes2.dex */
public class zb extends com.bytedance.adsdk.ugeno.lud.dj.sya {

    /* renamed from: ea, reason: collision with root package name */
    private String f25977ea;

    public zb(Context context) {
        super(context);
    }

    @Override // com.bytedance.adsdk.ugeno.lud.dj.sya
    public boolean ycx(Object... objArr) {
        Object obj;
        Map<String, Object> map = this.lud;
        if (map == null || map.size() <= 0 || (obj = this.lud.get("id")) == null) {
            return false;
        }
        String strValueOf = String.valueOf(obj);
        if (TextUtils.isEmpty(strValueOf)) {
            return false;
        }
        Object obj2 = this.lud.get("state");
        if (obj2 != null) {
            this.f25977ea = String.valueOf(obj2);
        }
        com.bytedance.adsdk.ugeno.zb.sya syaVar = this.f22463zb;
        com.bytedance.adsdk.ugeno.zb.sya syaVarZb = syaVar.zb(syaVar);
        if (syaVarZb == null) {
            return false;
        }
        com.bytedance.adsdk.ugeno.zb.sya syaVarLud = syaVarZb.lud(strValueOf);
        if (syaVarLud instanceof com.bytedance.sdk.openadsdk.core.ry.zb.sya.ycx) {
            ((com.bytedance.sdk.openadsdk.core.ry.zb.sya.ycx) syaVarLud).ycx(new AnimatorListenerAdapter() { // from class: com.bytedance.sdk.openadsdk.core.ry.lud.zb.zb.1
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animator) {
                    super.onAnimationEnd(animator);
                    if (!TextUtils.equals(zb.this.f25977ea, "complete") || ((com.bytedance.adsdk.ugeno.lud.dj.sya) zb.this).ycx == null) {
                        return;
                    }
                    ((com.bytedance.adsdk.ugeno.lud.dj.sya) zb.this).ycx.ycx(((com.bytedance.adsdk.ugeno.lud.dj.sya) zb.this).f22463zb, ((com.bytedance.adsdk.ugeno.lud.dj.sya) zb.this).f22461lt, ((com.bytedance.adsdk.ugeno.lud.dj.sya) zb.this).sya.zb(), ((com.bytedance.adsdk.ugeno.lud.dj.sya) zb.this).sya);
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationStart(Animator animator) {
                    super.onAnimationStart(animator);
                    if (!TextUtils.equals(zb.this.f25977ea, "start") || ((com.bytedance.adsdk.ugeno.lud.dj.sya) zb.this).ycx == null) {
                        return;
                    }
                    ((com.bytedance.adsdk.ugeno.lud.dj.sya) zb.this).ycx.ycx(((com.bytedance.adsdk.ugeno.lud.dj.sya) zb.this).f22463zb, ((com.bytedance.adsdk.ugeno.lud.dj.sya) zb.this).f22461lt, ((com.bytedance.adsdk.ugeno.lud.dj.sya) zb.this).sya.zb(), ((com.bytedance.adsdk.ugeno.lud.dj.sya) zb.this).sya);
                }
            });
        }
        return false;
    }
}
