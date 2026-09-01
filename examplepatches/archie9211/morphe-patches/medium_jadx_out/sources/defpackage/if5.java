package defpackage;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.util.Arrays;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class if5 {
    public static final /* synthetic */ int e = 0;
    public final HttpURLConnection a;
    public final JSONObject b;
    public final b94 c;
    public final JSONObject d;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public if5(ff5 ff5Var, HttpURLConnection httpURLConnection, String str, JSONObject jSONObject) {
        this(ff5Var, httpURLConnection, jSONObject, null, null);
        ff5Var.getClass();
        str.getClass();
    }

    public final String toString() {
        String str;
        try {
            Locale locale = Locale.US;
            HttpURLConnection httpURLConnection = this.a;
            str = String.format(locale, "%d", Arrays.copyOf(new Object[]{Integer.valueOf(httpURLConnection != null ? httpURLConnection.getResponseCode() : 200)}, 1));
        } catch (IOException unused) {
            str = "unknown";
        }
        StringBuilder sbU = lv8.u("{Response:  responseCode: ", str, ", graphObject: ");
        sbU.append(this.b);
        sbU.append(", error: ");
        sbU.append(this.c);
        sbU.append("}");
        return sbU.toString();
    }

    public if5(ff5 ff5Var, HttpURLConnection httpURLConnection, JSONObject jSONObject, JSONArray jSONArray, b94 b94Var) {
        ff5Var.getClass();
        this.a = httpURLConnection;
        this.b = jSONObject;
        this.c = b94Var;
        this.d = jSONObject;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public if5(ff5 ff5Var, HttpURLConnection httpURLConnection, b94 b94Var) {
        this(ff5Var, httpURLConnection, null, null, b94Var);
        ff5Var.getClass();
    }
}
