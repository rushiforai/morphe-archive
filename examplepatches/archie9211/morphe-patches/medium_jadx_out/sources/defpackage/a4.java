package defpackage;

import com.drew.imaging.eps.ld.PdtluglzAX;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class a4 implements bf5 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ a4(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.bf5
    public final void a(if5 if5Var) {
        JSONObject jSONObject;
        JSONObject jSONObject2;
        int i = this.a;
        String string = null;
        Object obj = this.b;
        switch (i) {
            case 0:
                e4 e4Var = (e4) obj;
                JSONObject jSONObject3 = if5Var.d;
                if (jSONObject3 != null) {
                    e4Var.a = jSONObject3.optString("access_token");
                    e4Var.c = jSONObject3.optInt("expires_at");
                    e4Var.d = jSONObject3.optInt("expires_in");
                    e4Var.e = Long.valueOf(jSONObject3.optLong("data_access_expiration_time"));
                    e4Var.b = jSONObject3.optString(PdtluglzAX.hlXz, null);
                    break;
                }
                break;
            case 1:
                ArrayList arrayList = (ArrayList) obj;
                try {
                    if (if5Var.c == null && (jSONObject = if5Var.d) != null && jSONObject.getBoolean("success")) {
                        Iterator it2 = arrayList.iterator();
                        while (it2.hasNext()) {
                            xz5.N(((p14) it2.next()).a);
                            break;
                        }
                        break;
                    }
                } catch (JSONException unused) {
                    return;
                }
                break;
            case 2:
                z36 z36Var = (z36) obj;
                try {
                    if (if5Var.c == null && (jSONObject2 = if5Var.d) != null && jSONObject2.getBoolean("success")) {
                        xz5.N(z36Var.a);
                        break;
                    }
                } catch (JSONException unused2) {
                    return;
                }
                break;
            default:
                lt ltVar = (lt) obj;
                if (ltVar != null) {
                    JSONObject jSONObject4 = if5Var.b;
                    String str = ((w3) ltVar.b).e;
                    yd0 yd0Var = (yd0) ltVar.c;
                    b94 b94Var = if5Var.c;
                    if (b94Var == null) {
                        if (jSONObject4 != null) {
                            try {
                                string = jSONObject4.getString("name");
                            } catch (JSONException e) {
                                wld.a.e(e, "could not fetch Facebook profile name", new Object[0]);
                            }
                        }
                        yd0Var.s(new sg2(str, string));
                    } else {
                        wld.a.e(b94Var.i, b94Var.a(), new Object[0]);
                        yd0Var.s(new sg2(str, null));
                    }
                }
                break;
        }
    }
}
