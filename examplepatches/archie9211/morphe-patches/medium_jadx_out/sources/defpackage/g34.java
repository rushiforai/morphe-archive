package defpackage;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONObject;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class g34 {
    public static boolean b;
    public static final g34 a = new g34();
    public static final ArrayList c = new ArrayList();
    public static final HashSet d = new HashSet();

    public static final void b(ArrayList arrayList) {
        if (ec2.a.contains(g34.class)) {
            return;
        }
        try {
            if (b) {
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    if (d.contains(((i40) it2.next()).e)) {
                        it2.remove();
                    }
                }
            }
        } catch (Throwable th) {
            ec2.a(g34.class, th);
        }
    }

    public final synchronized void a() {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            xe4 xe4VarK = af4.k(f94.b(), false);
            if (xe4VarK == null) {
                return;
            }
            String str = xe4VarK.l;
            if (str != null && str.length() > 0) {
                JSONObject jSONObject = new JSONObject(str);
                c.clear();
                Iterator<String> itKeys = jSONObject.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    JSONObject jSONObject2 = jSONObject.getJSONObject(next);
                    if (jSONObject2 != null) {
                        if (jSONObject2.optBoolean("is_deprecated_event")) {
                            HashSet hashSet = d;
                            next.getClass();
                            hashSet.add(next);
                        } else {
                            JSONArray jSONArrayOptJSONArray = jSONObject2.optJSONArray(eoLmc.XVKMOMVOnVfqq);
                            next.getClass();
                            ArrayList arrayList = new ArrayList();
                            f34 f34Var = new f34();
                            f34Var.a = next;
                            f34Var.b = arrayList;
                            if (jSONArrayOptJSONArray != null) {
                                f34Var.b = epe.k(jSONArrayOptJSONArray);
                            }
                            c.add(f34Var);
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
