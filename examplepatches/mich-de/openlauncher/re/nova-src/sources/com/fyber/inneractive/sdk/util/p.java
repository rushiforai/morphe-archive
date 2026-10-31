package com.fyber.inneractive.sdk.util;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes.dex */
public final class p implements ThreadFactory {

    /* renamed from: a, reason: collision with root package name */
    public final AtomicInteger f31212a = new AtomicInteger(1);

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        return new Thread(runnable, "IAConcurrencyUtil#" + this.f31212a.getAndIncrement());
    }
}
