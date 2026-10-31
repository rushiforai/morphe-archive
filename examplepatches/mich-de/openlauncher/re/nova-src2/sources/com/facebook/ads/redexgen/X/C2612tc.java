package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.net.Uri;
import android.net.http.SslError;
import android.os.Handler;
import android.util.Log;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.SslErrorHandler;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.internal.api.BuildConfigApi;
import com.facebook.ads.internal.protocol.AdErrorType;
import com.vungle.ads.internal.protos.Sdk;
import java.io.ByteArrayInputStream;
import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.tc, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2612tc extends WebViewClient {
    public static byte[] A0A;
    public static String[] A0B = {"dutFbLT0SJ7F8tp2omMpyLiOAYVHs", "eQZAVGISCoayl61p0XGnY6zF77MwgQ", "oGFUl4XXjxY0ysGh9uHTM5Bs0jmGzYfS", "nw1FzUJk4sGWtK2y2h7dLK31U1IoYOTN", "MQohGS04hBsrr", "rz5lEB2hDVgjaI0SM6Y5mQ12Lmz2ba", "Gakm8d7sZsS0Gn2hVSl3GYNL92Z8TRo6", "Ty7sQNcmLenaFb4R0BQbvtPuiVx7Fgst"};
    public boolean A00 = false;
    public final C0958Hi A01;
    public final WeakReference<C0894Ev> A02;
    public final WeakReference<InterfaceC2610ta> A03;
    public final WeakReference<AtomicBoolean> A04;
    public final WeakReference<C2417qT> A05;
    public final WeakReference<C1539c2> A06;
    public final AtomicInteger A07;
    public final AtomicReference<String> A08;
    public final boolean A09;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0A, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 74);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A0A = new byte[]{92, 126, 124, 119, 122, 50, 92, 112, 113, 107, 109, 112, 115, 83, 114, 121, 126, 114, 115, 55, 4, 19, 30, 7, 19, 6, 27, 28, 21, 82, 39, 32, 59, 82, 34, 19, 6, 26, 82, 20, 29, 0, 82, 52, 27, 30, 23, 82, 51, 17, 17, 23, 1, 1, 82, 71, 122, 118, 112, 99, 34, 102, 99, 118, 99, 56, 34, 53, 41, 41, 45, 93, 56, 15, 15, 18, 15, 53, 14, 19, 1, 6, 5, 64, 50, 5, 17, 21, 5, 19, 20, 64, 6, 15, 18, 64, 38, 9, 12, 5, 64, 33, 3, 3, 5, 19, 19, 64, 49, 10, 23, 5, 2, 1, 68, 54, 1, 21, 17, 1, 23, 16, 68, 2, 11, 22, 68, 34, 13, 8, 1, 68, 37, 7, 7, 1, 23, 23, 68, 0, 1, 10, 13, 1, 0, 98, 99, 104, 111, 99, 98, 89, 115, 116, 111, 89, 118, 103, 114, 110, 34, 37, 50, 45, 39, 43, 42, 106, 45, 39, 43, 19, 28, 25, 16, 32, 43, 58, 116, 116, 11, 28, 28, 17, 11, 3, 30, 26, 23, 17, 28, 11, 29, 30, 1, 0, 29, 11, 118, 119, 53, 107, 108, 119, 106, 125, 120, 111, 123, AbstractJsonLexerKt.TC_INVALID, 111, 121, 126, 85, 99, 110, 126, 111, 114, 126, 37, 122, 102, 107, 99, 100, 10, 29, 16, 21, 24, 35, 12, 29, 8, 20, 27, 9, 14, 51, 26, 5, 9, 27};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 4
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static boolean A09(String str, List<String> list) {
        String lowerCase = str.toLowerCase(Locale.getDefault());
        Iterator<String> it = list.iterator();
        while (it.hasNext()) {
            if (lowerCase.startsWith(it.next())) {
                return true;
            }
        }
        return false;
    }

    static {
        A02();
    }

    public C2612tc(C0958Hi c0958Hi, WeakReference<InterfaceC2610ta> weakReference, WeakReference<C1539c2> weakReference2, WeakReference<C2417qT> weakReference3, WeakReference<AtomicBoolean> checkAssetsByJavascriptBridge, WeakReference<C0894Ev> weakReference4, AtomicInteger atomicInteger, AtomicReference<String> requestId, boolean z11) {
        this.A01 = c0958Hi;
        this.A03 = weakReference;
        this.A06 = weakReference2;
        this.A05 = weakReference3;
        this.A04 = checkAssetsByJavascriptBridge;
        this.A02 = weakReference4;
        this.A07 = atomicInteger;
        this.A08 = requestId;
        this.A09 = z11;
    }

    private WebResourceResponse A00() {
        return new WebResourceResponse(A01(Sdk.SDKError.Reason.AD_RESPONSE_INVALID_TEMPLATE_TYPE_VALUE, 10, 64), StandardCharsets.UTF_8.name(), TTAdConstant.DEEPLINK_UNAVAILABLE_CODE, A01(13, 6, 93), Collections.singletonMap(A01(0, 13, 85), A01(198, 8, 82)), new ByteArrayInputStream(A01(13, 6, 93).getBytes()));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A03(int i5, String str) {
        if (A01(175, 23, 4).equals(str)) {
            this.A01.A0F().AMH();
            return;
        }
        this.A01.A0F().AMI(i5, str);
        if (A0B[3].charAt(13) != 'K') {
            throw new RuntimeException();
        }
        A0B[2] = "XsLUUp7nqHFiRWgs1yCq1ROdvH3XZYI8";
        if (this.A03.get() != null) {
            this.A03.get().AEw(i5, str);
        }
    }

    private final void A04(WebResourceRequest webResourceRequest, WebResourceResponse webResourceResponse) throws JSONException {
        if (webResourceRequest.getUrl().toString().toLowerCase(Locale.US).contains(A01(160, 11, 14))) {
            return;
        }
        this.A01.A0F().AMM(webResourceResponse.getStatusCode(), AbstractC2390q2.A01(webResourceResponse.getStatusCode(), A01(67, 10, 55), A01(0, 0, 49) + webResourceRequest.getUrl()));
    }

    private void A06(String str, String str2) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(A01(145, 15, 76), str);
            jSONObject.put(A01(Sdk.SDKError.Reason.PRIVACY_ICON_FALLBACK_ERROR_VALUE, 10, 54), str2);
            jSONObject.put(A01(Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE, 10, 64), this.A08.get());
        } catch (JSONException unused) {
        }
        if (this.A01 != null) {
            this.A01.A08().ABz(A01(236, 8, 38), AbstractC2126lf.A2c, new C2127lg(AdErrorType.WEB_VIEW_CACHE_FILE_WAS_DENIED.getDefaultErrorMessage(), A01(55, 12, 72) + jSONObject.toString()));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x00a4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean A07(Uri uri) throws JSONException {
        String scheme;
        String path = uri.getPath();
        String scheme2 = uri.getScheme();
        if (path == null || scheme2 == null) {
            scheme = A0B[7];
            if (scheme.charAt(29) != 'S') {
                A0B[2] = "yXDUwGubOAV6buqiBYARa4GXiUTiAdtJ";
                return true;
            }
        } else {
            String strA01 = A01(171, 4, 63);
            String path2 = A0B[4];
            if (path2.length() != 8) {
                A0B[6] = "e0NZ0IpncKNbspdHVbaE77hYKi1pXgCT";
                if (scheme2.equals(strA01)) {
                    if (BuildConfigApi.isDebug()) {
                        StringBuilder sb2 = new StringBuilder();
                        String path3 = A01(19, 36, 56);
                        sb2.append(path3).append(path).toString();
                    }
                    List<String> listA09 = C2086kz.A09(this.A01);
                    boolean zA09 = A09(path, listA09);
                    if (!zA09) {
                        if (BuildConfigApi.isDebug()) {
                            StringBuilder sb3 = new StringBuilder();
                            String path4 = A01(77, 31, 42);
                            sb3.append(path4).append(path).toString();
                        }
                        String str = C0894Ev.A0H;
                        String path5 = A01(108, 37, 46);
                        Log.w(str, path5);
                        String path6 = listA09.toString();
                        A06(path, path6);
                    }
                    return zA09;
                }
                scheme = A0B[7];
                if (scheme.charAt(29) != 'S') {
                }
            }
        }
        throw new RuntimeException();
    }

    @Override // android.webkit.WebViewClient
    public final void onPageFinished(WebView webView, String str) {
        this.A01.A0F().AMJ(this.A02.get() != null);
        if (this.A02.get() != null && this.A04.get() != null && !this.A04.get().get()) {
            this.A02.get().A0K();
        }
        if (this.A03.get() != null) {
            this.A03.get().AGD();
        }
        this.A00 = true;
    }

    @Override // android.webkit.WebViewClient
    public final void onPageStarted(WebView webView, String str, Bitmap bitmap) {
        super.onPageStarted(webView, str, bitmap);
        this.A01.A0F().AMK();
        new Handler().postDelayed(new C0895Ew(this), this.A07.get());
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedError(WebView webView, int i5, String str, String str2) {
        this.A00 = true;
        A03(i5, str);
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedError(WebView webView, WebResourceRequest webResourceRequest, WebResourceError webResourceError) throws JSONException {
        boolean zA11 = C2203mv.A11(this.A01);
        String strA01 = A01(0, 0, 49);
        if (zA11 || webResourceRequest.isForMainFrame()) {
            this.A00 = true;
            A03(webResourceError.getErrorCode(), strA01 + ((Object) webResourceError.getDescription()));
        } else {
            this.A01.A0F().AML(AbstractC2390q2.A01(webResourceError.getErrorCode(), strA01 + ((Object) webResourceError.getDescription()), strA01 + webResourceRequest.getUrl()));
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedHttpError(WebView webView, WebResourceRequest webResourceRequest, WebResourceResponse webResourceResponse) throws JSONException {
        super.onReceivedHttpError(webView, webResourceRequest, webResourceResponse);
        A04(webResourceRequest, webResourceResponse);
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedSslError(WebView webView, SslErrorHandler sslErrorHandler, SslError sslError) {
        this.A01.A0F().AMN();
        sslErrorHandler.cancel();
    }

    @Override // android.webkit.WebViewClient
    public final boolean onRenderProcessGone(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
        AbstractC2607tX.A0D(AbstractC2126lf.A2b);
        InterfaceC2610ta adWebViewListener = this.A03.get();
        if (adWebViewListener != null) {
            adWebViewListener.AHt();
            return true;
        }
        return true;
    }

    @Override // android.webkit.WebViewClient
    public final WebResourceResponse shouldInterceptRequest(WebView webView, WebResourceRequest webResourceRequest) throws JSONException {
        Uri url = webResourceRequest.getUrl();
        if (this.A09 && !A07(url)) {
            WebResourceResponse webResourceResponseA00 = A00();
            A04(webResourceRequest, webResourceResponseA00);
            return webResourceResponseA00;
        }
        return super.shouldInterceptRequest(webView, webResourceRequest);
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, String str) {
        if (this.A03.get() != null) {
            this.A03.get().AEN(str, new C2618ti().A05(this.A06.get()).A04(this.A05.get()).A07());
            return true;
        }
        return true;
    }
}
