package defpackage;

import android.app.ProgressDialog;
import android.graphics.Bitmap;
import android.net.http.SslError;
import android.webkit.CookieManager;
import android.webkit.SslErrorHandler;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.facebook.FacebookDialogException;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class tb extends WebViewClient {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ tb(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // android.webkit.WebViewClient
    public final void onPageFinished(WebView webView, String str) {
        ProgressDialog progressDialog;
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                super.onPageFinished(webView, str);
                String cookie = CookieManager.getInstance().getCookie(str);
                if (cookie != null) {
                    x45 x45Var = (x45) obj;
                    Iterator it2 = muc.p0(cookie, new String[]{";"}, 0, 6).iterator();
                    while (it2.hasNext()) {
                        String string = muc.y0((String) it2.next()).toString();
                        if (tuc.N(string, "CF_Authorization=", false)) {
                            String strS0 = muc.s0(string, "CF_Authorization=", string);
                            z92 z92Var = new z92();
                            z92Var.d("CF_Authorization");
                            z92Var.f(strS0);
                            z92Var.b("medium.com");
                            z92Var.e("/");
                            long jCurrentTimeMillis = System.currentTimeMillis();
                            int i2 = in3.d;
                            z92Var.c(in3.d(hlg.T(24, mn3.HOURS)) + jCurrentTimeMillis);
                            z92Var.f = true;
                            x45Var.invoke(z92Var.a());
                        }
                    }
                }
                break;
            default:
                webView.getClass();
                str.getClass();
                super.onPageFinished(webView, str);
                n1f n1fVar = (n1f) obj;
                if (!n1fVar.j && (progressDialog = n1fVar.e) != null) {
                    progressDialog.dismiss();
                }
                FrameLayout frameLayout = n1fVar.g;
                if (frameLayout != null) {
                    frameLayout.setBackgroundColor(0);
                }
                m1f m1fVar = n1fVar.d;
                if (m1fVar != null) {
                    m1fVar.setVisibility(0);
                }
                ImageView imageView = n1fVar.f;
                if (imageView != null) {
                    imageView.setVisibility(0);
                }
                n1fVar.k = true;
                break;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onPageStarted(WebView webView, String str, Bitmap bitmap) {
        ProgressDialog progressDialog;
        switch (this.a) {
            case 1:
                webView.getClass();
                str.getClass();
                f94 f94Var = f94.a;
                super.onPageStarted(webView, str, bitmap);
                n1f n1fVar = (n1f) this.b;
                if (!n1fVar.j && (progressDialog = n1fVar.e) != null) {
                    progressDialog.show();
                    break;
                }
                break;
            default:
                super.onPageStarted(webView, str, bitmap);
                break;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onReceivedError(WebView webView, int i, String str, String str2) {
        switch (this.a) {
            case 1:
                webView.getClass();
                str.getClass();
                str2.getClass();
                super.onReceivedError(webView, i, str, str2);
                ((n1f) this.b).e(new FacebookDialogException(str, i, str2));
                break;
            default:
                super.onReceivedError(webView, i, str, str2);
                break;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onReceivedSslError(WebView webView, SslErrorHandler sslErrorHandler, SslError sslError) {
        switch (this.a) {
            case 1:
                webView.getClass();
                sslErrorHandler.getClass();
                sslError.getClass();
                super.onReceivedSslError(webView, sslErrorHandler, sslError);
                sslErrorHandler.cancel();
                ((n1f) this.b).e(new FacebookDialogException(null, -11, null));
                break;
            default:
                super.onReceivedSslError(webView, sslErrorHandler, sslError);
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x0092  */
    @Override // android.webkit.WebViewClient
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean shouldOverrideUrlLoading(android.webkit.WebView r6, java.lang.String r7) {
        /*
            Method dump skipped, instruction units count: 248
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tb.shouldOverrideUrlLoading(android.webkit.WebView, java.lang.String):boolean");
    }

    @Override // android.webkit.WebViewClient
    public boolean shouldOverrideUrlLoading(WebView webView, WebResourceRequest webResourceRequest) {
        switch (this.a) {
            case 0:
                webView.getClass();
                webResourceRequest.getClass();
                return false;
            default:
                return super.shouldOverrideUrlLoading(webView, webResourceRequest);
        }
    }
}
