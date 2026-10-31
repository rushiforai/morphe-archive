package k0;

/* loaded from: classes.dex */
public final class g implements h {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70606a;

    @Override // k0.h
    public final void k(y3.c cVar, int i5, int[] iArr, y3.n nVar, int[] iArr2) {
        switch (this.f70606a) {
            case 0:
                if (nVar != y3.n.f96612a) {
                    k.b(iArr, iArr2, true);
                    break;
                } else {
                    k.c(i5, iArr, iArr2, false);
                    break;
                }
            default:
                if (nVar != y3.n.f96612a) {
                    k.c(i5, iArr, iArr2, true);
                    break;
                } else {
                    k.b(iArr, iArr2, false);
                    break;
                }
        }
    }

    public final String toString() {
        switch (this.f70606a) {
            case 0:
                return "Arrangement#End";
            default:
                return "Arrangement#Start";
        }
    }
}
