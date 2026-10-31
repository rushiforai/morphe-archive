package com.vungle.ads.internal.presenter;

import android.content.Context;
import android.webkit.WebView;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class e0 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f47370a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e0(Context context) {
        super(0);
        this.f47370a = context;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        Object objA;
        ReentrantLock reentrantLock = f0.f47373a;
        Context context = this.f47370a;
        try {
            int i5 = Result.f71687b;
            new WebView(context).loadData("<html><head></head><body></body></html>", "text/html", "UTF-8");
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            objA = Integer.valueOf(com.vungle.ads.internal.util.t.a("WebViewManager", "Prewarmed webview loaded blank html"));
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            boolean z12 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("WebViewManager", "Prewarm webview failed", thA);
            f0.f47375c.set(false);
        }
        return Unit.f71706a;
    }
}
