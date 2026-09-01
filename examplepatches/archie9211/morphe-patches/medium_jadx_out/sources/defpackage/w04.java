package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w04 extends fn1 {
    /* JADX WARN: Illegal instructions before constructor call */
    public w04(n98 n98Var) {
        l24 l24Var = l24.a;
        n14 n14Var = l24.b;
        c28 c28Var = c28.OPEN;
        qn1 qn1Var = qn1.CLASS;
        o67 o67Var = x67.e;
        List list = ey3.a;
        super(n14Var, n98Var, c28Var, qn1Var, list, o67Var);
        zm1 zm1Var = new zm1(this, null, cd7.e, true, e41.DECLARATION, jkc.g0);
        zm1Var.L0(list, h93.e);
        t14 t14Var = t14.SCOPE_FOR_ERROR_CLASS;
        String str = zm1Var.getName().a;
        str.getClass();
        s14 s14VarB = l24.b(t14Var, str, "");
        k24 k24Var = k24.ERROR_CLASS;
        zm1Var.h = new i24(l24.d(k24Var, new String[0]), s14VarB, k24Var, list, false, new String[0]);
        w0(s14VarB, qo7.B(zm1Var), zm1Var);
    }

    @Override // defpackage.f0, defpackage.s0d
    public final aw2 f(ixd ixdVar) {
        ixdVar.getClass();
        return this;
    }

    @Override // defpackage.f0, defpackage.y28
    public final ev7 h0(exd exdVar, sn6 sn6Var) {
        t14 t14Var = t14.SCOPE_FOR_ERROR_CLASS;
        String str = getName().a;
        str.getClass();
        return l24.b(t14Var, str, exdVar.toString());
    }

    @Override // defpackage.fn1
    public final String toString() {
        String strB = getName().b();
        strB.getClass();
        return strB;
    }

    @Override // defpackage.f0
    /* JADX INFO: renamed from: v0 */
    public final y28 f(ixd ixdVar) {
        ixdVar.getClass();
        return this;
    }
}
