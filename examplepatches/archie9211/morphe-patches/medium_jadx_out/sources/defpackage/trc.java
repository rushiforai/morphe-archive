package defpackage;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class trc {
    public static boolean b;
    public static final trc a = new trc();
    public static final HashMap c = new HashMap();
    public static final HashMap d = new HashMap();

    public static final void e(Bundle bundle) {
        if (ec2.a.contains(trc.class)) {
            return;
        }
        try {
            if (b && bundle != null) {
                ArrayList arrayList = new ArrayList();
                for (String str : bundle.keySet()) {
                    String strValueOf = String.valueOf(bundle.get(str));
                    HashMap map = c;
                    boolean z = map.get(str) != null;
                    HashMap map2 = d;
                    boolean z2 = map2.get(str) != null;
                    if (z || z2) {
                        trc trcVar = a;
                        boolean zC = trcVar.c(strValueOf, (Set) map.get(str));
                        boolean zB = trcVar.b(strValueOf, (Set) map2.get(str));
                        if (!zC && !zB) {
                            str.getClass();
                            arrayList.add(str);
                        }
                    }
                }
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    bundle.remove((String) it2.next());
                }
            }
        } catch (Throwable th) {
            ec2.a(trc.class, th);
        }
    }

    public final void a(JSONArray jSONArray) {
        HashMap map = c;
        HashMap map2 = d;
        if (ec2.a.contains(this) || jSONArray == null) {
            return;
        }
        try {
            if (b) {
                return;
            }
            int length = jSONArray.length();
            for (int i = 0; i < length; i++) {
                JSONObject jSONObject = jSONArray.getJSONObject(i);
                String string = jSONObject.getString("key");
                if (string != null && string.length() != 0) {
                    try {
                        JSONArray jSONArray2 = jSONObject.getJSONArray("value");
                        int length2 = jSONArray2.length();
                        for (int i2 = 0; i2 < length2; i2++) {
                            boolean z = jSONArray2.getJSONObject(i2).getBoolean("require_exact_match");
                            HashSet hashSetD = d(jSONArray2.getJSONObject(i2).getJSONArray("potential_matches"));
                            if (z) {
                                HashSet hashSet = (HashSet) map2.get(string);
                                if (hashSet != null) {
                                    hashSet.addAll(hashSetD);
                                    hashSetD = hashSet;
                                }
                                map2.put(string, hashSetD);
                            } else {
                                HashSet hashSet2 = (HashSet) map.get(string);
                                if (hashSet2 != null) {
                                    hashSet2.addAll(hashSetD);
                                    hashSetD = hashSet2;
                                }
                                map.put(string, hashSetD);
                            }
                        }
                    } catch (Exception unused) {
                        map2.remove(string);
                        map.remove(string);
                    }
                }
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final boolean b(String str, Set set) {
        if (!ec2.a.contains(this) && set != null) {
            try {
                Set<String> set2 = set;
                if (!(set2 instanceof Collection) || !set2.isEmpty()) {
                    for (String str2 : set2) {
                        Locale locale = Locale.ROOT;
                        String lowerCase = str2.toLowerCase(locale);
                        lowerCase.getClass();
                        String lowerCase2 = str.toLowerCase(locale);
                        lowerCase2.getClass();
                        if (lowerCase.equals(lowerCase2)) {
                            return true;
                        }
                    }
                }
            } catch (Throwable th) {
                ec2.a(this, th);
            }
        }
        return false;
    }

    public final boolean c(String str, Set set) {
        if (!ec2.a.contains(this) && set != null) {
            try {
                Set<String> set2 = set;
                if (!(set2 instanceof Collection) || !set2.isEmpty()) {
                    for (String str2 : set2) {
                        str2.getClass();
                        Pattern patternCompile = Pattern.compile(str2);
                        patternCompile.getClass();
                        if (patternCompile.matcher(str).matches()) {
                            return true;
                        }
                    }
                }
            } catch (Throwable th) {
                ec2.a(this, th);
            }
        }
        return false;
    }

    public final HashSet d(JSONArray jSONArray) {
        try {
            if (ec2.a.contains(this)) {
                return null;
            }
            try {
                HashSet hashSetJ = epe.j(jSONArray);
                return hashSetJ == null ? new HashSet() : hashSetJ;
            } catch (Exception unused) {
                return new HashSet();
            }
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }
}
