package nb0;

import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes.dex */
public final class w implements ib0.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AtomicReference f78170a;

    public w(AtomicReference atomicReference) {
        this.f78170a = atomicReference;
    }

    @Override // mb0.b
    /* renamed from: b */
    public final void mo5b(Object obj) {
        ib0.h hVar = (ib0.h) obj;
        while (true) {
            AtomicReference atomicReference = this.f78170a;
            z zVar = (z) atomicReference.get();
            if (zVar == null || zVar.a()) {
                z zVar2 = new z(atomicReference);
                zVar2.k();
                if (fq.c.u(atomicReference, zVar, zVar2)) {
                    zVar = zVar2;
                } else {
                    continue;
                }
            }
            x xVar = new x(zVar, hVar);
            if (zVar.h(xVar)) {
                hVar.d(xVar);
                hVar.g(xVar);
                return;
            }
        }
    }
}
