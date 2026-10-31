package com.bytedance.adsdk.ycx.ycx;

/* loaded from: classes2.dex */
public class zb extends RuntimeException {
    public zb(String str, Throwable th2) {
        super("Unable to parse expression:".concat(String.valueOf(str)), th2);
    }
}
