package io.sentry.protocol;

import com.amplitude.core.events.Plan;
import io.branch.search.internal.C3125e3;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class c0 implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f67480a;

    /* renamed from: b, reason: collision with root package name */
    public ConcurrentHashMap f67481b;

    public c0(String str) {
        this.f67480a = str;
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        String str = this.f67480a;
        if (str != null) {
            e3Var.o(Plan.AMP_PLAN_SOURCE);
            e3Var.x(iLogger, str);
        }
        ConcurrentHashMap concurrentHashMap = this.f67481b;
        if (concurrentHashMap != null) {
            for (String str2 : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67481b, str2, e3Var, str2, iLogger);
            }
        }
        e3Var.i();
    }
}
