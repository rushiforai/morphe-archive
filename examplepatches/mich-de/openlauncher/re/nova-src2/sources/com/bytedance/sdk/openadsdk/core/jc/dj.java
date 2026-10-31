package com.bytedance.sdk.openadsdk.core.jc;

import android.annotation.SuppressLint;
import android.view.ViewGroup;
import com.bytedance.sdk.component.utils.bhi;

/* loaded from: classes2.dex */
public class dj {
    @SuppressLint({"SetJavaScriptEnabled"})
    public static void ycx(lt ltVar) {
        if (ltVar == null || ltVar.getWebView() == null) {
            return;
        }
        try {
            if (bhi.zb()) {
                return;
            }
            if (ltVar.getParent() != null) {
                ((ViewGroup) ltVar.getParent()).removeView(ltVar);
            }
            ltVar.removeAllViews();
            ltVar.fby();
            ltVar.setWebChromeClient(null);
            ltVar.setWebViewClient(null);
            ltVar.setDownloadListener(null);
            ltVar.setDefaultTextEncodingName("UTF-8");
            ltVar.setAllowFileAccess(false);
            ltVar.setJavaScriptEnabled(true);
            ltVar.setCacheMode(-1);
            ltVar.setDatabaseEnabled(true);
            ltVar.setSupportZoom(false);
            ltVar.getWebView().setLayerType(0, null);
            ltVar.setBackgroundColor(0);
            ltVar.getWebView().setHorizontalScrollBarEnabled(false);
            ltVar.getWebView().setHorizontalScrollbarOverlay(false);
            ltVar.getWebView().setVerticalScrollBarEnabled(false);
            ltVar.getWebView().setVerticalScrollbarOverlay(false);
            ltVar.xkz();
            ltVar.setMixedContentMode(0);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "efwsmweeaMmOT8VqiROWIV75HZoMsA==", "Ses+kBeLbMW2Q9JK", 53);
        }
    }
}
