package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class s6c extends n2 {
    public long a;
    public x51 b;

    @Override // defpackage.n2
    public final boolean a(m2 m2Var) {
        r6c r6cVar = (r6c) m2Var;
        if (this.a >= 0) {
            return false;
        }
        long j = r6cVar.i;
        if (j < r6cVar.j) {
            r6cVar.j = j;
        }
        this.a = j;
        return true;
    }

    @Override // defpackage.n2
    public final n92[] b(m2 m2Var) {
        long j = this.a;
        this.a = -1L;
        this.b = null;
        return ((r6c) m2Var).w(j);
    }
}
