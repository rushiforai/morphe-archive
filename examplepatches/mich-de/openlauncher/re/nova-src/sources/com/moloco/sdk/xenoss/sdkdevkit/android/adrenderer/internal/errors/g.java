package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class g implements c {

    /* renamed from: a, reason: collision with root package name */
    public static final g f38758a = new g("STATIC_AD_UNKNOWN_ERROR", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final g f38759b = new g("STATIC_AD_WEBVIEW_DATA_WITH_DEFAULT_BASE_URL_ERROR", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final g f38760c = new g("STATIC_AD_WEBVIEW_RECEIVED_ERROR", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final g f38761d = new g("STATIC_AD_WEBVIEW_RENDER_PROCESS_GONE_ERROR", 3);

    /* renamed from: e, reason: collision with root package name */
    public static final g f38762e = new g("STATIC_AD_NON_HTML_ADM_ERROR", 4);

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ g[] f38763f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f38764g;

    static {
        g[] gVarArrB = b();
        f38763f = gVarArrB;
        f38764g = EnumEntriesKt.a(gVarArrB);
    }

    public g(String str, int i5) {
    }

    public static final /* synthetic */ g[] b() {
        return new g[]{f38758a, f38759b, f38760c, f38761d, f38762e};
    }

    @NotNull
    public static EnumEntries<g> c() {
        return f38764g;
    }

    public static g valueOf(String str) {
        return (g) Enum.valueOf(g.class, str);
    }

    public static g[] values() {
        return (g[]) f38763f.clone();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c
    @NotNull
    public String a() {
        return name();
    }
}
