package k0;

/* loaded from: classes2.dex */
public final class c0 extends d {

    /* renamed from: i, reason: collision with root package name */
    public final a f70576i;

    public c0(a aVar) {
        this.f70576i = aVar;
    }

    @Override // k0.d
    public final int i(int i5, y3.n nVar, z2.i1 i1Var, int i11) {
        int iO = i1Var.O(this.f70576i.f70555a);
        if (iO == Integer.MIN_VALUE) {
            return 0;
        }
        int i12 = i11 - iO;
        return nVar == y3.n.f96613b ? i5 - i12 : i12;
    }

    @Override // k0.d
    public final Integer j(z2.i1 i1Var) {
        return Integer.valueOf(i1Var.O(this.f70576i.f70555a));
    }
}
