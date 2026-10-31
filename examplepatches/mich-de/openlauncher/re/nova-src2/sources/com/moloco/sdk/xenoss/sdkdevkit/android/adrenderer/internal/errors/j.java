package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class j implements c {

    /* renamed from: a, reason: collision with root package name */
    public static final j f38773a = new j("STATIC_FULLSCREEN_AD_UNKNOWN_ERROR", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final j f38774b = new j("STATIC_FULLSCREEN_AD_WEBVIEW_DATA_WITH_DEFAULT_BASE_URL_ERROR", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final j f38775c = new j("STATIC_FULLSCREEN_AD_WEBVIEW_RECEIVED_ERROR", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final j f38776d = new j("STATIC_FULLSCREEN_AD_WEBVIEW_RENDER_PROCESS_GONE_ERROR", 3);

    /* renamed from: e, reason: collision with root package name */
    public static final j f38777e = new j("STATIC_FULLSCREEN_AD_NON_HTML_ADM_ERROR", 4);

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ j[] f38778f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f38779g;

    static {
        j[] jVarArrB = b();
        f38778f = jVarArrB;
        f38779g = EnumEntriesKt.a(jVarArrB);
    }

    public j(String str, int i5) {
    }

    public static final /* synthetic */ j[] b() {
        return new j[]{f38773a, f38774b, f38775c, f38776d, f38777e};
    }

    @NotNull
    public static EnumEntries<j> c() {
        return f38779g;
    }

    public static j valueOf(String str) {
        return (j) Enum.valueOf(j.class, str);
    }

    public static j[] values() {
        return (j[]) f38778f.clone();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c
    @NotNull
    public String a() {
        return name();
    }
}
