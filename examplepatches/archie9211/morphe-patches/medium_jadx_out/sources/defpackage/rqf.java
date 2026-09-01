package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzabz;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rqf implements xnf {
    public String a;
    public String b;
    public long c;

    @Override // defpackage.xnf
    public final xnf a(String str) throws zzabz {
        try {
            JSONObject jSONObject = new JSONObject(str);
            this.a = luc.a(jSONObject.optString("idToken", null));
            luc.a(jSONObject.optString("displayName", null));
            luc.a(jSONObject.optString("email", null));
            this.b = luc.a(jSONObject.optString("refreshToken", null));
            this.c = jSONObject.optLong("expiresIn", 0L);
            return this;
        } catch (NullPointerException | JSONException e) {
            throw to7.B(e, "rqf", str);
        }
    }
}
