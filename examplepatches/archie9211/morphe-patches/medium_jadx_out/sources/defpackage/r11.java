package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class r11 extends q0a {
    public static final r11 c = new r11(v11.a);

    @Override // defpackage.u0
    public final int h(Object obj) {
        byte[] bArr = (byte[]) obj;
        bArr.getClass();
        return bArr.length;
    }

    @Override // defpackage.bs1, defpackage.u0
    public final void j(f22 f22Var, int i, Object obj) {
        q11 q11Var = (q11) obj;
        q11Var.getClass();
        byte bI = f22Var.i(this.b, i);
        q11Var.b(q11Var.d() + 1);
        byte[] bArr = q11Var.a;
        int i2 = q11Var.b;
        q11Var.b = i2 + 1;
        bArr[i2] = bI;
    }

    @Override // defpackage.u0
    public final Object k(Object obj) {
        byte[] bArr = (byte[]) obj;
        bArr.getClass();
        q11 q11Var = new q11();
        q11Var.a = bArr;
        q11Var.b = bArr.length;
        q11Var.b(10);
        return q11Var;
    }

    @Override // defpackage.q0a
    public final Object n() {
        return new byte[0];
    }

    @Override // defpackage.q0a
    public final void o(xtc xtcVar, Object obj, int i) {
        byte[] bArr = (byte[]) obj;
        xtcVar.getClass();
        bArr.getClass();
        for (int i2 = 0; i2 < i; i2++) {
            byte b = bArr[i2];
            xtcVar.f(this.b, i2);
            xtcVar.c(b);
        }
    }
}
