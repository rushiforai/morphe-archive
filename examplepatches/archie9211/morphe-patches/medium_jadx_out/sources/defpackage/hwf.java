package defpackage;

import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.internal.p000firebaseauthapi.zzzx;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class hwf {
    public static final xp a = new xp("JSONParser", new String[0]);

    public static y70 a(JSONObject jSONObject) throws JSONException {
        y70 y70Var = new y70(0);
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            Object objA = jSONObject.get(next);
            if (objA instanceof JSONArray) {
                objA = b((JSONArray) objA);
            } else if (objA instanceof JSONObject) {
                objA = a((JSONObject) objA);
            }
            y70Var.put(next, objA);
        }
        return y70Var;
    }

    public static ArrayList b(JSONArray jSONArray) throws JSONException {
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < jSONArray.length(); i++) {
            Object objA = jSONArray.get(i);
            if (objA instanceof JSONArray) {
                objA = b((JSONArray) objA);
            } else if (objA instanceof JSONObject) {
                objA = a((JSONObject) objA);
            }
            arrayList.add(objA);
        }
        return arrayList;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static Map c(String str) {
        vp7.n(str);
        j6g j6gVar = new j6g('.', 0);
        ujf ujfVar = new ujf(27, (boolean) (0 == true ? 1 : 0));
        ujfVar.b = j6gVar;
        List listM = new wjc(15, ujfVar).m(str);
        if (listM.size() < 2) {
            a.j("Invalid idToken ".concat(str), new Object[0]);
            return new HashMap();
        }
        y70 y70VarD = d(new String(op8.S((String) listM.get(1)), StandardCharsets.UTF_8));
        return y70VarD == null ? new HashMap() : y70VarD;
    }

    public static y70 d(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            if (jSONObject != JSONObject.NULL) {
                return a(jSONObject);
            }
            return null;
        } catch (Exception e) {
            Log.d("JSONParser", "Failed to parse JSONObject into Map.");
            throw new zzzx(e);
        }
    }
}
