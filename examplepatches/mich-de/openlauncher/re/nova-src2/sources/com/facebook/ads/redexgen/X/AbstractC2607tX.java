package com.facebook.ads.redexgen.X;

import android.app.Activity;
import android.util.Log;
import android.webkit.CookieManager;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.tX, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2607tX extends WebView {
    public static byte[] A01;
    public static String[] A02 = {"wCfyxoFTZ1jJ20JoleL2PfrggSS6BF65", "Rc2rUHoB5tN3gwl7phNiRTFEm74RUGaD", "k3E8g92vqjz0P264LqfNkGJlcmiFj3XN", "5IFC", "4VKGug1amLvDa4cy8fz1MnlZuIkeI9i2", "ilhy", "oZlIL0UAu4uBBRacqgrbUbhUTaUcQiCc", "IlF4AsfZVSat8w0D1JV7TLHsmvDiF9Hf"};
    public static final String A03;
    public boolean A00;

    public static String A0B(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 105);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0C() {
        A01 = new byte[]{87, 112, 120, 125, 116, 117, 49, 101, 126, 49, 120, AbstractJsonLexerKt.TC_INVALID, 120, 101, 120, 112, 125, 120, 107, 116, 49, 82, 126, 126, 122, 120, 116, 92, 112, AbstractJsonLexerKt.TC_INVALID, 112, 118, 116, 99, 63, 92, 93, 43, 104, 121, 106, 120, 99, 110, 111, 27, 16, 7, 16, 2, 18, 3, 24, 1, 5, 75, 82, 64, 71, 122, 83, 76, 64, 82};
    }

    public abstract WebChromeClient A0G();

    public abstract WebViewClient A0H();

    static {
        A0C();
        A03 = AbstractC2607tX.class.getSimpleName();
    }

    public AbstractC2607tX(Activity activity, C0958Hi c0958Hi) throws Exception {
        super(activity);
        A0E(c0958Hi);
    }

    public AbstractC2607tX(C0958Hi c0958Hi) throws Exception {
        super(c0958Hi);
        A0E(c0958Hi);
    }

    public static void A0D(int i5) {
        C0957Hh context = AbstractC2094l9.A00();
        if (context != null) {
            context.A08().ABz(A0B(56, 8, 76), i5, new C2127lg(A0B(35, 10, 98)));
        }
    }

    private void A0E(C2095lA c2095lA) throws Exception {
        setWebChromeClient(A0G());
        setWebViewClient(A0H());
        AbstractC2613td.A04(this);
        getSettings().setJavaScriptEnabled(true);
        getSettings().setDomStorageEnabled(true);
        getSettings().setMediaPlaybackRequiresUserGesture(false);
        if (c2095lA.A05().AB6()) {
            setWebContentsDebuggingEnabled(true);
        }
        setHorizontalScrollBarEnabled(false);
        setHorizontalScrollbarOverlay(false);
        setVerticalScrollBarEnabled(false);
        setVerticalScrollbarOverlay(false);
        try {
            CookieManager.getInstance().setAcceptThirdPartyCookies(this, true);
        } catch (Exception unused) {
            String str = A03;
            String[] strArr = A02;
            if (strArr[5].length() != strArr[3].length()) {
                Exception e3 = new RuntimeException();
                throw e3;
            }
            String[] strArr2 = A02;
            strArr2[2] = "3PNmPrSUWzxeiAB5I9EQOdArp4AOyYx8";
            strArr2[1] = "IwiUK4Jj6dujXEYBYevDXKu5TYuHUrzl";
            Log.w(str, A0B(0, 35, 120));
        }
    }

    private void A0F(String str) {
        loadUrl(A0B(45, 11, 24) + str);
    }

    public final void A0I(String str) {
        try {
            evaluateJavascript(str, null);
        } catch (IllegalStateException unused) {
            A0F(str);
        }
    }

    public final boolean A0J() {
        return this.A00;
    }

    @Override // android.webkit.WebView
    public void destroy() {
        this.A00 = true;
        super.destroy();
    }
}
