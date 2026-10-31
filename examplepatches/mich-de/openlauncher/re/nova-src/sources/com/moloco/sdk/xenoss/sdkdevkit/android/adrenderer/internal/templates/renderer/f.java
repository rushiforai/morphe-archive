package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer;

import android.webkit.ValueCallback;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import m7.m;

/* loaded from: classes4.dex */
public final /* synthetic */ class f implements ValueCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f39691a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ d f39692b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ WebView f39693c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f39694d;

    public /* synthetic */ f(d dVar, Object obj, WebView webView, int i5) {
        this.f39691a = i5;
        this.f39692b = dVar;
        this.f39694d = obj;
        this.f39693c = webView;
    }

    @Override // android.webkit.ValueCallback
    public final void onReceiveValue(Object obj) {
        switch (this.f39691a) {
            case 0:
                d.a(this.f39692b, (WebResourceResponse) this.f39694d, this.f39693c, (String) obj);
                break;
            default:
                d.a(this.f39692b, (m) this.f39694d, this.f39693c, (String) obj);
                break;
        }
    }
}
