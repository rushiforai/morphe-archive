package com.moloco.sdk.internal.client_metrics_data;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class e {

    /* renamed from: b, reason: collision with root package name */
    public static final e f36306b = new e("SDKInit", 0, "sdk_init_time");

    /* renamed from: c, reason: collision with root package name */
    public static final e f36307c = new e("SDKPerformInitAttempt", 1, "sdk_perform_init_time_ms");

    /* renamed from: d, reason: collision with root package name */
    public static final e f36308d = new e("SDKInitHttpRequest", 2, "sdk_init_request_time_ms");

    /* renamed from: e, reason: collision with root package name */
    public static final e f36309e = new e("SDKInitCacheRead", 3, "sdk_init_cache_read_time_ms");

    /* renamed from: f, reason: collision with root package name */
    public static final e f36310f = new e("SDKInitCacheWrite", 4, "sdk_init_cache_write_time_ms");

    /* renamed from: g, reason: collision with root package name */
    public static final e f36311g = new e("SDKInitCacheClear", 5, "sdk_init_cache_clear_time_ms");

    /* renamed from: h, reason: collision with root package name */
    public static final e f36312h = new e("CreateAd", 6, "create_ad_time_ms");

    /* renamed from: i, reason: collision with root package name */
    public static final e f36313i = new e("CreateAdAwaitAdFactory", 7, "create_ad_await_ad_factory_time_ms");

    /* renamed from: j, reason: collision with root package name */
    public static final e f36314j = new e("LoadAd", 8, "load_ad_time");

    /* renamed from: k, reason: collision with root package name */
    public static final e f36315k = new e("NativePrepareAd", 9, "native_ad_load_prepare_time");

    /* renamed from: l, reason: collision with root package name */
    public static final e f36316l = new e("BidTokenFetch", 10, "bid_token_fetch_time");

    /* renamed from: m, reason: collision with root package name */
    public static final e f36317m = new e("ServerBidTokenFetch", 11, "sbt_fetch_time_ms");
    public static final e n = new e("ServerBidTokenApiFetchTime", 12, "sbt_api_fetch_time_ms");
    public static final e o = new e("ClientBidTokenBuild", 13, "bid_token_build_time_ms");

    /* renamed from: p, reason: collision with root package name */
    public static final e f36318p = new e("LoadToShow", 14, "load_to_show_time");

    /* renamed from: q, reason: collision with root package name */
    public static final e f36319q = new e("CreateToLoad", 15, "ad_create_to_load_ms");

    /* renamed from: r, reason: collision with root package name */
    public static final e f36320r = new e("WebviewLoadAd", 16, "webview_load_ad_ms");

    /* renamed from: s, reason: collision with root package name */
    public static final e f36321s = new e("WebviewEventHandled", 17, "webview_event_handled_time_ms");

    /* renamed from: t, reason: collision with root package name */
    public static final e f36322t = new e("WebviewEventHandlerLatency", 18, "webview_event_handler_latency_ms");

    /* renamed from: u, reason: collision with root package name */
    public static final e f36323u = new e("WebviewPageLoadLatency", 19, "webview_page_load_ms");

    /* renamed from: v, reason: collision with root package name */
    public static final e f36324v = new e("WebviewRequiredContentLoadLatency", 20, "webview_required_content_load_ms");

    /* renamed from: w, reason: collision with root package name */
    public static final e f36325w = new e("VastShowFileNotExistsLoadToShow", 21, "vast_show_file_not_exists_load_to_show_ms");

    /* renamed from: x, reason: collision with root package name */
    public static final /* synthetic */ e[] f36326x;

    /* renamed from: y, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f36327y;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f36328a;

    static {
        e[] eVarArrA = a();
        f36326x = eVarArrA;
        f36327y = EnumEntriesKt.a(eVarArrA);
    }

    public e(String str, int i5, String str2) {
        this.f36328a = str2;
    }

    public static final /* synthetic */ e[] a() {
        return new e[]{f36306b, f36307c, f36308d, f36309e, f36310f, f36311g, f36312h, f36313i, f36314j, f36315k, f36316l, f36317m, n, o, f36318p, f36319q, f36320r, f36321s, f36322t, f36323u, f36324v, f36325w};
    }

    @NotNull
    public static EnumEntries<e> b() {
        return f36327y;
    }

    public static e valueOf(String str) {
        return (e) Enum.valueOf(e.class, str);
    }

    public static e[] values() {
        return (e[]) f36326x.clone();
    }

    @NotNull
    public final String c() {
        return this.f36328a;
    }

    @Override // java.lang.Enum
    @NotNull
    public String toString() {
        return this.f36328a;
    }
}
