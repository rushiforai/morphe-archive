package com.bytedance.sdk.openadsdk.core.widget.ycx;

import android.util.Log;
import android.webkit.CookieManager;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.UrlConst;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public class ycx {
    public static Map<String, String> ycx(Map<String, List<String>> map, String str) {
        HashMap map2 = new HashMap();
        if (map != null && !map.isEmpty()) {
            ArrayList arrayList = new ArrayList();
            for (Map.Entry<String, List<String>> entry : map.entrySet()) {
                String key = entry.getKey();
                List<String> value = entry.getValue();
                if (key != null && value != null && !value.isEmpty()) {
                    if (key.equalsIgnoreCase("set-cookie")) {
                        arrayList.addAll(value);
                    } else {
                        map2.put(key, ycx(value));
                    }
                }
            }
            if (!arrayList.isEmpty()) {
                ycx(arrayList, str);
            }
        }
        return map2;
    }

    private static String ycx(List<String> list) {
        if (list != null && !list.isEmpty()) {
            if (list.size() == 1) {
                return list.get(0);
            }
            StringBuilder sb2 = new StringBuilder();
            for (int i5 = 0; i5 < list.size(); i5++) {
                if (i5 > 0) {
                    sb2.append(", ");
                }
                sb2.append(list.get(i5));
            }
            return sb2.toString();
        }
        return b.f42142b;
    }

    private static void ycx(List<String> list, String str) {
        CookieManager cookieManager = CookieManager.getInstance();
        Iterator<String> it = list.iterator();
        while (it.hasNext()) {
            try {
                cookieManager.setCookie(UrlConst.HTTPS.concat(String.valueOf(str)), it.next());
                cookieManager.flush();
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+SSRBLl9iZdP1UuFFLc=", "c+sskQauSsiOXNJPmBSy", "U+8jkQ+5WsKUadhShxilOw==", 83);
                Log.e("Cookie", "Failed to set cookie", e3);
            }
        }
    }
}
