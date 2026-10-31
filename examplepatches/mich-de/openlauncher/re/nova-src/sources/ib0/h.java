package ib0;

import b.u4;

/* loaded from: classes5.dex */
public abstract class h implements e, i {

    /* renamed from: a, reason: collision with root package name */
    public final rb0.h f61509a;

    /* renamed from: b, reason: collision with root package name */
    public final h f61510b;

    /* renamed from: c, reason: collision with root package name */
    public f f61511c;

    /* renamed from: d, reason: collision with root package name */
    public long f61512d;

    public h() {
        this(null, false);
    }

    @Override // ib0.i
    public final boolean a() {
        return this.f61509a.f85789b;
    }

    @Override // ib0.i
    public final void b() {
        this.f61509a.b();
    }

    public final void d(i iVar) {
        this.f61509a.c(iVar);
    }

    public void e() {
    }

    public final void f(long j11) {
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "number requested cannot be negative: "));
        }
        synchronized (this) {
            f fVar = this.f61511c;
            if (fVar != null) {
                fVar.j(j11);
                return;
            }
            long j12 = this.f61512d;
            if (j12 == Long.MIN_VALUE) {
                this.f61512d = j11;
            } else {
                long j13 = j12 + j11;
                if (j13 < 0) {
                    this.f61512d = Long.MAX_VALUE;
                } else {
                    this.f61512d = j13;
                }
            }
        }
    }

    public void g(f fVar) {
        long j11;
        h hVar;
        boolean z11;
        synchronized (this) {
            j11 = this.f61512d;
            this.f61511c = fVar;
            hVar = this.f61510b;
            z11 = hVar != null && j11 == Long.MIN_VALUE;
        }
        if (z11) {
            hVar.g(fVar);
        } else if (j11 == Long.MIN_VALUE) {
            fVar.j(Long.MAX_VALUE);
        } else {
            fVar.j(j11);
        }
    }

    public h(h hVar, boolean z11) {
        this.f61512d = Long.MIN_VALUE;
        this.f61510b = hVar;
        this.f61509a = (!z11 || hVar == null) ? new rb0.h() : hVar.f61509a;
    }
}
