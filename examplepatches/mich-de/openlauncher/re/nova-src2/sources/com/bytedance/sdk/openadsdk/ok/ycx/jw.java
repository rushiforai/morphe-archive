package com.bytedance.sdk.openadsdk.ok.ycx;

import com.bytedance.sdk.openadsdk.core.kgy;
import com.google.ads.mediation.fyber.FyberMediationAdapter;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class jw extends com.bytedance.sdk.component.ycx.dj<JSONObject, JSONObject> {
    private final kgy ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final String f26926zb;

    public jw(String str, kgy kgyVar) {
        this.ycx = kgyVar;
        this.f26926zb = str;
    }

    public static void ycx(com.bytedance.sdk.component.ycx.syc sycVar, kgy kgyVar) {
        sycVar.ycx("appInfo", new jw("appInfo", kgyVar));
        sycVar.ycx("adInfo", new jw("adInfo", kgyVar));
        sycVar.ycx("sendLog", new jw("sendLog", kgyVar));
        sycVar.ycx("playable_style", new jw("playable_style", kgyVar));
        sycVar.ycx("getTemplateInfo", new jw("getTemplateInfo", kgyVar));
        sycVar.ycx("getTeMaiAds", new jw("getTeMaiAds", kgyVar));
        sycVar.ycx("isViewable", new jw("isViewable", kgyVar));
        sycVar.ycx("getScreenSize", new jw("getScreenSize", kgyVar));
        sycVar.ycx("getCloseButtonInfo", new jw("getCloseButtonInfo", kgyVar));
        sycVar.ycx("getVolume", new jw("getVolume", kgyVar));
        sycVar.ycx("removeLoading", new jw("removeLoading", kgyVar));
        sycVar.ycx("sendReward", new jw("sendReward", kgyVar));
        sycVar.ycx("subscribe_app_ad", new jw("subscribe_app_ad", kgyVar));
        sycVar.ycx("download_app_ad", new jw("download_app_ad", kgyVar));
        sycVar.ycx("cancel_download_app_ad", new jw("cancel_download_app_ad", kgyVar));
        sycVar.ycx("unsubscribe_app_ad", new jw("unsubscribe_app_ad", kgyVar));
        sycVar.ycx("landscape_click", new jw("landscape_click", kgyVar));
        sycVar.ycx("clickEvent", new jw("clickEvent", kgyVar));
        sycVar.ycx("renderDidFinish", new jw("renderDidFinish", kgyVar));
        sycVar.ycx("dynamicTrack", new jw("dynamicTrack", kgyVar));
        sycVar.ycx("skipVideo", new jw("skipVideo", kgyVar));
        sycVar.ycx(FyberMediationAdapter.KEY_MUTE_VIDEO, new jw(FyberMediationAdapter.KEY_MUTE_VIDEO, kgyVar));
        sycVar.ycx("changeVideoState", new jw("changeVideoState", kgyVar));
        sycVar.ycx("getCurrentVideoState", new jw("getCurrentVideoState", kgyVar));
        sycVar.ycx("send_temai_product_ids", new jw("send_temai_product_ids", kgyVar));
        sycVar.ycx("getMaterialMeta", new jw("getMaterialMeta", kgyVar));
        sycVar.ycx("endcard_load", new jw("endcard_load", kgyVar));
        sycVar.ycx("pauseWebView", new jw("pauseWebView", kgyVar));
        sycVar.ycx("pauseWebViewTimers", new jw("pauseWebViewTimers", kgyVar));
        sycVar.ycx("webview_time_track", new jw("webview_time_track", kgyVar));
        sycVar.ycx("openPrivacy", new jw("openPrivacy", kgyVar));
        sycVar.ycx("openAdLandPageLinks", new jw("openAdLandPageLinks", kgyVar));
        sycVar.ycx("getNativeSiteCustomData", new jw("getNativeSiteCustomData", kgyVar));
        sycVar.ycx(n.f39150d, new jw(n.f39150d, kgyVar));
    }

    @Override // com.bytedance.sdk.component.ycx.dj
    public JSONObject ycx(String str, JSONObject jSONObject, com.bytedance.sdk.component.ycx.lud ludVar) throws Exception {
        kgy.sya syaVar = new kgy.sya();
        syaVar.ycx = ActionCategory.CALL;
        syaVar.sya = this.f26926zb;
        syaVar.f25576dj = jSONObject;
        return this.ycx.ycx(syaVar, 3);
    }
}
