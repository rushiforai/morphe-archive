package com.bytedance.sdk.openadsdk.component.reward;

import android.annotation.SuppressLint;
import android.content.Context;
import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.core.model.tn;

/* loaded from: classes2.dex */
public class dy {

    @SuppressLint({"StaticFieldLeak"})
    private static volatile dy ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final Context f24852zb;

    private dy(Context context) {
        this.f24852zb = context == null ? com.bytedance.sdk.openadsdk.core.pmi.ycx() : context.getApplicationContext();
    }

    public void ycx(String str, tn tnVar) {
        com.bytedance.sdk.openadsdk.common.zb.ycx("sp_reward_video_new").ycx(str, tnVar);
    }

    public void ycx() {
        com.bytedance.sdk.openadsdk.common.zb.ycx("sp_reward_video_new").ycx();
    }

    public void ycx(AdSlot adSlot, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
        if (ycxVar == null || ycxVar.ul() == null || !ycxVar.ul().oiz()) {
            com.bytedance.sdk.openadsdk.common.zb.ycx("sp_reward_video_new").ycx(adSlot, ycxVar);
        }
    }

    public static dy ycx(Context context) {
        if (ycx == null) {
            synchronized (dy.class) {
                try {
                    if (ycx == null) {
                        ycx = new dy(context);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public String ycx(String str, boolean z11) {
        com.bytedance.sdk.openadsdk.common.zb zbVarYcx = com.bytedance.sdk.openadsdk.common.zb.ycx("sp_reward_video_new");
        String strYcx = zbVarYcx.ycx(str, 10500000L);
        if (z11 && !TextUtils.isEmpty(strYcx) && zbVarYcx.dj(str)) {
            return null;
        }
        return strYcx;
    }

    public boolean ycx(com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
        return com.bytedance.sdk.openadsdk.common.zb.ycx("sp_reward_video_new").ycx(ycxVar, true);
    }

    public void ycx(String str) {
        com.bytedance.sdk.openadsdk.common.zb.ycx("sp_reward_video_new").sya(str);
    }
}
