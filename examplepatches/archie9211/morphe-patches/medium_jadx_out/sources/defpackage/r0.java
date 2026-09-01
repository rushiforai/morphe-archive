package defpackage;

import android.view.KeyEvent;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class r0 extends b43 implements ub9, lk6, xxb, ssd, u22, ln8, g16, h85 {
    public static final wz7 L = new wz7(10);
    public i85 A;
    public a43 B;
    public h0a C;
    public sr5 D;
    public final p68 E;
    public long F;
    public h0a G;
    public m68 H;
    public boolean I;
    public enc J;
    public final wz7 K;
    public m68 q;
    public w06 r;
    public boolean s;
    public String t;
    public vkb u;
    public boolean v;
    public m45 w;
    public final ls4 x;
    public w06 y;
    public w4d z;

    public r0(m68 m68Var, w06 w06Var, boolean z, boolean z2, String str, vkb vkbVar, m45 m45Var) {
        this.q = m68Var;
        this.r = w06Var;
        this.s = z;
        this.t = str;
        this.u = vkbVar;
        this.v = z2;
        this.w = m45Var;
        this.x = new ls4(m68Var, 0, new k0(1, this, r0.class, "onFocusChange", "onFocusChange(Z)V", 0, 0));
        int i = ma7.a;
        this.E = new p68(6);
        this.F = 0L;
        m68 m68Var2 = this.q;
        this.H = m68Var2;
        this.I = m68Var2 == null;
        this.K = L;
    }

    @Override // defpackage.q28
    public final void A0() {
        N0();
        if (this.H == null) {
            this.q = null;
        }
        a43 a43Var = this.B;
        if (a43Var != null) {
            J0(a43Var);
        }
        this.B = null;
        i85 i85Var = this.A;
        if (i85Var != null) {
            J0(i85Var);
        }
        this.A = null;
    }

    @Override // defpackage.h85
    public final boolean B(y06 y06Var) {
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0077 A[RETURN] */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$PrimitiveArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    @Override // defpackage.lk6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean D(android.view.KeyEvent r12) {
        /*
            r11 = this;
            r11.T0()
            long r0 = defpackage.nk7.p0(r12)
            boolean r2 = r11.v
            r3 = 3
            r4 = 0
            p68 r5 = r11.E
            r6 = 1
            r7 = 0
            if (r2 == 0) goto L4a
            int r2 = defpackage.nk7.q0(r12)
            r8 = 2
            if (r2 != r8) goto L4a
            boolean r2 = defpackage.hlg.F(r12)
            if (r2 == 0) goto L4a
            boolean r2 = r5.b(r0)
            if (r2 != 0) goto L40
            h0a r2 = new h0a
            long r9 = r11.F
            r2.<init>(r9)
            r5.g(r0, r2)
            m68 r0 = r11.q
            if (r0 == 0) goto L3e
            sb2 r0 = r11.u0()
            p0 r1 = new p0
            r1.<init>(r11, r2, r4, r8)
            defpackage.vx0.c0(r0, r4, r4, r1, r3)
        L3e:
            r0 = r6
            goto L41
        L40:
            r0 = r7
        L41:
            boolean r11 = r11.V0(r12)
            if (r11 != 0) goto L77
            if (r0 == 0) goto L78
            goto L77
        L4a:
            boolean r2 = r11.v
            if (r2 == 0) goto L78
            int r2 = defpackage.nk7.q0(r12)
            if (r2 != r6) goto L78
            boolean r2 = defpackage.hlg.F(r12)
            if (r2 == 0) goto L78
            java.lang.Object r0 = r5.f(r0)
            h0a r0 = (defpackage.h0a) r0
            if (r0 == 0) goto L75
            m68 r1 = r11.q
            if (r1 == 0) goto L72
            sb2 r1 = r11.u0()
            p0 r2 = new p0
            r2.<init>(r11, r0, r4, r3)
            defpackage.vx0.c0(r1, r4, r4, r2, r3)
        L72:
            r11.W0(r12)
        L75:
            if (r0 == 0) goto L78
        L77:
            return r6
        L78:
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.r0.D(android.view.KeyEvent):boolean");
    }

    public void H() {
        sr5 sr5Var;
        m68 m68Var = this.q;
        if (m68Var != null && (sr5Var = this.D) != null) {
            m68Var.c(new tr5(sr5Var));
        }
        this.D = null;
        w4d w4dVar = this.z;
        if (w4dVar != null) {
            w4dVar.H();
        }
    }

    @Override // defpackage.xxb
    public final boolean I() {
        return false;
    }

    public w4d M0() {
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0071  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void N0() {
        /*
            r17 = this;
            r0 = r17
            m68 r1 = r0.q
            p68 r2 = r0.E
            if (r1 == 0) goto L76
            h0a r3 = r0.C
            if (r3 == 0) goto L14
            g0a r4 = new g0a
            r4.<init>(r3)
            r1.c(r4)
        L14:
            h0a r3 = r0.G
            if (r3 == 0) goto L20
            g0a r4 = new g0a
            r4.<init>(r3)
            r1.c(r4)
        L20:
            sr5 r3 = r0.D
            if (r3 == 0) goto L2c
            tr5 r4 = new tr5
            r4.<init>(r3)
            r1.c(r4)
        L2c:
            java.lang.Object[] r3 = r2.c
            long[] r4 = r2.a
            int r5 = r4.length
            int r5 = r5 + (-2)
            if (r5 < 0) goto L76
            r6 = 0
            r7 = r6
        L37:
            r8 = r4[r7]
            long r10 = ~r8
            r12 = 7
            long r10 = r10 << r12
            long r10 = r10 & r8
            r12 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r10 = r10 & r12
            int r10 = (r10 > r12 ? 1 : (r10 == r12 ? 0 : -1))
            if (r10 == 0) goto L71
            int r10 = r7 - r5
            int r10 = ~r10
            int r10 = r10 >>> 31
            r11 = 8
            int r10 = 8 - r10
            r12 = r6
        L51:
            if (r12 >= r10) goto L6f
            r13 = 255(0xff, double:1.26E-321)
            long r13 = r13 & r8
            r15 = 128(0x80, double:6.3E-322)
            int r13 = (r13 > r15 ? 1 : (r13 == r15 ? 0 : -1))
            if (r13 >= 0) goto L6b
            int r13 = r7 << 3
            int r13 = r13 + r12
            r13 = r3[r13]
            h0a r13 = (defpackage.h0a) r13
            g0a r14 = new g0a
            r14.<init>(r13)
            r1.c(r14)
        L6b:
            long r8 = r8 >> r11
            int r12 = r12 + 1
            goto L51
        L6f:
            if (r10 != r11) goto L76
        L71:
            if (r7 == r5) goto L76
            int r7 = r7 + 1
            goto L37
        L76:
            r1 = 0
            r0.C = r1
            r0.G = r1
            r0.D = r1
            r2.a()
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.r0.N0():void");
    }

    public final long O0(long j) {
        long jM0 = flb.v0(this).y.m0(((zte) bo.K(this, z22.u)).e());
        float fMax = Math.max(0.0f, Float.intBitsToFloat((int) (jM0 >> 32)) - ((int) (j >> 32))) / 2.0f;
        return (((long) Float.floatToRawIntBits(Math.max(0.0f, Float.intBitsToFloat((int) (jM0 & 4294967295L)) - ((int) (j & 4294967295L))) / 2.0f)) & 4294967295L) | (Float.floatToRawIntBits(fMax) << 32);
    }

    public final void P0(boolean z) {
        m68 m68Var = this.q;
        if (m68Var != null) {
            enc encVar = this.J;
            n92 n92Var = null;
            if (encVar == null || !encVar.f()) {
                h0a h0aVar = z ? this.G : this.C;
                if (h0aVar != null) {
                    g0a g0aVar = new g0a(h0aVar);
                    va6 va6Var = (va6) ((k92) u0()).a.o0(cd7.g);
                    vx0.c0(u0(), null, null, new l0(m68Var, g0aVar, va6Var != null ? va6Var.R(new i0(m68Var, 0, g0aVar)) : null, n92Var, 0), 3);
                }
            } else {
                enc encVar2 = this.J;
                if (encVar2 != null) {
                    encVar2.m(null);
                }
            }
            if (z) {
                this.G = null;
            } else {
                this.C = null;
            }
        }
    }

    public final void Q0(long j, boolean z) {
        m68 m68Var = this.q;
        if (m68Var != null) {
            enc encVar = this.J;
            if (encVar == null || !encVar.f()) {
                h0a h0aVar = z ? this.G : this.C;
                if (h0aVar != null) {
                    vx0.c0(u0(), null, null, new n0(h0aVar, m68Var, null), 3);
                }
            } else {
                encVar.m(null);
                vx0.c0(u0(), null, null, new m0(encVar, j, m68Var, (n92) null, 0), 3);
            }
            if (z) {
                this.G = null;
            } else {
                this.C = null;
            }
        }
    }

    @Override // defpackage.h85
    public final boolean R(rb9 rb9Var) {
        return false;
    }

    public final void R0(y06 y06Var) {
        m68 m68Var = this.q;
        if (m68Var != null) {
            h0a h0aVar = new h0a(y06Var.c);
            nya nyaVar = new nya();
            br7.z(this, i85.p, new ju0(2, new i0(y06Var, 23, nyaVar)));
            n92 n92Var = null;
            if (nyaVar.a || vo1.a(this)) {
                this.J = vx0.c0(u0(), null, null, new o0(m68Var, h0aVar, this, n92Var, 0), 3);
            } else {
                this.G = h0aVar;
                vx0.c0(u0(), null, null, new n0(m68Var, h0aVar, n92Var, 1), 3);
            }
        }
    }

    public final void S0(rb9 rb9Var) {
        boolean z;
        m68 m68Var = this.q;
        if (m68Var != null) {
            h0a h0aVar = new h0a(rb9Var.c);
            int i = 2;
            zi5 zi5Var = i85.p;
            if (rb9Var == null) {
                ssd ssdVarR = br7.r(this, zi5Var);
                i85 i85Var = ssdVarR instanceof i85 ? (i85) ssdVarR : null;
                z = (i85Var != null ? i85Var.o : null) != null;
            } else {
                nya nyaVar = new nya();
                br7.z(this, zi5Var, new ju0(i, new i0(rb9Var, 24, nyaVar)));
                z = nyaVar.a;
            }
            n92 n92Var = null;
            if (z || vo1.a(this)) {
                this.J = vx0.c0(u0(), null, null, new o0(m68Var, h0aVar, this, n92Var, 1), 3);
            } else {
                this.C = h0aVar;
                vx0.c0(u0(), null, null, new n0(m68Var, h0aVar, n92Var, i), 3);
            }
        }
    }

    public final void T0() {
        if (this.B != null) {
            return;
        }
        w06 w06Var = this.s ? this.y : this.r;
        if (w06Var != null) {
            m68 m68Var = this.q;
            if (m68Var == null) {
                m68Var = new m68();
                this.q = m68Var;
            }
            this.x.M0(m68Var);
            m68 m68Var2 = this.q;
            m68Var2.getClass();
            a43 a43VarA = w06Var.a(m68Var2);
            I0(a43VarA);
            this.B = a43VarA;
        }
    }

    public abstract boolean V0(KeyEvent keyEvent);

    public abstract void W0(KeyEvent keyEvent);

    public final void X0(m68 m68Var, w06 w06Var, boolean z, boolean z2, String str, vkb vkbVar, m45 m45Var) {
        boolean z3;
        boolean z4;
        a43 a43Var;
        boolean z5 = true;
        if (g76.L(this.H, m68Var)) {
            z3 = false;
        } else {
            N0();
            this.H = m68Var;
            this.q = m68Var;
            z3 = true;
        }
        if (!g76.L(this.r, w06Var)) {
            this.r = w06Var;
            z3 = true;
        }
        if (this.s != z) {
            this.s = z;
            if (z) {
                d0();
            }
            z3 = true;
        }
        boolean z6 = this.v;
        ls4 ls4Var = this.x;
        if (z6 != z2) {
            if (z2) {
                I0(ls4Var);
            } else {
                J0(ls4Var);
                N0();
            }
            dl7.u(this);
            this.v = z2;
        }
        if (!g76.L(this.t, str)) {
            this.t = str;
            dl7.u(this);
        }
        if (!g76.L(this.u, vkbVar)) {
            this.u = vkbVar;
            dl7.u(this);
        }
        this.w = m45Var;
        boolean z7 = this.I;
        m68 m68Var2 = this.H;
        if (z7 == (m68Var2 == null)) {
            z5 = z3;
            z4 = z7;
        } else {
            z4 = m68Var2 == null;
            this.I = z4;
            if (z4 || this.B != null) {
                z7 = z4;
                z5 = z3;
                z4 = z7;
            }
        }
        if (z5 && ((a43Var = this.B) != null || !z4)) {
            if (a43Var != null) {
                J0(a43Var);
            }
            this.B = null;
            T0();
        }
        ls4Var.M0(this.q);
    }

    @Override // defpackage.ln8
    public final void d0() {
        if (this.s) {
            mo7.T(this, new h0(this, 0));
        }
    }

    @Override // defpackage.xxb
    public final boolean i() {
        return true;
    }

    @Override // defpackage.lk6
    public final boolean j(KeyEvent keyEvent) {
        return false;
    }

    @Override // defpackage.ub9
    public final boolean l0() {
        return false;
    }

    @Override // defpackage.ssd
    public final Object m() {
        return this.K;
    }

    @Override // defpackage.ub9
    public final long n() {
        return iqd.a;
    }

    @Override // defpackage.ub9
    public final void o0() {
        H();
    }

    @Override // defpackage.xxb
    public final void r0(jyb jybVar) {
        vkb vkbVar = this.u;
        if (vkbVar != null) {
            gyb.g(jybVar, vkbVar.a);
        }
        String str = this.t;
        h0 h0Var = new h0(this, 1);
        fj6[] fj6VarArr = gyb.a;
        jybVar.d(sxb.b, new i4(str, h0Var));
        if (this.v) {
            this.x.r0(jybVar);
        } else {
            jybVar.d(eyb.j, c1e.a);
        }
        L0(jybVar);
    }

    @Override // defpackage.xxb
    public final boolean s0() {
        return true;
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }

    public void y(lb9 lb9Var, mb9 mb9Var, long j) {
        w4d w4dVarM0;
        long j2 = ((j >> 33) << 32) | (((j << 32) >> 33) & 4294967295L);
        this.F = (((long) Float.floatToRawIntBits((int) (j2 & 4294967295L))) & 4294967295L) | (((long) Float.floatToRawIntBits((int) (j2 >> 32))) << 32);
        T0();
        if (this.v) {
            if (this.A == null) {
                i85 i85Var = new i85(this);
                I0(i85Var);
                this.A = i85Var;
            }
            if (mb9Var == mb9.Main) {
                int i = lb9Var.f;
                n92 n92Var = null;
                if (i == 4) {
                    vx0.c0(u0(), null, null, new q0(this, n92Var, 0), 3);
                } else if (i == 5) {
                    vx0.c0(u0(), null, null, new q0(this, n92Var, 1), 3);
                }
            }
        }
        if (this.z == null && (w4dVarM0 = M0()) != null) {
            I0(w4dVarM0);
            this.z = w4dVarM0;
        }
        w4d w4dVar = this.z;
        if (w4dVar != null) {
            w4dVar.y(lb9Var, mb9Var, j);
        }
    }

    @Override // defpackage.q28
    public final void y0() {
        d0();
        if (!this.I) {
            T0();
        }
        if (this.v) {
            I0(this.x);
        }
    }

    @Override // defpackage.q28
    public final void z0() {
        H();
    }

    @Override // defpackage.ub9
    public final void M() {
    }

    public void U0() {
    }

    public void L0(jyb jybVar) {
    }
}
