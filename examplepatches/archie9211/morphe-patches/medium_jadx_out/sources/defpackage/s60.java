package defpackage;

import android.graphics.Bitmap;
import android.net.Uri;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.medium.android.susi.ui.apple.AppleAuthFragment;
import com.medium.android.susi.ui.apple.AppleAuthResult;
import com.medium.android.susi.ui.apple.a;
import java.util.LinkedHashMap;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s60 extends WebViewClient {
    public final /* synthetic */ l78 a;
    public final /* synthetic */ l78 b;
    public final /* synthetic */ l78 c;
    public final /* synthetic */ l78 d;
    public final /* synthetic */ Uri e;
    public final /* synthetic */ a f;

    public s60(l78 l78Var, l78 l78Var2, l78 l78Var3, l78 l78Var4, Uri uri, a aVar) {
        this.a = l78Var;
        this.b = l78Var2;
        this.c = l78Var3;
        this.d = l78Var4;
        this.e = uri;
        this.f = aVar;
    }

    public final boolean a(String str) {
        if (str != null) {
            String string = this.e.toString();
            string.getClass();
            if (tuc.N(str, string, false)) {
                Uri uri = Uri.parse(str);
                AppleAuthFragment appleAuthFragment = this.f.a;
                uri.getClass();
                Set<String> queryParameterNames = uri.getQueryParameterNames();
                if (queryParameterNames == null) {
                    queryParameterNames = ny3.a;
                }
                Set<String> set = queryParameterNames;
                int iP = ei7.P(cu1.k0(set, 10));
                if (iP < 16) {
                    iP = 16;
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
                for (Object obj : set) {
                    linkedHashMap.put(obj, uri.getQueryParameter((String) obj));
                }
                String str2 = (String) linkedHashMap.get("id_token");
                String str3 = (String) linkedHashMap.get("code");
                String str4 = (String) linkedHashMap.get("error");
                if (str2 != null && str3 != null) {
                    appleAuthFragment.c0(new AppleAuthResult.Success(str2, str3));
                } else if (str4 == null || !str4.equals("user_cancelled_authorize")) {
                    appleAuthFragment.c0(new AppleAuthResult.Failure(str4));
                } else {
                    appleAuthFragment.c0(AppleAuthResult.Canceled.INSTANCE);
                }
                k40.X(appleAuthFragment).f();
                return true;
            }
        }
        return false;
    }

    @Override // android.webkit.WebViewClient
    public final void doUpdateVisitedHistory(WebView webView, String str, boolean z) {
        l78 l78Var = this.c;
        super.doUpdateVisitedHistory(webView, (String) l78Var.getValue(), z);
        if (str != null) {
            l78Var.setValue(str);
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onPageFinished(WebView webView, String str) {
        this.d.setValue(Boolean.valueOf(webView != null ? webView.canGoBack() : false));
        if (str != null) {
            l78 l78Var = this.c;
            if (g76.L((String) l78Var.getValue(), str)) {
                return;
            }
            l78Var.setValue(str);
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onPageStarted(WebView webView, String str, Bitmap bitmap) {
        this.a.setValue("");
        String str2 = str == null ? "" : str;
        try {
            String authority = Uri.parse(str2).getAuthority();
            str2 = authority != null ? authority : "";
        } catch (Exception unused) {
        }
        this.b.setValue(str2);
        if (str != null) {
            l78 l78Var = this.c;
            if (g76.L((String) l78Var.getValue(), str)) {
                return;
            }
            l78Var.setValue(str);
        }
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, WebResourceRequest webResourceRequest) {
        Uri url;
        return a((webResourceRequest == null || (url = webResourceRequest.getUrl()) == null) ? null : url.toString());
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, String str) {
        return a(str);
    }
}
