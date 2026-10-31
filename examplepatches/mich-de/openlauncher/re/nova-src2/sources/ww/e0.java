package ww;

import android.content.DialogInterface;
import android.webkit.ConsoleMessage;
import android.webkit.JsResult;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import com.stripe.android.view.PaymentAuthWebViewActivity;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e0 extends WebChromeClient {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentAuthWebViewActivity f94766a;

    /* renamed from: b, reason: collision with root package name */
    public final xq.c f94767b;

    public e0(PaymentAuthWebViewActivity paymentAuthWebViewActivity, xq.c logger) {
        Intrinsics.g(logger, "logger");
        this.f94766a = paymentAuthWebViewActivity;
        this.f94767b = logger;
    }

    @Override // android.webkit.WebChromeClient
    public final boolean onConsoleMessage(ConsoleMessage consoleMessage) {
        String strMessage;
        if (consoleMessage != null && (strMessage = consoleMessage.message()) != null) {
            this.f94767b.a(strMessage);
        }
        return super.onConsoleMessage(consoleMessage);
    }

    @Override // android.webkit.WebChromeClient
    public final boolean onJsConfirm(WebView webView, String str, String str2, final JsResult jsResult) {
        m.j jVar = new m.j(this.f94766a, 2132083290);
        jVar.f75297a.f75249f = str2;
        final int i5 = 0;
        m.j positiveButton = jVar.setPositiveButton(17039370, new DialogInterface.OnClickListener() { // from class: ww.d0
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i11) {
                switch (i5) {
                    case 0:
                        JsResult jsResult2 = jsResult;
                        if (jsResult2 != null) {
                            jsResult2.confirm();
                            break;
                        }
                        break;
                    default:
                        JsResult jsResult3 = jsResult;
                        if (jsResult3 != null) {
                            jsResult3.cancel();
                            break;
                        }
                        break;
                }
            }
        });
        final int i11 = 1;
        positiveButton.setNegativeButton(17039360, new DialogInterface.OnClickListener() { // from class: ww.d0
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i112) {
                switch (i11) {
                    case 0:
                        JsResult jsResult2 = jsResult;
                        if (jsResult2 != null) {
                            jsResult2.confirm();
                            break;
                        }
                        break;
                    default:
                        JsResult jsResult3 = jsResult;
                        if (jsResult3 != null) {
                            jsResult3.cancel();
                            break;
                        }
                        break;
                }
            }
        }).create().show();
        return true;
    }
}
