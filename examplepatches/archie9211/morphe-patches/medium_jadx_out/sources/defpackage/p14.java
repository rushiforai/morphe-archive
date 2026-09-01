package defpackage;

import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p14 {
    public String a;
    public String b;
    public Long c;

    public p14(String str) {
        Long lValueOf = Long.valueOf(System.currentTimeMillis() / 1000);
        this.c = lValueOf;
        this.b = str;
        StringBuffer stringBuffer = new StringBuffer("error_log_");
        stringBuffer.append(lValueOf.longValue());
        stringBuffer.append(".json");
        String string = stringBuffer.toString();
        string.getClass();
        this.a = string;
    }

    public final String toString() {
        JSONObject jSONObject = new JSONObject();
        try {
            Long l = this.c;
            if (l != null) {
                jSONObject.put("timestamp", l);
            }
            jSONObject.put("error_message", this.b);
        } catch (JSONException unused) {
            jSONObject = null;
        }
        if (jSONObject == null) {
            return super.toString();
        }
        String string = jSONObject.toString();
        string.getClass();
        return string;
    }
}
