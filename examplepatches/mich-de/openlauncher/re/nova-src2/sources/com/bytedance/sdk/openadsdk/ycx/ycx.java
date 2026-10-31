package com.bytedance.sdk.openadsdk.ycx;

import android.text.TextUtils;
import b.c9;
import com.bytedance.sdk.component.fby.zb.sya;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.api.PAGErrorCode;
import com.bytedance.sdk.openadsdk.api.PAGLoadListener;
import com.bytedance.sdk.openadsdk.api.PAGRequest;
import com.bytedance.sdk.openadsdk.core.ea.zb;
import com.bytedance.sdk.openadsdk.core.jc;
import com.bytedance.sdk.openadsdk.core.jw;
import com.bytedance.sdk.openadsdk.core.settings.ul;
import com.bytedance.sdk.openadsdk.core.syc;
import com.bytedance.sdk.openadsdk.pmi.dj;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.yzp;
import java.util.Map;

/* loaded from: classes2.dex */
public class ycx {
    public static boolean ycx(PAGLoadListener pAGLoadListener) {
        if (ul.ycx()) {
            return false;
        }
        if (pAGLoadListener == null) {
            return true;
        }
        pAGLoadListener.onError(1000, "Ad request is temporarily paused, Please contact your AM");
        return true;
    }

    public static void ycx(final sya syaVar, final PAGLoadListener pAGLoadListener, final AdSlot adSlot) {
        Runnable runnable = new Runnable() { // from class: com.bytedance.sdk.openadsdk.ycx.ycx.1
            @Override // java.lang.Runnable
            public void run() {
                if (!syc.lud()) {
                    PAGLoadListener pAGLoadListener2 = pAGLoadListener;
                    if (pAGLoadListener2 != null) {
                        pAGLoadListener2.onError(10000, "Please exec TTAdSdk.init before load ad");
                        return;
                    }
                    return;
                }
                if (!zb.ycx().ea() || !jc.zb().ry()) {
                    com.bytedance.sdk.openadsdk.pmi.sya.ycx(new dj() { // from class: com.bytedance.sdk.openadsdk.ycx.ycx.1.1
                        @Override // com.bytedance.sdk.openadsdk.pmi.dj
                        public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                            com.bytedance.sdk.openadsdk.pmi.zb.ycx ycxVarH = c9.h("load_ad");
                            ycxVarH.sya(adSlot.getCodeId());
                            ycxVarH.dj(oby.sya(adSlot.getDurationSlotType()));
                            ycxVarH.ul(oby.ycx(adSlot).toString());
                            return ycxVarH;
                        }
                    });
                    yzp.sya(syaVar);
                } else {
                    PAGLoadListener pAGLoadListener3 = pAGLoadListener;
                    if (pAGLoadListener3 != null) {
                        pAGLoadListener3.onError(10004, jw.ycx(10004));
                    }
                }
            }
        };
        if (syc.lud()) {
            runnable.run();
        } else {
            syc.zb().post(runnable);
        }
    }

    public static void ycx(AdSlot.Builder builder, PAGRequest pAGRequest) {
        Map<String, Object> extraInfo;
        if (!syc.lud() || pAGRequest == null || builder == null || (extraInfo = pAGRequest.getExtraInfo()) == null) {
            return;
        }
        if (extraInfo.containsKey("ad_id") && extraInfo.get("ad_id") != null) {
            builder.setAdId(extraInfo.get("ad_id").toString());
        }
        if (extraInfo.containsKey("creative_id") && extraInfo.get("creative_id") != null) {
            builder.setCreativeId(extraInfo.get("creative_id").toString());
        }
        if (extraInfo.containsKey("ext") && extraInfo.get("ext") != null) {
            builder.setExt(extraInfo.get("ext").toString());
        }
        if (!extraInfo.containsKey("media_extra") || extraInfo.get("media_extra") == null) {
            return;
        }
        builder.setMediaExtra(extraInfo.get("media_extra").toString());
    }

    public static boolean ycx(String str, PAGRequest pAGRequest, PAGLoadListener pAGLoadListener) {
        if (TextUtils.isEmpty(str) && pAGLoadListener != null) {
            pAGLoadListener.onError(1, PAGErrorCode.PAGAdErrorCodeSlotIdNULLMsg);
            return true;
        }
        if (pAGRequest != null || pAGLoadListener == null) {
            return false;
        }
        pAGLoadListener.onError(2, PAGErrorCode.PAGAdErrorCodeRequestNULLMsg);
        return true;
    }
}
