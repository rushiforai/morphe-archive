package defpackage;

import com.medium.reader.R;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class m implements c55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ p b;
    public final /* synthetic */ iaa c;

    public /* synthetic */ m(p pVar, iaa iaaVar) {
        this.b = pVar;
        this.c = iaaVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i;
        int i2 = this.a;
        c1e c1eVar = c1e.a;
        iaa iaaVar = this.c;
        p pVar = this.b;
        switch (i2) {
            case 0:
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((gq4) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    p65Var.S();
                } else {
                    String strR = vo7.R(p65Var, R.string.publication_about_all);
                    boolean zF = p65Var.f(iaaVar) | p65Var.f(pVar);
                    Object objM = p65Var.M();
                    uob uobVar = w12.a;
                    if (zF || objM == uobVar) {
                        objM = new n(iaaVar, 0, pVar);
                        p65Var.j0(objM);
                    }
                    o28 o28Var = o28.b;
                    r28 r28VarR = hlg.r(o28Var, false, null, null, (m45) objM, 15);
                    o28 o28Var2 = o28Var;
                    float f = 6.0f;
                    jjd.b(strR, w2g.F(r28VarR, 12.0f, 6.0f, 12.0f, 6.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).i, p65Var, 0, 0, 131068);
                    p65 p65Var2 = p65Var;
                    Iterator<E> it2 = pVar.b.iterator();
                    while (it2.hasNext()) {
                        int iIntValue2 = ((Number) it2.next()).intValue();
                        o28 o28Var3 = o28Var2;
                        float f2 = f;
                        r28 r28VarG = w2g.G(o28Var3, 0.0f, f2, 0.0f, f, 5);
                        sn3 sn3Var = jt7.c;
                        p65 p65Var3 = p65Var2;
                        c1e c1eVar2 = c1eVar;
                        jjd.b("·", r28VarG, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var)).i, p65Var3, 54, 0, 131068);
                        String strValueOf = String.valueOf(iIntValue2);
                        boolean zF2 = p65Var3.f(iaaVar) | p65Var3.f(pVar) | p65Var3.d(iIntValue2);
                        Object objM2 = p65Var3.M();
                        if (zF2 || objM2 == uobVar) {
                            i = 0;
                            objM2 = new o(iaaVar, pVar, iIntValue2, i);
                            p65Var3.j0(objM2);
                        } else {
                            i = 0;
                        }
                        jjd.b(strValueOf, w2g.F(hlg.r(o28Var3, false, null, null, (m45) objM2, 15), 12.0f, f2, 12.0f, f2), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var3.j(sn3Var)).i, p65Var3, 0, 0, 131068);
                        p65Var2 = p65Var3;
                        o28Var2 = o28Var3;
                        f = f2;
                        c1eVar = c1eVar2;
                    }
                }
                break;
            default:
                x12 x12Var2 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var4 = (p65) x12Var2;
                if (!p65Var4.P(iIntValue3 & 1, (iIntValue3 & 17) != 16)) {
                    p65Var4.S();
                } else {
                    o28 o28Var4 = o28.b;
                    r28 r28VarD = jfc.d(jfc.r(o28Var4, 3), 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var4.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var4.l();
                    r28 r28VarR2 = gx1.R(p65Var4, r28VarD);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var);
                    } else {
                        p65Var4.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var4, cuVar, zk7VarC);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var4, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i3);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var4, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var4, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var4, cuVar4, r28VarR2);
                    r28 r28VarD2 = jfc.d(jfc.o(o28Var4, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var4.T;
                    int i4 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var4.l();
                    r28 r28VarR3 = gx1.R(p65Var4, r28VarD2);
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(p65Var4, cuVar, zk7VarC2);
                    tp7.B(p65Var4, cuVar2, i89VarL2);
                    ka1.z(i4, p65Var4, cuVar3, p65Var4, fnVar);
                    tp7.B(p65Var4, cuVar4, r28VarR3);
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var4, 0);
                    long j3 = p65Var4.T;
                    int i5 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var4.l();
                    r28 r28VarR4 = gx1.R(p65Var4, o28Var4);
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(p65Var4, cuVar, wv1VarA);
                    tp7.B(p65Var4, cuVar2, i89VarL3);
                    ka1.z(i5, p65Var4, cuVar3, p65Var4, fnVar);
                    tp7.B(p65Var4, cuVar4, r28VarR4);
                    tp7.c(0.0f, 6, 6, 0L, p65Var4, w2g.G(o28Var4, 0.0f, 24.0f, 0.0f, 0.0f, 13));
                    jjd.b(vo7.R(p65Var4, R.string.publication_about_archives), w2g.G(o28Var4, 24.0f, 32.0f, 24.0f, 0.0f, 8), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var4.j(jt7.c)).j, p65Var4, 48, 0, 131068);
                    qb8.a(pVar, iaaVar, null, p65Var4, 0);
                    b09.H(p65Var4, true, true, true);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ m(iaa iaaVar, p pVar) {
        this.c = iaaVar;
        this.b = pVar;
    }
}
