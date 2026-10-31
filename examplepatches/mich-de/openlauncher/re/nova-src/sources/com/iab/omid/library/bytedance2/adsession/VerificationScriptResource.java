package com.iab.omid.library.bytedance2.adsession;

import com.iab.omid.library.bytedance2.utils.c;
import com.iab.omid.library.bytedance2.utils.g;
import java.net.URL;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class VerificationScriptResource {
    private final URL resourceUrl;
    private final String vendorKey;
    private final String verificationParameters;

    private VerificationScriptResource(String str, URL url, String str2) {
        this.vendorKey = str;
        this.resourceUrl = url;
        this.verificationParameters = str2;
    }

    public static VerificationScriptResource createVerificationScriptResourceWithParameters(String str, URL url, String str2) {
        g.a(str, "VendorKey is null or empty");
        g.a(url, "ResourceURL is null");
        g.a(str2, "VerificationParameters is null or empty");
        return new VerificationScriptResource(str, url, str2);
    }

    public static VerificationScriptResource createVerificationScriptResourceWithoutParameters(URL url) {
        g.a(url, "ResourceURL is null");
        return new VerificationScriptResource(null, url, null);
    }

    public URL getResourceUrl() {
        return this.resourceUrl;
    }

    public String getVendorKey() {
        return this.vendorKey;
    }

    public String getVerificationParameters() {
        return this.verificationParameters;
    }

    public JSONObject toJsonObject() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        c.a(jSONObject, "vendorKey", this.vendorKey);
        c.a(jSONObject, "resourceUrl", this.resourceUrl.toString());
        c.a(jSONObject, "verificationParameters", this.verificationParameters);
        return jSONObject;
    }
}
