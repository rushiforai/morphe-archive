package defpackage;

import android.text.TextUtils;
import com.google.android.gms.internal.p000firebaseauthapi.zzabz;
import java.util.ArrayList;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class irf implements xnf {
    public boolean a;
    public String b;
    public String c;
    public long d;
    public String e;
    public String f;
    public String g;
    public boolean h;
    public String i;
    public String j;
    public String k;
    public String l;
    public String m;
    public String n;
    public ArrayList o;
    public String p;

    @Override // defpackage.xnf
    public final xnf a(String str) throws zzabz {
        try {
            JSONObject jSONObject = new JSONObject(str);
            this.a = jSONObject.optBoolean("needConfirmation", false);
            jSONObject.optBoolean("needEmail", false);
            this.b = luc.a(jSONObject.optString("idToken", null));
            this.c = luc.a(jSONObject.optString("refreshToken", null));
            this.d = jSONObject.optLong("expiresIn", 0L);
            luc.a(jSONObject.optString("localId", null));
            this.e = luc.a(jSONObject.optString("email", null));
            luc.a(jSONObject.optString("displayName", null));
            luc.a(jSONObject.optString("photoUrl", null));
            this.f = luc.a(jSONObject.optString("providerId", null));
            this.g = luc.a(jSONObject.optString("rawUserInfo", null));
            this.h = jSONObject.optBoolean("isNewUser", false);
            this.i = jSONObject.optString("oauthAccessToken", null);
            this.j = jSONObject.optString("oauthIdToken", null);
            this.l = luc.a(jSONObject.optString("errorMessage", null));
            this.m = luc.a(jSONObject.optString("pendingToken", null));
            this.n = luc.a(jSONObject.optString("tenantId", null));
            this.o = hqf.a(jSONObject.optJSONArray("mfaInfo"));
            this.p = luc.a(jSONObject.optString("mfaPendingCredential", null));
            this.k = luc.a(jSONObject.optString("oauthTokenSecret", null));
            return this;
        } catch (NullPointerException | JSONException e) {
            throw to7.B(e, "irf", str);
        }
    }

    public final lxf b() {
        if (TextUtils.isEmpty(this.i) && TextUtils.isEmpty(this.j)) {
            return null;
        }
        String str = this.f;
        String str2 = this.j;
        String str3 = this.i;
        String str4 = this.m;
        String str5 = this.k;
        vp7.o(str, "Must specify a non-empty providerId");
        if (!TextUtils.isEmpty(str2) || !TextUtils.isEmpty(str3)) {
            return new lxf(str, str2, str3, null, str4, str5, null);
        }
        ay0.e("Must specify an idToken or an accessToken.");
        return null;
    }
}
