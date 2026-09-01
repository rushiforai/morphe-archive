package defpackage;

import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.util.Log;
import android.util.Patterns;
import j$.util.concurrent.ConcurrentHashMap;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iae {
    public static SharedPreferences b;
    public static final iae a = new iae();
    public static final AtomicBoolean c = new AtomicBoolean(false);
    public static final ConcurrentHashMap d = new ConcurrentHashMap();
    public static final ConcurrentHashMap e = new ConcurrentHashMap();

    public final HashMap a() {
        ConcurrentHashMap concurrentHashMap = e;
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            HashMap map = new HashMap();
            CopyOnWriteArraySet copyOnWriteArraySet = yz7.d;
            HashSet hashSet = new HashSet();
            Iterator it2 = yz7.a().iterator();
            while (it2.hasNext()) {
                hashSet.add(((yz7) it2.next()).b());
            }
            for (String str : concurrentHashMap.keySet()) {
                if (hashSet.contains(str)) {
                    map.put(str, concurrentHashMap.get(str));
                }
            }
            return map;
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }

    public final synchronized void b() {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            AtomicBoolean atomicBoolean = c;
            if (atomicBoolean.get()) {
                return;
            }
            SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(f94.a());
            defaultSharedPreferences.getClass();
            b = defaultSharedPreferences;
            String string = defaultSharedPreferences.getString("com.facebook.appevents.UserDataStore.userData", "");
            if (string == null) {
                string = "";
            }
            SharedPreferences sharedPreferences = b;
            if (sharedPreferences == null) {
                g76.g0("sharedPreferences");
                throw null;
            }
            String string2 = sharedPreferences.getString("com.facebook.appevents.UserDataStore.internalUserData", "");
            if (string2 == null) {
                string2 = "";
            }
            d.putAll(epe.M(string));
            e.putAll(epe.M(string2));
            atomicBoolean.set(true);
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final String c(String str, String str2) {
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            int length = str2.length() - 1;
            int i = 0;
            boolean z = false;
            while (i <= length) {
                boolean z2 = g76.Q(str2.charAt(!z ? i : length), 32) <= 0;
                if (z) {
                    if (!z2) {
                        break;
                    }
                    length--;
                } else if (z2) {
                    i++;
                } else {
                    z = true;
                }
            }
            String lowerCase = str2.subSequence(i, length + 1).toString().toLowerCase();
            lowerCase.getClass();
            if ("em".equals(str)) {
                if (!Patterns.EMAIL_ADDRESS.matcher(lowerCase).matches()) {
                    Log.e("iae", "Setting email failure: this is not a valid email address");
                    return "";
                }
            } else {
                if ("ph".equals(str)) {
                    Pattern patternCompile = Pattern.compile("[^0-9]");
                    patternCompile.getClass();
                    String strReplaceAll = patternCompile.matcher(lowerCase).replaceAll("");
                    strReplaceAll.getClass();
                    return strReplaceAll;
                }
                if ("ge".equals(str)) {
                    String strSubstring = lowerCase.length() > 0 ? lowerCase.substring(0, 1) : "";
                    if (!"f".equals(strSubstring) && !"m".equals(strSubstring)) {
                        Log.e("iae", "Setting gender failure: the supported value for gender is f or m");
                        return "";
                    }
                    return strSubstring;
                }
            }
            return lowerCase;
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }
}
