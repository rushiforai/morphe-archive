package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzabz;
import java.util.Arrays;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bqf implements xnf {
    public String a;
    public ivf b;

    @Override // defpackage.xnf
    public final xnf a(String str) throws zzabz {
        ivf ivfVar;
        try {
            JSONObject jSONObject = new JSONObject(str);
            this.a = luc.a(jSONObject.optString("recaptchaKey"));
            if (jSONObject.has("recaptchaEnforcementState")) {
                JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("recaptchaEnforcementState");
                if (jSONArrayOptJSONArray == null || jSONArrayOptJSONArray.length() == 0) {
                    bsf bsfVar = upf.f;
                    ivfVar = ivf.i;
                } else {
                    bsf bsfVar2 = upf.f;
                    Object[] objArrCopyOf = new Object[4];
                    int i = 0;
                    int i2 = 0;
                    boolean z = false;
                    while (i < jSONArrayOptJSONArray.length()) {
                        JSONObject jSONObject2 = jSONArrayOptJSONArray.getJSONObject(i);
                        yof yofVar = jSONObject2 == null ? new yof(null, null) : new yof(luc.a(jSONObject2.optString("provider")), luc.a(jSONObject2.optString("enforcementState")));
                        int iE = qo7.E(objArrCopyOf.length, i2 + 1);
                        if (iE > objArrCopyOf.length || z) {
                            objArrCopyOf = Arrays.copyOf(objArrCopyOf, iE);
                            z = false;
                        }
                        objArrCopyOf[i2] = yofVar;
                        i++;
                        i2++;
                    }
                    ivfVar = i2 == 0 ? ivf.i : new ivf(i2, objArrCopyOf);
                }
                this.b = ivfVar;
            }
            return this;
        } catch (NullPointerException e) {
            e = e;
            throw to7.B(e, "bqf", str);
        } catch (JSONException e2) {
            e = e2;
            throw to7.B(e, "bqf", str);
        }
    }

    public final boolean b() {
        vp7.n("EMAIL_PASSWORD_PROVIDER");
        ivf ivfVar = this.b;
        String str = null;
        if (ivfVar != null && !ivfVar.isEmpty()) {
            ivf ivfVar2 = this.b;
            int i = ivfVar2.h;
            int i2 = 0;
            while (true) {
                if (i2 >= i) {
                    break;
                }
                Object obj = ivfVar2.get(i2);
                i2++;
                yof yofVar = (yof) obj;
                String str2 = yofVar.b;
                String str3 = yofVar.a;
                if (str2 != null && str3 != null && str3.equals("EMAIL_PASSWORD_PROVIDER")) {
                    str = str2;
                    break;
                }
            }
        }
        return str != null && (str.equals("ENFORCE") || str.equals("AUDIT"));
    }
}
