package bz;

import ads_mobile_sdk.xu1;
import android.graphics.Bitmap;
import android.net.Uri;
import android.net.http.SslError;
import android.os.Message;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.ClientCertRequest;
import android.webkit.HttpAuthHandler;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.SafeBrowsingResponse;
import android.webkit.SslErrorHandler;
import android.webkit.URLUtil;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ProgressBar;
import b.e2;
import b.k9;
import com.google.android.gms.internal.consent_sdk.m;
import com.google.android.gms.internal.consent_sdk.s;
import com.google.android.gms.internal.consent_sdk.v;
import com.google.android.gms.internal.consent_sdk.zzg;
import com.stripe.android.financialconnections.lite.FinancialConnectionsSheetLiteActivity;
import com.teslacoilsw.launcher.games.GamesActivity;
import java.util.Locale;
import java.util.Objects;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import pu.f0;
import r70.j;
import sr.l;
import zn.d;
import zv.x;

/* loaded from: classes4.dex */
public final class a extends WebViewClient {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18677a;

    /* renamed from: b, reason: collision with root package name */
    public Object f18678b;

    public void a(Uri uri) {
        wm.b bVar;
        String string = uri.toString();
        Intrinsics.f(string, "toString(...)");
        Locale ENGLISH = Locale.ENGLISH;
        Intrinsics.f(ENGLISH, "ENGLISH");
        String lowerCase = string.toLowerCase(ENGLISH);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        if (!j.I0(lowerCase, "https://emv3ds/challenge", false) || (bVar = (wm.b) this.f18678b) == null) {
            return;
        }
        String query = uri.getQuery();
        x xVar = (x) bVar.f94597b;
        if (query == null) {
            query = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        xVar.f98762b = query;
        View.OnClickListener onClickListener = xVar.f98763c;
        if (onClickListener != null) {
            onClickListener.onClick(xVar);
        }
    }

    @Override // android.webkit.WebViewClient
    public void doUpdateVisitedHistory(WebView webView, String str, boolean z11) {
        switch (this.f18677a) {
            case 1:
                ((WebViewClient) this.f18678b).doUpdateVisitedHistory(webView, str, z11);
                break;
            default:
                super.doUpdateVisitedHistory(webView, str, z11);
                break;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onFormResubmission(WebView webView, Message message, Message message2) {
        switch (this.f18677a) {
            case 1:
                ((WebViewClient) this.f18678b).onFormResubmission(webView, message, message2);
                break;
            default:
                super.onFormResubmission(webView, message, message2);
                break;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onLoadResource(WebView webView, String str) {
        switch (this.f18677a) {
            case 1:
                ((WebViewClient) this.f18678b).onLoadResource(webView, str);
                break;
            case 2:
            default:
                super.onLoadResource(webView, str);
                break;
            case 3:
                s sVar = (s) this.f18678b;
                int i5 = s.f32228d;
                if (str != null && str.startsWith("consent://")) {
                    sVar.f32230b.a(str);
                    break;
                }
                break;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onPageCommitVisible(WebView webView, String str) {
        switch (this.f18677a) {
            case 1:
                ((WebViewClient) this.f18678b).onPageCommitVisible(webView, str);
                break;
            default:
                super.onPageCommitVisible(webView, str);
                break;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onPageFinished(WebView webView, String str) {
        switch (this.f18677a) {
            case 0:
                super.onPageFinished(webView, str);
                ProgressBar progressBar = ((GamesActivity) this.f18678b).f45759p;
                if (progressBar != null) {
                    progressBar.setVisibility(8);
                    return;
                } else {
                    Intrinsics.m("progressBar");
                    throw null;
                }
            case 1:
                ((WebViewClient) this.f18678b).onPageFinished(webView, str);
                return;
            case 2:
            default:
                super.onPageFinished(webView, str);
                return;
            case 3:
                s sVar = (s) this.f18678b;
                if (sVar.f32231c) {
                    return;
                }
                sVar.f32231c = true;
                return;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onPageStarted(WebView webView, String str, Bitmap bitmap) {
        switch (this.f18677a) {
            case 0:
                super.onPageStarted(webView, str, bitmap);
                ProgressBar progressBar = ((GamesActivity) this.f18678b).f45759p;
                if (progressBar != null) {
                    progressBar.setVisibility(0);
                    return;
                } else {
                    Intrinsics.m("progressBar");
                    throw null;
                }
            case 1:
                ((WebViewClient) this.f18678b).onPageStarted(webView, str, bitmap);
                return;
            default:
                super.onPageStarted(webView, str, bitmap);
                return;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onReceivedClientCertRequest(WebView webView, ClientCertRequest clientCertRequest) {
        switch (this.f18677a) {
            case 1:
                ((WebViewClient) this.f18678b).onReceivedClientCertRequest(webView, clientCertRequest);
                break;
            default:
                super.onReceivedClientCertRequest(webView, clientCertRequest);
                break;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onReceivedError(WebView webView, int i5, String str, String str2) {
        switch (this.f18677a) {
            case 1:
                ((WebViewClient) this.f18678b).onReceivedError(webView, i5, str, str2);
                break;
            case 2:
            default:
                super.onReceivedError(webView, i5, str, str2);
                break;
            case 3:
                v vVar = ((s) this.f18678b).f32230b;
                vVar.getClass();
                Locale locale = Locale.US;
                ((m) vVar.f32265g).c(new zzg(2, "WebResourceError(" + i5 + ", " + str2 + "): " + str));
                break;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onReceivedHttpAuthRequest(WebView webView, HttpAuthHandler httpAuthHandler, String str, String str2) {
        switch (this.f18677a) {
            case 1:
                ((WebViewClient) this.f18678b).onReceivedHttpAuthRequest(webView, httpAuthHandler, str, str2);
                break;
            default:
                super.onReceivedHttpAuthRequest(webView, httpAuthHandler, str, str2);
                break;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onReceivedHttpError(WebView webView, WebResourceRequest webResourceRequest, WebResourceResponse webResourceResponse) {
        switch (this.f18677a) {
            case 1:
                ((WebViewClient) this.f18678b).onReceivedHttpError(webView, webResourceRequest, webResourceResponse);
                break;
            default:
                super.onReceivedHttpError(webView, webResourceRequest, webResourceResponse);
                break;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onReceivedLoginRequest(WebView webView, String str, String str2, String str3) {
        switch (this.f18677a) {
            case 1:
                ((WebViewClient) this.f18678b).onReceivedLoginRequest(webView, str, str2, str3);
                break;
            default:
                super.onReceivedLoginRequest(webView, str, str2, str3);
                break;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onReceivedSslError(WebView webView, SslErrorHandler sslErrorHandler, SslError sslError) {
        switch (this.f18677a) {
            case 1:
                ((WebViewClient) this.f18678b).onReceivedSslError(webView, sslErrorHandler, sslError);
                break;
            default:
                super.onReceivedSslError(webView, sslErrorHandler, sslError);
                break;
        }
    }

    @Override // android.webkit.WebViewClient
    public boolean onRenderProcessGone(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
        switch (this.f18677a) {
            case 1:
                return ((WebViewClient) this.f18678b).onRenderProcessGone(webView, renderProcessGoneDetail);
            case 2:
                ((xu1) this.f18678b).a(webView, renderProcessGoneDetail);
                return true;
            case 3:
                if (webView != null) {
                    String str = true != renderProcessGoneDetail.didCrash() ? "was stopped by system" : "crashed";
                    Log.w("UserMessagingPlatform", "WebView render process " + str + ". Renderer priority at exit: " + renderProcessGoneDetail.rendererPriorityAtExit());
                    ViewGroup viewGroup = (ViewGroup) webView.getParent();
                    if (viewGroup != null) {
                        viewGroup.removeView(webView);
                    }
                    webView.destroy();
                }
                return true;
            case 4:
            default:
                return super.onRenderProcessGone(webView, renderProcessGoneDetail);
            case 5:
                Log.w("NativeBridge", "WebView renderer gone: " + renderProcessGoneDetail.toString() + "for WebView: " + webView);
                d dVar = (d) this.f18678b;
                if (dVar.i() == webView) {
                    Log.w("NativeBridge", "Deallocating the Native bridge as it is unusable. No further events will be generated for this session.");
                    dVar.f98572b = new e2((Object) null);
                }
                webView.destroy();
                return true;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onSafeBrowsingHit(WebView webView, WebResourceRequest webResourceRequest, int i5, SafeBrowsingResponse safeBrowsingResponse) {
        switch (this.f18677a) {
            case 1:
                ((WebViewClient) this.f18678b).onSafeBrowsingHit(webView, webResourceRequest, i5, safeBrowsingResponse);
                break;
            default:
                super.onSafeBrowsingHit(webView, webResourceRequest, i5, safeBrowsingResponse);
                break;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onScaleChanged(WebView webView, float f11, float f12) {
        switch (this.f18677a) {
            case 1:
                ((WebViewClient) this.f18678b).onScaleChanged(webView, f11, f12);
                break;
            default:
                super.onScaleChanged(webView, f11, f12);
                break;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onUnhandledKeyEvent(WebView webView, KeyEvent keyEvent) {
        switch (this.f18677a) {
            case 1:
                ((WebViewClient) this.f18678b).onUnhandledKeyEvent(webView, keyEvent);
                break;
            default:
                super.onUnhandledKeyEvent(webView, keyEvent);
                break;
        }
    }

    @Override // android.webkit.WebViewClient
    public WebResourceResponse shouldInterceptRequest(WebView view, WebResourceRequest request) {
        switch (this.f18677a) {
            case 1:
                return ((WebViewClient) this.f18678b).shouldInterceptRequest(view, request);
            case 6:
                Intrinsics.g(view, "view");
                Intrinsics.g(request, "request");
                Uri url = request.getUrl();
                Intrinsics.f(url, "getUrl(...)");
                a(url);
                Uri url2 = request.getUrl();
                Intrinsics.f(url2, "getUrl(...)");
                return URLUtil.isDataUrl(url2.toString()) ? super.shouldInterceptRequest(view, request) : new WebResourceResponse(null, null, null);
            default:
                return super.shouldInterceptRequest(view, request);
        }
    }

    @Override // android.webkit.WebViewClient
    public boolean shouldOverrideKeyEvent(WebView webView, KeyEvent keyEvent) {
        switch (this.f18677a) {
            case 1:
                return ((WebViewClient) this.f18678b).shouldOverrideKeyEvent(webView, keyEvent);
            default:
                return super.shouldOverrideKeyEvent(webView, keyEvent);
        }
    }

    @Override // android.webkit.WebViewClient
    public boolean shouldOverrideUrlLoading(WebView webView, String str) {
        switch (this.f18677a) {
            case 1:
                if (k9.G(str)) {
                    return true;
                }
                return ((WebViewClient) this.f18678b).shouldOverrideUrlLoading(webView, str);
            case 2:
                return k9.G(str);
            case 3:
                s sVar = (s) this.f18678b;
                int i5 = s.f32228d;
                if (str == null || !str.startsWith("consent://")) {
                    return false;
                }
                sVar.f32230b.a(str);
                return true;
            default:
                return super.shouldOverrideUrlLoading(webView, str);
        }
    }

    public /* synthetic */ a(Object obj, int i5) {
        this.f18677a = i5;
        this.f18678b = obj;
    }

    public /* synthetic */ a(s sVar) {
        this.f18677a = 3;
        Objects.requireNonNull(sVar);
        this.f18678b = sVar;
    }

    public a(WebViewClient webViewClient) {
        this.f18677a = 1;
        this.f18678b = webViewClient;
    }

    @Override // android.webkit.WebViewClient
    public WebResourceResponse shouldInterceptRequest(WebView webView, String str) {
        switch (this.f18677a) {
            case 1:
                return ((WebViewClient) this.f18678b).shouldInterceptRequest(webView, str);
            default:
                return super.shouldInterceptRequest(webView, str);
        }
    }

    @Override // android.webkit.WebViewClient
    public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
        Object objA;
        Object value;
        switch (this.f18677a) {
            case 0:
                return false;
            case 1:
                if (k9.G(request.getUrl().toString())) {
                    return true;
                }
                return ((WebViewClient) this.f18678b).shouldOverrideUrlLoading(view, request);
            case 2:
                return k9.G(request.getUrl().toString());
            case 3:
                String string = request.getUrl().toString();
                s sVar = (s) this.f18678b;
                int i5 = s.f32228d;
                if (string == null || !string.startsWith("consent://")) {
                    return false;
                }
                sVar.f32230b.a(string);
                return true;
            case 4:
                FinancialConnectionsSheetLiteActivity financialConnectionsSheetLiteActivity = (FinancialConnectionsSheetLiteActivity) this.f18678b;
                Uri url = request != null ? request.getUrl() : null;
                int i11 = FinancialConnectionsSheetLiteActivity.f42693r;
                if (url == null) {
                    return false;
                }
                l lVar = (l) financialConnectionsSheetLiteActivity.f42695q.getValue();
                String string2 = url.toString();
                Intrinsics.f(string2, "toString(...)");
                f0 f0Var = new f0(7, string2, lVar);
                try {
                    int i12 = Result.f71687b;
                    value = lVar.f87729g.getValue();
                } catch (Throwable th2) {
                    int i13 = Result.f71687b;
                    objA = ResultKt.a(th2);
                }
                if (value != null) {
                    f0Var.invoke(value);
                    objA = Unit.f71706a;
                    Throwable thA = Result.a(objA);
                    if (thA != null) {
                        lVar.e("State is null", thA);
                    }
                    return true;
                }
                throw new IllegalArgumentException("Required value was null.");
            case 5:
            default:
                return super.shouldOverrideUrlLoading(view, request);
            case 6:
                Intrinsics.g(view, "view");
                Intrinsics.g(request, "request");
                Uri url2 = request.getUrl();
                Intrinsics.f(url2, "getUrl(...)");
                a(url2);
                return true;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onReceivedError(WebView webView, WebResourceRequest webResourceRequest, WebResourceError webResourceError) {
        switch (this.f18677a) {
            case 1:
                ((WebViewClient) this.f18678b).onReceivedError(webView, webResourceRequest, webResourceError);
                break;
            default:
                super.onReceivedError(webView, webResourceRequest, webResourceError);
                break;
        }
    }
}
