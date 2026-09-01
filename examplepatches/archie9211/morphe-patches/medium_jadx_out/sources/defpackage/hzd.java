package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hzd extends q0a {
    public static final hzd c = new hzd(izd.a);

    @Override // defpackage.u0
    public final int h(Object obj) {
        return ((fzd) obj).a.length;
    }

    @Override // defpackage.bs1, defpackage.u0
    public final void j(f22 f22Var, int i, Object obj) {
        gzd gzdVar = (gzd) obj;
        gzdVar.getClass();
        long jT = f22Var.b(this.b, i).t();
        gzdVar.b(gzdVar.d() + 1);
        long[] jArr = gzdVar.a;
        int i2 = gzdVar.b;
        gzdVar.b = i2 + 1;
        jArr[i2] = jT;
    }

    @Override // defpackage.u0
    public final Object k(Object obj) {
        long[] jArr = ((fzd) obj).a;
        gzd gzdVar = new gzd();
        gzdVar.a = jArr;
        gzdVar.b = jArr.length;
        gzdVar.b(10);
        return gzdVar;
    }

    @Override // defpackage.q0a
    public final Object n() {
        return new fzd(new long[0]);
    }

    @Override // defpackage.q0a
    public final void o(xtc xtcVar, Object obj, int i) {
        long[] jArr = ((fzd) obj).a;
        xtcVar.getClass();
        for (int i2 = 0; i2 < i; i2++) {
            xtcVar.i(this.b, i2).k(jArr[i2]);
        }
    }
}
