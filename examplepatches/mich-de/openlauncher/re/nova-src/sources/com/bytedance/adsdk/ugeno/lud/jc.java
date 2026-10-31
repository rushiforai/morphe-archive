package com.bytedance.adsdk.ugeno.lud;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public class jc {
    private static Map<String, ul> ycx = new HashMap();

    public static void ycx(List<ul> list) {
        if (list == null || list.size() <= 0) {
            return;
        }
        for (ul ulVar : list) {
            if (ulVar != null) {
                ycx.put(ulVar.ycx(), ulVar);
            }
        }
    }

    public static ul ycx(String str) {
        return ycx.get(str);
    }
}
