package com.iab.omid.library.vungle.webviewclient;

import android.net.Uri;
import android.webkit.WebView;
import com.iab.omid.library.vungle.attestation.c;
import com.iab.omid.library.vungle.internal.g;
import com.iab.omid.library.vungle.internal.j;

/* loaded from: classes3.dex */
public class a {
    public static void a(WebView webView) {
        if (c.a(g.b().a()).b()) {
            webView.setWebViewClient(new b(webView.getWebViewClient()));
        }
    }

    public static boolean a(String str) {
        if (str != null && str.startsWith("omid-native")) {
            try {
                Uri uri = Uri.parse(str);
                if ("omid-native".equals(uri.getScheme())) {
                    j.b(uri);
                    return true;
                }
            } catch (Exception unused) {
            }
        }
        return false;
    }
}
