package com.vungle.ads.internal.ui.view;

import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.vungle.ads.internal.presenter.f0;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import g.p;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final j f47622a;

    public g(j widget) {
        Intrinsics.g(widget, "widget");
        this.f47622a = widget;
    }

    public static final void a(g this$0) {
        Intrinsics.g(this$0, "this$0");
        this$0.run();
    }

    @Override // java.lang.Runnable
    public final void run() {
        WebView webView = this.f47622a.f47624b;
        if (webView == null) {
            return;
        }
        if (!Intrinsics.b(Looper.myLooper(), Looper.getMainLooper())) {
            new Handler(Looper.getMainLooper()).post(new p(this, 22));
            return;
        }
        try {
            try {
                int i5 = Result.f71687b;
                webView.onPause();
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                ResultKt.a(th2);
            }
            try {
                webView.stopLoading();
                Unit unit2 = Unit.f71706a;
            } catch (Throwable th3) {
                int i12 = Result.f71687b;
                ResultKt.a(th3);
            }
            try {
                webView.setWebChromeClient(null);
                Unit unit3 = Unit.f71706a;
            } catch (Throwable th4) {
                int i13 = Result.f71687b;
                ResultKt.a(th4);
            }
            try {
                webView.setWebViewClient(new WebViewClient());
                Unit unit4 = Unit.f71706a;
            } catch (Throwable th5) {
                int i14 = Result.f71687b;
                ResultKt.a(th5);
            }
            if (Build.VERSION.SDK_INT >= 29) {
                try {
                    webView.setWebViewRenderProcessClient(null);
                    Unit unit5 = Unit.f71706a;
                } catch (Throwable th6) {
                    int i15 = Result.f71687b;
                    ResultKt.a(th6);
                }
            }
            try {
                webView.loadUrl("about:blank");
                Unit unit6 = Unit.f71706a;
            } catch (Throwable th7) {
                int i16 = Result.f71687b;
                ResultKt.a(th7);
            }
            try {
                webView.clearHistory();
                Unit unit7 = Unit.f71706a;
            } catch (Throwable th8) {
                int i17 = Result.f71687b;
                ResultKt.a(th8);
            }
            try {
                webView.removeAllViews();
                Unit unit8 = Unit.f71706a;
            } catch (Throwable th9) {
                int i18 = Result.f71687b;
                ResultKt.a(th9);
            }
            try {
                this.f47622a.removeAllViews();
                Unit unit9 = Unit.f71706a;
            } catch (Throwable th10) {
                int i19 = Result.f71687b;
                ResultKt.a(th10);
            }
            try {
                String eventId = this.f47622a.getEventId();
                if (eventId != null) {
                    f0.a(eventId);
                    Unit unit10 = Unit.f71706a;
                }
            } catch (Throwable th11) {
                int i21 = Result.f71687b;
                ResultKt.a(th11);
            }
            try {
                webView.destroy();
                Unit unit11 = Unit.f71706a;
            } catch (Throwable th12) {
                int i22 = Result.f71687b;
                ResultKt.a(th12);
            }
            this.f47622a.f47624b = null;
        } catch (Throwable th13) {
            boolean z11 = u.f47714a;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Destroy webview: ");
            sbA.append(th13.getMessage());
            t.b("MRAIDAdWidget", sbA.toString());
        }
    }
}
