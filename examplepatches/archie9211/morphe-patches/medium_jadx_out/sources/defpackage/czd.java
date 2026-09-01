package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class czd extends q0a {
    public static final czd c = new czd(dzd.a);

    @Override // defpackage.u0
    public final int h(Object obj) {
        return ((azd) obj).a.length;
    }

    @Override // defpackage.bs1, defpackage.u0
    public final void j(f22 f22Var, int i, Object obj) {
        bzd bzdVar = (bzd) obj;
        bzdVar.getClass();
        int iK = f22Var.b(this.b, i).k();
        bzdVar.b(bzdVar.d() + 1);
        int[] iArr = bzdVar.a;
        int i2 = bzdVar.b;
        bzdVar.b = i2 + 1;
        iArr[i2] = iK;
    }

    @Override // defpackage.u0
    public final Object k(Object obj) {
        int[] iArr = ((azd) obj).a;
        bzd bzdVar = new bzd();
        bzdVar.a = iArr;
        bzdVar.b = iArr.length;
        bzdVar.b(10);
        return bzdVar;
    }

    @Override // defpackage.q0a
    public final Object n() {
        return new azd(new int[0]);
    }

    @Override // defpackage.q0a
    public final void o(xtc xtcVar, Object obj, int i) {
        int[] iArr = ((azd) obj).a;
        xtcVar.getClass();
        for (int i2 = 0; i2 < i; i2++) {
            xtcVar.i(this.b, i2).j(iArr[i2]);
        }
    }
}
