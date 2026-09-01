package defpackage;

import android.os.Build;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z36 {
    public String a;
    public x36 b;
    public JSONArray c;
    public String d;
    public String e;
    public String f;
    public Long g;

    public final boolean a() {
        String str = this.f;
        Long l = this.g;
        x36 x36Var = this.b;
        int i = x36Var == null ? -1 : y36.a[x36Var.ordinal()];
        return i != 1 ? i != 2 ? ((i != 3 && i != 4 && i != 5) || str == null || l == null) ? false : true : (str == null || this.e == null || l == null) ? false : true : (this.c == null || l == null) ? false : true;
    }

    public final void b() {
        if (a()) {
            xz5.F0(this.a, toString());
        }
    }

    public final String toString() {
        Long l = this.g;
        x36 x36Var = this.b;
        int i = x36Var == null ? -1 : y36.a[x36Var.ordinal()];
        JSONObject jSONObject = null;
        try {
            if (i == 1) {
                JSONObject jSONObject2 = new JSONObject();
                JSONArray jSONArray = this.c;
                if (jSONArray != null) {
                    jSONObject2.put("feature_names", jSONArray);
                }
                if (l != null) {
                    jSONObject2.put("timestamp", l);
                }
                jSONObject = jSONObject2;
            } else if (i == 2 || i == 3 || i == 4 || i == 5) {
                JSONObject jSONObject3 = new JSONObject();
                jSONObject3.put("device_os_version", Build.VERSION.RELEASE);
                jSONObject3.put("device_model", Build.MODEL);
                String str = this.d;
                if (str != null) {
                    jSONObject3.put("app_version", str);
                }
                if (l != null) {
                    jSONObject3.put("timestamp", l);
                }
                String str2 = this.e;
                if (str2 != null) {
                    jSONObject3.put("reason", str2);
                }
                String str3 = this.f;
                if (str3 != null) {
                    jSONObject3.put("callstack", str3);
                }
                if (x36Var != null) {
                    jSONObject3.put("type", x36Var);
                }
                jSONObject = jSONObject3;
            }
        } catch (JSONException unused) {
        }
        if (jSONObject == null) {
            String string = new JSONObject().toString();
            string.getClass();
            return string;
        }
        String string2 = jSONObject.toString();
        string2.getClass();
        return string2;
    }
}
