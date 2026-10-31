package wp;

import b50.d;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONObject;
import sp.r0;

/* loaded from: classes4.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f94629a = 0;

    static {
        new d(a.class.getSimpleName());
    }

    public static ArrayList a(JSONArray jSONArray) {
        ArrayList arrayList = new ArrayList();
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            try {
                Object objB = jSONArray.get(i5);
                if (objB instanceof JSONArray) {
                    objB = a((JSONArray) objB);
                } else if (objB instanceof JSONObject) {
                    objB = b((JSONObject) objB);
                }
                arrayList.add(objB);
            } catch (Throwable th2) {
                r0.c(th2);
                return arrayList;
            }
        }
        return arrayList;
    }

    public static HashMap b(JSONObject jSONObject) {
        HashMap map = new HashMap();
        try {
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                Object objB = jSONObject.get(next);
                if (objB instanceof JSONArray) {
                    objB = a((JSONArray) objB);
                } else if (objB instanceof JSONObject) {
                    objB = b((JSONObject) objB);
                }
                map.put(next, objB);
            }
            return map;
        } catch (Throwable th2) {
            r0.c(th2);
            return map;
        }
    }
}
