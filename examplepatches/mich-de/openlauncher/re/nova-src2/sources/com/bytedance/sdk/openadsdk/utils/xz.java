package com.bytedance.sdk.openadsdk.utils;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import java.util.Map;

/* loaded from: classes2.dex */
public class xz {
    public static void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, Double d5) {
        if (tnVar == null || tnVar.ab() == null) {
            return;
        }
        Map<String, Object> mapAb = tnVar.ab();
        try {
            Object obj = tnVar.ab().get(TTAdConstant.SDK_BIDDING_TYPE);
            if (obj != null && Integer.parseInt(obj.toString()) == 2) {
                String strReplace = (String) mapAb.get("nurl");
                if (TextUtils.isEmpty(strReplace)) {
                    return;
                }
                if (d5 != null) {
                    strReplace = strReplace.replace("${AUCTION_BID_TO_WIN}", String.valueOf(d5));
                }
                com.bytedance.sdk.openadsdk.core.pmi.sya().ycx(strReplace);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b9oOmQq5Z9OiQ9NZhR+nHU/nIQ==", "Ses9mhGoXs6O", 38);
            com.bytedance.sdk.component.utils.htf.sya("report Win error", new Object[0]);
        }
    }

    public static void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, Double d5, String str, String str2) {
        if (tnVar == null || tnVar.ab() == null) {
            return;
        }
        Map<String, Object> mapAb = tnVar.ab();
        try {
            Object obj = tnVar.ab().get(TTAdConstant.SDK_BIDDING_TYPE);
            if (obj != null && Integer.parseInt(obj.toString()) == 2) {
                String strReplace = (String) mapAb.get("lurl");
                if (TextUtils.isEmpty(strReplace)) {
                    return;
                }
                if (d5 != null) {
                    strReplace = strReplace.replace("${AUCTION_PRICE}", String.valueOf(d5));
                }
                if (str != null) {
                    strReplace = strReplace.replace("${AUCTION_LOSS}", str);
                }
                if (str2 != null) {
                    strReplace = strReplace.replace("${AUCTION_WINNER}", str2);
                }
                com.bytedance.sdk.openadsdk.core.pmi.sya().ycx(strReplace);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b9oOmQq5Z9OiQ9NZhR+nHU/nIQ==", "Ses9mhGoRciTWQ==", 72);
            com.bytedance.sdk.component.utils.htf.sya("report Loss error", new Object[0]);
        }
    }
}
