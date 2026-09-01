package defpackage;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class izb {
    public static boolean b;
    public static final izb a = new izb();
    public static HashSet c = new HashSet();
    public static HashMap d = new HashMap();

    public static final void b(String str, Bundle bundle) {
        if (ec2.a.contains(izb.class)) {
            return;
        }
        try {
            str.getClass();
            if (b && bundle != null) {
                if (!c.isEmpty() || d.containsKey(str)) {
                    JSONArray jSONArray = new JSONArray();
                    try {
                        HashSet hashSet = (HashSet) d.get(str);
                        for (String str2 : new ArrayList(bundle.keySet())) {
                            izb izbVar = a;
                            str2.getClass();
                            if (!ec2.a.contains(izbVar)) {
                                try {
                                    if (c.contains(str2) || (hashSet != null && !hashSet.isEmpty() && hashSet.contains(str2))) {
                                        bundle.remove(str2);
                                        jSONArray.put(str2);
                                    }
                                } catch (Throwable th) {
                                    ec2.a(izbVar, th);
                                }
                            }
                        }
                    } catch (Exception unused) {
                    }
                    if (jSONArray.length() > 0) {
                        bundle.putString("_filteredKey", jSONArray.toString());
                    }
                }
            }
        } catch (Throwable th2) {
            ec2.a(izb.class, th2);
        }
    }

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
                c = new HashSet();
                d = new HashMap();
                JSONArray jSONArray = xe4VarK.q;
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
                        if (jSONArray2 != null && (hashSetJ = epe.j(jSONArray2)) != null) {
                            if (string.equals("_MTSDK_Default_")) {
                                c = hashSetJ;
                            } else {
                                d.put(string, hashSetJ);
                            }
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
