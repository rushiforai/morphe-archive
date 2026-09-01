package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class nzd extends q0a {
    public static final nzd c = new nzd(ozd.a);

    @Override // defpackage.u0
    public final int h(Object obj) {
        return ((lzd) obj).a.length;
    }

    @Override // defpackage.bs1, defpackage.u0
    public final void j(f22 f22Var, int i, Object obj) {
        mzd mzdVar = (mzd) obj;
        mzdVar.getClass();
        short sY = f22Var.b(this.b, i).y();
        mzdVar.b(mzdVar.d() + 1);
        short[] sArr = mzdVar.a;
        int i2 = mzdVar.b;
        mzdVar.b = i2 + 1;
        sArr[i2] = sY;
    }

    @Override // defpackage.u0
    public final Object k(Object obj) {
        short[] sArr = ((lzd) obj).a;
        mzd mzdVar = new mzd();
        mzdVar.a = sArr;
        mzdVar.b = sArr.length;
        mzdVar.b(10);
        return mzdVar;
    }

    @Override // defpackage.q0a
    public final Object n() {
        return new lzd(new short[0]);
    }

    @Override // defpackage.q0a
    public final void o(xtc xtcVar, Object obj, int i) {
        short[] sArr = ((lzd) obj).a;
        xtcVar.getClass();
        for (int i2 = 0; i2 < i; i2++) {
            xtcVar.i(this.b, i2).q(sArr[i2]);
        }
    }
}
