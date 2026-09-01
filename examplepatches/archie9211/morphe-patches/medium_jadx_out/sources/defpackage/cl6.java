package defpackage;

import android.util.Log;
import j$.util.DesugarCollections;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cl6 {
    public final HashMap a = new HashMap();
    public final int b;

    public cl6(int i) {
        this.b = i;
    }

    public static String b(int i, String str) {
        if (str != null) {
            str = str.trim();
            if (str.length() > i) {
                return str.substring(0, i);
            }
        }
        return str;
    }

    public final synchronized Map a() {
        return DesugarCollections.unmodifiableMap(new HashMap(this.a));
    }

    public final synchronized boolean c(String str, String str2) {
        String strB = b(this.b, str);
        if (this.a.size() >= 64 && !this.a.containsKey(strB)) {
            Log.w("FirebaseCrashlytics", "Ignored entry \"" + str + "\" when adding custom keys. Maximum allowable: 64", null);
            return false;
        }
        String strB2 = b(this.b, str2);
        String str3 = (String) this.a.get(strB);
        if (str3 == null ? strB2 == null : str3.equals(strB2)) {
            return false;
        }
        HashMap map = this.a;
        if (str2 == null) {
            strB2 = "";
        }
        map.put(strB, strB2);
        return true;
    }

    public final synchronized void d(Map map) {
        try {
            int i = 0;
            for (Map.Entry entry : map.entrySet()) {
                String str = (String) entry.getKey();
                if (str == null) {
                    throw new IllegalArgumentException("Custom attribute key must not be null.");
                }
                String strB = b(this.b, str);
                if (this.a.size() < 64 || this.a.containsKey(strB)) {
                    String str2 = (String) entry.getValue();
                    this.a.put(strB, str2 == null ? "" : b(this.b, str2));
                } else {
                    i++;
                }
            }
            if (i > 0) {
                Log.w("FirebaseCrashlytics", "Ignored " + i + " entries when adding custom keys. Maximum allowable: 64", null);
            }
        } catch (Throwable th) {
            throw th;
        }
    }
}
