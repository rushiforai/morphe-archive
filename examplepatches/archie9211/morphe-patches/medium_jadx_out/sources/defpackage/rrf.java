package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzabz;
import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class rrf implements xnf {
    public String a;
    public String b;
    public long c;
    public boolean d;
    public String e;
    public String f;

    @Override // defpackage.xnf
    public final xnf a(String str) throws zzabz {
        try {
            JSONObject jSONObject = new JSONObject(str);
            this.a = luc.a(jSONObject.optString("idToken", null));
            this.b = luc.a(jSONObject.optString("refreshToken", null));
            this.c = jSONObject.optLong("expiresIn", 0L);
            luc.a(jSONObject.optString("localId", null));
            this.d = jSONObject.optBoolean("isNewUser", false);
            this.e = luc.a(jSONObject.optString(pUlNWdybf.ggRIHsqGrdhsKmp, null));
            this.f = luc.a(jSONObject.optString("phoneNumber", null));
            return this;
        } catch (NullPointerException | JSONException e) {
            throw to7.B(e, "rrf", str);
        }
    }
}
