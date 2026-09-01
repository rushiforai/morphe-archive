package defpackage;

import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wlg {
    public static final wlg b = new wlg();
    public final HashMap a = new HashMap();

    public final synchronized void a(String str, jjg jjgVar) {
        try {
            HashMap map = this.a;
            if (!map.containsKey(str)) {
                map.put(str, jjgVar);
                return;
            }
            if (((jjg) map.get(str)).equals(jjgVar)) {
                return;
            }
            String strValueOf = String.valueOf(map.get(str));
            String strValueOf2 = String.valueOf(jjgVar);
            StringBuilder sb = new StringBuilder(String.valueOf(str).length() + 45 + strValueOf.length() + 17 + strValueOf2.length());
            sb.append("Parameters object with name ");
            sb.append(str);
            sb.append(" already exists (");
            sb.append(strValueOf);
            sb.append("), cannot insert ");
            sb.append(strValueOf2);
            throw new GeneralSecurityException(sb.toString());
        } catch (Throwable th) {
            throw th;
        }
    }

    public final synchronized void b(Map map) {
        for (Map.Entry entry : map.entrySet()) {
            a((String) entry.getKey(), (jjg) entry.getValue());
        }
    }
}
