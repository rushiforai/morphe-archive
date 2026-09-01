package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class je2 extends co6 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ l78 b;
    public final /* synthetic */ z52 c;
    public final /* synthetic */ m45 d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ je2(l78 l78Var, z52 z52Var, m45 m45Var, Object obj, Object obj2, int i) {
        super(2);
        this.a = i;
        this.b = l78Var;
        this.c = z52Var;
        this.d = m45Var;
        this.e = obj;
        this.f = obj2;
    }

    private final Object a(Object obj, Object obj2) {
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
        this.b.setValue(c1eVar);
        z52 z52Var = this.c;
        int i = z52Var.b;
        z52Var.f();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.Y(-854618952);
        z52 z52Var2 = (z52) z52Var.e().b;
        i52 i52VarD = z52Var2.d();
        i52 i52VarD2 = z52Var2.d();
        i52 i52VarD3 = z52Var2.d();
        String strR = vo7.R(p65Var2, R.string.update_catalog_private);
        sn3 sn3Var = jt7.c;
        mkd mkdVar = ((bu7) p65Var2.j(sn3Var)).n;
        boolean zF = p65Var2.f(i52VarD2) | p65Var2.f(i52VarD3);
        Object objM = p65Var2.M();
        uob uobVar = w12.a;
        if (zF || objM == uobVar) {
            objM = new it0(i52VarD2, i52VarD3, 14);
            p65Var2.j0(objM);
        }
        jjd.b(strR, new y52(i52VarD, (x45) objM), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar, p65Var2, 0, 0, 131068);
        String strR2 = vo7.R(p65Var2, R.string.update_catalog_private_description);
        mkd mkdVar2 = ((bu7) p65Var2.j(sn3Var)).n;
        boolean zF2 = p65Var2.f(i52VarD) | p65Var2.f(i52VarD3);
        Object objM2 = p65Var2.M();
        if (zF2 || objM2 == uobVar) {
            objM2 = new it0(i52VarD, i52VarD3, 15);
            p65Var2.j0(objM2);
        }
        jjd.b(strR2, new y52(i52VarD2, (x45) objM2), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar2, p65Var2, 0, 0, 131068);
        k40.c(g56.c.a(new vj3(Float.NaN)), pxf.E(1385824862, new ie2((a5e) this.e, (g4e) this.f, z52Var, i52VarD3, 1), p65Var2), p65Var2, 56);
        p65Var2.p(false);
        if (z52Var.b != i) {
            kyd.v(this.d, p65Var2);
        }
        return c1eVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x003e  */
    /* JADX WARN: Removed duplicated region for block: B:262:0x0d18  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x023b  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x04e4  */
    @Override // defpackage.b55
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invoke(java.lang.Object r66, java.lang.Object r67) throws androidx.constraintlayout.core.parser.CLParsingException {
        /*
            Method dump skipped, instruction units count: 3642
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.je2.invoke(java.lang.Object, java.lang.Object):java.lang.Object");
    }
}
