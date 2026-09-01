package defpackage;

import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sqf implements vnf {
    public String a;
    public String b;
    public String c;
    public String d;
    public String e;

    @Override // defpackage.vnf
    public String zza() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        String str = this.a;
        if (str != null) {
            jSONObject.put("email", str);
        }
        String str2 = this.b;
        if (str2 != null) {
            jSONObject.put("password", str2);
        }
        String str3 = this.c;
        if (str3 != null) {
            jSONObject.put("tenantId", str3);
        }
        String str4 = this.d;
        if (str4 != null) {
            to7.C(jSONObject, "captchaResponse", str4);
        } else {
            jSONObject.put("clientType", "CLIENT_TYPE_ANDROID");
        }
        String str5 = this.e;
        if (str5 != null) {
            jSONObject.put("idToken", str5);
        }
        return jSONObject.toString();
    }
}
