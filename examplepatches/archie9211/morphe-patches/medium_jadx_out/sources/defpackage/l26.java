package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l26 extends eh8 {
    public static final uq Y;
    public final ffd S;
    public k26 X;

    static {
        uq uqVarZ = rx0.z();
        uqVarZ.e(uu1.e);
        uqVarZ.k(1.0f);
        uqVarZ.l(1);
        Y = uqVarZ;
    }

    public l26(aq6 aq6Var) {
        super(aq6Var);
        ffd ffdVar = new ffd();
        ffdVar.d = 0;
        this.S = ffdVar;
        ffdVar.h = this;
        this.X = aq6Var.h != null ? new k26(this) : null;
    }

    @Override // defpackage.eh8
    public final void J0() {
        if (this.X == null) {
            this.X = new k26(this);
        }
    }

    @Override // defpackage.tk7
    public final int L(int i) {
        gg5 gg5VarU = this.o.u();
        zk7 zk7VarB = gg5VarU.B();
        aq6 aq6Var = (aq6) gg5VarU.b;
        return zk7VarB.e((eh8) aq6Var.F.e, aq6Var.m(), i);
    }

    @Override // defpackage.eh8
    public final hb7 M0() {
        return this.X;
    }

    @Override // defpackage.eh8
    public final q28 O0() {
        return this.S;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0036  */
    /* JADX WARN: Removed duplicated region for block: B:38:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.eh8
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void U0(defpackage.ah8 r12, long r13, defpackage.yn5 r15, int r16, boolean r17) {
        /*
            r11 = this;
            aq6 r0 = r11.o
            boolean r1 = r12.C(r0)
            r2 = 1
            r3 = 0
            if (r1 == 0) goto L30
            boolean r1 = r11.p1(r13)
            if (r1 == 0) goto L16
            r9 = r16
            r10 = r17
        L14:
            r3 = r2
            goto L34
        L16:
            r9 = r16
            if (r9 != r2) goto L32
            long r4 = r11.N0()
            float r11 = r11.G0(r13, r4)
            int r11 = java.lang.Float.floatToRawIntBits(r11)
            r1 = 2147483647(0x7fffffff, float:NaN)
            r11 = r11 & r1
            r1 = 2139095040(0x7f800000, float:Infinity)
            if (r11 >= r1) goto L32
            r10 = r3
            goto L14
        L30:
            r9 = r16
        L32:
            r10 = r17
        L34:
            if (r3 == 0) goto L7a
            int r11 = r15.c
            o78 r0 = r0.y()
            java.lang.Object[] r1 = r0.a
            int r0 = r0.c
            int r0 = r0 - r2
        L41:
            if (r0 < 0) goto L78
            r2 = r1[r0]
            r5 = r2
            aq6 r5 = (defpackage.aq6) r5
            boolean r2 = r5.I()
            if (r2 == 0) goto L73
            r4 = r12
            r6 = r13
            r8 = r15
            r4.s(r5, r6, r8, r9, r10)
            long r2 = r15.d()
            float r6 = defpackage.op8.W(r2)
            r7 = 0
            int r6 = (r6 > r7 ? 1 : (r6 == r7 ? 0 : -1))
            if (r6 >= 0) goto L73
            boolean r6 = defpackage.op8.d0(r2)
            if (r6 == 0) goto L73
            boolean r2 = defpackage.op8.c0(r2)
            if (r2 != 0) goto L73
            boolean r2 = r12.A(r15, r5)
            if (r2 == 0) goto L78
        L73:
            int r0 = r0 + (-1)
            r9 = r16
            goto L41
        L78:
            r15.c = r11
        L7a:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.l26.U0(ah8, long, yn5, int, boolean):void");
    }

    @Override // defpackage.t99
    public final void X(long j, float f, x45 x45Var) {
        e1(j, f, x45Var, null);
        if (this.j) {
            return;
        }
        this.o.G.p.r0();
    }

    @Override // defpackage.tk7
    public final int a(int i) {
        gg5 gg5VarU = this.o.u();
        zk7 zk7VarB = gg5VarU.B();
        aq6 aq6Var = (aq6) gg5VarU.b;
        return zk7VarB.d((eh8) aq6Var.F.e, aq6Var.m(), i);
    }

    @Override // defpackage.eh8, defpackage.t99
    public final void a0(long j, float f, of5 of5Var) {
        e1(j, f, null, of5Var);
        if (this.j) {
            return;
        }
        this.o.G.p.r0();
    }

    @Override // defpackage.eh8
    public final void d1(e61 e61Var, of5 of5Var) throws Throwable {
        aq6 aq6Var = this.o;
        mx8 mx8VarA = dq6.a(aq6Var);
        o78 o78VarY = aq6Var.y();
        Object[] objArr = o78VarY.a;
        int i = o78VarY.c;
        for (int i2 = 0; i2 < i; i2++) {
            aq6 aq6Var2 = (aq6) objArr[i2];
            if (aq6Var2.I()) {
                aq6Var2.i(e61Var, of5Var);
            }
        }
        if (((mn) mx8VarA).getShowLayoutBounds()) {
            long j = this.c;
            e61Var.l(0.5f, 0.5f, ((int) (j >> 32)) - 0.5f, ((int) (j & 4294967295L)) - 0.5f, Y);
        }
    }

    @Override // defpackage.tk7
    public final int k(int i) {
        gg5 gg5VarU = this.o.u();
        zk7 zk7VarB = gg5VarU.B();
        aq6 aq6Var = (aq6) gg5VarU.b;
        return zk7VarB.c((eh8) aq6Var.F.e, aq6Var.m(), i);
    }

    @Override // defpackage.fb7
    public final int l0(yd ydVar) {
        k26 k26Var = this.X;
        if (k26Var != null) {
            return k26Var.l0(ydVar);
        }
        yk7 yk7Var = this.o.G.p;
        bq6 bq6Var = yk7Var.y;
        if (!yk7Var.m) {
            if (yk7Var.f.d == wp6.Measuring) {
                bq6Var.f = true;
                if (bq6Var.b) {
                    yk7Var.w = true;
                    yk7Var.x = true;
                }
            } else {
                bq6Var.g = true;
            }
        }
        l26 l26VarE = yk7Var.e();
        boolean z = l26VarE.k;
        l26VarE.k = true;
        yk7Var.C();
        l26VarE.k = z;
        Integer num = (Integer) bq6Var.i.get(ydVar);
        if (num != null) {
            return num.intValue();
        }
        return Integer.MIN_VALUE;
    }

    @Override // defpackage.tk7
    public final int n(int i) {
        gg5 gg5VarU = this.o.u();
        zk7 zk7VarB = gg5VarU.B();
        aq6 aq6Var = (aq6) gg5VarU.b;
        return zk7VarB.a((eh8) aq6Var.F.e, aq6Var.m(), i);
    }

    @Override // defpackage.tk7
    public final t99 s(long j) {
        e0(j);
        aq6 aq6Var = this.o;
        o78 o78VarZ = aq6Var.z();
        Object[] objArr = o78VarZ.a;
        int i = o78VarZ.c;
        for (int i2 = 0; i2 < i; i2++) {
            ((aq6) objArr[i2]).G.p.l = yp6.NotUsed;
        }
        h1(aq6Var.w.b(this, aq6Var.m(), j));
        Y0();
        return this;
    }
}
