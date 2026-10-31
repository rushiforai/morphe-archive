package com.vungle.ads.internal.executor;

import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements ThreadFactory {

    /* renamed from: a, reason: collision with root package name */
    public final String f46817a;

    /* renamed from: b, reason: collision with root package name */
    public final ThreadFactory f46818b;

    /* renamed from: c, reason: collision with root package name */
    public final AtomicInteger f46819c;

    public c(String name) {
        Intrinsics.g(name, "name");
        this.f46817a = name;
        this.f46818b = Executors.defaultThreadFactory();
        this.f46819c = new AtomicInteger(0);
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable r11) {
        Intrinsics.g(r11, "r");
        Thread threadNewThread = this.f46818b.newThread(r11);
        threadNewThread.setName(this.f46817a + "-th-" + this.f46819c.incrementAndGet());
        return threadNewThread;
    }
}
