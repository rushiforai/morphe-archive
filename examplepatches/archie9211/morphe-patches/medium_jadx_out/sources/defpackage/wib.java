package defpackage;

import android.util.Log;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArraySet;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wib {
    public static boolean b;
    public static final wib a = new wib();
    public static final ArrayList c = new ArrayList();
    public static final CopyOnWriteArraySet d = new CopyOnWriteArraySet();

    public final String a(String str, String str2) {
        try {
            if (!ec2.a.contains(this)) {
                try {
                    for (vib vibVar : new ArrayList(c)) {
                        if (vibVar != null && g76.L(str, vibVar.a)) {
                            for (String str3 : vibVar.b.keySet()) {
                                if (g76.L(str2, str3)) {
                                    return (String) vibVar.b.get(str3);
                                }
                            }
                        }
                    }
                } catch (Exception e) {
                    Log.w("wib", "getMatchedRuleType failed", e);
                }
            }
            return null;
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }

    public final void b() {
        String str;
        CopyOnWriteArraySet copyOnWriteArraySet = d;
        ArrayList arrayList = c;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            xe4 xe4VarK = af4.k(f94.b(), false);
            if (xe4VarK != null && (str = xe4VarK.l) != null && str.length() != 0) {
                JSONObject jSONObject = new JSONObject(str);
                arrayList.clear();
                copyOnWriteArraySet.clear();
                Iterator<String> itKeys = jSONObject.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    JSONObject jSONObject2 = jSONObject.getJSONObject(next);
                    if (jSONObject2 != null) {
                        JSONObject jSONObjectOptJSONObject = jSONObject2.optJSONObject("restrictive_param");
                        next.getClass();
                        HashMap map = new HashMap();
                        vib vibVar = new vib();
                        vibVar.a = next;
                        vibVar.b = map;
                        if (jSONObjectOptJSONObject != null) {
                            vibVar.b = epe.m(jSONObjectOptJSONObject);
                            arrayList.add(vibVar);
                        }
                        if (jSONObject2.has("process_event_name")) {
                            copyOnWriteArraySet.add(next);
                        }
                    }
                }
            }
        } catch (Exception unused) {
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }
}
