package ve;

import ke.r;
import ke.s;
import ke.t;
import wf.v;

/* loaded from: classes3.dex */
public final class f implements s {

    /* renamed from: a, reason: collision with root package name */
    public final ma0.c f92621a;

    /* renamed from: b, reason: collision with root package name */
    public final int f92622b;

    /* renamed from: c, reason: collision with root package name */
    public final long f92623c;

    /* renamed from: d, reason: collision with root package name */
    public final long f92624d;

    /* renamed from: e, reason: collision with root package name */
    public final long f92625e;

    public f(ma0.c cVar, int i5, long j11, long j12) {
        this.f92621a = cVar;
        this.f92622b = i5;
        this.f92623c = j11;
        long j13 = (j12 - j11) / cVar.f76183c;
        this.f92624d = j13;
        this.f92625e = v.D(j13 * i5, 1000000L, cVar.f76182b);
    }

    @Override // ke.s
    public final r d(long j11) {
        ma0.c cVar = this.f92621a;
        int i5 = this.f92622b;
        long j12 = this.f92624d - 1;
        long jI = v.i((cVar.f76182b * j11) / (i5 * 1000000), 0L, j12);
        int i11 = cVar.f76183c;
        long j13 = this.f92623c;
        long jD = v.D(jI * i5, 1000000L, cVar.f76182b);
        t tVar = new t(jD, (i11 * jI) + j13);
        if (jD >= j11 || jI == j12) {
            return new r(tVar, tVar);
        }
        long j14 = jI + 1;
        return new r(tVar, new t(v.D(j14 * i5, 1000000L, cVar.f76182b), (i11 * j14) + j13));
    }

    @Override // ke.s
    public final boolean f() {
        return true;
    }

    @Override // ke.s
    public final long i() {
        return this.f92625e;
    }
}
