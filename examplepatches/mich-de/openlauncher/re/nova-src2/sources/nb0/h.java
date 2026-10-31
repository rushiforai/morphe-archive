package nb0;

import b.u4;
import e10.i2;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes5.dex */
public abstract class h extends AtomicLong implements ib0.a, ib0.f, ib0.i {

    /* renamed from: a, reason: collision with root package name */
    public final ib0.h f78129a;

    /* renamed from: b, reason: collision with root package name */
    public final xb0.b f78130b = new xb0.b();

    public h(ib0.h hVar) {
        this.f78129a = hVar;
    }

    @Override // ib0.i
    public final boolean a() {
        return ((qb0.a) this.f78130b.f95755b).a();
    }

    @Override // ib0.i
    public final void b() {
        this.f78130b.b();
        e();
    }

    public void d() {
    }

    public void e() {
    }

    public final void f(i2 i2Var) {
        this.f78130b.c(new qb0.a(i2Var));
    }

    @Override // ib0.f
    public final void j(long j11) {
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "n >= 0 required but it was "));
        }
        if (j11 != 0) {
            jk.b.A(this, j11);
            d();
        }
    }

    @Override // ib0.e
    public void onCompleted() {
        if (this.f78129a.f61509a.f85789b) {
            return;
        }
        try {
            this.f78129a.onCompleted();
        } finally {
            this.f78130b.b();
        }
    }

    @Override // ib0.e
    public void onError(Throwable th2) {
        if (this.f78129a.f61509a.f85789b) {
            return;
        }
        try {
            this.f78129a.onError(th2);
        } finally {
            this.f78130b.b();
        }
    }
}
