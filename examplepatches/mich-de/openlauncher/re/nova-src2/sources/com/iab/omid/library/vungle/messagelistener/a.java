package com.iab.omid.library.vungle.messagelistener;

import android.net.Uri;
import android.webkit.WebView;
import androidx.webkit.WebViewFeature;
import com.iab.omid.library.vungle.utils.d;
import com.iab.omid.library.vungle.utils.g;
import com.iab.omid.library.vungle.utils.i;
import java.util.Arrays;
import java.util.HashSet;
import m7.j;
import m7.s;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public class a {

    /* renamed from: c, reason: collision with root package name */
    private static final i f35234c = new i();

    /* renamed from: a, reason: collision with root package name */
    private final WebView f35235a;

    /* renamed from: b, reason: collision with root package name */
    private final b f35236b;

    /* renamed from: com.iab.omid.library.vungle.messagelistener.a$a, reason: collision with other inner class name */
    public class C0127a implements s {
        public C0127a() {
        }

        @Override // m7.s
        public void onPostMessage(WebView webView, j jVar, Uri uri, boolean z11, m7.b bVar) throws JSONException {
            a.this.a(jVar.b());
        }
    }

    public a(WebView webView, b bVar) {
        g.a(webView, "WebView is null");
        this.f35235a = webView;
        this.f35236b = bVar;
    }

    public void a() {
        try {
            if (!WebViewFeature.a(WebViewFeature.WEB_MESSAGE_LISTENER)) {
                this.f35236b.onWebMessageListenerUnsupported();
                return;
            }
            try {
                b();
                f35234c.a(this.f35235a, this.f35236b.getListenerName(), new HashSet(Arrays.asList("*")), new C0127a());
            } catch (Exception e3) {
                d.a("Error adding WebView listener", e3);
                this.f35236b.onWebMessageListenerUnsupported();
            }
        } catch (NoClassDefFoundError unused) {
        }
    }

    public void b() {
        f35234c.a(this.f35235a, this.f35236b.getListenerName());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(String str) throws JSONException {
        try {
            JSONObject jSONObject = new JSONObject(str);
            this.f35236b.onMessageReceived(jSONObject.getString("method"), jSONObject.getJSONObject("data"));
        } catch (JSONException e3) {
            d.a("Error parsing JS message", e3);
        }
    }
}
