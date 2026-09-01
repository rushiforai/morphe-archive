package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x37 extends co6 implements b55 {
    public final /* synthetic */ l78 a;
    public final /* synthetic */ z52 b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ boolean d;
    public final /* synthetic */ String e;
    public final /* synthetic */ boolean f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x37(l78 l78Var, z52 z52Var, m45 m45Var, boolean z, String str, boolean z2) {
        super(2);
        this.a = l78Var;
        this.b = z52Var;
        this.c = m45Var;
        this.d = z;
        this.e = str;
        this.f = z2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue() & 3;
        c1e c1eVar = c1e.a;
        if (iIntValue == 2) {
            p65 p65Var = (p65) x12Var;
            if (p65Var.B()) {
                p65Var.S();
                return c1eVar;
            }
        }
        this.a.setValue(c1eVar);
        z52 z52Var = this.b;
        int i = z52Var.b;
        z52Var.f();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.Y(1917723685);
        z52 z52Var2 = (z52) z52Var.e().b;
        i52 i52VarD = z52Var2.d();
        i52 i52VarD2 = z52Var2.d();
        i52 i52VarD3 = z52Var2.d();
        Object objM = p65Var2.M();
        uob uobVar = w12.a;
        if (objM == uobVar) {
            objM = h06.t;
            p65Var2.j0(objM);
        }
        vo7.b(this.d, null, new y52(i52VarD, (x45) objM), false, null, p65Var2, 48, 24);
        mkd mkdVar = ((bu7) p65Var2.j(jt7.c)).l;
        boolean zF = p65Var2.f(i52VarD) | p65Var2.f(i52VarD3);
        Object objM2 = p65Var2.M();
        if (zF || objM2 == uobVar) {
            objM2 = new it0(i52VarD, i52VarD3, 7);
            p65Var2.j0(objM2);
        }
        jjd.b(this.e, new y52(i52VarD2, (x45) objM2), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkdVar, p65Var2, 0, 24960, 110588);
        c09 c09VarJ = vn7.J(R.drawable.ic_lock_filled, 0, p65Var2);
        String strR = vo7.R(p65Var2, R.string.cd_private);
        boolean z = this.f;
        boolean zG = p65Var2.g(z);
        Object objM3 = p65Var2.M();
        if (zG || objM3 == uobVar) {
            objM3 = new y37(z);
            p65Var2.j0(objM3);
        }
        qv5.b(c09VarJ, strR, new y52(i52VarD3, (x45) objM3), ((zo7) p65Var2.j(kt7.b)).n, p65Var2, 8, 0);
        p65Var2.p(false);
        if (z52Var.b != i) {
            kyd.v(this.c, p65Var2);
        }
        return c1eVar;
    }
}
