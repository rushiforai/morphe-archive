package defpackage;

import android.webkit.GeolocationPermissions;
import android.webkit.WebChromeClient;
import android.webkit.WebView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t60 extends WebChromeClient {
    public final /* synthetic */ int a;
    public final /* synthetic */ g49 b;
    public final /* synthetic */ l78 c;

    public /* synthetic */ t60(g49 g49Var, l78 l78Var, int i) {
        this.a = i;
        this.b = g49Var;
        this.c = l78Var;
    }

    @Override // android.webkit.WebChromeClient
    public void onGeolocationPermissionsShowPrompt(String str, GeolocationPermissions.Callback callback) {
        switch (this.a) {
            case 1:
                if (callback != null) {
                    callback.invoke(str, true, false);
                }
                break;
            default:
                super.onGeolocationPermissionsShowPrompt(str, callback);
                break;
        }
    }

    @Override // android.webkit.WebChromeClient
    public final void onProgressChanged(WebView webView, int i) {
        switch (this.a) {
            case 0:
                this.b.h(i / 100.0f);
                break;
            default:
                this.b.h(i / 100.0f);
                break;
        }
    }

    @Override // android.webkit.WebChromeClient
    public final void onReceivedTitle(WebView webView, String str) {
        int i = this.a;
        l78 l78Var = this.c;
        str.getClass();
        switch (i) {
            case 0:
                l78Var.setValue(str);
                break;
            default:
                l78Var.setValue(str);
                break;
        }
    }
}
