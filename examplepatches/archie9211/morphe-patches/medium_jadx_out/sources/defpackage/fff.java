package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class fff implements c55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ off b;
    public final /* synthetic */ iff c;
    public final /* synthetic */ kv6 d;
    public final /* synthetic */ sh9 e;
    public final /* synthetic */ gff f;

    public /* synthetic */ fff(off offVar, gff gffVar, iff iffVar, kv6 kv6Var, sh9 sh9Var) {
        this.b = offVar;
        this.f = gffVar;
        this.c = iffVar;
        this.d = kv6Var;
        this.e = sh9Var;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                hy8 hy8Var = (hy8) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(1 & iIntValue, (iIntValue & 19) != 18)) {
                    off offVar = this.b;
                    kff kffVar = offVar instanceof kff ? (kff) offVar : null;
                    boolean z = kffVar != null ? kffVar.b : false;
                    npa npaVarJ = vo7.J(p65Var);
                    gff gffVar = this.f;
                    boolean zF = p65Var.f(gffVar);
                    Object objM = p65Var.M();
                    if (zF || objM == w12.a) {
                        objM = new iaf(0, gffVar, gff.class, "refresh", "refresh()V", 0, 18);
                        p65Var.j0(objM);
                    }
                    er7.d(z, (m45) ((qh6) objM), w2g.B(o28.b, hy8Var).b(jfc.c), npaVarJ, 0L, 0L, false, 0.0f, null, null, pxf.E(1750950022, new fff(offVar, this.c, this.d, this.e, gffVar), p65Var), p65Var, 0, PhotoshopDirectory.TAG_CAPTION);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            default:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(1 & iIntValue2, (iIntValue2 & 17) != 16)) {
                    rh4 rh4Var = jfc.c;
                    nff nffVar = nff.a;
                    off offVar2 = this.b;
                    if (g76.L(offVar2, nffVar)) {
                        p65Var2.Y(-964204029);
                        pwd.l(rh4Var, p65Var2, 6);
                        p65Var2.p(false);
                    } else {
                        boolean z2 = offVar2 instanceof kff;
                        gff gffVar2 = this.f;
                        if (z2) {
                            p65Var2.Y(-964200740);
                            pwd.g((kff) offVar2, this.c, this.d, this.e, gffVar2, rh4Var, p65Var2, 196608);
                            p65Var2.p(false);
                        } else if (offVar2 instanceof mff) {
                            p65Var2.Y(-964188953);
                            pwd.k((mff) offVar2, gffVar2, rh4Var, p65Var2, 384);
                            p65Var2.p(false);
                        } else {
                            if (!(offVar2 instanceof lff)) {
                                throw ho2.L(p65Var2, -964205725, false);
                            }
                            p65Var2.Y(-964181869);
                            pwd.j(rh4Var, p65Var2, 6);
                            p65Var2.p(false);
                        }
                    }
                } else {
                    p65Var2.S();
                }
                return c1eVar;
        }
    }

    public /* synthetic */ fff(off offVar, iff iffVar, kv6 kv6Var, sh9 sh9Var, gff gffVar) {
        this.b = offVar;
        this.c = iffVar;
        this.d = kv6Var;
        this.e = sh9Var;
        this.f = gffVar;
    }
}
