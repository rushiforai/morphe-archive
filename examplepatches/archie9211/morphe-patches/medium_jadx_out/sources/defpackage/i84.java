package defpackage;

import android.webkit.WebView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class i84 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ l78 b;
    public final /* synthetic */ l78 c;

    public /* synthetic */ i84(l78 l78Var, l78 l78Var2, int i) {
        this.a = i;
        this.b = l78Var;
        this.c = l78Var2;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        l78 l78Var = this.c;
        l78 l78Var2 = this.b;
        switch (i) {
            case 0:
                WebView webView = (WebView) l78Var2.getValue();
                if (webView != null) {
                    webView.goBack();
                }
                WebView webView2 = (WebView) l78Var2.getValue();
                l78Var.setValue(Boolean.valueOf(webView2 != null ? webView2.canGoBack() : false));
                break;
            case 1:
                Boolean bool = Boolean.FALSE;
                l78Var2.setValue(bool);
                l78Var.setValue(bool);
                break;
            default:
                Boolean bool2 = Boolean.FALSE;
                l78Var2.setValue(bool2);
                l78Var.setValue(bool2);
                break;
        }
        return c1eVar;
    }
}
