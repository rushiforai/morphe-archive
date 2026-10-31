package com.vungle.ads.internal.presenter;

import android.webkit.WebView;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public final WebView f47355a;

    /* renamed from: b, reason: collision with root package name */
    public final com.vungle.ads.internal.ui.z f47356b;

    public a0(com.vungle.ads.internal.ui.z webViewClient, WebView webView) {
        Intrinsics.g(webView, "webView");
        Intrinsics.g(webViewClient, "webViewClient");
        this.f47355a = webView;
        this.f47356b = webViewClient;
    }

    public final WebView a() {
        return this.f47355a;
    }

    public final com.vungle.ads.internal.ui.z b() {
        return this.f47356b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a0)) {
            return false;
        }
        a0 a0Var = (a0) obj;
        return Intrinsics.b(this.f47355a, a0Var.f47355a) && Intrinsics.b(this.f47356b, a0Var.f47356b);
    }

    public final int hashCode() {
        return this.f47356b.hashCode() + (this.f47355a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("WebViewEntry(webView=");
        sbA.append(this.f47355a);
        sbA.append(", webViewClient=");
        sbA.append(this.f47356b);
        sbA.append(')');
        return sbA.toString();
    }
}
