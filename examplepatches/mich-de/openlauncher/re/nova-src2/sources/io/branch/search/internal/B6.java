package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class B6 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Wc f62127a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3240l0 f62128b;

    public B6(@NotNull Wc scheduledQueryRepository, @NotNull C3240l0 analyticsSessionRepository) {
        Intrinsics.g(scheduledQueryRepository, "scheduledQueryRepository");
        Intrinsics.g(analyticsSessionRepository, "analyticsSessionRepository");
        this.f62127a = scheduledQueryRepository;
        this.f62128b = analyticsSessionRepository;
    }
}
