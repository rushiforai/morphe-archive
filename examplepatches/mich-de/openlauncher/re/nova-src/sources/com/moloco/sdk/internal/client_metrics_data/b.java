package com.moloco.sdk.internal.client_metrics_data;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class b {

    /* renamed from: i0, reason: collision with root package name */
    public static final /* synthetic */ b[] f36272i0;

    /* renamed from: j0, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f36274j0;

    /* renamed from: k0, reason: collision with root package name */
    @NotNull
    public final String f36289k0;

    /* renamed from: a, reason: collision with root package name */
    public static final b f36255a = new b("SDKInitAttempt", 0, "sdk_init_attempt");

    /* renamed from: b, reason: collision with root package name */
    public static final b f36257b = new b("SDKInitSuccess", 1, "sdk_init_success");

    /* renamed from: c, reason: collision with root package name */
    public static final b f36259c = new b("SDKInitFailure", 2, "sdk_init_failure");

    /* renamed from: d, reason: collision with root package name */
    public static final b f36261d = new b("SDKPerformInitAttempt", 3, "sdk_perform_init_attempt");

    /* renamed from: e, reason: collision with root package name */
    public static final b f36263e = new b("SDKFetchInitAttempt", 4, "sdk_fetch_init_attempt");

    /* renamed from: f, reason: collision with root package name */
    public static final b f36265f = new b("SDKInitCacheRead", 5, "sdk_init_cache_read");

    /* renamed from: g, reason: collision with root package name */
    public static final b f36267g = new b("SDKInitCacheWrite", 6, "sdk_init_cache_write");

    /* renamed from: h, reason: collision with root package name */
    public static final b f36269h = new b("SDKInitCacheClear", 7, "sdk_init_cache_clear");

    /* renamed from: i, reason: collision with root package name */
    public static final b f36271i = new b("SDKInitFailureDifferentAppKey", 8, "sdk_init_failure_different_app_key");

    /* renamed from: j, reason: collision with root package name */
    public static final b f36273j = new b("CreateAd", 9, "create_ad");

    /* renamed from: k, reason: collision with root package name */
    public static final b f36275k = new b("LoadAdAttempt", 10, "load_ad_attempted");

    /* renamed from: l, reason: collision with root package name */
    public static final b f36276l = new b("LoadAdSuccess", 11, "load_ad_success");

    /* renamed from: m, reason: collision with root package name */
    public static final b f36277m = new b("LoadAdFailed", 12, "load_ad_failed");
    public static final b n = new b("NativeAdLoadAdAttempted", 13, "native_ad_load_attempted");
    public static final b o = new b("NativeLoadAd", 14, "native_ad_load");

    /* renamed from: p, reason: collision with root package name */
    public static final b f36278p = new b("BidTokenGetRequest", 15, "bid_token_get_request");

    /* renamed from: q, reason: collision with root package name */
    public static final b f36279q = new b("BidTokenGetResponse", 16, "bid_token_get_response");

    /* renamed from: r, reason: collision with root package name */
    public static final b f36280r = new b("BidTokenFetch", 17, "bid_token_fetch");

    /* renamed from: s, reason: collision with root package name */
    public static final b f36281s = new b("BidTokenDurationTimeoutOneSecond", 18, "bid_token_duration_crossed_1s");

    /* renamed from: t, reason: collision with root package name */
    public static final b f36282t = new b("BidTokenDurationTimeoutThreeSecond", 19, "bid_token_duration_crossed_3s");

    /* renamed from: u, reason: collision with root package name */
    public static final b f36283u = new b("ServerBidTokenFetch", 20, "sbt_fetch");

    /* renamed from: v, reason: collision with root package name */
    public static final b f36284v = new b("ServerBidTokenCached", 21, "sbt_cached");

    /* renamed from: w, reason: collision with root package name */
    public static final b f36285w = new b("ServerBidTokenApiFetch", 22, "sbt_api_fetch");

    /* renamed from: x, reason: collision with root package name */
    public static final b f36286x = new b("ServerBidTokenAsyncRefresh", 23, "sbt_async_fetch");

    /* renamed from: y, reason: collision with root package name */
    public static final b f36287y = new b("ClientBidTokenBuild", 24, "bid_token_build");

    /* renamed from: z, reason: collision with root package name */
    public static final b f36288z = new b("ClientBidTokenCached", 25, "cbt_cached");
    public static final b A = new b("ShowAdAttempt", 26, "show_ad_attempted");
    public static final b B = new b("ShowAdSuccess", 27, "show_ad_success");
    public static final b C = new b("ShowAdFailed", 28, "show_ad_failed");
    public static final b D = new b("AdClicked", 29, "ad_clicked");
    public static final b E = new b("AdClickedDeduped", 30, "ad_clicked_deduped");
    public static final b F = new b("CrashDetected", 31, "crash_detected");
    public static final b G = new b("WebviewLoadAd", 32, "webview_load_ad");
    public static final b H = new b("WebviewHtmlAdError", 33, "webview_html_ad_error");
    public static final b I = new b("WebviewHtmlAdRetryAttempt", 34, "webview_html_ad_retry_attempt");
    public static final b J = new b("WebviewHtmlAdIgnoredError", 35, "webview_html_ad_ignored_error");
    public static final b K = new b("WebviewEventHandled", 36, "webview_event_handled");
    public static final b L = new b("WebviewEventMultipleHandlers", 37, "webview_event_multiple_handlers");
    public static final b M = new b("WebviewPageLoadStart", 38, "webview_page_load_start");
    public static final b N = new b("WebviewPageLoadEnd", 39, "webview_page_load_end");
    public static final b O = new b("WebviewPageLoadFinishCallback", 40, "webview_page_load_finish_callback");
    public static final b P = new b("WebviewRequiredContentLoaded", 41, "webview_required_content_loaded");
    public static final b Q = new b("StoreLaunchStarted", 42, "store_launch_started");
    public static final b R = new b("StoreLaunchComplete", 43, "store_launch_complete");
    public static final b S = new b("TemplateBridgeNotifyReadyInvoked", 44, "template_bridge_notify_ready_invoked");
    public static final b T = new b("TemplateBridgeNotifyReadyCompleted", 45, "template_bridge_notify_ready_completed");
    public static final b U = new b("TemplateBridgeViewVisibleInvoked", 46, "template_bridge_view_visible_invoked");
    public static final b V = new b("TemplateBridgeViewVisibleCompleted", 47, "template_bridge_view_visible_completed");
    public static final b W = new b("FullscreenWebviewActivityOnCreate", 48, "fullscreen_webview_activity_create");
    public static final b X = new b("RewardIssued", 49, "reward_issued");
    public static final b Y = new b("UnknownCreativeType", 50, "unknown_creative_type");
    public static final b Z = new b("WebViewNotAvailable", 51, "webview_not_available");

    /* renamed from: a0, reason: collision with root package name */
    public static final b f36256a0 = new b("VastShowFileNotExists", 52, "vast_show_file_not_exists");

    /* renamed from: b0, reason: collision with root package name */
    public static final b f36258b0 = new b("SoftwareRenderingDetected", 53, "software_rendering_detected");

    /* renamed from: c0, reason: collision with root package name */
    public static final b f36260c0 = new b("ExoPlayerError", 54, "exoplayer_error");

    /* renamed from: d0, reason: collision with root package name */
    public static final b f36262d0 = new b("AdHidden", 55, "ad_hidden");

    /* renamed from: e0, reason: collision with root package name */
    public static final b f36264e0 = new b("NativeAdComposeViewNotAvailable", 56, "native_ad_compose_not_available");

    /* renamed from: f0, reason: collision with root package name */
    public static final b f36266f0 = new b("FullscreenAdComposeViewNotAvailable", 57, "fullscreen_ad_compose_not_available");

    /* renamed from: g0, reason: collision with root package name */
    public static final b f36268g0 = new b("CreativeRenderingCheck", 58, "creative_rendering_check");

    /* renamed from: h0, reason: collision with root package name */
    public static final b f36270h0 = new b("BannerNonHtmlAdm", 59, "banner_non_html_adm");

    static {
        b[] bVarArrA = a();
        f36272i0 = bVarArrA;
        f36274j0 = EnumEntriesKt.a(bVarArrA);
    }

    public b(String str, int i5, String str2) {
        this.f36289k0 = str2;
    }

    public static final /* synthetic */ b[] a() {
        return new b[]{f36255a, f36257b, f36259c, f36261d, f36263e, f36265f, f36267g, f36269h, f36271i, f36273j, f36275k, f36276l, f36277m, n, o, f36278p, f36279q, f36280r, f36281s, f36282t, f36283u, f36284v, f36285w, f36286x, f36287y, f36288z, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, f36256a0, f36258b0, f36260c0, f36262d0, f36264e0, f36266f0, f36268g0, f36270h0};
    }

    @NotNull
    public static EnumEntries<b> b() {
        return f36274j0;
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f36272i0.clone();
    }

    @NotNull
    public final String c() {
        return this.f36289k0;
    }

    @Override // java.lang.Enum
    @NotNull
    public String toString() {
        return this.f36289k0;
    }
}
