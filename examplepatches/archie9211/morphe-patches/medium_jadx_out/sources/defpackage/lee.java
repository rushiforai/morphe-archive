package defpackage;

import android.webkit.WebView;
import android.webkit.WebViewClient;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lee extends WebViewClient {
    public final /* synthetic */ nee a;
    public final /* synthetic */ efe b;

    public lee(nee neeVar, efe efeVar) {
        this.a = neeVar;
        this.b = efeVar;
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, String str) {
        webView.getClass();
        str.getClass();
        SourceParameter sourceParameter = this.b.e;
        sourceParameter.getClass();
        this.a.b.o(str, sourceParameter);
        return true;
    }
}
