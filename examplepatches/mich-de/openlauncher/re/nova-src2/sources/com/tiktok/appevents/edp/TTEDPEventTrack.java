package com.tiktok.appevents.edp;

import com.tiktok.TikTokBusinessSdk;
import com.tiktok.util.JSON;
import java.util.Random;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public class TTEDPEventTrack {
    public static volatile long LAST_CLICK_TS = 0;
    private static volatile boolean hasSendLaunch = false;
    public static volatile boolean isSending = false;
    public static volatile boolean pageShowIsSending = false;
    private static final Random sRandom = new Random();
    private static TTAppLaunchEvent ttAppLaunchEvent;

    public static boolean checkUpload() {
        return sRandom.nextDouble() <= EDPConfig.report_frequency_control;
    }

    public static void trackAppLaunch(String str, String str2) {
        try {
            JSONObject jSONObjectBuild = JSON.build();
            JSON.putObject(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_REFER, str);
            JSON.putObject(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_SOURCE_URL, str2);
            JSONObject jSONObjectBuild2 = JSON.build();
            JSON.putObject(jSONObjectBuild2, "meta", jSONObjectBuild);
            if (TikTokBusinessSdk.isInitialized()) {
                TikTokBusinessSdk.getAppEventLogger().trackEdp(TTEDPEventConstants.EDP_EVENT_NAME_APP_LAUNCH, jSONObjectBuild2, null);
            } else {
                if (ttAppLaunchEvent != null || hasSendLaunch) {
                    return;
                }
                ttAppLaunchEvent = new TTAppLaunchEvent(jSONObjectBuild, System.currentTimeMillis());
            }
        } catch (Throwable unused) {
        }
    }

    public static void trackClick(String str, float f11, float f12, int i5, int i11, String str2, String str3, JSONObject jSONObject, int i12, long j11) {
        try {
            LAST_CLICK_TS = System.currentTimeMillis();
            JSONObject jSONObjectBuild = JSON.build();
            JSON.putDouble(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_CLICK_POSITON_X, f11);
            JSON.putDouble(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_CLICK_POSITON_Y, f12);
            JSON.putInt(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_CLICK_SIZE_W, i5);
            JSON.putInt(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_CLICK_SIZE_H, i11);
            JSON.putObject(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_CLICK_BUTTON_TEXT, str2);
            JSON.putObject(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_CURRENT_PAGE_NAME, str3);
            JSON.putObject(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAGE_COMPONENTS, jSONObject);
            JSON.putInt(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAGE_DEEP_COUNT, i12);
            JSON.putLong(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_CLICK_DURATION, j11);
            JSON.putObject(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_CLASS_NAME, str);
            JSONObject jSONObjectBuild2 = JSON.build();
            JSON.putObject(jSONObjectBuild2, "meta", jSONObjectBuild);
            TikTokBusinessSdk.getAppEventLogger().trackEdp(TTEDPEventConstants.EDP_EVENT_NAME_CLICK, jSONObjectBuild2, null);
        } catch (Throwable unused) {
        }
    }

    public static void trackFirstAppLaunch() {
        try {
            if (ttAppLaunchEvent != null) {
                hasSendLaunch = true;
                JSONObject jSONObjectBuild = JSON.build();
                JSON.putObject(jSONObjectBuild, "meta", ttAppLaunchEvent.getProp());
                TikTokBusinessSdk.getAppEventLogger().trackEdp(TTEDPEventConstants.EDP_EVENT_NAME_APP_LAUNCH, jSONObjectBuild, null);
                ttAppLaunchEvent = null;
            }
        } catch (Exception unused) {
        }
    }

    public static void trackPageShow(String str, int i5, boolean z11, JSONObject jSONObject, int i11) {
        try {
            JSONObject jSONObjectBuild = JSON.build();
            JSON.putObject(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_CURRENT_PAGE_NAME, str);
            JSON.putInt(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, i5);
            JSON.putBoolean(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_FROM_BACKGROUND, z11);
            JSON.putObject(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAGE_COMPONENTS, jSONObject);
            JSON.putInt(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAGE_DEEP_COUNT, i11);
            JSONObject jSONObjectBuild2 = JSON.build();
            JSON.putObject(jSONObjectBuild2, "meta", jSONObjectBuild);
            TikTokBusinessSdk.getAppEventLogger().trackEdp(TTEDPEventConstants.EDP_EVENT_NAME_PAGE_SHOW, jSONObjectBuild2, null);
        } catch (Throwable unused) {
        }
    }

    public static void trackPayShow(int i5, JSONArray jSONArray) {
        try {
            JSONObject jSONObjectBuild = JSON.build();
            JSON.putInt(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, i5);
            JSON.putObject(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_SKU_INFO, jSONArray);
            JSONObject jSONObjectBuild2 = JSON.build();
            JSON.putObject(jSONObjectBuild2, "meta", jSONObjectBuild);
            TikTokBusinessSdk.getAppEventLogger().trackEdp(TTEDPEventConstants.EDP_EVENT_NAME_PAY_SHOW, jSONObjectBuild2, null);
        } catch (Throwable unused) {
        }
    }

    public static void trackUnityEvent(String str, JSONObject jSONObject) {
        try {
            JSONObject jSONObjectBuild = JSON.build();
            JSON.putObject(jSONObjectBuild, "meta", jSONObject);
            JSON.putObject(jSONObjectBuild, "api_platform", jSONObject.remove("api_platform"));
            TikTokBusinessSdk.getAppEventLogger().trackEdp(str, jSONObjectBuild, null);
        } catch (Throwable unused) {
        }
    }

    public static void trackWebviewRequest(String str) {
        try {
            JSONObject jSONObjectBuild = JSON.build();
            JSON.putObject(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str);
            JSONObject jSONObjectBuild2 = JSON.build();
            JSON.putObject(jSONObjectBuild2, "meta", jSONObjectBuild);
            TikTokBusinessSdk.getAppEventLogger().trackEdp(TTEDPEventConstants.EDP_EVENT_NAME_WEBVIEW_REQUEST, jSONObjectBuild2, null);
        } catch (Throwable unused) {
        }
    }
}
