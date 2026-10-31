package com.vungle.ads.internal.ui;

import android.webkit.WebView;
import com.vungle.ads.EvaluateJsError;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class w extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ z f47646a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ WebView f47647b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f47648c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(z zVar, WebView webView, String str) {
        super(0);
        this.f47646a = zVar;
        this.f47647b = webView;
        this.f47648c = str;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        Object objA;
        WebView webView = this.f47647b;
        String str = this.f47648c;
        try {
            int i5 = Result.f71687b;
            objA = null;
            if (webView != null) {
                webView.evaluateJavascript(str, null);
                objA = Unit.f71706a;
            }
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        z zVar = this.f47646a;
        Throwable thA = Result.a(objA);
        if (thA != null) {
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Evaluate js failed ");
            sbA.append(thA.getLocalizedMessage());
            new EvaluateJsError(sbA.toString()).setLogEntry$vungle_ads_release(zVar.f47651a.q()).logErrorNoReturnValue$vungle_ads_release();
        }
        return Unit.f71706a;
    }
}
