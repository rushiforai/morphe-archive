package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n16 {
    public final o78 a = new o78(new l16[16]);
    public final k49 b = qo7.u(Boolean.FALSE);
    public long c = Long.MIN_VALUE;
    public final k49 d = qo7.u(Boolean.TRUE);

    public final void a(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-318043801);
        int i2 = (p65Var.h(this) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            Object objM = p65Var.M();
            n92 n92Var = null;
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(null);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            if (((Boolean) this.d.getValue()).booleanValue() || ((Boolean) this.b.getValue()).booleanValue()) {
                p65Var.Y(-144841960);
                boolean zH = p65Var.h(this);
                Object objM2 = p65Var.M();
                if (zH || objM2 == uobVar) {
                    objM2 = new zo5(l78Var, this, n92Var, 3);
                    p65Var.j0(objM2);
                }
                kyd.k(p65Var, (b55) objM2, this);
                p65Var.p(false);
            } else {
                p65Var.Y(-143455237);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l23(i, 26, this);
        }
    }
}
