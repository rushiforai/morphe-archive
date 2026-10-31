package io.sentry;

import java.util.Date;

/* loaded from: classes4.dex */
public final class j3 extends u2 {

    /* renamed from: a, reason: collision with root package name */
    public final Date f67350a;

    /* renamed from: b, reason: collision with root package name */
    public final long f67351b;

    public j3(Date date, long j11) {
        this.f67350a = date;
        this.f67351b = j11;
    }

    @Override // io.sentry.u2, java.lang.Comparable
    /* renamed from: a */
    public final int compareTo(u2 u2Var) {
        if (!(u2Var instanceof j3)) {
            return super.compareTo(u2Var);
        }
        j3 j3Var = (j3) u2Var;
        long time = this.f67350a.getTime();
        long time2 = j3Var.f67350a.getTime();
        return time == time2 ? Long.valueOf(this.f67351b).compareTo(Long.valueOf(j3Var.f67351b)) : Long.valueOf(time).compareTo(Long.valueOf(time2));
    }

    @Override // io.sentry.u2
    public final long b(u2 u2Var) {
        return u2Var instanceof j3 ? this.f67351b - ((j3) u2Var).f67351b : super.b(u2Var);
    }

    @Override // io.sentry.u2
    public final long c(u2 u2Var) {
        if (u2Var == null || !(u2Var instanceof j3)) {
            return super.c(u2Var);
        }
        j3 j3Var = (j3) u2Var;
        long j11 = j3Var.f67351b;
        int iCompareTo = compareTo(u2Var);
        long j12 = this.f67351b;
        if (iCompareTo < 0) {
            return d() + (j11 - j12);
        }
        return j3Var.d() + (j12 - j11);
    }

    @Override // io.sentry.u2
    public final long d() {
        return this.f67350a.getTime() * 1000000;
    }

    public j3() {
        this(android.support.v4.media.session.b.V(), System.nanoTime());
    }
}
