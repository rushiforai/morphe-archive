package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ue1 extends co6 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ l78 b;
    public final /* synthetic */ z52 c;
    public final /* synthetic */ m45 d;
    public final /* synthetic */ long e;
    public final /* synthetic */ Enum f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ue1(l78 l78Var, z52 z52Var, m45 m45Var, long j, oe1 oe1Var) {
        super(2);
        this.b = l78Var;
        this.c = z52Var;
        this.d = m45Var;
        this.e = j;
        this.f = oe1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        mkd mkdVar;
        m45 m45Var;
        int i;
        oe1 oe1Var;
        boolean z;
        mkd mkdVar2;
        int i2 = this.a;
        m45 m45Var2 = this.d;
        l78 l78Var = this.b;
        Enum r5 = this.f;
        uob uobVar = w12.a;
        z52 z52Var = this.c;
        c1e c1eVar = c1e.a;
        long j = this.e;
        switch (i2) {
            case 0:
                x12 x12Var = (x12) obj;
                oe1 oe1Var2 = (oe1) r5;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p65 p65Var = (p65) x12Var;
                    if (p65Var.B()) {
                        p65Var.S();
                        return c1eVar;
                    }
                }
                l78Var.setValue(c1eVar);
                int i3 = z52Var.b;
                z52Var.f();
                p65 p65Var2 = (p65) x12Var;
                p65Var2.Y(1142646119);
                z52 z52Var2 = (z52) z52Var.e().b;
                i52 i52VarD = z52Var2.d();
                i52 i52VarD2 = z52Var2.d();
                i52 i52VarD3 = z52Var2.d();
                i52 i52VarD4 = z52Var2.d();
                boolean zD = p65Var2.d(oe1Var2.ordinal()) | p65Var2.f(i52VarD4);
                Object objM = p65Var2.M();
                if (zD || objM == uobVar) {
                    objM = new ge1(oe1Var2, i52VarD4, 1);
                    p65Var2.j0(objM);
                }
                o28 o28Var = o28.b;
                s42.d(0, j, p65Var2, z52.b(o28Var, i52VarD, (x45) objM));
                int i4 = ve1.a[oe1Var2.ordinal()];
                if (i4 == 1) {
                    p65Var2.Y(-101662377);
                    mkdVar = ((bu7) p65Var2.j(jt7.c)).e;
                    p65Var2.p(false);
                } else {
                    if (i4 != 2) {
                        throw ho2.L(p65Var2, -101665077, false);
                    }
                    p65Var2.Y(-101660042);
                    mkdVar = ((bu7) p65Var2.j(jt7.c)).c;
                    p65Var2.p(false);
                }
                mkd mkdVar3 = mkdVar;
                r28 r28VarN = bgf.N(o28Var, "catalog_name");
                boolean zF = p65Var2.f(i52VarD);
                Object objM2 = p65Var2.M();
                if (zF || objM2 == uobVar) {
                    m45Var = m45Var2;
                    objM2 = new et0(i52VarD, 6);
                    p65Var2.j0(objM2);
                } else {
                    m45Var = m45Var2;
                }
                ok7.r(200.0f, 48, 0, this.e, p65Var2, z52.b(r28VarN, i52VarD2, (x45) objM2), mkdVar3);
                boolean zF2 = p65Var2.f(i52VarD2) | p65Var2.d(oe1Var2.ordinal()) | p65Var2.f(i52VarD4);
                Object objM3 = p65Var2.M();
                if (zF2 || objM3 == uobVar) {
                    i = 2;
                    objM3 = new ie1(i52VarD2, oe1Var2, i52VarD4, 2);
                    p65Var2.j0(objM3);
                } else {
                    i = 2;
                }
                s42.y(0, j, p65Var2, jfc.f(z52.b(o28Var, i52VarD3, (x45) objM3), 48.0f, 0.0f, i));
                float fP = br7.p(p65Var2, R.dimen.list_catalog_preview_s_height);
                float fP2 = br7.p(p65Var2, R.dimen.list_catalog_preview_m_width);
                boolean zD2 = p65Var2.d(oe1Var2.ordinal()) | p65Var2.c(fP) | p65Var2.f(i52VarD3) | p65Var2.c(fP2);
                Object objM4 = p65Var2.M();
                if (zD2 || objM4 == uobVar) {
                    objM4 = new le1(oe1Var2, fP, i52VarD3, fP2, 1);
                    oe1Var = oe1Var2;
                    p65Var2.j0(objM4);
                } else {
                    oe1Var = oe1Var2;
                }
                s42.w(oe1Var, this.e, z52.b(o28Var, i52VarD4, (x45) objM4), p65Var2, 0);
                p65Var2.p(false);
                if (z52Var.b == i3) {
                    return c1eVar;
                }
                kyd.v(m45Var, p65Var2);
                return c1eVar;
            default:
                x12 x12Var2 = (x12) obj;
                stc stcVar = (stc) r5;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p65 p65Var3 = (p65) x12Var2;
                    if (p65Var3.B()) {
                        p65Var3.S();
                        return c1eVar;
                    }
                }
                l78Var.setValue(c1eVar);
                int i5 = z52Var.b;
                z52Var.f();
                p65 p65Var4 = (p65) x12Var2;
                p65Var4.Y(-206268441);
                z52 z52Var3 = (z52) z52Var.e().b;
                i52 i52VarD5 = z52Var3.d();
                i52 i52VarD6 = z52Var3.d();
                i52 i52VarD7 = z52Var3.d();
                i52 i52VarD8 = z52Var3.d();
                i52 i52VarD9 = z52Var3.d();
                boolean zF3 = p65Var4.f(i52VarD5) | p65Var4.d(stcVar.ordinal());
                Object objM5 = p65Var4.M();
                if (zF3 || objM5 == uobVar) {
                    objM5 = new vja(i52VarD5, 12, stcVar);
                    p65Var4.j0(objM5);
                }
                dy0.a(flb.a0(new y52(i52VarD9, (x45) objM5), j, bmb.a(2.0f)), p65Var4, 0);
                p65Var4.Y(824658620);
                sn3 sn3Var = z22.h;
                m73 m73Var = (m73) p65Var4.j(sn3Var);
                sn3 sn3Var2 = jt7.c;
                float fZ = m73Var.z(((bu7) p65Var4.j(sn3Var2)).n.b.c);
                p65Var4.p(false);
                boolean zF4 = p65Var4.f(i52VarD9);
                Object objM6 = p65Var4.M();
                if (zF4 || objM6 == uobVar) {
                    objM6 = new et0(i52VarD9, 25);
                    p65Var4.j0(objM6);
                }
                r28 r28VarE = jfc.e(new y52(i52VarD5, (x45) objM6), fZ);
                nr5 nr5Var = rv8.r;
                dy0.a(flb.a0(r28VarE, j, nr5Var), p65Var4, 0);
                p65Var4.Y(824682291);
                m73 m73Var2 = (m73) p65Var4.j(sn3Var);
                int i6 = rtc.b[stcVar.ordinal()];
                if (i6 == 1) {
                    z = false;
                    p65Var4.Y(1301171236);
                    mkdVar2 = ((bu7) p65Var4.j(sn3Var2)).e;
                    p65Var4.p(false);
                } else if (i6 == 2) {
                    z = false;
                    p65Var4.Y(1301173411);
                    mkdVar2 = ((bu7) p65Var4.j(sn3Var2)).d;
                    p65Var4.p(false);
                } else {
                    if (i6 != 3) {
                        throw ho2.L(p65Var4, 1301169090, false);
                    }
                    p65Var4.Y(1301175555);
                    mkdVar2 = ((bu7) p65Var4.j(sn3Var2)).c;
                    z = false;
                    p65Var4.p(false);
                }
                float fZ2 = m73Var2.z(mkdVar2.b.c);
                p65Var4.p(z);
                boolean zF5 = p65Var4.f(i52VarD5) | p65Var4.d(stcVar.ordinal()) | p65Var4.f(i52VarD9);
                Object objM7 = p65Var4.M();
                if (zF5 || objM7 == uobVar) {
                    objM7 = new ltc(i52VarD5, stcVar, i52VarD9, 2);
                    p65Var4.j0(objM7);
                }
                dy0.a(flb.a0(jfc.e(new y52(i52VarD6, (x45) objM7), fZ2), j, nr5Var), p65Var4, 0);
                boolean zF6 = p65Var4.f(i52VarD6) | p65Var4.f(i52VarD9) | p65Var4.d(stcVar.ordinal());
                Object objM8 = p65Var4.M();
                if (zF6 || objM8 == uobVar) {
                    objM8 = new ltc(i52VarD6, i52VarD9, stcVar, 3);
                    p65Var4.j0(objM8);
                }
                dy0.a(flb.a0(jfc.e(new y52(i52VarD7, (x45) objM8), fZ2), j, nr5Var), p65Var4, 0);
                boolean zF7 = p65Var4.f(i52VarD7) | p65Var4.f(i52VarD9) | p65Var4.d(stcVar.ordinal());
                Object objM9 = p65Var4.M();
                if (zF7 || objM9 == uobVar) {
                    objM9 = new ltc(i52VarD7, i52VarD9, stcVar, 4);
                    p65Var4.j0(objM9);
                }
                dy0.a(flb.a0(jfc.e(new y52(i52VarD8, (x45) objM9), fZ2), j, nr5Var), p65Var4, 0);
                p65Var4.p(false);
                if (z52Var.b == i5) {
                    return c1eVar;
                }
                kyd.v(m45Var2, p65Var4);
                return c1eVar;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ue1(l78 l78Var, z52 z52Var, m45 m45Var, stc stcVar, long j) {
        super(2);
        this.b = l78Var;
        this.c = z52Var;
        this.d = m45Var;
        this.f = stcVar;
        this.e = j;
    }
}
