package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kv6 implements nsb {
    public static final mya y = kng.K(new p44(19), new vx5(10));
    public final d03 a;
    public boolean b;
    public cv6 c;
    public boolean d;
    public final pr6 e;
    public final k49 f;
    public final m68 g;
    public float h;
    public boolean i;
    public final v13 j;
    public final boolean k;
    public aq6 l;
    public final sr6 m;
    public final nl0 n;
    public final st6 o;
    public final rz2 p;
    public final gu6 q;
    public final md5 r;
    public final du6 s;
    public final l78 t;
    public final k49 u;
    public final k49 v;
    public final l78 w;
    public final gg5 x;

    public kv6(int i, int i2) {
        d03 d03Var = new d03();
        d03Var.a = -1;
        d03Var.c = -1;
        this.a = d03Var;
        int i3 = 1;
        this.e = new pr6(i, i2, 1);
        this.f = new k49(pv6.a, y3b.h);
        this.g = new m68();
        this.j = new v13(new ff4(20, this));
        this.k = true;
        this.m = new sr6(this, i3);
        this.n = new nl0();
        this.o = new st6();
        this.p = new rz2(28);
        this.q = new gu6(new rr6(i, i3, this));
        this.r = new md5(22, this);
        this.s = new du6();
        this.t = fo7.G();
        Boolean bool = Boolean.FALSE;
        this.u = qo7.u(bool);
        this.v = qo7.u(bool);
        this.w = fo7.G();
        this.x = new gg5(10);
    }

    public static Object l(kv6 kv6Var, int i, n92 n92Var) {
        kv6Var.getClass();
        Object objB = kv6Var.b(s78.Default, new jv6(kv6Var, i, (n92) null), n92Var);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
    }

    @Override // defpackage.nsb
    public final boolean a() {
        return this.j.a();
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x0067, code lost:
    
        if (r6.j.b(r7, r8, r0) == r1) goto L23;
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
            boolean r0 = r9 instanceof defpackage.iv6
            if (r0 == 0) goto L13
            r0 = r9
            iv6 r0 = (defpackage.iv6) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            iv6 r0 = new iv6
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
            k49 r9 = r6.f
            java.lang.Object r9 = r9.getValue()
            cv6 r2 = defpackage.pv6.a
            if (r9 != r2) goto L5b
            r0.b = r7
            r9 = r8
            p4d r9 = (defpackage.p4d) r9
            r0.c = r9
            r0.f = r5
            nl0 r9 = r6.n
            java.lang.Object r9 = r9.m(r0)
            if (r9 != r1) goto L5b
            goto L69
        L5b:
            r0.b = r3
            r0.c = r3
            r0.f = r4
            v13 r6 = r6.j
            java.lang.Object r6 = r6.b(r7, r8, r0)
            if (r6 != r1) goto L6a
        L69:
            return r1
        L6a:
            c1e r6 = defpackage.c1e.a
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kv6.b(s78, b55, n92):java.lang.Object");
    }

    @Override // defpackage.nsb
    public final boolean c() {
        return ((Boolean) this.v.getValue()).booleanValue();
    }

    @Override // defpackage.nsb
    public final boolean d() {
        return ((Boolean) this.u.getValue()).booleanValue();
    }

    @Override // defpackage.nsb
    public final float e(float f) {
        return this.j.e(f);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r6v2, types: [c1e, java.lang.Object] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(int r7, int r8, defpackage.n92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.gv6
            if (r0 == 0) goto L13
            r0 = r9
            gv6 r0 = (defpackage.gv6) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            gv6 r0 = new gv6
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 0
            r5 = 1
            if (r2 == 0) goto L31
            if (r2 != r5) goto L2b
            defpackage.br7.v(r9)     // Catch: java.lang.Throwable -> L29
            goto L46
        L29:
            r7 = move-exception
            goto L4b
        L2b:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r3
        L31:
            defpackage.br7.v(r9)
            r6.i = r5     // Catch: java.lang.Throwable -> L29
            hv6 r9 = new hv6     // Catch: java.lang.Throwable -> L29
            r9.<init>(r6, r7, r8, r3)     // Catch: java.lang.Throwable -> L29
            r0.d = r5     // Catch: java.lang.Throwable -> L29
            s78 r7 = defpackage.s78.Default     // Catch: java.lang.Throwable -> L29
            java.lang.Object r7 = r6.b(r7, r9, r0)     // Catch: java.lang.Throwable -> L29
            if (r7 != r1) goto L46
            return r1
        L46:
            r6.i = r4
            c1e r6 = defpackage.c1e.a
            return r6
        L4b:
            r6.i = r4
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kv6.f(int, int, n92):java.lang.Object");
    }

    public final void g(cv6 cv6Var, boolean z, boolean z2) {
        String str;
        long j;
        List list = cv6Var.k;
        int i = cv6Var.n;
        int i2 = cv6Var.b;
        dv6 dv6Var = cv6Var.a;
        this.q.e = list.size();
        gg5 gg5Var = this.x;
        pr6 pr6Var = this.e;
        if (!z && this.b) {
            this.c = cv6Var;
            oic oicVarA = vn7.A();
            x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
            oic oicVarG = vn7.G(oicVarA);
            try {
                if (gg5Var.W() && dv6Var != null && dv6Var.a == pr6Var.b.g() && i2 == pr6Var.c.g()) {
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
        this.v.setValue(Boolean.valueOf(((dv6Var != null ? dv6Var.a : 0) == 0 && i2 == 0) ? false : true));
        this.u.setValue(Boolean.valueOf(cv6Var.c));
        this.h -= cv6Var.d;
        this.f.setValue(cv6Var);
        if (z2) {
            pr6Var.getClass();
            if (i2 < 0.0f) {
                e26.c("scrollOffset should be non-negative");
            }
            pr6Var.c.h(i2);
        } else {
            dv6 dv6Var2 = (dv6) bu1.z0(list);
            dv6 dv6Var3 = (dv6) bu1.I0(list);
            if (dv6Var2 != null) {
                str = "scrollOffset should be non-negative";
                j = dv6Var2.a;
            } else {
                str = "scrollOffset should be non-negative";
                j = -1;
            }
            nm.N(j, "firstVisibleItem:index");
            nm.N(dv6Var3 != null ? dv6Var3.a : -1L, "lastVisibleItem:index");
            pr6Var.getClass();
            pr6Var.e = dv6Var != null ? dv6Var.k : null;
            if (pr6Var.d || i > 0) {
                pr6Var.d = true;
                if (i2 < 0.0f) {
                    e26.c(str);
                }
                pr6Var.a(dv6Var != null ? dv6Var.a : 0, i2);
            }
            if (this.k) {
                d03 d03Var = this.a;
                int i3 = d03Var.a;
                boolean z3 = d03Var.b;
                if (i3 != -1 && !list.isEmpty() && i3 != d03.a(cv6Var, z3)) {
                    d03Var.a = -1;
                    fu6 fu6Var = (fu6) d03Var.e;
                    if (fu6Var != null) {
                        fu6Var.cancel();
                    }
                    d03Var.e = null;
                }
                int i4 = d03Var.c;
                if (i4 != -1 && d03Var.d != 0.0f && i4 != i && !list.isEmpty()) {
                    int iA = d03.a(cv6Var, d03Var.d < 0.0f);
                    if (iA >= 0 && iA < i) {
                        d03Var.a = iA;
                        d03Var.e = km4.J(this.r, iA);
                    }
                }
                d03Var.c = i;
            }
        }
        if (z) {
            gg5Var.a0(cv6Var.f, cv6Var.i, cv6Var.h);
        }
    }

    public final int h() {
        return this.e.b.g();
    }

    public final int i() {
        return this.e.c.g();
    }

    public final cv6 j() {
        return (cv6) this.f.getValue();
    }

    public final void k(float f, cv6 cv6Var) {
        fu6 fu6Var;
        fu6 fu6Var2;
        if (this.k) {
            d03 d03Var = this.a;
            d03Var.getClass();
            if (!cv6Var.k.isEmpty()) {
                boolean z = f < 0.0f;
                int iA = d03.a(cv6Var, z);
                if (iA >= 0 && iA < cv6Var.n) {
                    if (iA != d03Var.a) {
                        if (d03Var.b != z) {
                            d03Var.a = -1;
                            fu6 fu6Var3 = (fu6) d03Var.e;
                            if (fu6Var3 != null) {
                                fu6Var3.cancel();
                            }
                            d03Var.e = null;
                        }
                        d03Var.b = z;
                        d03Var.a = iA;
                        d03Var.e = km4.J(this.r, iA);
                    }
                    List list = cv6Var.k;
                    if (z) {
                        dv6 dv6Var = (dv6) bu1.H0(list);
                        if (((dv6Var.o + dv6Var.p) + cv6Var.q) - cv6Var.m < (-f) && (fu6Var2 = (fu6) d03Var.e) != null) {
                            fu6Var2.a();
                        }
                    } else if (cv6Var.l - ((dv6) bu1.x0(list)).o < f && (fu6Var = (fu6) d03Var.e) != null) {
                        fu6Var.a();
                    }
                }
            }
            d03Var.d = f;
        }
    }

    public final void m(int i, int i2) {
        pr6 pr6Var = this.e;
        if (pr6Var.b.g() != i || pr6Var.c.g() != i2) {
            st6 st6Var = this.o;
            st6Var.e();
            st6Var.b = null;
            st6Var.c = -1;
        }
        pr6Var.a(i, i2);
        pr6Var.e = null;
        aq6 aq6Var = this.l;
        if (aq6Var != null) {
            aq6Var.k();
        }
    }
}
