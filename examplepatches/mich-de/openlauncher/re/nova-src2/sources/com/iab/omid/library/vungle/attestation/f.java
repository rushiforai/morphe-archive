package com.iab.omid.library.vungle.attestation;

import android.webkit.WebView;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public class f implements com.iab.omid.library.vungle.messagelistener.b {

    /* renamed from: a, reason: collision with root package name */
    private final com.iab.omid.library.vungle.messagelistener.a f35167a;

    private f(WebView webView) {
        com.iab.omid.library.vungle.messagelistener.a aVar = new com.iab.omid.library.vungle.messagelistener.a(webView, this);
        this.f35167a = aVar;
        aVar.a();
    }

    public static f a(WebView webView) {
        return new f(webView);
    }

    @Override // com.iab.omid.library.vungle.messagelistener.b
    public String getListenerName() {
        return "omidJsAttestationListener";
    }

    @Override // com.iab.omid.library.vungle.messagelistener.b
    public void onMessageReceived(String str, JSONObject jSONObject) throws JSONException {
        if ("attest".equals(str)) {
            a(jSONObject);
            return;
        }
        com.iab.omid.library.vungle.utils.d.b("Unexpected method in AttestationMessageListener: " + str);
    }

    @Override // com.iab.omid.library.vungle.messagelistener.b
    public void onWebMessageListenerUnsupported() {
        com.iab.omid.library.vungle.utils.d.b("The Attestation Webview Listener cannot be supported in this WebView version.");
    }

    private void a(JSONObject jSONObject) throws JSONException {
        try {
            String string = jSONObject.getString("mechanism");
            String string2 = jSONObject.getString("version");
            Map<String, String> mapB = com.iab.omid.library.vungle.utils.c.b(jSONObject.getJSONObject("attestationArgs"));
            mapB.put("version", string2);
            e.a(com.iab.omid.library.vungle.internal.g.b().a().getApplicationContext(), string, new a(mapB));
        } catch (Exception e3) {
            com.iab.omid.library.vungle.utils.d.a("Error processing attestation request", e3);
        }
    }
}
