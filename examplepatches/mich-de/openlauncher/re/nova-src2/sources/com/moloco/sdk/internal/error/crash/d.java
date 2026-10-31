package com.moloco.sdk.internal.error.crash;

import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.internal.MolocoLogger;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class d implements c {

    /* renamed from: e, reason: collision with root package name */
    public static final int f36390e = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final List<com.moloco.sdk.internal.error.crash.filters.a> f36391a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.internal.error.api.a f36392b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final MetricsRecorder f36393c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f36394d;

    /* JADX WARN: Multi-variable type inference failed */
    public d(@NotNull List<? extends com.moloco.sdk.internal.error.crash.filters.a> exceptionFilters, @NotNull com.moloco.sdk.internal.error.api.a errorReporter, @NotNull MetricsRecorder metricsRecorder) {
        Intrinsics.g(exceptionFilters, "exceptionFilters");
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(metricsRecorder, "metricsRecorder");
        this.f36391a = exceptionFilters;
        this.f36392b = errorReporter;
        this.f36393c = metricsRecorder;
        this.f36394d = "CrashHandlerService";
    }

    @Override // com.moloco.sdk.internal.error.crash.c
    public void a(@NotNull Throwable crash) {
        Intrinsics.g(crash, "crash");
        if (!b(crash)) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, this.f36394d, "App Crashed", null, false, 12, null);
        } else {
            this.f36393c.recordCountEvent(new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.F.c()));
            this.f36392b.a(crash);
        }
    }

    public final boolean b(Throwable th2) {
        Iterator<com.moloco.sdk.internal.error.crash.filters.a> it = this.f36391a.iterator();
        while (it.hasNext()) {
            if (it.next().a(th2)) {
                return true;
            }
        }
        return false;
    }
}
