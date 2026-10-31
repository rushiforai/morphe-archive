package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class l implements com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c {

    /* renamed from: a, reason: collision with root package name */
    public static final l f39606a = new l("UNKNOWN_ERROR", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final l f39607b = new l("WEBVIEW_DATA_WITH_DEFAULT_BASE_URL_ERROR", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final l f39608c = new l("WEBVIEW_RECEIVED_ERROR", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final l f39609d = new l("WEBVIEW_REQUIRED_CONTENT_HTTP_ERROR", 3);

    /* renamed from: e, reason: collision with root package name */
    public static final l f39610e = new l("WEBVIEW_RENDER_PROCESS_GONE_ERROR", 4);

    /* renamed from: f, reason: collision with root package name */
    public static final l f39611f = new l("WEBVIEW_TIMEOUT_ERROR", 5);

    /* renamed from: g, reason: collision with root package name */
    public static final l f39612g = new l("WEBVIEW_NOT_AVAILABLE_ERROR", 6);

    /* renamed from: h, reason: collision with root package name */
    public static final l f39613h = new l("WEBVIEW_FULLSCREEN_ACTIVITY_START_FAILED", 7);

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ l[] f39614i;

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f39615j;

    static {
        l[] lVarArrB = b();
        f39614i = lVarArrB;
        f39615j = EnumEntriesKt.a(lVarArrB);
    }

    public l(String str, int i5) {
    }

    public static final /* synthetic */ l[] b() {
        return new l[]{f39606a, f39607b, f39608c, f39609d, f39610e, f39611f, f39612g, f39613h};
    }

    @NotNull
    public static EnumEntries<l> c() {
        return f39615j;
    }

    public static l valueOf(String str) {
        return (l) Enum.valueOf(l.class, str);
    }

    public static l[] values() {
        return (l[]) f39614i.clone();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c
    @NotNull
    public String a() {
        return name();
    }
}
