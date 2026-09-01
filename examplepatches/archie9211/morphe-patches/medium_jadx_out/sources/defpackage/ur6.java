package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ur6 implements nsb {
    public static final mya w = kng.K(new p44(18), new vx5(6));
    public final d03 a;
    public boolean b;
    public mr6 c;
    public final pr6 d;
    public final k49 e;
    public final m68 f;
    public float g;
    public final v13 h;
    public final boolean i;
    public aq6 j;
    public final sr6 k;
    public final nl0 l;
    public final st6 m;
    public final rz2 n;
    public final gu6 o;
    public final olb p;
    public final du6 q;
    public final l78 r;
    public final l78 s;
    public final k49 t;
    public final k49 u;
    public final gg5 v;

    public ur6(int i, int i2) {
        d03 d03Var = new d03();
        d03Var.a = -1;
        d03Var.e = new o78(new fu6[16]);
        d03Var.c = -1;
        this.a = d03Var;
        int i3 = 0;
        this.d = new pr6(i, i2, 0);
        this.e = new k49(wr6.a, y3b.h);
        this.f = new m68();
        this.h = new v13(new ff4(16, this));
        this.i = true;
        this.k = new sr6(this, i3);
        this.l = new nl0();
        this.m = new st6();
        this.n = new rz2(28);
        this.o = new gu6(new rr6(i, i3, this));
        this.p = new olb(18, this);
        this.q = new du6();
        this.r = fo7.G();
        this.s = fo7.G();
        Boolean bool = Boolean.FALSE;
        this.t = qo7.u(bool);
        this.u = qo7.u(bool);
        this.v = new gg5(10);
    }

    @Override // defpackage.nsb
    public final boolean a() {
        return this.h.a();
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x0067, code lost:
    
        if (r6.h.b(r7, r8, r0) == r1) goto L23;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    @Override // defpackage.nsb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.s78 r7, defpackage.b55 r8, defpackage.n92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.tr6
            if (r0 == 0) goto L13
            r0 = r9
            tr6 r0 = (defpackage.tr6) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            tr6 r0 = new tr6
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 0
            r4 = 2
            r5 = 1
            if (r2 == 0) goto L3c
            if (r2 == r5) goto L31
            if (r2 != r4) goto L2b
            defpackage.br7.v(r9)
            goto L6a
        L2b:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r3
        L31:
            p4d r7 = r0.c
            r8 = r7
            b55 r8 = (defpackage.b55) r8
            s78 r7 = r0.b
            defpackage.br7.v(r9)
            goto L5b
        L3c:
            defpackage.br7.v(r9)
            k49 r9 = r6.e
            java.lang.Object r9 = r9.getValue()
            mr6 r2 = defpackage.wr6.a
            if (r9 != r2) goto L5b
            r0.b = r7
            r9 = r8
            p4d r9 = (defpackage.p4d) r9
            r0.c = r9
            r0.f = r5
            nl0 r9 = r6.l
            java.lang.Object r9 = r9.m(r0)
            if (r9 != r1) goto L5b
            goto L69
        L5b:
            r0.b = r3
            r0.c = r3
            r0.f = r4
            v13 r6 = r6.h
            java.lang.Object r6 = r6.b(r7, r8, r0)
            if (r6 != r1) goto L6a
        L69:
            return r1
        L6a:
            c1e r6 = defpackage.c1e.a
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ur6.b(s78, b55, n92):java.lang.Object");
    }

    @Override // defpackage.nsb
    public final boolean c() {
        return ((Boolean) this.u.getValue()).booleanValue();
    }

    @Override // defpackage.nsb
    public final boolean d() {
        return ((Boolean) this.t.getValue()).booleanValue();
    }

    @Override // defpackage.nsb
    public final float e(float f) {
        return this.h.e(f);
    }

    public final void f(mr6 mr6Var, boolean z, boolean z2) {
        nr6 nr6Var;
        nr6 nr6Var2;
        nr6 nr6Var3;
        List list = mr6Var.m;
        int i = mr6Var.p;
        or6 or6Var = mr6Var.a;
        int i2 = mr6Var.b;
        this.o.e = list.size();
        Object obj = null;
        obj = null;
        pr6 pr6Var = this.d;
        gg5 gg5Var = this.v;
        if (!z && this.b) {
            this.c = mr6Var;
            oic oicVarA = vn7.A();
            x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
            oic oicVarG = vn7.G(oicVarA);
            try {
                if (gg5Var.W() && i2 == pr6Var.c.g() && or6Var != null && (nr6Var3 = (nr6) k80.u0(or6Var.b)) != null && nr6Var3.a == pr6Var.b.g()) {
                    gg5Var.Z();
                }
                return;
            } finally {
                vn7.T(oicVarA, oicVarG, x45VarE);
            }
        }
        if (z) {
            this.b = true;
        }
        this.g -= mr6Var.d;
        this.e.setValue(mr6Var);
        this.u.setValue(Boolean.valueOf(((or6Var != null ? or6Var.a : 0) == 0 && i2 == 0) ? false : true));
        this.t.setValue(Boolean.valueOf(mr6Var.c));
        if (z2) {
            pr6Var.getClass();
            if (i2 < 0.0f) {
                e26.c("scrollOffset should be non-negative");
            }
            pr6Var.c.h(i2);
        } else {
            pr6Var.getClass();
            if (or6Var != null && (nr6Var2 = (nr6) k80.u0(or6Var.b)) != null) {
                obj = nr6Var2.b;
            }
            pr6Var.e = obj;
            if (pr6Var.d || i > 0) {
                pr6Var.d = true;
                if (i2 < 0.0f) {
                    e26.c("scrollOffset should be non-negative (" + i2 + ')');
                }
                pr6Var.a((or6Var == null || (nr6Var = (nr6) k80.u0(or6Var.b)) == null) ? 0 : nr6Var.a, i2);
            }
            if (this.i) {
                d03 d03Var = this.a;
                o78 o78Var = (o78) d03Var.e;
                int i3 = d03Var.a;
                boolean z3 = d03Var.b;
                if (i3 != -1 && !list.isEmpty() && i3 != d03.b(mr6Var, z3)) {
                    d03Var.a = -1;
                    Object[] objArr = o78Var.a;
                    int i4 = o78Var.c;
                    for (int i5 = 0; i5 < i4; i5++) {
                        ((fu6) objArr[i5]).cancel();
                    }
                    o78Var.i();
                }
                int i6 = d03Var.c;
                if (i6 != -1 && d03Var.d != 0.0f && i6 != i && !list.isEmpty()) {
                    int iB = d03.b(mr6Var, d03Var.d < 0.0f);
                    int i7 = d03Var.d < 0.0f ? ((nr6) bu1.H0(list)).a + 1 : ((nr6) bu1.x0(list)).a - 1;
                    if (i7 >= 0 && i7 < i && iB != d03Var.a && iB >= 0) {
                        d03Var.a = iB;
                        o78Var.i();
                        o78Var.e(o78Var.c, this.p.w(iB));
                    }
                }
                d03Var.c = i;
            }
        }
        if (z) {
            gg5Var.a0(mr6Var.f, mr6Var.i, mr6Var.h);
        }
    }

    public final mr6 g() {
        return (mr6) this.e.getValue();
    }

    public final void h(float f, mr6 mr6Var) {
        if (this.i) {
            d03 d03Var = this.a;
            o78 o78Var = (o78) d03Var.e;
            List list = mr6Var.m;
            List list2 = mr6Var.m;
            hw8 hw8Var = mr6Var.q;
            if (!list.isEmpty()) {
                int i = 0;
                boolean z = f < 0.0f;
                int iB = d03.b(mr6Var, z);
                int i2 = z ? ((nr6) bu1.H0(list2)).a + 1 : ((nr6) bu1.x0(list2)).a - 1;
                if (i2 >= 0 && i2 < mr6Var.p) {
                    if (iB != d03Var.a && iB >= 0) {
                        if (d03Var.b != z) {
                            Object[] objArr = o78Var.a;
                            int i3 = o78Var.c;
                            for (int i4 = 0; i4 < i3; i4++) {
                                ((fu6) objArr[i4]).cancel();
                            }
                        }
                        d03Var.b = z;
                        d03Var.a = iB;
                        o78Var.i();
                        o78Var.e(o78Var.c, this.p.w(iB));
                    }
                    if (z) {
                        nr6 nr6Var = (nr6) bu1.H0(list2);
                        if (((t40.I(nr6Var, hw8Var) + ((int) (hw8Var == hw8.Vertical ? nr6Var.s & 4294967295L : nr6Var.s >> 32))) + mr6Var.s) - mr6Var.o < (-f)) {
                            Object[] objArr2 = o78Var.a;
                            int i5 = o78Var.c;
                            while (i < i5) {
                                ((fu6) objArr2[i]).a();
                                i++;
                            }
                        }
                    } else if (mr6Var.n - t40.I((nr6) bu1.x0(list2), hw8Var) < f) {
                        Object[] objArr3 = o78Var.a;
                        int i6 = o78Var.c;
                        while (i < i6) {
                            ((fu6) objArr3[i]).a();
                            i++;
                        }
                    }
                }
            }
            d03Var.d = f;
        }
    }
}
