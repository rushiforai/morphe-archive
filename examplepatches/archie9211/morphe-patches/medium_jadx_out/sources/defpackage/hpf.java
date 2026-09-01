package defpackage;

import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import com.google.android.gms.internal.p000firebaseauthapi.zzabz;
import java.util.ArrayList;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class hpf implements xnf {
    public String a;
    public String b;
    public boolean c;
    public long d;
    public ArrayList e;
    public String f;

    @Override // defpackage.xnf
    public final xnf a(String str) throws zzabz {
        try {
            JSONObject jSONObject = new JSONObject(str);
            jSONObject.optString("localId", null);
            jSONObject.optString("email", null);
            this.a = jSONObject.optString(kSWQKWZ.UDmFCTIQTpvwwpP, null);
            this.b = jSONObject.optString("refreshToken", null);
            this.c = jSONObject.optBoolean("isNewUser", false);
            this.d = jSONObject.optLong("expiresIn", 0L);
            this.e = hqf.a(jSONObject.optJSONArray("mfaInfo"));
            this.f = jSONObject.optString("mfaPendingCredential", null);
            return this;
        } catch (NullPointerException | JSONException e) {
            throw to7.B(e, "hpf", str);
        }
    }
}
