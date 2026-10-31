package com.bytedance.adsdk.ugeno.fby;

import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public class jc implements Runnable {
    private WeakReference<Runnable> ycx;

    public jc(Runnable runnable) {
        this.ycx = new WeakReference<>(runnable);
    }

    @Override // java.lang.Runnable
    public void run() {
        Runnable runnable = this.ycx.get();
        if (runnable != null) {
            runnable.run();
        }
    }
}
