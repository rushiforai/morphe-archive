package defpackage;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y4a {
    public static boolean b;
    public static HashSet d;
    public static final y4a a = new y4a();
    public static final w5d c = new w5d(b18.h);

    public static final void b(Bundle bundle) {
        if (ec2.a.contains(y4a.class)) {
            return;
        }
        try {
            if (b && bundle != null && !bundle.isEmpty() && d != null) {
                ArrayList<String> arrayList = new ArrayList();
                Set<String> setKeySet = bundle.keySet();
                setKeySet.getClass();
                for (String str : setKeySet) {
                    HashSet hashSet = d;
                    hashSet.getClass();
                    if (!hashSet.contains(str)) {
                        str.getClass();
                        arrayList.add(str);
                    }
                }
                boolean z = false;
                for (String str2 : arrayList) {
                    if (bundle.containsKey(str2)) {
                        bundle.remove(str2);
                        z = true;
                    }
                }
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("cd", z);
                bundle.putString("pm_metadata", jSONObject.toString());
                bundle.putString("pm", "1");
            }
        } catch (Throwable th) {
            ec2.a(y4a.class, th);
        }
    }

    public final void a() {
        HashSet hashSet;
        Set set = ec2.a;
        if (set.contains(this)) {
            return;
        }
        try {
            xe4 xe4VarK = af4.k(f94.b(), false);
            if (xe4VarK == null) {
                return;
            }
            JSONArray jSONArray = xe4VarK.m;
            HashSet hashSet2 = null;
            if (set.contains(this) || jSONArray == null) {
                hashSet = null;
            } else {
                try {
                    if (jSONArray.length() != 0) {
                        hashSet = new HashSet();
                        int length = jSONArray.length();
                        for (int i = 0; i < length; i++) {
                            String string = jSONArray.getString(i);
                            string.getClass();
                            hashSet.add(string);
                        }
                    }
                } catch (Throwable th) {
                    ec2.a(this, th);
                }
                hashSet = null;
            }
            if (hashSet == null) {
                if (!ec2.a.contains(this)) {
                    try {
                        hashSet2 = (HashSet) c.getValue();
                    } catch (Throwable th2) {
                        ec2.a(this, th2);
                    }
                }
                hashSet = hashSet2;
            }
            d = hashSet;
        } catch (Throwable th3) {
            ec2.a(this, th3);
        }
    }

    public final boolean c(Bundle bundle) {
        if (ec2.a.contains(this) || bundle == null) {
            return false;
        }
        try {
            if (bundle.containsKey("pm")) {
                if (g76.L(bundle.get("pm"), "1")) {
                    return true;
                }
            }
            return false;
        } catch (Throwable th) {
            ec2.a(this, th);
            return false;
        }
    }
}
