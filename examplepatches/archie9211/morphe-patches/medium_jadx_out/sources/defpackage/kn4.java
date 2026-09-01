package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class kn4 extends q0a {
    public static final kn4 c = new kn4(nn4.a);

    @Override // defpackage.u0
    public final int h(Object obj) {
        float[] fArr = (float[]) obj;
        fArr.getClass();
        return fArr.length;
    }

    @Override // defpackage.bs1, defpackage.u0
    public final void j(f22 f22Var, int i, Object obj) {
        in4 in4Var = (in4) obj;
        in4Var.getClass();
        float fH = f22Var.h(this.b, i);
        in4Var.b(in4Var.d() + 1);
        float[] fArr = in4Var.a;
        int i2 = in4Var.b;
        in4Var.b = i2 + 1;
        fArr[i2] = fH;
    }

    @Override // defpackage.u0
    public final Object k(Object obj) {
        float[] fArr = (float[]) obj;
        fArr.getClass();
        in4 in4Var = new in4();
        in4Var.a = fArr;
        in4Var.b = fArr.length;
        in4Var.b(10);
        return in4Var;
    }

    @Override // defpackage.q0a
    public final Object n() {
        return new float[0];
    }

    @Override // defpackage.q0a
    public final void o(xtc xtcVar, Object obj, int i) {
        float[] fArr = (float[]) obj;
        xtcVar.getClass();
        fArr.getClass();
        for (int i2 = 0; i2 < i; i2++) {
            float f = fArr[i2];
            xtcVar.f(this.b, i2);
            xtcVar.g(f);
        }
    }
}
