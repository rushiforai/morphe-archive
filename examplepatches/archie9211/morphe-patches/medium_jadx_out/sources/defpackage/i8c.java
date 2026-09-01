package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class i8c extends q0a {
    public static final i8c c = new i8c(j8c.a);

    @Override // defpackage.u0
    public final int h(Object obj) {
        short[] sArr = (short[]) obj;
        sArr.getClass();
        return sArr.length;
    }

    @Override // defpackage.bs1, defpackage.u0
    public final void j(f22 f22Var, int i, Object obj) {
        h8c h8cVar = (h8c) obj;
        h8cVar.getClass();
        short sL = f22Var.l(this.b, i);
        h8cVar.b(h8cVar.d() + 1);
        short[] sArr = h8cVar.a;
        int i2 = h8cVar.b;
        h8cVar.b = i2 + 1;
        sArr[i2] = sL;
    }

    @Override // defpackage.u0
    public final Object k(Object obj) {
        short[] sArr = (short[]) obj;
        sArr.getClass();
        h8c h8cVar = new h8c();
        h8cVar.a = sArr;
        h8cVar.b = sArr.length;
        h8cVar.b(10);
        return h8cVar;
    }

    @Override // defpackage.q0a
    public final Object n() {
        return new short[0];
    }

    @Override // defpackage.q0a
    public final void o(xtc xtcVar, Object obj, int i) {
        short[] sArr = (short[]) obj;
        xtcVar.getClass();
        sArr.getClass();
        for (int i2 = 0; i2 < i; i2++) {
            short s = sArr[i2];
            xtcVar.f(this.b, i2);
            xtcVar.q(s);
        }
    }
}
