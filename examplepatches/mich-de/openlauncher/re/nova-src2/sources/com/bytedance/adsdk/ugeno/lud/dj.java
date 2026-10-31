package com.bytedance.adsdk.ugeno.lud;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public class dj {
    private static Map<String, zb> ycx = new HashMap();

    public static void ycx(List<zb> list) {
        if (list == null || list.size() <= 0) {
            return;
        }
        for (zb zbVar : list) {
            if (zbVar != null) {
                ycx.put(zbVar.ycx(), zbVar);
            }
        }
    }

    public static zb ycx(String str) {
        return ycx.get(str);
    }
}
