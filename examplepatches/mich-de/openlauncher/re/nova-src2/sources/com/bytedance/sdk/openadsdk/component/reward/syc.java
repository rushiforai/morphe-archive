package com.bytedance.sdk.openadsdk.component.reward;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.core.model.tn;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes2.dex */
public class syc {
    private static final ConcurrentHashMap<ycx, syc> ycx = new ConcurrentHashMap<>();
    private final ycx sya;

    /* renamed from: zb, reason: collision with root package name */
    private final Context f24978zb;

    public enum ycx {
        REWARD_VIDEO("sp_reward_video", "sp_reward_video_new", "reward_video_cache"),
        FULL_SCREEN_VIDEO("sp_full_screen_video", "sp_full_screen_video_new", "full_screen_video_cache");


        /* renamed from: dj, reason: collision with root package name */
        final String f24981dj;
        final String lud;
        final String sya;

        ycx(String str, String str2, String str3) {
            this.sya = str;
            this.f24981dj = str2;
            this.lud = str3;
        }
    }

    private syc(Context context, ycx ycxVar) {
        this.f24978zb = context == null ? com.bytedance.sdk.openadsdk.core.pmi.ycx() : context.getApplicationContext();
        this.sya = ycxVar;
    }

    public static syc ycx(Context context, ycx ycxVar) {
        ConcurrentHashMap<ycx, syc> concurrentHashMap = ycx;
        if (!concurrentHashMap.containsKey(ycxVar)) {
            synchronized (syc.class) {
                try {
                    if (!concurrentHashMap.containsKey(ycxVar)) {
                        concurrentHashMap.put(ycxVar, new syc(context, ycxVar));
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return concurrentHashMap.get(ycxVar);
    }

    public void ycx(String str, tn tnVar) {
        com.bytedance.sdk.openadsdk.common.zb.ycx(this.sya.f24981dj).ycx(str, tnVar);
    }

    public void ycx() {
        com.bytedance.sdk.openadsdk.common.zb.ycx(this.sya.f24981dj).ycx();
    }

    public void ycx(AdSlot adSlot, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
        if (ycxVar == null || ycxVar.ul() == null || !ycxVar.ul().oiz()) {
            com.bytedance.sdk.openadsdk.common.zb.ycx(this.sya.f24981dj).ycx(adSlot, ycxVar);
        }
    }

    public String ycx(String str, boolean z11) {
        com.bytedance.sdk.openadsdk.common.zb zbVarYcx = com.bytedance.sdk.openadsdk.common.zb.ycx(this.sya.f24981dj);
        String strYcx = zbVarYcx.ycx(str, 10500000L);
        if (z11 && !TextUtils.isEmpty(strYcx) && zbVarYcx.dj(str)) {
            return null;
        }
        return strYcx;
    }

    public boolean ycx(com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
        return com.bytedance.sdk.openadsdk.common.zb.ycx(this.sya.f24981dj).ycx(ycxVar, true);
    }

    public void ycx(String str) {
        com.bytedance.sdk.openadsdk.common.zb.ycx(this.sya.f24981dj).sya(str);
    }
}
