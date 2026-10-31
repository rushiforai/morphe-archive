package io.sentry.config;

import com.amplitude.core.events.Identify;
import io.sentry.util.h;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class c implements d {
    public static String e(String str) {
        return "SENTRY_" + str.replace(".", "_").replace(Identify.UNSET_VALUE, "_").toUpperCase(Locale.ROOT);
    }

    @Override // io.sentry.config.d
    public final Map b() {
        String strB;
        String str = e("tags") + "_";
        ConcurrentHashMap concurrentHashMap = new ConcurrentHashMap();
        for (Map.Entry<String, String> entry : System.getenv().entrySet()) {
            String key = entry.getKey();
            if (key.startsWith(str) && (strB = h.b(entry.getValue())) != null) {
                concurrentHashMap.put(key.substring(str.length()).toLowerCase(Locale.ROOT), strB);
            }
        }
        return concurrentHashMap;
    }

    @Override // io.sentry.config.d
    public final String getProperty(String str) {
        return h.b(System.getenv(e(str)));
    }
}
