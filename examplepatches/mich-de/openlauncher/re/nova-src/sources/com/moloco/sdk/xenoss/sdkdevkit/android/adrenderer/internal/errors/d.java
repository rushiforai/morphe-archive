package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class d implements c {

    /* renamed from: a, reason: collision with root package name */
    public static final d f38735a = new d("MRAID_WEBVIEW_CLIENT_UNRECOVERABLE_ERROR", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final d f38736b = new d("MRAID_WEBVIEW_CLIENT_RENDER_PROCESS_GONE_ERROR", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final d f38737c = new d("MRAID_WEBVIEW_LOAD_DATA_WITH_BASE_URL_ERROR", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final d f38738d = new d("MRAID_WEBVIEW_PAGE_DIDNT_LOAD_ERROR", 3);

    /* renamed from: e, reason: collision with root package name */
    public static final d f38739e = new d("MRAID_WEBVIEW_INTERNAL_TIMEOUT_ERROR", 4);

    /* renamed from: f, reason: collision with root package name */
    public static final d f38740f = new d("MRAID_FULLSCREEN_WEBVIEW_CLIENT_UNRECOVERABLE_ERROR", 5);

    /* renamed from: g, reason: collision with root package name */
    public static final d f38741g = new d("MRAID_FULLSCREEN_WEBVIEW_CLIENT_RENDER_PROCESS_GONE_ERROR", 6);

    /* renamed from: h, reason: collision with root package name */
    public static final d f38742h = new d("MRAID_FULLSCREEN_WEBVIEW_LOAD_DATA_WITH_BASE_URL_ERROR", 7);

    /* renamed from: i, reason: collision with root package name */
    public static final d f38743i = new d("MRAID_FULLSCREEN_WEBVIEW_PAGE_DIDNT_LOAD_ERROR", 8);

    /* renamed from: j, reason: collision with root package name */
    public static final d f38744j = new d("MRAID_FULLSCREEN_AD_ACTIVITY_SHOW_FAILED_ERROR", 9);

    /* renamed from: k, reason: collision with root package name */
    public static final d f38745k = new d("MRAID_BANNER_WEBVIEW_CLIENT_UNRECOVERABLE_ERROR", 10);

    /* renamed from: l, reason: collision with root package name */
    public static final d f38746l = new d("MRAID_BANNER_WEBVIEW_CLIENT_RENDER_PROCESS_GONE_ERROR", 11);

    /* renamed from: m, reason: collision with root package name */
    public static final d f38747m = new d("MRAID_BANNER_WEBVIEW_LOAD_DATA_WITH_BASE_URL_ERROR", 12);
    public static final d n = new d("MRAID_BANNER_WEBVIEW_PAGE_DIDNT_LOAD_ERROR", 13);
    public static final /* synthetic */ d[] o;

    /* renamed from: p, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f38748p;

    static {
        d[] dVarArrB = b();
        o = dVarArrB;
        f38748p = EnumEntriesKt.a(dVarArrB);
    }

    public d(String str, int i5) {
    }

    public static final /* synthetic */ d[] b() {
        return new d[]{f38735a, f38736b, f38737c, f38738d, f38739e, f38740f, f38741g, f38742h, f38743i, f38744j, f38745k, f38746l, f38747m, n};
    }

    @NotNull
    public static EnumEntries<d> c() {
        return f38748p;
    }

    public static d valueOf(String str) {
        return (d) Enum.valueOf(d.class, str);
    }

    public static d[] values() {
        return (d[]) o.clone();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c
    @NotNull
    public String a() {
        return name();
    }
}
