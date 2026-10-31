package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import android.webkit.WebView;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.e, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2978e {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final String f38718a = "https://appassets.androidplatform.net";

    public static final void a(@NotNull WebView webView, @NotNull String data) {
        Intrinsics.g(webView, "<this>");
        Intrinsics.g(data, "data");
        webView.loadDataWithBaseURL(f38718a, data, "text/html", "utf-8", null);
    }
}
