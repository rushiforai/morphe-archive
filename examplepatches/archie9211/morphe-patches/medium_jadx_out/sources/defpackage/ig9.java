package defpackage;

import com.medium.android.donkey.post.PostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ig9 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ PostFragment b;

    public /* synthetic */ ig9(PostFragment postFragment, int i) {
        this.a = i;
        this.b = postFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        PostFragment postFragment;
        r28 r28Var;
        int i = this.a;
        PostFragment postFragment2 = this.b;
        uob uobVar = w12.a;
        c1e c1eVar = c1e.a;
        int i2 = 2;
        boolean z = false;
        boolean z2 = false;
        boolean z3 = false;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    jt7.a(false, pxf.E(-830473684, new ig9(postFragment2, i2), p65Var), p65Var, 48, 1);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    boolean zH = p65Var2.h(postFragment2);
                    Object objM = p65Var2.M();
                    if (zH || objM == uobVar) {
                        objM = new rg9(postFragment2, i2);
                        p65Var2.j0(objM);
                    }
                    f76.w((m45) objM, null, false, null, null, null, pwd.e, p65Var2, 805306368, 510);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            default:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    nhc nhcVarF = mk7.F(p65Var3);
                    PostFragment postFragment3 = this.b;
                    br7.k(nhcVarF, null, 0.0f, pxf.E(-319910166, new qg9(nhcVarF, z3 ? 1 : 0, postFragment3), p65Var3), p65Var3, 3072, 6);
                    Object objM2 = p65Var3.M();
                    Object obj3 = objM2;
                    if (objM2 == uobVar) {
                        sb2 sb2VarM = kyd.M(p65Var3);
                        p65Var3.j0(sb2VarM);
                        obj3 = sb2VarM;
                    }
                    sb2 sb2Var = (sb2) obj3;
                    boolean zH2 = p65Var3.h(postFragment3) | p65Var3.f(nhcVarF) | p65Var3.h(sb2Var);
                    Object objM3 = p65Var3.M();
                    n92 n92Var = null;
                    if (zH2 || objM3 == uobVar) {
                        postFragment = postFragment3;
                        mo5 mo5Var = new mo5(postFragment, nhcVarF, sb2Var, n92Var, 20);
                        r28Var = null;
                        p65Var3.j0(mo5Var);
                        objM3 = mo5Var;
                    } else {
                        postFragment = postFragment3;
                        r28Var = null;
                    }
                    kyd.k(p65Var3, (b55) objM3, c1eVar);
                    rr9 rr9Var = (rr9) guc.z(postFragment.k1().A0, p65Var3, 0).getValue();
                    if (rr9Var instanceof qr9) {
                        p65Var3.Y(-1627940687);
                        mk7.i(((qr9) rr9Var).a, new fh9(postFragment), r28Var, p65Var3, 0);
                        p65Var3.p(false);
                    } else if (rr9Var instanceof pr9) {
                        p65Var3.Y(-1624753422);
                        vp7.g(((pr9) rr9Var).a, new gh9(z2 ? 1 : 0, postFragment), r28Var, p65Var3, 0);
                        p65Var3.p(false);
                    } else if (rr9Var instanceof or9) {
                        p65Var3.Y(-1623957001);
                        or9 or9Var = (or9) rr9Var;
                        wgf.c(or9Var.a, new hh9(postFragment, or9Var, z ? 1 : 0), r28Var, p65Var3, 0);
                        p65Var3.p(false);
                    } else {
                        if (rr9Var != null) {
                            throw ho2.L(p65Var3, 778768081, false);
                        }
                        p65Var3.Y(778928112);
                        p65Var3.p(false);
                    }
                } else {
                    p65Var3.S();
                }
                return c1eVar;
        }
    }
}
