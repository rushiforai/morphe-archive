package defpackage;

import android.text.TextUtils;
import android.util.Log;
import java.util.LinkedHashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f33 {
    public long a;
    public final Object b;
    public final Object c;

    public f33() {
        rre rreVar = rre.Lsq2;
        this.b = new tre(false, rreVar);
        this.c = new tre(false, rreVar);
    }

    public static String b(String str, String str2, long j) {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("token", str);
            jSONObject.put("appVersion", str2);
            jSONObject.put("timestamp", j);
            return jSONObject.toString();
        } catch (JSONException e) {
            Log.w("FirebaseMessaging", "Failed to encode token: " + e);
            return null;
        }
    }

    public static f33 c(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        if (!str.startsWith("{")) {
            return new f33(str, null, 0L);
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            return new f33(jSONObject.getString("token"), jSONObject.getString("appVersion"), jSONObject.getLong("timestamp"));
        } catch (JSONException e) {
            Log.w("FirebaseMessaging", "Failed to parse token: " + e);
            return null;
        }
    }

    public void a(long j, long j2) {
        ((tre) this.b).a(Float.intBitsToFloat((int) (j2 >> 32)), j);
        ((tre) this.c).a(Float.intBitsToFloat((int) (j2 & 4294967295L)), j);
    }

    public void d(cx7 cx7Var, ew5 ew5Var, Map map, long j) {
        uva uvaVar = (uva) this.c;
        long j2 = uvaVar.a;
        LinkedHashMap linkedHashMap = (LinkedHashMap) uvaVar.c;
        if (j > j2) {
            Object objRemove = linkedHashMap.remove(cx7Var);
            if (objRemove != null) {
                uvaVar.b = uvaVar.c() - uvaVar.f(cx7Var, objRemove);
                uvaVar.a(cx7Var, objRemove, null);
            }
            ((ad) this.b).w(cx7Var, ew5Var, map, j);
            return;
        }
        tva tvaVar = new tva(ew5Var, map, j);
        Object objPut = linkedHashMap.put(cx7Var, tvaVar);
        uvaVar.b = uvaVar.f(cx7Var, tvaVar) + uvaVar.c();
        if (objPut != null) {
            uvaVar.b = uvaVar.c() - uvaVar.f(cx7Var, objPut);
            uvaVar.a(cx7Var, objPut, tvaVar);
        }
        uvaVar.g(uvaVar.a);
    }

    public f33(long j, ad adVar) {
        this.a = j;
        this.b = adVar;
        this.c = new uva(this, j);
    }

    public f33(String str, String str2, long j) {
        this.b = str;
        this.c = str2;
        this.a = j;
    }
}
