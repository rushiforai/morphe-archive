package io.branch.search.internal;

import io.branch.search.internal.services.model.BranchJob;
import io.branch.search.internal.util.CorosKt;
import java.util.Objects;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Lc implements InterfaceC3490zd<C3465y5> {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final P1 f62847a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3240l0 f62848b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final I0 f62849c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final B6 f62850d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final InterfaceC3164g8 f62851e;

    public Lc(@NotNull P1 branchConfiguration, @NotNull C3240l0 analyticsSessionRepository, @NotNull I analyticalBufferRepository, @NotNull I0 appUsageMonitor, @NotNull B6 executeScheduledQueriesUseCase, @NotNull InterfaceC3164g8 jobManager) {
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(analyticsSessionRepository, "analyticsSessionRepository");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        Intrinsics.g(appUsageMonitor, "appUsageMonitor");
        Intrinsics.g(executeScheduledQueriesUseCase, "executeScheduledQueriesUseCase");
        Intrinsics.g(jobManager, "jobManager");
        this.f62847a = branchConfiguration;
        this.f62848b = analyticsSessionRepository;
        this.f62849c = appUsageMonitor;
        this.f62850d = executeScheduledQueriesUseCase;
        this.f62851e = jobManager;
    }

    @Override // io.branch.search.internal.InterfaceC3490zd
    public final Boolean a(F4 f42, Cd cd2, Exception exc) {
        C3240l0 c3240l0 = this.f62848b;
        c3240l0.getClass();
        C3296o5.a(c3240l0.f64939d.b("io.branch.search"), exc, "ScheduledQueryService.onStartJob");
        return Boolean.FALSE;
    }

    @Override // io.branch.search.internal.InterfaceC3490zd
    public final Object a(F4 f42, Cd cd2, Continuation continuation) {
        C3465y5 c3465y5 = (C3465y5) cd2;
        C3240l0 c3240l0 = this.f62848b;
        c3240l0.getClass();
        c3240l0.f64939d.b("io.branch.search");
        this.f62847a.getClass();
        this.f62849c.a();
        B6 b62 = this.f62850d;
        b62.getClass();
        Wc wc = b62.f62127a;
        C3240l0 c3240l02 = b62.f62128b;
        c3240l02.getClass();
        String sessionId = c3240l02.f64939d.b("io.branch.search");
        wc.getClass();
        Intrinsics.g(sessionId, "sessionId");
        Pc pc2 = wc.f63602a;
        pc2.getClass();
        long j11 = pc2.f63090c.a().Q;
        Uc uc2 = new Uc(pc2, sessionId);
        w4.d dVar = new w4.d();
        t70.g2 g2VarT = t70.m0.t(CorosKt.getBNCScope(), a80.d.f488c, null, new V3(j11, dVar, null), 2);
        try {
            uc2.invoke(dVar);
            g2VarT.c(null);
            if (c3465y5.f66308b) {
                this.f62851e.a(new BranchJob.ScheduledQueries(3600000L, this.f62847a.f63057z != y40.m.f96676b), C3147f8.f64479a);
            }
            return Boolean.FALSE;
        } catch (Throwable th2) {
            g2VarT.c(null);
            throw th2;
        }
    }

    @Override // io.branch.search.internal.InterfaceC3490zd
    public final void a(F4 contextDelegate, Cd cd2) {
        C3465y5 request = (C3465y5) cd2;
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(request, "request");
        Objects.toString(request);
    }
}
