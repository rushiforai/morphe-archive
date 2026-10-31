package com.bytedance.sdk.openadsdk.ok.ycx;

import com.bytedance.sdk.openadsdk.core.kgy;
import com.google.ads.mediation.fyber.FyberMediationAdapter;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import java.util.Arrays;
import java.util.HashSet;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class jc extends com.bytedance.sdk.component.ycx.pmi<JSONObject, JSONObject> {
    public static final HashSet<String> ycx = new HashSet<>(Arrays.asList("appInfo", "adInfo", "sendLog", "playable_style", "getTemplateInfo", "getTeMaiAds", "isViewable", "getScreenSize", "getCloseButtonInfo", "getVolume", "removeLoading", "sendReward", "subscribe_app_ad", "download_app_ad", "cancel_download_app_ad", "unsubscribe_app_ad", "landscape_click", "clickEvent", "renderDidFinish", "dynamicTrack", "skipVideo", FyberMediationAdapter.KEY_MUTE_VIDEO, "changeVideoState", "getCurrentVideoState", "send_temai_product_ids", "getMaterialMeta", "endcard_load", "pauseWebView", "pauseWebViewTimers", "webview_time_track", "getDownloadStatus", "openPrivacy", "openAdLandPageLinks", "getNativeSiteCustomData", n.f39150d));

    /* renamed from: zb, reason: collision with root package name */
    private final kgy f26925zb;

    public jc(kgy kgyVar) {
        this.f26925zb = kgyVar;
    }

    public static void ycx(com.bytedance.sdk.component.ycx.syc sycVar, kgy kgyVar) {
        sycVar.ycx(ycx, new jc(kgyVar));
    }

    @Override // com.bytedance.sdk.component.ycx.dj
    public JSONObject ycx(String str, JSONObject jSONObject, com.bytedance.sdk.component.ycx.lud ludVar) throws Exception {
        kgy.sya syaVar = new kgy.sya();
        syaVar.ycx = ActionCategory.CALL;
        syaVar.sya = str;
        syaVar.f25576dj = jSONObject;
        return this.f26925zb.ycx(syaVar, 3);
    }
}
