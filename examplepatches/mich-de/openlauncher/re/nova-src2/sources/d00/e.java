package d00;

import android.os.Message;
import android.webkit.CookieManager;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.FrameLayout;
import android.widget.ProgressBar;
import com.teslacoilsw.launcher.novamobile.NovaMobileActivity;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e extends WebChromeClient {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48682a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ NovaMobileActivity f48683b;

    public /* synthetic */ e(NovaMobileActivity novaMobileActivity, int i5) {
        this.f48682a = i5;
        this.f48683b = novaMobileActivity;
    }

    @Override // android.webkit.WebChromeClient
    public final void onCloseWindow(WebView webView) {
        int i5 = this.f48682a;
        NovaMobileActivity novaMobileActivity = this.f48683b;
        switch (i5) {
            case 0:
                List list = NovaMobileActivity.f45911x;
                novaMobileActivity.b0();
                break;
            default:
                List list2 = NovaMobileActivity.f45911x;
                novaMobileActivity.b0();
                break;
        }
    }

    @Override // android.webkit.WebChromeClient
    public boolean onCreateWindow(WebView webView, boolean z11, boolean z12, Message message) {
        switch (this.f48682a) {
            case 1:
                List list = NovaMobileActivity.f45911x;
                NovaMobileActivity novaMobileActivity = this.f48683b;
                novaMobileActivity.b0();
                Object obj = message != null ? message.obj : null;
                WebView.WebViewTransport webViewTransport = obj instanceof WebView.WebViewTransport ? (WebView.WebViewTransport) obj : null;
                int i5 = 0;
                if (webViewTransport == null) {
                    return false;
                }
                WebView webView2 = new WebView(novaMobileActivity);
                webView2.getSettings().setJavaScriptEnabled(true);
                webView2.getSettings().setDomStorageEnabled(true);
                WebSettings settings = webView2.getSettings();
                WebView webView3 = novaMobileActivity.f45913q;
                if (webView3 == null) {
                    Intrinsics.m("webView");
                    throw null;
                }
                settings.setUserAgentString(webView3.getSettings().getUserAgentString());
                webView2.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
                webView2.setWebViewClient(new d(novaMobileActivity, 1));
                webView2.setWebChromeClient(new e(novaMobileActivity, i5));
                CookieManager.getInstance().setAcceptThirdPartyCookies(webView2, true);
                novaMobileActivity.f45917u = webView2;
                FrameLayout frameLayout = novaMobileActivity.f45916t;
                if (frameLayout == null) {
                    Intrinsics.m("webViewContainer");
                    throw null;
                }
                frameLayout.addView(webView2);
                webViewTransport.setWebView(webView2);
                message.sendToTarget();
                return true;
            default:
                return super.onCreateWindow(webView, z11, z12, message);
        }
    }

    @Override // android.webkit.WebChromeClient
    public void onProgressChanged(WebView webView, int i5) {
        switch (this.f48682a) {
            case 1:
                ProgressBar progressBar = this.f48683b.f45914r;
                if (progressBar != null) {
                    progressBar.setProgress(i5);
                    return;
                } else {
                    Intrinsics.m("progressBar");
                    throw null;
                }
            default:
                super.onProgressChanged(webView, i5);
                return;
        }
    }
}
