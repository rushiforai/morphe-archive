package com.moloco.sdk.acm.http;

import com.moloco.sdk.MetricsRequest;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes3.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final List<MetricsRequest.PostMetricsRequest.CountEvent> f36133a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final List<MetricsRequest.PostMetricsRequest.TimerEvent> f36134b;

    public d(@NotNull List<MetricsRequest.PostMetricsRequest.CountEvent> counts, @NotNull List<MetricsRequest.PostMetricsRequest.TimerEvent> timers) {
        Intrinsics.g(counts, "counts");
        Intrinsics.g(timers, "timers");
        this.f36133a = counts;
        this.f36134b = timers;
    }

    @NotNull
    public final List<MetricsRequest.PostMetricsRequest.CountEvent> a() {
        return this.f36133a;
    }

    @NotNull
    public final List<MetricsRequest.PostMetricsRequest.TimerEvent> b() {
        return this.f36134b;
    }
}
