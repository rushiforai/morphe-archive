package com.bytedance.adsdk.zb.sya;

import com.bytedance.adsdk.zb.xkz;

/* loaded from: classes2.dex */
public class lud {
    private static final lud ycx = new lud();

    /* renamed from: zb, reason: collision with root package name */
    private final xkz<String, com.bytedance.adsdk.zb.ul> f22946zb = new xkz<>(20);

    public static lud ycx() {
        return ycx;
    }

    public com.bytedance.adsdk.zb.ul ycx(String str) {
        if (str == null) {
            return null;
        }
        return this.f22946zb.ycx((xkz<String, com.bytedance.adsdk.zb.ul>) str);
    }

    public void ycx(String str, com.bytedance.adsdk.zb.ul ulVar) {
        if (str == null) {
            return;
        }
        this.f22946zb.ycx(str, ulVar);
    }
}
