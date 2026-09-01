package defpackage;

import android.text.TextUtils;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class jag {
    public static String a(int i, Object obj) {
        if (i > 10) {
            return "ERROR: Recursive toString calls";
        }
        if (obj == null) {
            return "";
        }
        if (obj instanceof String) {
            return !TextUtils.isEmpty((String) obj) ? obj.toString() : "";
        }
        if (obj instanceof Integer) {
            return ((Integer) obj).intValue() != 0 ? obj.toString() : "";
        }
        if (obj instanceof Long) {
            return ((Long) obj).longValue() != 0 ? obj.toString() : "";
        }
        if (obj instanceof Double) {
            return ((Double) obj).doubleValue() != 0.0d ? obj.toString() : "";
        }
        if (obj instanceof Boolean) {
            return ((Boolean) obj).booleanValue() ? obj.toString() : "";
        }
        if (obj instanceof List) {
            StringBuilder sb = new StringBuilder();
            if (i > 0) {
                sb.append("[");
            }
            int length = sb.length();
            for (Object obj2 : (List) obj) {
                if (sb.length() > length) {
                    sb.append(", ");
                }
                sb.append(a(i + 1, obj2));
            }
            if (i > 0) {
                sb.append("]");
            }
            return sb.toString();
        }
        if (!(obj instanceof Map)) {
            return obj.toString();
        }
        StringBuilder sb2 = new StringBuilder();
        boolean z = false;
        int length2 = 0;
        for (Map.Entry entry : new TreeMap((Map) obj).entrySet()) {
            String strA = a(i + 1, entry.getValue());
            if (!TextUtils.isEmpty(strA)) {
                if (i > 0 && !z) {
                    sb2.append("{");
                    length2 = sb2.length();
                    z = true;
                }
                if (sb2.length() > length2) {
                    sb2.append(", ");
                }
                sb2.append((String) entry.getKey());
                sb2.append('=');
                sb2.append(strA);
            }
        }
        if (z) {
            sb2.append("}");
        }
        return sb2.toString();
    }

    public static String zza(Object obj) {
        return a(0, obj);
    }
}
