package defpackage;

import android.util.Log;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.logging.Level;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class eq {
    public static final CopyOnWriteArraySet a = new CopyOnWriteArraySet();
    public static final Map b;

    static {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Package r2 = up8.class.getPackage();
        String name = r2 != null ? r2.getName() : null;
        if (name != null) {
            linkedHashMap.put(name, "OkHttp");
        }
        linkedHashMap.put(up8.class.getName(), "okhttp.OkHttpClient");
        linkedHashMap.put(is5.class.getName(), "okhttp.Http2");
        linkedHashMap.put(cgd.class.getName(), "okhttp.TaskRunner");
        linkedHashMap.put("okhttp3.mockwebserver.MockWebServer", "okhttp.MockWebServer");
        b = ei7.W(linkedHashMap);
    }

    public static void a(String str, int i, String str2, Throwable th) {
        int iMin;
        String strX0 = (String) b.get(str);
        if (strX0 == null) {
            strX0 = muc.x0(23, str);
        }
        if (Log.isLoggable(strX0, i)) {
            if (th != null) {
                str2 = str2 + '\n' + Log.getStackTraceString(th);
            }
            int length = str2.length();
            int i2 = 0;
            while (i2 < length) {
                int iY = muc.Y(str2, '\n', i2, 4);
                if (iY == -1) {
                    iY = length;
                }
                while (true) {
                    iMin = Math.min(iY, i2 + 4000);
                    Log.println(i, strX0, str2.substring(i2, iMin));
                    if (iMin >= iY) {
                        break;
                    } else {
                        i2 = iMin;
                    }
                }
                i2 = iMin + 1;
            }
        }
    }

    public static void b(String str, String str2) {
        Logger logger = Logger.getLogger(str);
        if (a.add(logger)) {
            logger.setUseParentHandlers(false);
            logger.setLevel(Log.isLoggable(str2, 3) ? Level.FINE : Log.isLoggable(str2, 4) ? Level.INFO : Level.WARNING);
            logger.addHandler(fq.a);
        }
    }
}
