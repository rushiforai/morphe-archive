package com.bytedance.sdk.component.jw.ycx;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: zb, reason: collision with root package name */
    private static volatile ycx f23822zb;
    private volatile zb ycx;

    private ycx() {
    }

    public static ycx ycx() {
        if (f23822zb == null) {
            synchronized (ycx.class) {
                try {
                    if (f23822zb == null) {
                        f23822zb = new ycx();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return f23822zb;
    }

    public zb zb() {
        return this.ycx;
    }

    public void ycx(zb zbVar) {
        this.ycx = zbVar;
    }
}
