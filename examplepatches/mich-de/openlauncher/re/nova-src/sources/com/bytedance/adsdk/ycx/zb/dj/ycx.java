package com.bytedance.adsdk.ycx.zb.dj;

import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public enum ycx implements lud {
    TRUE,
    FALSE,
    NULL;


    /* renamed from: dj, reason: collision with root package name */
    private static final Map<String, ycx> f22819dj = new HashMap(128);

    static {
        for (ycx ycxVar : values()) {
            f22819dj.put(ycxVar.name().toLowerCase(), ycxVar);
        }
    }

    public static ycx ycx(String str) {
        return f22819dj.get(str.toLowerCase());
    }
}
