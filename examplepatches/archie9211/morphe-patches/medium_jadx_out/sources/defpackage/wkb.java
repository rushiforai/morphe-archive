package defpackage;

import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class wkb {
    public static final rz2 a;

    static {
        yb6 yb6Var = new yb6();
        gh0 gh0Var = gh0.a;
        yb6Var.a(wkb.class, gh0Var);
        yb6Var.a(bk0.class, gh0Var);
        a = new rz2(24, yb6Var);
    }

    public static bk0 a(String str) throws JSONException {
        JSONObject jSONObject = new JSONObject(str);
        String string = jSONObject.getString("rolloutId");
        String string2 = jSONObject.getString("parameterKey");
        String string3 = jSONObject.getString("parameterValue");
        String string4 = jSONObject.getString("variantId");
        long j = jSONObject.getLong("templateVersion");
        if (string3.length() > 256) {
            string3 = string3.substring(0, 256);
        }
        return new bk0(string, string2, string3, j, string4);
    }
}
