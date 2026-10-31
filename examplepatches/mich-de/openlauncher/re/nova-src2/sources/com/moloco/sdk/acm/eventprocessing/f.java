package com.moloco.sdk.acm.eventprocessing;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes3.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.acm.services.i f36073a;

    /* renamed from: b, reason: collision with root package name */
    public final long f36074b;

    public f(@NotNull com.moloco.sdk.acm.services.i timeProviderService, long j11) {
        Intrinsics.g(timeProviderService, "timeProviderService");
        this.f36073a = timeProviderService;
        this.f36074b = j11;
    }

    public final boolean a(@NotNull com.moloco.sdk.acm.db.b eventEntity) {
        Intrinsics.g(eventEntity, "eventEntity");
        return this.f36073a.invoke() - eventEntity.l() >= this.f36074b * ((long) 1000);
    }
}
