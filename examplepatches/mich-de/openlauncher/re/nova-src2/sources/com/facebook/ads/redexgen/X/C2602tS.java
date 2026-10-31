package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.net.Uri;
import android.net.http.SslError;
import android.os.Build;
import android.text.TextUtils;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.SslErrorHandler;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.lang.ref.WeakReference;
import java.net.URISyntaxException;
import java.util.Arrays;
import org.json.JSONException;

/* renamed from: com.facebook.ads.redexgen.X.tS, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2602tS extends WebViewClient {
    public static byte[] A05;
    public final WeakReference<C0958Hi> A02;
    public final WeakReference<InterfaceC2599tP> A03;
    public final WeakReference<C2594tK> A04;
    public final InterfaceC2598tO A01 = new InterfaceC2598tO() { // from class: com.facebook.ads.redexgen.X.F5
        @Override // com.facebook.ads.redexgen.X.InterfaceC2598tO
        public final boolean ABN(String str) {
            return C2602tS.A04(str);
        }
    };
    public WeakReference<InterfaceC2600tQ> A00 = new WeakReference<>(null);

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 97);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A05 = new byte[]{54, 55, 68, 74, 73, 15, 55, 65, 54, 67, 64, 39, 52, 37, 39, 41, 58, 47, 60, 47, 58, 63, 51, 64, 54, 68, 65, 59, 54, 0, 59, 64, 70, 55, 64, 70, 0, 51, 53, 70, 59, 65, 64, 0, 40, 27, 23, 41, 9, 22, 12, 26, 23, 17, 12, -42, 17, 22, 28, 13, 22, 28, -42, 11, 9, 28, 13, 15, 23, 26, 33, -42, -22, -6, -9, -1, -5, -23, -22, -12, -19, 7, 23, 20, 28, 24, 10, 23, 4, 11, 6, 17, 17, 7, 6, 8, 16, 4, 26, 23, 17, -54, -57, -38, -57, 49, 54, 60, 45, 54, 60, -36, -39, -45, -95, -121, -30, -48, -51, -54, -31, -44, -48, -30};
    }

    public C2602tS(WeakReference<C0958Hi> weakReference, WeakReference<InterfaceC2599tP> weakReference2, WeakReference<C2594tK> weakReference3) {
        this.A02 = weakReference;
        this.A03 = weakReference2;
        this.A04 = weakReference3;
    }

    private void A02(String str, C0958Hi c0958Hi) {
        c0958Hi.A08().ABz(A00(11, 11, 101), AbstractC2126lf.A09, new C2127lg(A00(111, 5, 6) + str));
    }

    private boolean A03(WebView webView, String str) throws URISyntaxException {
        boolean zA13;
        String strA00;
        String strA002;
        String strA003;
        Intent intent;
        String strA004 = A00(Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE, 8, 10);
        C0958Hi c0958Hi = this.A02.get();
        if (c0958Hi != null) {
            if ((F4.A0A && (TextUtils.isEmpty(str) || A00(0, 11, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE).equals(str))) || !this.A01.ABN(str)) {
                return true;
            }
            try {
                Uri uri = AbstractC2351pP.A00(str);
                String scheme = uri.getScheme();
                try {
                    zA13 = C2203mv.A13(c0958Hi);
                    strA00 = A00(48, 33, 71);
                    strA002 = A00(22, 26, 113);
                    strA003 = A00(105, 6, 103);
                } catch (Exception e3) {
                    c0958Hi.A08().AC0(strA004, AbstractC2126lf.A2d, new C2127lg(e3));
                    c0958Hi.A0F().AAg(e3.toString());
                }
                if (zA13) {
                    if (!F4.A0C.contains(scheme) && !A00(101, 4, 5).equals(scheme)) {
                        if (strA003.equalsIgnoreCase(scheme)) {
                            intent = Intent.parseUri(str, 1);
                            intent.setComponent(null);
                            intent.setSelector(null);
                        } else {
                            intent = new Intent(strA002, uri);
                        }
                        intent.addCategory(strA00);
                        if (Build.VERSION.SDK_INT >= 30) {
                            intent.setFlags(268436480);
                        } else {
                            intent.setFlags(268435456);
                        }
                        try {
                            if (!C2337p8.A0F(c0958Hi, intent)) {
                                A02(str, c0958Hi);
                            }
                            return true;
                        } catch (C2335p6 unused) {
                            if (strA003.equals(scheme)) {
                                String stringExtra = intent.getStringExtra(A00(81, 20, 68));
                                if (!TextUtils.isEmpty(stringExtra)) {
                                    if (!C2337p8.A0F(c0958Hi, new Intent(strA002, AbstractC2351pP.A00(stringExtra)))) {
                                        A02(str, c0958Hi);
                                    }
                                    return true;
                                }
                            }
                            C2127lg c2127lg = new C2127lg(A00(111, 5, 6) + str);
                            c2127lg.A05(1);
                            c0958Hi.A08().AC0(A00(11, 11, 101), AbstractC2126lf.A06, c2127lg);
                            return true;
                        }
                    }
                    return false;
                }
                if (!F4.A0A || !strA003.equalsIgnoreCase(scheme)) {
                    if ((F4.A0A && AbstractC2390q2.A04(str)) || !F4.A0C.contains(scheme)) {
                        return C2337p8.A0F(c0958Hi, new Intent(strA002, uri));
                    }
                } else {
                    Intent uri2 = Intent.parseUri(str, 1);
                    uri2.addCategory(strA00);
                    uri2.setComponent(null);
                    uri2.setSelector(null);
                    PackageManager packageManager = c0958Hi.getPackageManager();
                    if (packageManager != null && packageManager.resolveActivity(uri2, SQLiteDatabase.OPEN_FULLMUTEX) != null && C2337p8.A0F(c0958Hi, uri2)) {
                        webView.goBack();
                        return true;
                    }
                }
                return false;
            } catch (SecurityException e11) {
                c0958Hi.A08().AC0(strA004, AbstractC2126lf.A2d, new C2127lg(e11));
                return true;
            }
        }
        return false;
    }

    public static /* synthetic */ boolean A04(String str) {
        return true;
    }

    public final void A05(WeakReference<InterfaceC2600tQ> weakReference) {
        this.A00 = weakReference;
    }

    @Override // android.webkit.WebViewClient
    public final void onPageFinished(WebView webView, String str) {
        super.onPageFinished(webView, str);
        C2594tK timingLogger = this.A04.get();
        if (timingLogger != null) {
            timingLogger.A03();
        }
        InterfaceC2599tP interfaceC2599tP = this.A03.get();
        if (interfaceC2599tP != null) {
            interfaceC2599tP.AGC(str);
        }
        InterfaceC2600tQ interfaceC2600tQ = this.A00.get();
        if (interfaceC2600tQ != null) {
            interfaceC2600tQ.AE7(webView.canGoBack());
            interfaceC2600tQ.AF0(webView.canGoForward());
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onPageStarted(WebView webView, String str, Bitmap bitmap) {
        super.onPageStarted(webView, str, bitmap);
        InterfaceC2599tP listener = this.A03.get();
        if (listener != null) {
            listener.AGE(str);
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedError(WebView webView, int i5, String str, String str2) throws JSONException {
        super.onReceivedError(webView, i5, str, str2);
        C0958Hi c0958Hi = this.A02.get();
        if (c0958Hi != null) {
            StringBuilder sb2 = new StringBuilder();
            String strA00 = A00(0, 0, 27);
            String errorMessage = AbstractC2390q2.A01(i5, sb2.append(strA00).append(str).toString(), strA00 + str2);
            c0958Hi.A0F().AAd(errorMessage);
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedError(WebView webView, WebResourceRequest webResourceRequest, WebResourceError webResourceError) throws JSONException {
        super.onReceivedError(webView, webResourceRequest, webResourceError);
        C0958Hi c0958Hi = this.A02.get();
        if (c0958Hi != null) {
            int errorCode = webResourceError.getErrorCode();
            StringBuilder sb2 = new StringBuilder();
            String strA00 = A00(0, 0, 27);
            String errorMessage = AbstractC2390q2.A01(errorCode, sb2.append(strA00).append((Object) webResourceError.getDescription()).toString(), strA00 + webResourceRequest.getUrl());
            c0958Hi.A0F().AAd(errorMessage);
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedHttpError(WebView webView, WebResourceRequest webResourceRequest, WebResourceResponse webResourceResponse) {
        super.onReceivedHttpError(webView, webResourceRequest, webResourceResponse);
        C0958Hi context = this.A02.get();
        if (context != null) {
            context.A0F().AAe();
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedSslError(WebView webView, SslErrorHandler sslErrorHandler, SslError sslError) {
        super.onReceivedSslError(webView, sslErrorHandler, sslError);
        C0958Hi context = this.A02.get();
        if (context != null) {
            context.A0F().AAf();
        }
    }

    @Override // android.webkit.WebViewClient
    public final boolean onRenderProcessGone(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
        AbstractC2607tX.A0D(AbstractC2126lf.A2e);
        InterfaceC2599tP listener = this.A03.get();
        if (listener != null) {
            listener.AGl();
            return true;
        }
        return true;
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, WebResourceRequest webResourceRequest) {
        return A03(webView, webResourceRequest.getUrl().toString());
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, String str) {
        return A03(webView, str);
    }
}
