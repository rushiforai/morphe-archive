package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class dbd implements c55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ ycd b;
    public final /* synthetic */ kv6 c;
    public final /* synthetic */ d9d d;
    public final /* synthetic */ lbd e;
    public final /* synthetic */ cs1 f;
    public final /* synthetic */ sh9 g;
    public final /* synthetic */ obe h;
    public final /* synthetic */ l78 i;

    public /* synthetic */ dbd(ycd ycdVar, kv6 kv6Var, d9d d9dVar, lbd lbdVar, cs1 cs1Var, sh9 sh9Var, obe obeVar, l78 l78Var) {
        this.b = ycdVar;
        this.c = kv6Var;
        this.d = d9dVar;
        this.e = lbdVar;
        this.f = cs1Var;
        this.g = sh9Var;
        this.h = obeVar;
        this.i = l78Var;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        uob uobVar = w12.a;
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
                if (!p65Var.P(1 & iIntValue, (iIntValue & 19) != 18)) {
                    p65Var.S();
                } else {
                    npa npaVarJ = vo7.J(p65Var);
                    ycd ycdVar = this.b;
                    boolean z = ycdVar.d;
                    lbd lbdVar = this.e;
                    boolean zF = p65Var.f(lbdVar);
                    Object objM = p65Var.M();
                    if (zF || objM == uobVar) {
                        ibd ibdVar = new ibd(0, lbdVar, lbd.class, "refresh", "refresh()V", 0, 0);
                        p65Var.j0(ibdVar);
                        objM = ibdVar;
                    }
                    er7.d(z, (m45) ((qh6) objM), w2g.B(o28.b, hy8Var).b(jfc.c), npaVarJ, 0L, 0L, false, 0.0f, null, null, pxf.E(2055977285, new dbd(ycdVar, this.c, this.d, lbdVar, this.f, this.g, this.h, this.i), p65Var), p65Var, 0, PhotoshopDirectory.TAG_CAPTION);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    p65Var2.S();
                } else {
                    Object objM2 = p65Var2.M();
                    if (objM2 == uobVar) {
                        objM2 = new ws(this.i, 26);
                        p65Var2.j0(objM2);
                    }
                    guc.g(this.b, this.c, this.d, this.e, this.f, this.g, this.h, (x45) objM2, jfc.c, p65Var2, 113246208);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ dbd(ycd ycdVar, lbd lbdVar, kv6 kv6Var, d9d d9dVar, cs1 cs1Var, sh9 sh9Var, obe obeVar, l78 l78Var) {
        this.b = ycdVar;
        this.e = lbdVar;
        this.c = kv6Var;
        this.d = d9dVar;
        this.f = cs1Var;
        this.g = sh9Var;
        this.h = obeVar;
        this.i = l78Var;
    }
}
