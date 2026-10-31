package io.branch.search.internal;

import android.content.Context;
import io.branch.search.internal.Y2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Rd implements W5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f63290a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final H f63291b;

    public Rd(@NotNull F4 contextDelegate, @NotNull I analyticalBufferRepository) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        this.f63290a = contextDelegate;
        this.f63291b = analyticalBufferRepository;
    }

    @Override // io.branch.search.internal.W5
    public final void a(@NotNull String sessionId, @NotNull U5 collector) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(collector, "collector");
        Y2.a aVar = Y2.Companion;
        Context context = this.f63290a.f62438a;
        H h5 = this.f63291b;
        aVar.getClass();
        collector.f63429f = Y2.a.a(context, h5);
    }

    @Override // io.branch.search.internal.W5
    @NotNull
    public final String a() {
        return "shared_prefs_diagnostic";
    }
}
