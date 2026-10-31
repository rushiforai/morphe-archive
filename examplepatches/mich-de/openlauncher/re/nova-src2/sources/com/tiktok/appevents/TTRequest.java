package com.tiktok.appevents;

import android.net.Uri;
import android.os.Build;
import android.text.TextUtils;
import com.amplitude.android.TrackingOptions;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.TikTokBusinessSdk;
import com.tiktok.appevents.edp.EDPConfig;
import com.tiktok.iap.TTInAppPurchaseWrapper;
import com.tiktok.util.HttpRequestUtil;
import com.tiktok.util.JSON;
import com.tiktok.util.LastSessionUtil;
import com.tiktok.util.SystemInfoUtil;
import com.tiktok.util.TTConst;
import com.tiktok.util.TTLogger;
import com.tiktok.util.TTUtil;
import com.tiktok.util.TimeUtil;
import com.tiktok.util.UrlConst;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes4.dex */
public class TTRequest {
    private static final int MAX_EVENT_SIZE = 50;
    private static final Map<String, String> getHeadParamMap;
    private static final Map<String, String> headParamMap;
    private static final String TAG = "TTRequest";
    private static final TTLogger logger = new TTLogger(TAG, TikTokBusinessSdk.getLogLevel());
    private static int toBeSentRequests = 0;
    private static int failedRequests = 0;
    private static int successfulRequests = 0;
    private static final TreeSet<Long> allRequestIds = new TreeSet<>();
    private static final List<TTAppEvent> successfullySentRequests = new CopyOnWriteArrayList();

    static {
        ConcurrentHashMap concurrentHashMap = new ConcurrentHashMap();
        headParamMap = concurrentHashMap;
        ConcurrentHashMap concurrentHashMap2 = new ConcurrentHashMap();
        getHeadParamMap = concurrentHashMap2;
        concurrentHashMap.put("Content-Type", "application/json");
        concurrentHashMap.put("Connection", "Keep-Alive");
        String str = "tiktok-business-android-sdk/1.6.1/" + TikTokBusinessSdk.getApiAvailableVersion();
        concurrentHashMap.put("User-Agent", str);
        concurrentHashMap2.put("Connection", "Keep-Alive");
        concurrentHashMap2.put("User-Agent", str);
        concurrentHashMap2.put("Content-Type", "application/json");
    }

    public static <T> List<List<T>> averageAssign(List<T> list, int i5) {
        ArrayList arrayList = new ArrayList();
        if (list != null && !list.isEmpty()) {
            try {
                ArrayList arrayList2 = new ArrayList();
                int size = list.size();
                for (int i11 = 0; i11 < size; i11++) {
                    try {
                        arrayList2.add(list.get(i11));
                        if (arrayList2.size() >= i5 || i11 == size - 1) {
                            arrayList.add(arrayList2);
                            arrayList2 = new ArrayList();
                        }
                    } catch (Throwable unused) {
                    }
                }
            } catch (Throwable unused2) {
                arrayList.add(list);
            }
        }
        return arrayList;
    }

    public static JSONObject buildConfigParams() {
        JSONObject jSONObjectBuild = JSON.build();
        try {
            JSON.putObject(jSONObjectBuild, "app", getAppInfo());
            JSONObject jSONObjectBuild2 = JSON.build();
            JSON.putObject(jSONObjectBuild2, TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, AndroidContextPlugin.PLATFORM);
            JSON.putObject(jSONObjectBuild2, "version", SystemInfoUtil.getAndroidVersion());
            if (TikTokBusinessSdk.isGaidCollectionEnabled()) {
                try {
                    JSON.putObject(jSONObjectBuild2, "gaid", TTIdentifierFactory.getGoogleAdIdInfo(TikTokBusinessSdk.getApplicationContext()).getAdId());
                } catch (Throwable unused) {
                }
            }
            JSON.putObject(jSONObjectBuild, "device", jSONObjectBuild2);
            if (TikTokBusinessSdk.isInSdkDebugMode().booleanValue()) {
                JSON.putObject(jSONObjectBuild, "debug", InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
            }
            JSONObject jSONObjectBuild3 = JSON.build();
            JSON.putObject(jSONObjectBuild3, PendingUpgradeStore.KEY_NAME, "tiktok/" + SystemInfoUtil.getLibraryName());
            JSON.putObject(jSONObjectBuild3, "version", SystemInfoUtil.getSDKVersion());
            JSON.putBoolean(jSONObjectBuild3, "smart_sdk_client_flag", TikTokBusinessSdk.isEdpEnable());
            JSON.putInt(jSONObjectBuild3, "auto_iap_track_config", TTInAppPurchaseWrapper.devAutoTrack);
            JSON.putObject(jSONObjectBuild, PlaceTypes.LIBRARY, jSONObjectBuild3);
        } catch (Throwable unused2) {
        }
        return jSONObjectBuild;
    }

    public static HttpRequestUtil.HttpResponse fetchDeferredDeeplinkWithCompletion() {
        return HttpRequestUtil.doPost(UrlConst.getDDLUrl(), headParamMap, TTRequestBuilder.ddlJson().toString(), false);
    }

    public static JSONObject getAppInfo() {
        JSONObject jSONObjectBuild = JSON.build();
        try {
            if (TikTokBusinessSdk.bothIdsProvided()) {
                JSON.putObject(jSONObjectBuild, "id", TikTokBusinessSdk.getAppId());
            }
            JSON.putObject(jSONObjectBuild, PendingUpgradeStore.KEY_NAME, SystemInfoUtil.getAppName());
            JSON.putObject(jSONObjectBuild, "namespace", SystemInfoUtil.getPackageName());
            JSON.putObject(jSONObjectBuild, "version", SystemInfoUtil.getAppVersionName());
            JSON.putObject(jSONObjectBuild, "build", SystemInfoUtil.getAppVersionCode() + com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            JSON.putObject(jSONObjectBuild, "tiktok_app_id", TikTokBusinessSdk.getTTAppId());
            JSON.putObject(jSONObjectBuild, "app_session_id", SystemInfoUtil.getAppSessionId());
            LastSessionUtil.inject2RequestParam(jSONObjectBuild);
        } catch (Throwable unused) {
        }
        return jSONObjectBuild;
    }

    public static JSONObject getBusinessSDKConfig() {
        if (TextUtils.isEmpty(TikTokBusinessSdk.getTTAppId()) || TextUtils.isEmpty(TikTokBusinessSdk.getAppId())) {
            JSONObject jSONObjectBuild = JSON.build();
            JSON.putBoolean(jSONObjectBuild, EDPConfig.ConfigConst.ENABLE_SDK, false);
            logger.debug("config request return by appid or ttAppId", new Object[0]);
            return jSONObjectBuild;
        }
        JSONObject jSONObjectBuildConfigParams = buildConfigParams();
        String configUrl = UrlConst.getConfigUrl();
        try {
            String tTAppId = TikTokBusinessSdk.getTTAppId();
            Uri.Builder builderBuildUpon = Uri.parse(configUrl).buildUpon();
            if (tTAppId == null) {
                tTAppId = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            configUrl = builderBuildUpon.appendQueryParameter("tiktok_app_id", tTAppId).appendQueryParameter("sdk_version", SystemInfoUtil.getSDKVersion()).appendQueryParameter(TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, AndroidContextPlugin.PLATFORM).appendQueryParameter("model", Build.MODEL).appendQueryParameter("app_version", SystemInfoUtil.getAppVersionName()).appendQueryParameter(TrackingOptions.AMP_TRACKING_OPTION_OS_VERSION, SystemInfoUtil.getAndroidVersion()).appendQueryParameter("locale", SystemInfoUtil.getBcp47Language()).appendQueryParameter("namespace", SystemInfoUtil.getPackageName()).build().toString();
        } catch (Throwable unused) {
        }
        HttpRequestUtil.HttpResponse httpResponseDoPost = HttpRequestUtil.doPost(configUrl, getHeadParamMap, jSONObjectBuildConfigParams.toString(), false);
        if (httpResponseDoPost != null) {
            TTLogger tTLogger = logger;
            tTLogger.debug(httpResponseDoPost.url, new Object[0]);
            tTLogger.debug("code=" + String.valueOf(httpResponseDoPost.code), new Object[0]);
            tTLogger.debug("rsp=".concat(String.valueOf(httpResponseDoPost.body)), new Object[0]);
        }
        if (httpResponseDoPost == null || !httpResponseDoPost.isOK()) {
            return null;
        }
        return JSON.getJsonObject(httpResponseDoPost.body, "data");
    }

    public static JSONObject getDebugModeConfig() {
        try {
            HttpRequestUtil.HttpResponse httpResponseDoPost = HttpRequestUtil.doPost(UrlConst.getDebugModeUrl(), getHeadParamMap, buildConfigParams().toString(), false);
            if (httpResponseDoPost == null || !httpResponseDoPost.isOK()) {
                return null;
            }
            return JSON.getJsonObject(httpResponseDoPost.body, "data");
        } catch (Throwable unused) {
            return null;
        }
    }

    public static synchronized List<TTAppEvent> getSuccessfullySentRequests() {
        return successfullySentRequests;
    }

    private static void notifyChange() {
        TikTokBusinessSdk.NetworkListener networkListener = TikTokBusinessSdk.networkListener;
        if (networkListener != null) {
            networkListener.onNetworkChange(toBeSentRequests, successfulRequests, failedRequests, allRequestIds.size() + TTAppEventsQueue.size(), successfullySentRequests.size());
        }
    }

    public static synchronized List<TTAppEvent> reportAppEvent(JSONObject jSONObject, List<TTAppEvent> list, boolean z11) {
        try {
            TTUtil.checkThread(TAG);
            if (list != null && !list.isEmpty()) {
                toBeSentRequests = list.size();
                Iterator<TTAppEvent> it = list.iterator();
                while (it.hasNext()) {
                    allRequestIds.add(it.next().getUniqueId());
                }
                failedRequests = 0;
                successfulRequests = 0;
                notifyChange();
                String batchUrl = UrlConst.getBatchUrl();
                ArrayList arrayList = new ArrayList();
                int size = 0;
                for (List list2 : averageAssign(list, 50)) {
                    JSONArray jSONArrayBuildArr = JSON.buildArr();
                    Iterator it2 = list2.iterator();
                    while (it2.hasNext()) {
                        JSONObject jSONObjectTransferJson = transferJson((TTAppEvent) it2.next());
                        if (jSONObjectTransferJson != null) {
                            JSON.putArr(jSONArrayBuildArr, jSONObjectTransferJson);
                        }
                    }
                    if (jSONArrayBuildArr.length() != 0) {
                        JSON.putObject(jSONObject, "batch", null);
                        try {
                            JSON.putObject(jSONObject, "batch", jSONArrayBuildArr);
                            HttpRequestUtil.HttpResponse httpResponseDoPost = HttpRequestUtil.doPost(batchUrl, headParamMap, jSONObject.toString());
                            if (z11) {
                                return null;
                            }
                            if (httpResponseDoPost == null || !httpResponseDoPost.isOK()) {
                                arrayList.addAll(list2);
                                failedRequests += list2.size();
                            } else {
                                try {
                                    TTLogger tTLogger = logger;
                                    tTLogger.debug("url=" + String.valueOf(batchUrl), new Object[0]);
                                    tTLogger.debug("rsp=" + String.valueOf(httpResponseDoPost.body), new Object[0]);
                                    int i5 = httpResponseDoPost.code;
                                    if (TikTokBusinessSdk.isInSdkDebugMode().booleanValue() || i5 == TTConst.ApiErrorCodes.API_ERROR.code.intValue() || i5 == TTConst.ApiErrorCodes.PARTIAL_SUCCESS.code.intValue()) {
                                        size += list2.size();
                                        failedRequests += list2.size();
                                    } else if (i5 != 0) {
                                        arrayList.addAll(list2);
                                        failedRequests += list2.size();
                                    } else {
                                        successfulRequests += list2.size();
                                        successfullySentRequests.addAll(list2);
                                    }
                                } catch (Throwable th2) {
                                    failedRequests += list2.size();
                                    arrayList.addAll(list2);
                                    TTCrashHandler.handleCrash(TAG, th2, 2);
                                }
                            }
                            notifyChange();
                        } catch (Throwable th3) {
                            if (!z11) {
                                arrayList.addAll(list2);
                            }
                            TTCrashHandler.handleCrash(TAG, th3, 2);
                        }
                    }
                }
                TTLogger tTLogger2 = logger;
                tTLogger2.debug("Flushed %d events successfully", Integer.valueOf(successfulRequests));
                if (!arrayList.isEmpty()) {
                    tTLogger2.debug("Failed to flush %d events, will save them to disk", new Object[0]);
                }
                if (size != 0) {
                    tTLogger2.debug("Failed to flush " + size + " events, will discard them", new Object[0]);
                    TTAppEventLogger.totalDumped = TTAppEventLogger.totalDumped + size;
                    TikTokBusinessSdk.DiskStatusListener diskStatusListener = TikTokBusinessSdk.diskListener;
                    if (diskStatusListener != null) {
                        diskStatusListener.onDumped(TTAppEventLogger.totalDumped);
                    }
                }
                tTLogger2.debug("Failed to flush %d events in total", Integer.valueOf(failedRequests));
                toBeSentRequests = 0;
                failedRequests = 0;
                successfulRequests = 0;
                notifyChange();
                return arrayList;
            }
            return new ArrayList();
        } catch (Throwable th4) {
            throw th4;
        }
    }

    public static HttpRequestUtil.HttpResponse reportMonitorEvent(JSONObject jSONObject) {
        return HttpRequestUtil.doPost(UrlConst.getMonitorUrl(), headParamMap, jSONObject.toString());
    }

    private static JSONObject transferJson(TTAppEvent tTAppEvent) {
        if (tTAppEvent == null) {
            return null;
        }
        try {
            JSONObject jSONObjectBuild = JSON.build();
            JSON.putObject(jSONObjectBuild, "event_id", UUID.randomUUID());
            JSON.putObject(jSONObjectBuild, "tt_event_id", TextUtils.isEmpty(tTAppEvent.getEventId()) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : tTAppEvent.getEventId());
            JSON.putObject(jSONObjectBuild, TTConst.TRACK_TYPE, tTAppEvent.getType());
            if (tTAppEvent.getEventName() != null) {
                JSON.putObject(jSONObjectBuild, DatabaseConstants.EVENT_FIELD, tTAppEvent.getEventName());
            }
            JSON.putObject(jSONObjectBuild, "timestamp", TimeUtil.getISO8601Timestamp(tTAppEvent.getTimeStamp()));
            if (TikTokBusinessSdk.isInSdkLDUMode().booleanValue()) {
                JSON.putBoolean(jSONObjectBuild, "limited_data_use", true);
            }
            JSONObject jSONObjectBuild2 = JSON.build(tTAppEvent.getPropertiesJson());
            if (jSONObjectBuild2 != null && jSONObjectBuild2.length() > 0) {
                JSON.putObject(jSONObjectBuild, "properties", jSONObjectBuild2);
            }
            JSON.putObject(jSONObjectBuild, "context", TTRequestBuilder.getContextForApi(tTAppEvent));
            ReferrerInfo installReferrer = SystemInfoUtil.getInstallReferrer();
            if (installReferrer != null) {
                JSON.putLong(jSONObjectBuild, "gp_referrer_install_ts", installReferrer.getGpReferrerInstallTs());
                JSON.putLong(jSONObjectBuild, "gp_referrer_click_ts", installReferrer.getGpReferrerClickTs());
            }
            String screenShot = tTAppEvent.getScreenShot();
            if (!TextUtils.isEmpty(screenShot)) {
                JSON.putObject(jSONObjectBuild, "screenshot", screenShot);
            }
            return jSONObjectBuild;
        } catch (Throwable th2) {
            TTCrashHandler.handleCrash(TAG, th2, 2);
            return null;
        }
    }
}
