package com.bytedance.sdk.openadsdk.component.reward;

import android.annotation.SuppressLint;
import android.content.Context;
import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.core.model.tn;

/* loaded from: classes2.dex */
class lud {

    @SuppressLint({"StaticFieldLeak"})
    private static volatile lud ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final Context f24879zb;

    private lud(Context context) {
        this.f24879zb = context == null ? com.bytedance.sdk.openadsdk.core.pmi.ycx() : context.getApplicationContext();
    }

    public void ycx(String str, tn tnVar) {
        com.bytedance.sdk.openadsdk.common.zb.ycx("sp_full_screen_video_new").ycx(str, tnVar);
    }

    public void ycx() {
        com.bytedance.sdk.openadsdk.common.zb.ycx("sp_full_screen_video_new").ycx();
    }

    public void ycx(AdSlot adSlot, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
        if (ycxVar == null || ycxVar.ul() == null || !ycxVar.ul().oiz()) {
            com.bytedance.sdk.openadsdk.common.zb.ycx("sp_full_screen_video_new").ycx(adSlot, ycxVar);
        }
    }

    public static lud ycx(Context context) {
        if (ycx == null) {
            synchronized (lud.class) {
                try {
                    if (ycx == null) {
                        ycx = new lud(context);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public String ycx(String str, boolean z11) {
        com.bytedance.sdk.openadsdk.common.zb zbVarYcx = com.bytedance.sdk.openadsdk.common.zb.ycx("sp_full_screen_video_new");
        String strYcx = zbVarYcx.ycx(str, 10500000L);
        if (z11 && !TextUtils.isEmpty(strYcx) && zbVarYcx.dj(str)) {
            return null;
        }
        return strYcx;
    }

    public boolean ycx(com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
        return com.bytedance.sdk.openadsdk.common.zb.ycx("sp_full_screen_video_new").ycx(ycxVar, true);
    }

    public void ycx(String str) {
        com.bytedance.sdk.openadsdk.common.zb.ycx("sp_full_screen_video_new").sya(str);
    }
}
