package com.bytedance.sdk.component.jw;

import android.webkit.WebSettings;
import com.bytedance.sdk.component.jw.fby;
import com.bytedance.sdk.component.utils.htf;

/* loaded from: classes2.dex */
public class jc {
    public static void ycx(fby fbyVar) {
        try {
            fby.sya scene = fbyVar.getScene();
            fbyVar.setSupportZoom(false);
            fbyVar.setDisplayZoomControls(false);
            fbyVar.setBuiltInZoomControls(false);
            fbyVar.setSupportMultipleWindows(false);
            fbyVar.setAllowFileAccess(false);
            fbyVar.setSavePassword(false);
            fbyVar.setWebViewClient(new fby.ycx());
            fbyVar.setVerticalScrollBarEnabled(false);
            fbyVar.setHorizontalScrollBarEnabled(false);
            fbyVar.setMixedContentMode(0);
            fbyVar.setDomStorageEnabled(true);
            fbyVar.setLayerType(0, null);
            fbyVar.setMediaPlaybackRequiresUserGesture(false);
            fbyVar.setUseWideViewPort(true);
            fbyVar.setLoadWithOverviewMode(true);
            if (scene == fby.sya.ADS || scene == fby.sya.ADS_V3 || scene == fby.sya.ADS_V4 || scene == fby.sya.EASY_PLAYABLE) {
                fbyVar.setJavaScriptCanOpenWindowsAutomatically(true);
                fbyVar.setLayoutAlgorithm(WebSettings.LayoutAlgorithm.NARROW_COLUMNS);
                fbyVar.setDatabaseEnabled(true);
            } else if (scene == fby.sya.LANDING_PAGE_WITH_VIDEO) {
                fbyVar.setLayerType(2, null);
            } else if (scene == fby.sya.VAST_ENDCARD) {
                fbyVar.setJavaScriptCanOpenWindowsAutomatically(true);
                fbyVar.setSupportZoom(true);
                fbyVar.setBuiltInZoomControls(true);
                fbyVar.setLayoutAlgorithm(WebSettings.LayoutAlgorithm.NARROW_COLUMNS);
                fbyVar.setDatabaseEnabled(true);
            } else if (scene != fby.sya.DSP) {
                htf.ycx("WebViewSettingsHelper", "initConfig: no special settings for scene = ".concat(String.valueOf(scene)));
                return;
            } else {
                fbyVar.setDefaultTextEncodingName("UTF-8");
                fbyVar.setDatabaseEnabled(true);
            }
            htf.ycx("WebViewSettingsHelper", "initConfig: apply webview settings success for scene = ".concat(String.valueOf(scene)));
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "bOsvowq5fvSFXsNUghazAF7iPZAR", "UuAkgSCzZ8GJTQ==", 72);
            th2.getMessage();
        }
    }
}
