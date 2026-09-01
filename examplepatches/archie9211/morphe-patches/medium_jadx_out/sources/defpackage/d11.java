package defpackage;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class d11 {
    public static final HashMap a;

    static {
        HashMap map = new HashMap();
        a = map;
        map.put(Boolean.class, new c11(0));
        map.put(Integer.class, new c11(1));
        map.put(Long.class, new c11(2));
        map.put(Double.class, new c11(3));
        map.put(String.class, new c11(4));
        map.put(String[].class, new c11(5));
        map.put(JSONArray.class, new c11(6));
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final Bundle a(JSONObject jSONObject) throws JSONException {
        Bundle bundle = new Bundle();
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            Object obj = jSONObject.get(next);
            if (obj != JSONObject.NULL) {
                if (!(obj instanceof JSONObject)) {
                    c11 c11Var = (c11) a.get(obj.getClass());
                    if (c11Var == null) {
                        z72.d("Unsupported type: ", obj.getClass());
                        return null;
                    }
                    next.getClass();
                    switch (c11Var.a) {
                        case 0:
                            bundle.putBoolean(next, ((Boolean) obj).booleanValue());
                            break;
                        case 1:
                            bundle.putInt(next, ((Integer) obj).intValue());
                            break;
                        case 2:
                            bundle.putLong(next, ((Long) obj).longValue());
                            break;
                        case 3:
                            bundle.putDouble(next, ((Double) obj).doubleValue());
                            break;
                        case 4:
                            bundle.putString(next, (String) obj);
                            break;
                        case 5:
                            throw new IllegalArgumentException("Unexpected type from JSON");
                        default:
                            JSONArray jSONArray = (JSONArray) obj;
                            ArrayList arrayList = new ArrayList();
                            if (jSONArray.length() != 0) {
                                int length = jSONArray.length();
                                int i = 0;
                                while (true) {
                                    if (i >= length) {
                                        bundle.putStringArrayList(next, arrayList);
                                    } else {
                                        Object obj2 = jSONArray.get(i);
                                        if (!(obj2 instanceof String)) {
                                            z72.d("Unexpected type in an array: ", obj2.getClass());
                                        } else {
                                            arrayList.add(obj2);
                                            i++;
                                        }
                                    }
                                }
                            } else {
                                bundle.putStringArrayList(next, arrayList);
                            }
                            break;
                    }
                } else {
                    bundle.putBundle(next, a((JSONObject) obj));
                }
            }
        }
        return bundle;
    }
}
