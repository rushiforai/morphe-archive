package defpackage;

import com.facebook.FacebookException;
import java.util.Arrays;
import java.util.Locale;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class oa3 implements bf5 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ta3 b;

    public /* synthetic */ oa3(ta3 ta3Var, int i) {
        this.a = i;
        this.b = ta3Var;
    }

    @Override // defpackage.bf5
    public final void a(if5 if5Var) {
        int i = this.a;
        ta3 ta3Var = this.b;
        switch (i) {
            case 0:
                if (!ta3Var.K0) {
                    b94 b94Var = if5Var.c;
                    if (b94Var != null) {
                        FacebookException facebookException = b94Var.i;
                        if (facebookException == null) {
                            facebookException = new FacebookException();
                        }
                        ta3Var.g0(facebookException);
                    } else {
                        JSONObject jSONObject = if5Var.b;
                        if (jSONObject == null) {
                            jSONObject = new JSONObject();
                        }
                        ra3 ra3Var = new ra3();
                        try {
                            String string = jSONObject.getString("user_code");
                            ra3Var.b = string;
                            ra3Var.a = String.format(Locale.ENGLISH, "https://facebook.com/device?user_code=%1$s&qr=1", Arrays.copyOf(new Object[]{string}, 1));
                            ra3Var.c = jSONObject.getString("code");
                            ra3Var.d = jSONObject.getLong("interval");
                            ta3Var.k0(ra3Var);
                        } catch (JSONException e) {
                            ta3Var.g0(new FacebookException(e));
                            return;
                        }
                    }
                    break;
                }
                break;
            default:
                if (!ta3Var.G0.get()) {
                    b94 b94Var2 = if5Var.c;
                    if (b94Var2 != null) {
                        int i2 = b94Var2.c;
                        if (i2 == 1349174 || i2 == 1349172) {
                            ta3Var.j0();
                        } else if (i2 == 1349152) {
                            ra3 ra3Var2 = ta3Var.J0;
                            if (ra3Var2 != null) {
                                xa3.a(ra3Var2.b);
                            }
                            m87 m87Var = ta3Var.M0;
                            if (m87Var == null) {
                                ta3Var.f0();
                            } else {
                                ta3Var.l0(m87Var);
                            }
                        } else if (i2 != 1349173) {
                            FacebookException facebookException2 = b94Var2.i;
                            if (facebookException2 == null) {
                                facebookException2 = new FacebookException();
                            }
                            ta3Var.g0(facebookException2);
                        } else {
                            ta3Var.f0();
                        }
                    } else {
                        try {
                            JSONObject jSONObject2 = if5Var.b;
                            if (jSONObject2 == null) {
                                jSONObject2 = new JSONObject();
                            }
                            String string2 = jSONObject2.getString("access_token");
                            string2.getClass();
                            ta3Var.h0(string2, jSONObject2.getLong("expires_in"), Long.valueOf(jSONObject2.optLong("data_access_expiration_time")));
                        } catch (JSONException e2) {
                            ta3Var.g0(new FacebookException(e2));
                        }
                    }
                    break;
                }
                break;
        }
    }
}
