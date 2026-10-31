package com.bytedance.adsdk.zb;

import java.util.Map;

/* loaded from: classes2.dex */
public class htf {
    private final Map<String, String> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private boolean f22843zb;

    public String ycx(String str) {
        return str;
    }

    public final String zb(String str, String str2) {
        if (this.f22843zb && this.ycx.containsKey(str2)) {
            return this.ycx.get(str2);
        }
        String strYcx = ycx(str, str2);
        if (this.f22843zb) {
            this.ycx.put(str2, strYcx);
        }
        return strYcx;
    }

    public String ycx(String str, String str2) {
        return ycx(str2);
    }
}
