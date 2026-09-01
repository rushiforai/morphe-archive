package defpackage;

import java.io.EOFException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class y38 implements y92 {
    public static final fn7 b;
    public final jb6 a;

    static {
        x2b x2bVar = fn7.d;
        b = en7.x("application/json; charset=UTF-8");
    }

    public y38(jb6 jb6Var) {
        this.a = jb6Var;
    }

    @Override // defpackage.y92
    public final Object v(Object obj) throws EOFException {
        kz0 kz0Var = new kz0();
        this.a.e(new ud6(kz0Var), obj);
        h21 h21VarR = kz0Var.r(kz0Var.b);
        qbb qbbVar = sbb.a;
        h21VarR.getClass();
        return new qbb(b, h21VarR);
    }
}
