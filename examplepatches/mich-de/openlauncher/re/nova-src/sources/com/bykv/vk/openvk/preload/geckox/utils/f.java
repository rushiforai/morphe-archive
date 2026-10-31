package com.bykv.vk.openvk.preload.geckox.utils;

import java.util.concurrent.Executor;

/* loaded from: classes2.dex */
public class f implements Executor {

    /* renamed from: a, reason: collision with root package name */
    private static volatile f f22162a;

    public static f a() {
        if (f22162a == null) {
            synchronized (f.class) {
                try {
                    if (f22162a == null) {
                        f22162a = new f();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return f22162a;
    }

    @Override // java.util.concurrent.Executor
    public void execute(Runnable runnable) {
        com.bykv.vk.openvk.preload.geckox.b.t().execute(runnable);
    }
}
