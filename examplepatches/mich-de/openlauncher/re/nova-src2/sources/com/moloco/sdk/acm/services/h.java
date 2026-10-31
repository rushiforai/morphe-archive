package com.moloco.sdk.acm.services;

import java.util.concurrent.atomic.AtomicLong;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final i f36181a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final AtomicLong f36182b;

    public h(@NotNull i timeProviderService) {
        Intrinsics.g(timeProviderService, "timeProviderService");
        this.f36181a = timeProviderService;
        this.f36182b = new AtomicLong(0L);
    }

    public final long a() {
        return this.f36181a.invoke() - this.f36182b.get();
    }

    @NotNull
    public final AtomicLong b() {
        return this.f36182b;
    }

    public final void c() {
        this.f36182b.set(this.f36181a.invoke());
    }
}
