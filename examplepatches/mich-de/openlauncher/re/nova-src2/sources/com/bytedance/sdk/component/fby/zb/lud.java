package com.bytedance.sdk.component.fby.zb;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes2.dex */
public class lud implements ThreadFactory {
    public static volatile boolean sya;

    /* renamed from: dj, reason: collision with root package name */
    private final AtomicInteger f23751dj = new AtomicInteger(1);
    protected final ThreadGroup ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected final String f23752zb;

    public lud(String str) {
        this.ycx = new ThreadGroup("pag_g_".concat(String.valueOf(str)));
        this.f23752zb = ycx(str);
    }

    @Override // java.util.concurrent.ThreadFactory
    public Thread newThread(Runnable runnable) {
        if (sya) {
            return null;
        }
        Thread threadYcx = ycx(this.ycx, runnable, this.f23752zb + "_" + this.f23751dj.getAndIncrement());
        if (threadYcx.isDaemon()) {
            threadYcx.setDaemon(false);
        }
        return threadYcx;
    }

    public Thread ycx(ThreadGroup threadGroup, Runnable runnable, String str) {
        return new Thread(threadGroup, runnable, str);
    }

    public static String ycx(String str) {
        return "pag_".concat(String.valueOf(str));
    }
}
