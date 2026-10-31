package com.bytedance.sdk.openadsdk.dy.zb;

/* loaded from: classes2.dex */
class lud implements sya {
    private static volatile lud ycx;

    private lud() {
    }

    @Override // com.bytedance.sdk.openadsdk.dy.zb.sya
    public void ycx(com.bytedance.sdk.openadsdk.dy.zb zbVar) {
    }

    @Override // com.bytedance.sdk.openadsdk.dy.zb.sya
    public void ycx(com.bytedance.sdk.openadsdk.dy.zb zbVar, boolean z11) {
    }

    public static lud ycx() {
        if (ycx == null) {
            synchronized (lud.class) {
                try {
                    if (ycx == null) {
                        ycx = new lud();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }
}
