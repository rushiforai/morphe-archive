package io.branch.search.internal;

import io.branch.search.internal.C4;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.l0, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3240l0 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f64936a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final P1 f64937b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final C3223k0 f64938c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final C3190i0 f64939d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final H f64940e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final InterfaceC3475yf f64941f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final K5 f64942g;

    public C3240l0(@NotNull F4 contextDelegate, @NotNull P1 branchConfiguration, @NotNull C3223k0 analyticsSessionHistoryDataSource, @NotNull C3190i0 analyticsSessionDataSource, @NotNull I analyticalBufferRepository, @NotNull C3492zf versionAnalyticsManager, @NotNull K5 decider) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(analyticsSessionHistoryDataSource, "analyticsSessionHistoryDataSource");
        Intrinsics.g(analyticsSessionDataSource, "analyticsSessionDataSource");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        Intrinsics.g(versionAnalyticsManager, "versionAnalyticsManager");
        Intrinsics.g(decider, "decider");
        this.f64936a = contextDelegate;
        this.f64937b = branchConfiguration;
        this.f64938c = analyticsSessionHistoryDataSource;
        this.f64939d = analyticsSessionDataSource;
        this.f64940e = analyticalBufferRepository;
        this.f64941f = versionAnalyticsManager;
        this.f64942g = decider;
    }

    @NotNull
    public final String[] a() {
        C3190i0 c3190i0 = this.f64939d;
        ReentrantLock reentrantLock = c3190i0.f64695b;
        reentrantLock.lock();
        try {
            Object[] array = c3190i0.f64696c.keySet().toArray(new String[0]);
            Intrinsics.e(array, "null cannot be cast to non-null type kotlin.Array<T of kotlin.collections.ArraysKt__ArraysJVMKt.toTypedArray>");
            return (String[]) array;
        } finally {
            reentrantLock.unlock();
        }
    }

    @NotNull
    public final String b() {
        return this.f64939d.b("io.branch.search");
    }

    @NotNull
    public final Gd a(@NotNull String sessionId, @NotNull C4.i.d impressions) {
        String str;
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(impressions, "impressions");
        long jCurrentTimeMillis = System.currentTimeMillis();
        Fd fdC = this.f64939d.c(sessionId);
        String callerId = fdC.f62473a;
        int i5 = fdC.f62475c;
        long jCurrentTimeMillis2 = System.currentTimeMillis();
        String str2 = this.f64937b.f63037d;
        boolean zA = this.f64942g.a();
        if (Intrinsics.b(callerId, "io.branch.search")) {
            str = "Internal";
        } else {
            String packageName = this.f64936a.f62438a.getPackageName();
            Intrinsics.f(packageName, "context.packageName");
            str = Intrinsics.b(callerId, packageName) ? "BaseClient" : "AdClient";
        }
        C3223k0 c3223k0 = this.f64938c;
        c3223k0.getClass();
        Intrinsics.g(callerId, "callerId");
        return new Gd(jCurrentTimeMillis2, str2, zA, str, callerId, sessionId, i5, c3223k0.f64906a.getString("prev_analytics_window_id_".concat(callerId), null), this.f64941f.a(jCurrentTimeMillis), this.f64941f.a(sessionId, jCurrentTimeMillis), this.f64940e.d(sessionId), this.f64940e.c(sessionId), impressions);
    }

    public final void a(@NotNull String sessionId) {
        Intrinsics.g(sessionId, "sessionId");
        C3190i0 c3190i0 = this.f64939d;
        c3190i0.getClass();
        ReentrantLock reentrantLock = c3190i0.f64695b;
        reentrantLock.lock();
        try {
        } finally {
            reentrantLock.unlock();
        }
    }
}
