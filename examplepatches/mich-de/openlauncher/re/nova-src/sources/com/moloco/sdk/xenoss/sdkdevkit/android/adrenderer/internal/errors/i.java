package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class i implements c {

    /* renamed from: a, reason: collision with root package name */
    public static final i f38766a = new i("STATIC_BANNER_AD_UNKNOWN_ERROR", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final i f38767b = new i("STATIC_BANNER_AD_WEBVIEW_DATA_WITH_DEFAULT_BASE_URL_ERROR", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final i f38768c = new i("STATIC_BANNER_AD_WEBVIEW_RECEIVED_ERROR", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final i f38769d = new i("STATIC_BANNER_AD_WEBVIEW_RENDER_PROCESS_GONE_ERROR", 3);

    /* renamed from: e, reason: collision with root package name */
    public static final i f38770e = new i("STATIC_BANNER_AD_NON_HTML_ADM_ERROR", 4);

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ i[] f38771f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f38772g;

    static {
        i[] iVarArrB = b();
        f38771f = iVarArrB;
        f38772g = EnumEntriesKt.a(iVarArrB);
    }

    public i(String str, int i5) {
    }

    public static final /* synthetic */ i[] b() {
        return new i[]{f38766a, f38767b, f38768c, f38769d, f38770e};
    }

    @NotNull
    public static EnumEntries<i> c() {
        return f38772g;
    }

    public static i valueOf(String str) {
        return (i) Enum.valueOf(i.class, str);
    }

    public static i[] values() {
        return (i[]) f38771f.clone();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c
    @NotNull
    public String a() {
        return name();
    }
}
