package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzabz;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mpf implements xnf {
    public ug3 a;

    @Override // defpackage.xnf
    public final xnf a(String str) throws zzabz {
        ug3 ug3Var;
        int i;
        JSONArray jSONArray;
        ppf ppfVar;
        try {
            JSONObject jSONObject = new JSONObject(str);
            if (jSONObject.has("users")) {
                JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("users");
                if (jSONArrayOptJSONArray == null || jSONArrayOptJSONArray.length() == 0) {
                    ug3Var = new ug3(new ArrayList());
                } else {
                    ArrayList arrayList = new ArrayList(jSONArrayOptJSONArray.length());
                    boolean z = false;
                    int i2 = 0;
                    while (i2 < jSONArrayOptJSONArray.length()) {
                        JSONObject jSONObject2 = jSONArrayOptJSONArray.getJSONObject(i2);
                        if (jSONObject2 == null) {
                            ppfVar = new ppf();
                            ppfVar.f = new a38();
                            bsf bsfVar = upf.f;
                            ppfVar.m = ivf.i;
                            jSONArray = jSONArrayOptJSONArray;
                            i = i2;
                        } else {
                            String strA = luc.a(jSONObject2.optString("localId", null));
                            String strA2 = luc.a(jSONObject2.optString("email", null));
                            boolean zOptBoolean = jSONObject2.optBoolean("emailVerified", z);
                            String strA3 = luc.a(jSONObject2.optString("displayName", null));
                            String strA4 = luc.a(jSONObject2.optString("photoUrl", null));
                            a38 a38VarA = a38.a(jSONObject2.optJSONArray("providerUserInfo"));
                            luc.a(jSONObject2.optString("rawPassword", null));
                            i = i2;
                            jSONArray = jSONArrayOptJSONArray;
                            ppfVar = new ppf(strA, strA2, zOptBoolean, strA3, strA4, a38VarA, luc.a(jSONObject2.optString("phoneNumber", null)), jSONObject2.optLong("createdAt", 0L), jSONObject2.optLong("lastLoginAt", 0L), hqf.a(jSONObject2.optJSONArray("mfaInfo")), dvf.e(jSONObject2.optJSONArray("passkeyInfo")));
                        }
                        arrayList.add(ppfVar);
                        i2 = i + 1;
                        jSONArrayOptJSONArray = jSONArray;
                        z = false;
                    }
                    ug3Var = new ug3(arrayList);
                }
            } else {
                ug3Var = new ug3();
                ug3Var.a = new ArrayList();
            }
            this.a = ug3Var;
            return this;
        } catch (NullPointerException e) {
            e = e;
            throw to7.B(e, "mpf", str);
        } catch (JSONException e2) {
            e = e2;
            throw to7.B(e, "mpf", str);
        }
    }
}
