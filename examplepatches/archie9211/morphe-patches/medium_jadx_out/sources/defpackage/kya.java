package defpackage;

import java.util.HashMap;
import java.util.HashSet;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kya {
    public static boolean b;
    public static final kya a = new kya();
    public static HashMap c = new HashMap();

    public final void a() {
        HashSet hashSetJ;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            xe4 xe4VarK = af4.k(f94.b(), false);
            if (xe4VarK == null) {
                return;
            }
            try {
                c = new HashMap();
                JSONArray jSONArray = xe4VarK.p;
                if (jSONArray == null || jSONArray.length() == 0) {
                    return;
                }
                int length = jSONArray.length();
                for (int i = 0; i < length; i++) {
                    JSONObject jSONObject = jSONArray.getJSONObject(i);
                    boolean zHas = jSONObject.has("key");
                    boolean zHas2 = jSONObject.has("value");
                    if (zHas && zHas2) {
                        String string = jSONObject.getString("key");
                        JSONArray jSONArray2 = jSONObject.getJSONArray("value");
                        if (string != null && (hashSetJ = epe.j(jSONArray2)) != null) {
                            c.put(string, hashSetJ);
                        }
                    }
                }
            } catch (Exception unused) {
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }
}
