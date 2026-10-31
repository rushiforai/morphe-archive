package com.android.billingclient.api;

import java.util.Objects;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes2.dex */
final class zzbl implements ThreadFactory {
    private final ThreadFactory zza;
    private final AtomicInteger zzb;

    public zzbl(BillingClientImpl billingClientImpl) {
        Objects.requireNonNull(billingClientImpl);
        this.zza = Executors.defaultThreadFactory();
        this.zzb = new AtomicInteger(1);
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        AtomicInteger atomicInteger = this.zzb;
        Thread threadNewThread = this.zza.newThread(runnable);
        threadNewThread.setName("PlayBillingLibrary-" + atomicInteger.getAndIncrement());
        return threadNewThread;
    }
}
