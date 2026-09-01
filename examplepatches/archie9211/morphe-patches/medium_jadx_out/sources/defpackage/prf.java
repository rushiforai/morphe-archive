package defpackage;

import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class prf implements vnf {
    public final String a;
    public final String b;
    public final String c;
    public final String d;

    public prf() {
        this.a = "https://www.recaptcha.net/recaptcha/api3".concat("/mri");
        this.b = "https://www.recaptcha.net/recaptcha/api3".concat("/mlg");
        this.c = "https://www.recaptcha.net/recaptcha/api3".concat("/mrr");
        this.d = "https://www.recaptcha.net/recaptcha/api3".concat("/mrs");
    }

    @Override // defpackage.vnf
    public String zza() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("email", this.a);
        jSONObject.put("password", this.b);
        jSONObject.put("returnSecureToken", true);
        String str = this.c;
        if (str != null) {
            jSONObject.put("tenantId", str);
        }
        String str2 = this.d;
        if (str2 != null) {
            to7.C(jSONObject, "captchaResponse", str2);
        } else {
            jSONObject.put("clientType", "CLIENT_TYPE_ANDROID");
        }
        return jSONObject.toString();
    }

    public prf(String str, String str2, String str3, String str4) {
        vp7.n(str);
        this.a = str;
        vp7.n(str2);
        this.b = str2;
        this.c = str3;
        this.d = str4;
    }
}
