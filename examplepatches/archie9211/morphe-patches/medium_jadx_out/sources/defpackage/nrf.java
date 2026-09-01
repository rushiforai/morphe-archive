package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzabz;
import java.util.ArrayList;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nrf implements xnf {
    public String a;
    public String b;
    public long c;
    public ArrayList d;
    public String e;

    @Override // defpackage.xnf
    public final xnf a(String str) throws zzabz {
        try {
            JSONObject jSONObject = new JSONObject(str);
            luc.a(jSONObject.optString("localId", null));
            luc.a(jSONObject.optString("email", null));
            luc.a(jSONObject.optString("displayName", null));
            this.a = luc.a(jSONObject.optString("idToken", null));
            luc.a(jSONObject.optString("photoUrl", null));
            this.b = luc.a(jSONObject.optString("refreshToken", null));
            this.c = jSONObject.optLong("expiresIn", 0L);
            this.d = hqf.a(jSONObject.optJSONArray("mfaInfo"));
            this.e = jSONObject.optString("mfaPendingCredential", null);
            return this;
        } catch (NullPointerException | JSONException e) {
            throw to7.B(e, "nrf", str);
        }
    }
}
