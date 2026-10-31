package com.bytedance.sdk.component.lud.zb.ycx;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes2.dex */
public class ycx implements ThreadFactory {
    private final ThreadGroup ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final AtomicInteger f24048zb = new AtomicInteger(1);

    public ycx(String str) {
        this.ycx = new ThreadGroup("tt_img_".concat(String.valueOf(str)));
    }

    @Override // java.util.concurrent.ThreadFactory
    public Thread newThread(Runnable runnable) {
        Thread thread = new Thread(this.ycx, runnable, "tt_img_" + this.f24048zb.getAndIncrement());
        if (thread.isDaemon()) {
            thread.setDaemon(false);
        }
        return thread;
    }
}
