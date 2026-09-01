package defpackage;

import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class chg {
    public static final chg b = new chg();
    public final HashMap a = new HashMap();

    public final synchronized void a(String str, bzf bzfVar) {
        try {
            boolean zContainsKey = this.a.containsKey(str);
            HashMap map = this.a;
            if (!zContainsKey) {
                map.put(str, bzfVar);
                return;
            }
            if (((bzf) map.get(str)).equals(bzfVar)) {
                return;
            }
            throw new GeneralSecurityException("Parameters object with name " + str + " already exists (" + String.valueOf(this.a.get(str)) + "), cannot insert " + String.valueOf(bzfVar));
        } catch (Throwable th) {
            throw th;
        }
    }

    public final synchronized void b(Map map) {
        for (Map.Entry entry : map.entrySet()) {
            a((String) entry.getKey(), (bzf) entry.getValue());
        }
    }
}
