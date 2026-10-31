package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.webview;

import android.content.Context;
import android.webkit.WebView;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.webview.b;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.z;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function10;
import w70.m1;

/* loaded from: classes4.dex */
public final /* synthetic */ class n implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f42044a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function10 f42045b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ WebView f42046c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f42047d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ m1 f42048e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Function1 f42049f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ z f42050g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Function0 f42051h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Function0 f42052i;

    public /* synthetic */ n(Function10 function10, WebView webView, int i5, m1 m1Var, Function1 function1, z zVar, Function0 function0, Function0 function02) {
        this.f42045b = function10;
        this.f42046c = webView;
        this.f42047d = i5;
        this.f42048e = m1Var;
        this.f42049f = function1;
        this.f42050g = zVar;
        this.f42051h = function0;
        this.f42052i = function02;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f42044a) {
            case 0:
                return b.a(this.f42045b, this.f42046c, this.f42047d, this.f42048e, this.f42049f, this.f42051h, this.f42050g, this.f42052i, (Context) obj);
            default:
                return b.a.a(this.f42045b, this.f42046c, this.f42047d, this.f42048e, this.f42049f, this.f42050g, this.f42051h, this.f42052i, (Context) obj);
        }
    }

    public /* synthetic */ n(Function10 function10, WebView webView, int i5, m1 m1Var, Function1 function1, Function0 function0, z zVar, Function0 function02) {
        this.f42045b = function10;
        this.f42046c = webView;
        this.f42047d = i5;
        this.f42048e = m1Var;
        this.f42049f = function1;
        this.f42051h = function0;
        this.f42050g = zVar;
        this.f42052i = function02;
    }
}
