package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.y9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3469y9 implements W5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final A9 f66322a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3262m5 f66323b;

    public C3469y9(@NotNull B9 networkRepository, @NotNull C3262m5 dateProvider) {
        Intrinsics.g(networkRepository, "networkRepository");
        Intrinsics.g(dateProvider, "dateProvider");
        this.f66322a = networkRepository;
        this.f66323b = dateProvider;
    }

    @Override // io.branch.search.internal.W5
    public final void a(@NotNull String sessionId, @NotNull U5 collector) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(collector, "collector");
        collector.f63431h = this.f66322a.a(this.f66323b);
    }

    @Override // io.branch.search.internal.W5
    @NotNull
    public final String a() {
        return "network_diagnostic";
    }
}
