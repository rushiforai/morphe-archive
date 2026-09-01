package defpackage;

import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;
import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import com.facebook.FacebookException;
import com.facebook.FacebookServiceException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class ba7 implements Parcelable {
    public HashMap a;
    public p87 b;

    public ba7(Parcel parcel) {
        HashMap map;
        int i = parcel.readInt();
        if (i < 0) {
            map = null;
        } else {
            map = new HashMap();
            for (int i2 = 0; i2 < i; i2++) {
                map.put(parcel.readString(), parcel.readString());
            }
        }
        this.a = map != null ? new LinkedHashMap(map) : null;
    }

    public final void a(String str, String str2) {
        HashMap map = this.a;
        if (map == null) {
            map = new HashMap();
            this.a = map;
        }
    }

    public void b() {
    }

    public final String c(String str) {
        str.getClass();
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("0_auth_logger_id", str);
            jSONObject.put("3_method", e());
            j(jSONObject);
        } catch (JSONException e) {
            Log.w("LoginMethodHandler", "Error creating client state json: " + e.getMessage());
        }
        String string = jSONObject.toString();
        string.getClass();
        return string;
    }

    public final p87 d() {
        p87 p87Var = this.b;
        if (p87Var != null) {
            return p87Var;
        }
        g76.g0("loginClient");
        throw null;
    }

    public abstract String e();

    public String f() {
        return "fb" + f94.b() + "://authorize/";
    }

    public final void g(String str) {
        String strB;
        m87 m87Var = d().g;
        if (m87Var == null || (strB = m87Var.d) == null) {
            strB = f94.b();
        }
        g50 g50Var = new g50(d().e(), strB);
        Bundle bundle = new Bundle();
        bundle.putString("fb_web_login_e2e", str);
        bundle.putLong("fb_web_login_switchback_time", System.currentTimeMillis());
        bundle.putString("app_id", strB);
        f94 f94Var = f94.a;
        if (mme.c()) {
            g50Var.g("fb_dialogs_web_login_dialog_complete", bundle);
        }
    }

    public boolean h(int i, int i2, Intent intent) {
        return false;
    }

    public void j(JSONObject jSONObject) {
    }

    public abstract int k(m87 m87Var);

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        HashMap map = this.a;
        if (map == null) {
            parcel.writeInt(-1);
            return;
        }
        parcel.writeInt(map.size());
        for (Map.Entry entry : map.entrySet()) {
            String str = (String) entry.getKey();
            String str2 = (String) entry.getValue();
            parcel.writeString(str);
            parcel.writeString(str2);
        }
    }

    public final void i(m87 m87Var, Bundle bundle) {
        String string = bundle.getString("code");
        if (epe.J(string)) {
            throw new FacebookException("No code param found from the request");
        }
        if (string == null) {
            throw new FacebookException("Failed to create code exchange request");
        }
        String strF = f();
        String str = m87Var.r;
        if (str == null) {
            str = "";
        }
        strF.getClass();
        Bundle bundle2 = new Bundle();
        bundle2.putString("code", string);
        bundle2.putString("client_id", f94.b());
        bundle2.putString("redirect_uri", strF);
        bundle2.putString("code_verifier", str);
        String str2 = ff5.j;
        ff5 ff5VarG0 = xz5.g0(null, QFTsJPDEnO.geIWgxkDS, null);
        ff5VarG0.k(dt5.GET);
        ff5VarG0.d = bundle2;
        if5 if5VarC = ff5VarG0.c();
        b94 b94Var = if5VarC.c;
        if (b94Var != null) {
            throw new FacebookServiceException(b94Var, b94Var.a());
        }
        try {
            JSONObject jSONObject = if5VarC.b;
            String string2 = jSONObject != null ? jSONObject.getString("access_token") : null;
            if (jSONObject == null || epe.J(string2)) {
                throw new FacebookException("No access token found from result");
            }
            bundle.putString("access_token", string2);
            if (jSONObject.has("id_token")) {
                bundle.putString("id_token", jSONObject.getString("id_token"));
            }
        } catch (JSONException e) {
            throw new FacebookException("Fail to process code exchange response: " + e.getMessage());
        }
    }
}
