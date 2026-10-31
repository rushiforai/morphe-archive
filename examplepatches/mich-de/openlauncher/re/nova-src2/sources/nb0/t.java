package nb0;

import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.ReentrantLock;

/* loaded from: classes.dex */
public final class t implements ib0.b {

    /* renamed from: a, reason: collision with root package name */
    public final a0 f78155a;

    /* renamed from: b, reason: collision with root package name */
    public volatile xb0.c f78156b = new xb0.c();

    /* renamed from: c, reason: collision with root package name */
    public final AtomicInteger f78157c = new AtomicInteger(0);

    /* renamed from: d, reason: collision with root package name */
    public final ReentrantLock f78158d = new ReentrantLock();

    public t(a0 a0Var) {
        this.f78155a = a0Var;
    }

    @Override // mb0.b
    /* renamed from: b */
    public final void mo5b(Object obj) {
        z zVar;
        ib0.h hVar = (ib0.h) obj;
        this.f78158d.lock();
        boolean z11 = true;
        if (this.f78157c.incrementAndGet() != 1) {
            try {
                xb0.c cVar = this.f78156b;
                hVar.d(xb0.e.a(new s(0, this, cVar)));
                this.f78155a.d(new r(this, hVar, hVar, cVar));
                return;
            } finally {
                this.f78158d.unlock();
            }
        }
        AtomicBoolean atomicBoolean = new AtomicBoolean(true);
        try {
            a0 a0Var = this.f78155a;
            mh.c cVar2 = new mh.c(this, hVar, atomicBoolean);
            AtomicReference atomicReference = a0Var.f78099c;
            while (true) {
                zVar = (z) atomicReference.get();
                if (zVar != null && !zVar.a()) {
                    break;
                }
                z zVar2 = new z(atomicReference);
                zVar2.k();
                if (fq.c.u(atomicReference, zVar, zVar2)) {
                    zVar = zVar2;
                    break;
                }
            }
            AtomicBoolean atomicBoolean2 = zVar.f78180i;
            if (atomicBoolean2.get() || !atomicBoolean2.compareAndSet(false, true)) {
                z11 = false;
            }
            cVar2.mo5b(zVar);
            if (z11) {
                a0Var.f78098b.d(zVar);
            }
        } finally {
            if (atomicBoolean.get()) {
            }
        }
    }
}
