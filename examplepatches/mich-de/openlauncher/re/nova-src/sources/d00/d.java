package d00;

import android.content.Intent;
import android.net.Uri;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ProgressBar;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;
import com.teslacoilsw.launcher.novamobile.NovaMobileActivity;
import java.util.Collection;
import java.util.List;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d extends WebViewClient {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48680a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ NovaMobileActivity f48681b;

    public /* synthetic */ d(NovaMobileActivity novaMobileActivity, int i5) {
        this.f48680a = i5;
        this.f48681b = novaMobileActivity;
    }

    @Override // android.webkit.WebViewClient
    public void onPageFinished(WebView webView, String str) {
        switch (this.f48680a) {
            case 0:
                super.onPageFinished(webView, str);
                NovaMobileActivity novaMobileActivity = this.f48681b;
                ProgressBar progressBar = novaMobileActivity.f45914r;
                if (progressBar == null) {
                    Intrinsics.m("progressBar");
                    throw null;
                }
                progressBar.setVisibility(8);
                SwipeRefreshLayout swipeRefreshLayout = novaMobileActivity.f45915s;
                if (swipeRefreshLayout != null) {
                    swipeRefreshLayout.m(false, false);
                    return;
                } else {
                    Intrinsics.m("swipeRefresh");
                    throw null;
                }
            default:
                super.onPageFinished(webView, str);
                return;
        }
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, WebResourceRequest webResourceRequest) {
        Uri url;
        Object objA;
        Uri url2;
        int i5 = this.f48680a;
        NovaMobileActivity novaMobileActivity = this.f48681b;
        switch (i5) {
            case 0:
                if (webResourceRequest != null && (url = webResourceRequest.getUrl()) != null) {
                    if (NovaMobileActivity.Z(novaMobileActivity, url) && !novaMobileActivity.f45919w) {
                        novaMobileActivity.f45918v = url;
                        NovaMobileActivity.a0(novaMobileActivity);
                        return true;
                    }
                    String string = url.toString();
                    if (r70.j.I0(string, "intent://", false)) {
                        try {
                            int i11 = Result.f71687b;
                            objA = Intent.parseUri(string, 1);
                        } catch (Throwable th2) {
                            int i12 = Result.f71687b;
                            objA = ResultKt.a(th2);
                        }
                        Intent intent = (Intent) (objA instanceof Result.Failure ? null : objA);
                        if (intent == null) {
                            return true;
                        }
                        try {
                            novaMobileActivity.startActivity(intent);
                            return true;
                        } catch (Exception unused) {
                            String str = intent.getPackage();
                            if (str == null) {
                                return true;
                            }
                            try {
                                try {
                                    novaMobileActivity.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=".concat(str))));
                                    return true;
                                } catch (Exception unused2) {
                                    return true;
                                }
                            } catch (Exception unused3) {
                                novaMobileActivity.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("https://play.google.com/store/apps/details?id=".concat(str))));
                                return true;
                            }
                        }
                    }
                    List<String> list = NovaMobileActivity.f45911x;
                    if (!(list instanceof Collection) || !list.isEmpty()) {
                        for (String str2 : list) {
                            String host = url.getHost();
                            if (host != null && r70.j.A0(host, str2, false)) {
                                ProgressBar progressBar = novaMobileActivity.f45914r;
                                if (progressBar == null) {
                                    Intrinsics.m("progressBar");
                                    throw null;
                                }
                                progressBar.setVisibility(0);
                            }
                        }
                    }
                    try {
                        int i13 = Result.f71687b;
                        novaMobileActivity.startActivity(new Intent("android.intent.action.VIEW", url));
                        Unit unit = Unit.f71706a;
                        return true;
                    } catch (Throwable th3) {
                        int i14 = Result.f71687b;
                        ResultKt.a(th3);
                        return true;
                    }
                }
                return false;
            default:
                if (webResourceRequest == null || (url2 = webResourceRequest.getUrl()) == null || !NovaMobileActivity.Z(novaMobileActivity, url2) || novaMobileActivity.f45919w) {
                    return false;
                }
                novaMobileActivity.f45918v = url2;
                NovaMobileActivity.a0(novaMobileActivity);
                return true;
        }
    }
}
