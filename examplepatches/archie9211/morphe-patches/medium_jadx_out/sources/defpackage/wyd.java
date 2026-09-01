package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wyd extends q0a {
    public static final wyd c = new wyd(xyd.a);

    @Override // defpackage.u0
    public final int h(Object obj) {
        return ((uyd) obj).a.length;
    }

    @Override // defpackage.bs1, defpackage.u0
    public final void j(f22 f22Var, int i, Object obj) {
        vyd vydVar = (vyd) obj;
        vydVar.getClass();
        byte bX = f22Var.b(this.b, i).x();
        vydVar.b(vydVar.d() + 1);
        byte[] bArr = vydVar.a;
        int i2 = vydVar.b;
        vydVar.b = i2 + 1;
        bArr[i2] = bX;
    }

    @Override // defpackage.u0
    public final Object k(Object obj) {
        byte[] bArr = ((uyd) obj).a;
        vyd vydVar = new vyd();
        vydVar.a = bArr;
        vydVar.b = bArr.length;
        vydVar.b(10);
        return vydVar;
    }

    @Override // defpackage.q0a
    public final Object n() {
        return new uyd(new byte[0]);
    }

    @Override // defpackage.q0a
    public final void o(xtc xtcVar, Object obj, int i) {
        byte[] bArr = ((uyd) obj).a;
        xtcVar.getClass();
        for (int i2 = 0; i2 < i; i2++) {
            xtcVar.i(this.b, i2).c(bArr[i2]);
        }
    }
}
