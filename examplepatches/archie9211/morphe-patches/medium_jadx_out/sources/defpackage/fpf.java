package defpackage;

import android.util.Log;
import com.medium.android.common.ui.Ezz.Plbho;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class fpf implements vnf {
    public final String a;
    public final String b;
    public final qw3 c;
    public final String d;
    public final String e;

    public fpf(qw3 qw3Var, String str, String str2) {
        vp7.p(qw3Var);
        this.c = qw3Var;
        String str3 = qw3Var.a;
        vp7.n(str3);
        this.a = str3;
        String str4 = qw3Var.c;
        vp7.n(str4);
        this.b = str4;
        this.d = str;
        this.e = str2;
    }

    @Override // defpackage.vnf
    public final String zza() throws JSONException {
        a6 a6Var;
        int i = a6.c;
        String str = this.b;
        vp7.n(str);
        try {
            a6Var = new a6(str);
        } catch (IllegalArgumentException unused) {
            a6Var = null;
        }
        String str2 = a6Var != null ? a6Var.a : null;
        String str3 = a6Var != null ? a6Var.b : null;
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("email", this.a);
        if (str2 != null) {
            jSONObject.put("oobCode", str2);
        }
        if (str3 != null) {
            jSONObject.put("tenantId", str3);
        }
        String str4 = this.d;
        if (str4 != null) {
            jSONObject.put("idToken", str4);
        }
        String str5 = this.e;
        if (str5 != null) {
            to7.C(jSONObject, "captchaResp", str5);
        } else {
            jSONObject.put("clientType", "CLIENT_TYPE_ANDROID");
        }
        return jSONObject.toString();
    }

    static {
        String simpleName = fpf.class.getSimpleName();
        String[] strArr = new String[0];
        if (strArr.length != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append('[');
            for (String str : strArr) {
                if (sb.length() > 1) {
                    sb.append(Plbho.hVyX);
                }
                sb.append(str);
            }
            sb.append("] ");
        }
        Object[] objArr = {simpleName, 23};
        if (!(simpleName.length() <= 23)) {
            throw new IllegalArgumentException(String.format("tag \"%s\" is longer than the %d character maximum", objArr));
        }
        for (int i = 2; i <= 7 && !Log.isLoggable(simpleName, i); i++) {
        }
    }
}
