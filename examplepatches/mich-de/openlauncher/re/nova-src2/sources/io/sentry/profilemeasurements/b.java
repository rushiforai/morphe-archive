package io.sentry.profilemeasurements;

import i30.j;
import io.branch.search.internal.C3125e3;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.Arrays;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class b implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public ConcurrentHashMap f67442a;

    /* renamed from: b, reason: collision with root package name */
    public String f67443b;

    /* renamed from: c, reason: collision with root package name */
    public double f67444c;

    public b(Long l9, Number number) {
        this.f67443b = l9.toString();
        this.f67444c = number.doubleValue();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || b.class != obj.getClass()) {
            return false;
        }
        b bVar = (b) obj;
        return j.z(this.f67442a, bVar.f67442a) && this.f67443b.equals(bVar.f67443b) && this.f67444c == bVar.f67444c;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f67442a, this.f67443b, Double.valueOf(this.f67444c)});
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        e3Var.o("value");
        e3Var.x(iLogger, Double.valueOf(this.f67444c));
        e3Var.o("elapsed_since_start_ns");
        e3Var.x(iLogger, this.f67443b);
        ConcurrentHashMap concurrentHashMap = this.f67442a;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67442a, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
    }
}
