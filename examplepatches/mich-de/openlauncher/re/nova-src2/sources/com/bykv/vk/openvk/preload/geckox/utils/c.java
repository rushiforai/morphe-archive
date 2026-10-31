package com.bykv.vk.openvk.preload.geckox.utils;

import java.util.concurrent.Executor;

/* loaded from: classes2.dex */
public class c implements Executor {

    /* renamed from: a, reason: collision with root package name */
    private static volatile c f22160a;

    public static c a() {
        if (f22160a == null) {
            synchronized (c.class) {
                try {
                    if (f22160a == null) {
                        f22160a = new c();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return f22160a;
    }

    @Override // java.util.concurrent.Executor
    public void execute(Runnable runnable) {
        com.bykv.vk.openvk.preload.geckox.b.t().execute(runnable);
    }
}
