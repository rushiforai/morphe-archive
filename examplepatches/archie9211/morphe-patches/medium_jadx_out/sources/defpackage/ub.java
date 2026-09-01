package defpackage;

import android.webkit.WebChromeClient;
import android.webkit.WebView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ub extends WebChromeClient {
    public final /* synthetic */ g49 a;

    public ub(g49 g49Var) {
        this.a = g49Var;
    }

    @Override // android.webkit.WebChromeClient
    public final void onProgressChanged(WebView webView, int i) {
        this.a.h(i / 100.0f);
    }
}
