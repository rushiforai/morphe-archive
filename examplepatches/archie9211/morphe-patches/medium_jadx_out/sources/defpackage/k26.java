package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k26 extends hb7 {
    @Override // defpackage.hb7
    public final void D0() {
        mb7 mb7Var = this.o.o.G.q;
        mb7Var.getClass();
        mb7Var.s0();
    }

    @Override // defpackage.tk7
    public final int L(int i) {
        gg5 gg5VarU = this.o.o.u();
        zk7 zk7VarB = gg5VarU.B();
        aq6 aq6Var = (aq6) gg5VarU.b;
        return zk7VarB.e((eh8) aq6Var.F.e, aq6Var.l(), i);
    }

    @Override // defpackage.tk7
    public final int a(int i) {
        gg5 gg5VarU = this.o.o.u();
        zk7 zk7VarB = gg5VarU.B();
        aq6 aq6Var = (aq6) gg5VarU.b;
        return zk7VarB.d((eh8) aq6Var.F.e, aq6Var.l(), i);
    }

    @Override // defpackage.tk7
    public final int k(int i) {
        gg5 gg5VarU = this.o.o.u();
        zk7 zk7VarB = gg5VarU.B();
        aq6 aq6Var = (aq6) gg5VarU.b;
        return zk7VarB.c((eh8) aq6Var.F.e, aq6Var.l(), i);
    }

    @Override // defpackage.fb7
    public final int l0(yd ydVar) {
        mb7 mb7Var = this.o.o.G.q;
        mb7Var.getClass();
        bq6 bq6Var = mb7Var.s;
        if (!mb7Var.k) {
            eq6 eq6Var = mb7Var.f;
            if (eq6Var.d == wp6.LookaheadMeasuring) {
                bq6Var.f = true;
                if (bq6Var.b) {
                    eq6Var.f = true;
                    eq6Var.g = true;
                }
            } else {
                bq6Var.g = true;
            }
        }
        k26 k26Var = mb7Var.e().X;
        if (k26Var != null) {
            k26Var.k = true;
        }
        mb7Var.C();
        k26 k26Var2 = mb7Var.e().X;
        if (k26Var2 != null) {
            k26Var2.k = false;
        }
        Integer num = (Integer) bq6Var.i.get(ydVar);
        int iIntValue = num != null ? num.intValue() : Integer.MIN_VALUE;
        this.t.g(iIntValue, ydVar);
        return iIntValue;
    }

    @Override // defpackage.tk7
    public final int n(int i) {
        gg5 gg5VarU = this.o.o.u();
        zk7 zk7VarB = gg5VarU.B();
        aq6 aq6Var = (aq6) gg5VarU.b;
        return zk7VarB.a((eh8) aq6Var.F.e, aq6Var.l(), i);
    }

    @Override // defpackage.tk7
    public final t99 s(long j) {
        e0(j);
        eh8 eh8Var = this.o;
        o78 o78VarZ = eh8Var.o.z();
        Object[] objArr = o78VarZ.a;
        int i = o78VarZ.c;
        for (int i2 = 0; i2 < i; i2++) {
            mb7 mb7Var = ((aq6) objArr[i2]).G.q;
            mb7Var.getClass();
            mb7Var.j = yp6.NotUsed;
        }
        aq6 aq6Var = eh8Var.o;
        G0(aq6Var.w.b(this, aq6Var.l(), j));
        return this;
    }
}
