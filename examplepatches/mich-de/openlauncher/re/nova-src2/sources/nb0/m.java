package nb0;

/* loaded from: classes5.dex */
public final class m extends h {
    public m(ib0.h hVar) {
        super(hVar);
    }

    @Override // ib0.e
    public final void c(Object obj) {
        long j11;
        if (this.f78129a.f61509a.f85789b) {
            return;
        }
        this.f78129a.c(obj);
        do {
            j11 = get();
            if (j11 == 0) {
                return;
            }
        } while (!compareAndSet(j11, j11 - 1));
    }
}
