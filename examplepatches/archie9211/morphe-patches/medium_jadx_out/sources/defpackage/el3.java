package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class el3 extends b43 implements ub9, g16, u22, h85 {
    public jk3 A;
    public ik3 B;
    public hk3 C;
    public bgf D;
    public nec E;
    public il1 G;
    public f16 H;
    public hw8 q;
    public x45 r;
    public boolean s;
    public m68 t;
    public i85 u;
    public uz0 v;
    public gl3 w;
    public boolean x;
    public boolean y;
    public gk3 z;
    public long F = 9205357640488583168L;
    public long I = 0;

    public el3(x45 x45Var, boolean z, m68 m68Var, hw8 hw8Var) {
        this.q = hw8Var;
        this.r = x45Var;
        this.s = z;
        this.t = m68Var;
    }

    public static void P0(el3 el3Var, rb9 rb9Var, long j, long j2, int i) {
        if ((i & 4) != 0) {
            j2 = 0;
        }
        ik3 ik3Var = el3Var.B;
        if (ik3Var == null) {
            ik3Var = new ik3();
            ik3Var.Q = null;
            ik3Var.R = Long.MAX_VALUE;
            ik3Var.S = false;
            el3Var.B = ik3Var;
        }
        ik3Var.Q = rb9Var;
        ik3Var.R = j;
        il1 il1Var = el3Var.G;
        hw8 hw8Var = el3Var.q;
        if (il1Var == null) {
            el3Var.G = new il1(hw8Var);
        } else {
            il1Var.c = hw8Var;
            il1Var.b = j2;
        }
        ik3Var.S = false;
        el3Var.D = ik3Var;
    }

    @Override // defpackage.q28
    public final void A0() {
        this.x = false;
        L0();
        this.I = 0L;
        i85 i85Var = this.u;
        if (i85Var != null) {
            J0(i85Var);
        }
        this.u = null;
    }

    @Override // defpackage.h85
    public final boolean B(y06 y06Var) {
        return t40.C(y06Var) && this.s;
    }

    @Override // defpackage.ub9
    public final void H() {
        if (this.y) {
            N0();
            if (this.x) {
                W0().e(kk3.a);
            }
            this.E = null;
        }
        this.y = false;
    }

    public final void L0() {
        gl3 gl3Var = this.w;
        if (gl3Var != null) {
            m68 m68Var = this.t;
            if (m68Var != null) {
                m68Var.c(new fl3(gl3Var));
            }
            this.w = null;
        }
    }

    public abstract Object M0(dl3 dl3Var, dl3 dl3Var2);

    public final void N0() {
        gk3 gk3Var = this.z;
        if (gk3Var == null) {
            fk3 fk3Var = fk3.NotInitialized;
            gk3Var = new gk3();
            gk3Var.Q = fk3Var;
            gk3Var.R = false;
            this.z = gk3Var;
        }
        gk3Var.Q = fk3.NotInitialized;
        gk3Var.R = false;
        this.D = gk3Var;
    }

    public final void O0(rb9 rb9Var, long j, il1 il1Var) {
        hk3 hk3Var = this.C;
        if (hk3Var == null) {
            hk3Var = new hk3();
            hk3Var.Q = null;
            hk3Var.R = Long.MAX_VALUE;
            this.C = hk3Var;
        }
        hk3Var.Q = rb9Var;
        hk3Var.R = j;
        il1Var.b = 0L;
        this.D = hk3Var;
    }

    public final void Q0(ok3 ok3Var) {
        if ((ok3Var instanceof mk3) && !this.x) {
            this.x = true;
            b1();
        }
        W0().e(ok3Var);
    }

    @Override // defpackage.h85
    public final boolean R(rb9 rb9Var) {
        if (mq7.v(rb9Var)) {
            return this.s;
        }
        if (!mq7.x(rb9Var)) {
            if (this.G == null) {
                this.G = new il1(this.q);
            }
            float fG = ((zte) bo.K(this, z22.u)).g();
            long jF = mq7.F(rb9Var, false);
            il1 il1Var = this.G;
            if (il1Var == null) {
                ay0.e("Touch slop detector not initialized.");
                return false;
            }
            if (!ip8.b(il1Var.e(fG, jF, false), 9205357640488583168L)) {
                long jE = ip8.e(il1Var.b, jF);
                double dAtan2 = ((double) (((float) Math.atan2(Math.abs(Float.intBitsToFloat((int) (jE & 4294967295L))), Math.abs(Float.intBitsToFloat((int) (jE >> 32))))) * 180.0f)) / 3.141592653589793d;
                hw8 hw8Var = (hw8) il1Var.c;
                int i = hw8Var == null ? -1 : jqd.a[hw8Var.ordinal()];
                if (i == 1 ? dAtan2 < 30.0d : !(i != 2 || dAtan2 <= 30.0d)) {
                    return true;
                }
            }
        }
        return false;
    }

    public abstract void R0(long j);

    public abstract void S0(nk3 nk3Var);

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object T0(defpackage.p92 r7) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.al3
            if (r0 == 0) goto L13
            r0 = r7
            al3 r0 = (defpackage.al3) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            al3 r0 = new al3
            r0.<init>(r6, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 != r4) goto L28
            defpackage.br7.v(r7)
            goto L47
        L28:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r3
        L2e:
            defpackage.br7.v(r7)
            gl3 r7 = r6.w
            if (r7 == 0) goto L49
            m68 r2 = r6.t
            if (r2 == 0) goto L47
            fl3 r5 = new fl3
            r5.<init>(r7)
            r0.d = r4
            java.lang.Object r7 = r2.b(r5, r0)
            if (r7 != r1) goto L47
            return r1
        L47:
            r6.w = r3
        L49:
            nk3 r7 = new nk3
            r0 = 0
            r2 = 0
            r7.<init>(r0, r2)
            r6.S0(r7)
            c1e r6 = defpackage.c1e.a
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.el3.T0(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object U0(defpackage.mk3 r7, defpackage.p92 r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.bl3
            if (r0 == 0) goto L13
            r0 = r8
            bl3 r0 = (defpackage.bl3) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            bl3 r0 = new bl3
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 2
            r4 = 1
            if (r2 == 0) goto L3b
            if (r2 == r4) goto L35
            if (r2 != r3) goto L2e
            gl3 r7 = r0.c
            mk3 r0 = r0.b
            defpackage.br7.v(r8)
            goto L6e
        L2e:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L35:
            mk3 r7 = r0.b
            defpackage.br7.v(r8)
            goto L56
        L3b:
            defpackage.br7.v(r8)
            gl3 r8 = r6.w
            if (r8 == 0) goto L56
            m68 r2 = r6.t
            if (r2 == 0) goto L56
            fl3 r5 = new fl3
            r5.<init>(r8)
            r0.b = r7
            r0.f = r4
            java.lang.Object r8 = r2.b(r5, r0)
            if (r8 != r1) goto L56
            goto L6b
        L56:
            gl3 r8 = new gl3
            r8.<init>()
            m68 r2 = r6.t
            if (r2 == 0) goto L70
            r0.b = r7
            r0.c = r8
            r0.f = r3
            java.lang.Object r0 = r2.b(r8, r0)
            if (r0 != r1) goto L6c
        L6b:
            return r1
        L6c:
            r0 = r7
            r7 = r8
        L6e:
            r8 = r7
            r7 = r0
        L70:
            r6.w = r8
            long r7 = r7.a
            r6.R0(r7)
            c1e r6 = defpackage.c1e.a
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.el3.U0(mk3, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object V0(defpackage.nk3 r7, defpackage.p92 r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.cl3
            if (r0 == 0) goto L13
            r0 = r8
            cl3 r0 = (defpackage.cl3) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            cl3 r0 = new cl3
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L30
            if (r2 != r4) goto L2a
            nk3 r7 = r0.b
            defpackage.br7.v(r8)
            goto L4b
        L2a:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r3
        L30:
            defpackage.br7.v(r8)
            gl3 r8 = r6.w
            if (r8 == 0) goto L4d
            m68 r2 = r6.t
            if (r2 == 0) goto L4b
            hl3 r5 = new hl3
            r5.<init>(r8)
            r0.b = r7
            r0.e = r4
            java.lang.Object r8 = r2.b(r5, r0)
            if (r8 != r1) goto L4b
            return r1
        L4b:
            r6.w = r3
        L4d:
            r6.S0(r7)
            c1e r6 = defpackage.c1e.a
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.el3.V0(nk3, p92):java.lang.Object");
    }

    public final wj1 W0() {
        uz0 uz0Var = this.v;
        if (uz0Var != null) {
            return uz0Var;
        }
        ay0.e("Events channel not initialized.");
        return null;
    }

    public final nec X0() {
        nec necVar = this.E;
        if (necVar != null) {
            return necVar;
        }
        ay0.e("Velocity Tracker not initialized.");
        return null;
    }

    public final void Y0(long j, rb9 rb9Var) {
        long jP = flb.u0(this.a).p(0L);
        if (!ip8.b(this.F, 9205357640488583168L) && !ip8.b(jP, this.F)) {
            this.I = ip8.e(this.I, ip8.d(jP, this.F));
        }
        this.F = jP;
        qk7.m(X0(), rb9Var, this.I);
        W0().e(new lk3(j, false));
    }

    public final void Z0(rb9 rb9Var, rb9 rb9Var2, long j) {
        if (this.E == null) {
            this.E = new nec(5, (byte) 0);
        }
        qk7.m(X0(), rb9Var, 0L);
        long jD = ip8.d(rb9Var2.c, j);
        this.I = 0L;
        if (((Boolean) this.r.invoke(new ac9(rb9Var.i))).booleanValue()) {
            if (!this.x) {
                if (this.v == null) {
                    this.v = pwd.e(Integer.MAX_VALUE, 6, null);
                }
                b1();
            }
            this.F = flb.u0(this).p(0L);
            W0().e(new mk3(jD));
        }
    }

    @Override // defpackage.g16
    public final void a0() {
        f16 f16Var = this.H;
        if (f16Var != null) {
            f16Var.a();
            el3 el3Var = f16Var.a;
            if (el3Var.x) {
                el3Var.Q0(kk3.a);
            }
            f16Var.g = null;
            ad adVar = f16Var.k;
            adVar.b = 0;
            ((o68) adVar.c).b = 0;
        }
    }

    public abstract boolean a1();

    public final void b1() {
        this.x = true;
        if (this.v == null) {
            this.v = pwd.e(Integer.MAX_VALUE, 6, null);
        }
        vx0.c0(u0(), null, null, new dl3(this, null), 3);
    }

    public final void c1(x45 x45Var, boolean z, m68 m68Var, hw8 hw8Var, boolean z2) {
        this.r = x45Var;
        boolean z3 = true;
        if (this.s != z) {
            this.s = z;
            if (!z) {
                L0();
                this.H = null;
            }
            z2 = true;
        }
        if (!g76.L(this.t, m68Var)) {
            L0();
            this.t = m68Var;
        }
        if (this.q != hw8Var) {
            this.q = hw8Var;
        } else {
            z3 = z2;
        }
        if (z3) {
            boolean z4 = this.y;
            kk3 kk3Var = kk3.a;
            if (z4) {
                N0();
                if (this.x) {
                    W0().e(kk3Var);
                }
                this.E = null;
            }
            f16 f16Var = this.H;
            if (f16Var != null) {
                f16Var.a();
                el3 el3Var = f16Var.a;
                if (el3Var.x) {
                    el3Var.Q0(kk3Var);
                }
                f16Var.g = null;
                ad adVar = f16Var.k;
                adVar.b = 0;
                ((o68) adVar.c).b = 0;
            }
        }
    }

    @Override // defpackage.ub9
    public final boolean l0() {
        return false;
    }

    @Override // defpackage.ub9
    public final long n() {
        return iqd.a;
    }

    @Override // defpackage.ub9
    public final void o0() {
        H();
    }

    @Override // defpackage.g16
    public final void w(xp xpVar, mb9 mb9Var) {
        Object obj;
        Object obj2;
        Object obj3;
        Object obj4;
        Object obj5;
        int i = xpVar.b;
        ArrayList arrayList = (ArrayList) xpVar.c;
        if (this.u == null) {
            i85 i85Var = new i85(this);
            I0(i85Var);
            this.u = i85Var;
        }
        if (this.s) {
            f16 f16Var = this.H;
            if (f16Var == null) {
                f16Var = new f16(this);
                this.H = f16Var;
            }
            f16 f16Var2 = f16Var;
            el3 el3Var = f16Var2.a;
            r40 r40Var = f16Var2.f;
            int i2 = 0;
            Object obj6 = r40Var;
            if (r40Var == null) {
                a16 a16Var = f16Var2.b;
                a16 a16Var2 = a16Var;
                if (a16Var == null) {
                    z06 z06Var = z06.NotInitialized;
                    a16 a16Var3 = new a16();
                    a16Var3.q = z06Var;
                    a16Var3.r = false;
                    f16Var2.b = a16Var3;
                    a16Var2 = a16Var3;
                }
                f16Var2.f = a16Var2;
                obj6 = a16Var2;
            }
            boolean z = true;
            if (obj6 instanceof a16) {
                a16 a16Var4 = (a16) obj6;
                if (arrayList.isEmpty()) {
                    return;
                }
                int size = arrayList.size();
                while (i2 < size) {
                    if (!t40.C((y06) arrayList.get(i2))) {
                        return;
                    } else {
                        i2++;
                    }
                }
                y06 y06Var = (y06) bu1.x0(arrayList);
                z06 z06Var2 = e16.a[a16Var4.q.ordinal()] == 1 ? !el3Var.a1() ? z06.Yes : z06.No : a16Var4.q;
                a16Var4.q = z06Var2;
                if (mb9Var == mb9.Initial && z06Var2 == z06.No) {
                    y06Var.i = true;
                    a16Var4.r = true;
                }
                if (mb9Var == mb9.Main) {
                    if (z06Var2 == z06.Yes) {
                        f16.c(f16Var2, y06Var, y06Var.a, 0L, 12);
                        return;
                    }
                    if (a16Var4.r) {
                        f16Var2.f(y06Var, y06Var, new x06(i), 0L);
                        f16Var2.e(y06Var, new x06(i), 0L);
                        long j = y06Var.a;
                        d16 d16Var = f16Var2.c;
                        if (d16Var == null) {
                            d16Var = new d16();
                            d16Var.q = Long.MAX_VALUE;
                            f16Var2.c = d16Var;
                        }
                        d16Var.q = j;
                        f16Var2.f = d16Var;
                        return;
                    }
                    return;
                }
                return;
            }
            if (!(obj6 instanceof c16)) {
                if (obj6 instanceof b16) {
                    b16 b16Var = (b16) obj6;
                    if (mb9Var != mb9.Final) {
                        return;
                    }
                    int size2 = arrayList.size();
                    int i3 = 0;
                    while (true) {
                        if (i3 >= size2) {
                            break;
                        }
                        if (((y06) arrayList.get(i3)).i) {
                            z = false;
                            break;
                        }
                        i3++;
                    }
                    int size3 = arrayList.size();
                    while (true) {
                        if (i2 >= size3) {
                            break;
                        }
                        if (!((y06) arrayList.get(i2)).d) {
                            i2++;
                        } else if (!arrayList.isEmpty()) {
                            if (z) {
                                long jK = t40.K((y06) bu1.x0(arrayList), el3Var.q, new x06(i));
                                y06 y06Var2 = b16Var.q;
                                y06Var2.getClass();
                                long jD = ip8.d(jK, t40.K(y06Var2, el3Var.q, new x06(i)));
                                y06 y06Var3 = b16Var.q;
                                if (y06Var3 != null) {
                                    f16.c(f16Var2, y06Var3, b16Var.r, jD, 8);
                                    return;
                                } else {
                                    ay0.e("AwaitGesturePickup.initialDown was not initialized.");
                                    return;
                                }
                            }
                            return;
                        }
                    }
                    f16Var2.a();
                    return;
                }
                if (!(obj6 instanceof d16)) {
                    ygf.a();
                    return;
                }
                d16 d16Var2 = (d16) obj6;
                if (mb9Var != mb9.Main) {
                    return;
                }
                long j2 = d16Var2.q;
                int size4 = arrayList.size();
                int i4 = 0;
                while (true) {
                    if (i4 >= size4) {
                        obj = null;
                        break;
                    }
                    obj = arrayList.get(i4);
                    if (br7.q(((y06) obj).a, j2)) {
                        break;
                    } else {
                        i4++;
                    }
                }
                y06 y06Var4 = (y06) obj;
                if (y06Var4 == null) {
                    return;
                }
                boolean zD = t40.D(y06Var4);
                kk3 kk3Var = kk3.a;
                if (!zD) {
                    if (y06Var4.i) {
                        el3Var.Q0(kk3Var);
                        return;
                    } else {
                        if (ip8.c(t40.J(y06Var4, el3Var.q, new x06(i), true)) == 0.0f) {
                            return;
                        }
                        f16Var2.e(y06Var4, new x06(i), t40.J(y06Var4, el3Var.q, new x06(i), false));
                        y06Var4.i = true;
                        return;
                    }
                }
                int size5 = arrayList.size();
                int i5 = 0;
                while (true) {
                    if (i5 >= size5) {
                        obj2 = null;
                        break;
                    }
                    obj2 = arrayList.get(i5);
                    if (((y06) obj2).d) {
                        break;
                    } else {
                        i5++;
                    }
                }
                y06 y06Var5 = (y06) obj2;
                if (y06Var5 != null) {
                    d16Var2.q = y06Var5.a;
                    return;
                }
                if (y06Var4.i || !t40.D(y06Var4)) {
                    el3Var.Q0(kk3Var);
                } else {
                    t40.A(f16Var2.d(), y06Var4, el3Var.q, new x06(i), f16Var2.j, f16Var2.l);
                    float f = ((zte) bo.K(el3Var, z22.u)).f();
                    long jF = f16Var2.d().f(ok7.u(f, f));
                    f33 f33Var = (f33) f16Var2.d().b;
                    tre treVar = (tre) f33Var.b;
                    qt2[] qt2VarArr = treVar.d;
                    k80.o0(0, qt2VarArr.length, null, qt2VarArr);
                    treVar.e = 0;
                    tre treVar2 = (tre) f33Var.c;
                    qt2[] qt2VarArr2 = treVar2.d;
                    k80.o0(0, qt2VarArr2.length, null, qt2VarArr2);
                    treVar2.e = 0;
                    f33Var.a = 0L;
                    el3Var.Q0(new nk3(pl3.c(jF), true));
                }
                f16Var2.a();
                return;
            }
            c16 c16Var = (c16) obj6;
            if (mb9Var == mb9.Initial) {
                return;
            }
            int size6 = arrayList.size();
            int i6 = 0;
            while (true) {
                if (i6 >= size6) {
                    obj3 = null;
                    break;
                }
                obj3 = arrayList.get(i6);
                int i7 = i6;
                if (br7.q(((y06) obj3).a, c16Var.r)) {
                    break;
                } else {
                    i6 = i7 + 1;
                }
            }
            y06 y06Var6 = (y06) obj3;
            if (y06Var6 == null) {
                int size7 = arrayList.size();
                int i8 = 0;
                while (true) {
                    if (i8 >= size7) {
                        obj5 = null;
                        break;
                    }
                    obj5 = arrayList.get(i8);
                    if (((y06) obj5).d) {
                        break;
                    } else {
                        i8++;
                    }
                }
                y06Var6 = (y06) obj5;
                if (y06Var6 == null) {
                    f16Var2.a();
                    return;
                }
                c16Var.r = y06Var6.a;
            }
            if (mb9Var == mb9.Main) {
                if (y06Var6.i) {
                    y06 y06Var7 = c16Var.q;
                    if (y06Var7 == null) {
                        ay0.e("AwaitTouchSlop.initialDown was not initialized");
                        return;
                    }
                    long j3 = c16Var.r;
                    il1 il1Var = f16Var2.i;
                    if (il1Var == null) {
                        ay0.e("AwaitTouchSlop.touchSlopDetector was not initialized");
                        return;
                    }
                    f16Var2.b(y06Var7, j3, il1Var);
                } else if (t40.D(y06Var6)) {
                    int size8 = arrayList.size();
                    int i9 = 0;
                    while (true) {
                        if (i9 >= size8) {
                            obj4 = null;
                            break;
                        }
                        Object obj7 = arrayList.get(i9);
                        if (((y06) obj7).d) {
                            obj4 = obj7;
                            break;
                        }
                        i9++;
                    }
                    y06 y06Var8 = (y06) obj4;
                    if (y06Var8 == null) {
                        f16Var2.a();
                    } else {
                        c16Var.r = y06Var8.a;
                    }
                } else {
                    zte zteVar = (zte) bo.K(el3Var, z22.u);
                    float f2 = yk3.a;
                    float fG = zteVar.g();
                    il1 il1Var2 = f16Var2.i;
                    if (il1Var2 == null) {
                        ay0.e("Touch slop detector not initialized.");
                        return;
                    }
                    long jE = il1Var2.e(fG, t40.J(y06Var6, el3Var.q, new x06(i), true), true);
                    if ((9223372034707292159L & jE) != 9205357640488583168L) {
                        y06Var6.i = true;
                        y06 y06Var9 = c16Var.q;
                        y06Var9.getClass();
                        y06 y06Var10 = y06Var6;
                        f16Var2.f(y06Var9, y06Var10, new x06(i), jE);
                        y06Var6 = y06Var10;
                        f16Var2.e(y06Var6, new x06(i), jE);
                        long j4 = y06Var6.a;
                        d16 d16Var3 = f16Var2.c;
                        if (d16Var3 == null) {
                            d16Var3 = new d16();
                            d16Var3.q = Long.MAX_VALUE;
                            f16Var2.c = d16Var3;
                        }
                        d16Var3.q = j4;
                        f16Var2.f = d16Var3;
                    } else {
                        c16Var.s = true;
                    }
                }
            }
            if (mb9Var == mb9.Final && c16Var.s) {
                if (!y06Var6.i) {
                    c16Var.s = false;
                    return;
                }
                y06 y06Var11 = c16Var.q;
                if (y06Var11 == null) {
                    ay0.e("AwaitTouchSlop.initialDown was not initialized");
                    return;
                }
                long j5 = c16Var.r;
                il1 il1Var3 = f16Var2.i;
                if (il1Var3 != null) {
                    f16Var2.b(y06Var11, j5, il1Var3);
                } else {
                    ay0.e("AwaitTouchSlop.touchSlopDetector was not initialized");
                }
            }
        }
    }

    @Override // defpackage.ub9
    public void y(lb9 lb9Var, mb9 mb9Var, long j) {
        Object obj;
        Object obj2;
        Object obj3;
        Object obj4;
        boolean z = true;
        this.y = true;
        if (this.u == null) {
            i85 i85Var = new i85(this);
            I0(i85Var);
            this.u = i85Var;
        }
        if (this.s) {
            bgf bgfVar = this.D;
            int i = 0;
            Object obj5 = bgfVar;
            if (bgfVar == null) {
                gk3 gk3Var = this.z;
                gk3 gk3Var2 = gk3Var;
                if (gk3Var == null) {
                    fk3 fk3Var = fk3.NotInitialized;
                    gk3 gk3Var3 = new gk3();
                    gk3Var3.Q = fk3Var;
                    gk3Var3.R = false;
                    this.z = gk3Var3;
                    gk3Var2 = gk3Var3;
                }
                this.D = gk3Var2;
                obj5 = gk3Var2;
            }
            if (obj5 instanceof gk3) {
                gk3 gk3Var4 = (gk3) obj5;
                if (!lb9Var.a.isEmpty() && qfd.e(lb9Var, false)) {
                    rb9 rb9Var = (rb9) bu1.x0(lb9Var.a);
                    fk3 fk3Var2 = zk3.a[gk3Var4.Q.ordinal()] == 1 ? !a1() ? fk3.Yes : fk3.No : gk3Var4.Q;
                    gk3Var4.Q = fk3Var2;
                    if (mb9Var == mb9.Initial && fk3Var2 == fk3.No) {
                        rb9Var.a();
                        gk3Var4.R = true;
                    }
                    if (mb9Var == mb9.Main) {
                        if (fk3Var2 == fk3.Yes) {
                            P0(this, rb9Var, rb9Var.a, 0L, 12);
                            return;
                        }
                        if (gk3Var4.R) {
                            Z0(rb9Var, rb9Var, 0L);
                            Y0(0L, rb9Var);
                            long j2 = rb9Var.a;
                            jk3 jk3Var = this.A;
                            if (jk3Var == null) {
                                jk3Var = new jk3();
                                jk3Var.Q = Long.MAX_VALUE;
                                this.A = jk3Var;
                            }
                            jk3Var.Q = j2;
                            this.D = jk3Var;
                            return;
                        }
                        return;
                    }
                    return;
                }
                return;
            }
            Object obj6 = null;
            if (!(obj5 instanceof ik3)) {
                if (obj5 instanceof hk3) {
                    hk3 hk3Var = (hk3) obj5;
                    if (mb9Var != mb9.Final) {
                        return;
                    }
                    List list = lb9Var.a;
                    int size = list.size();
                    int i2 = 0;
                    while (true) {
                        if (i2 >= size) {
                            break;
                        }
                        if (((rb9) list.get(i2)).b()) {
                            z = false;
                            break;
                        }
                        i2++;
                    }
                    int size2 = list.size();
                    while (true) {
                        if (i >= size2) {
                            break;
                        }
                        if (!((rb9) list.get(i)).d) {
                            i++;
                        } else if (!list.isEmpty()) {
                            if (z) {
                                long j3 = ((rb9) bu1.x0(list)).c;
                                rb9 rb9Var2 = hk3Var.Q;
                                rb9Var2.getClass();
                                long jD = ip8.d(j3, rb9Var2.c);
                                rb9 rb9Var3 = hk3Var.Q;
                                if (rb9Var3 != null) {
                                    P0(this, rb9Var3, hk3Var.R, jD, 8);
                                    return;
                                } else {
                                    ay0.e("AwaitGesturePickup.initialDown was not initialized.");
                                    return;
                                }
                            }
                            return;
                        }
                    }
                    N0();
                    return;
                }
                if (!(obj5 instanceof jk3)) {
                    ygf.a();
                    return;
                }
                jk3 jk3Var2 = (jk3) obj5;
                if (mb9Var != mb9.Main) {
                    return;
                }
                long j4 = jk3Var2.Q;
                List list2 = lb9Var.a;
                int size3 = list2.size();
                int i3 = 0;
                while (true) {
                    if (i3 >= size3) {
                        obj = null;
                        break;
                    }
                    obj = list2.get(i3);
                    if (br7.q(((rb9) obj).a, j4)) {
                        break;
                    } else {
                        i3++;
                    }
                }
                rb9 rb9Var4 = (rb9) obj;
                if (rb9Var4 == null) {
                    return;
                }
                boolean zX = mq7.x(rb9Var4);
                Object obj7 = kk3.a;
                if (!zX) {
                    if (rb9Var4.b()) {
                        W0().e(obj7);
                        return;
                    } else {
                        if (ip8.c(mq7.F(rb9Var4, true)) == 0.0f) {
                            return;
                        }
                        Y0(mq7.F(rb9Var4, false), rb9Var4);
                        rb9Var4.a();
                        return;
                    }
                }
                List list3 = lb9Var.a;
                int size4 = list3.size();
                int i4 = 0;
                while (true) {
                    if (i4 >= size4) {
                        obj2 = null;
                        break;
                    }
                    obj2 = list3.get(i4);
                    if (((rb9) obj2).d) {
                        break;
                    } else {
                        i4++;
                    }
                }
                rb9 rb9Var5 = (rb9) obj2;
                if (rb9Var5 != null) {
                    jk3Var2.Q = rb9Var5.a;
                    return;
                }
                if (rb9Var4.b() || !mq7.x(rb9Var4)) {
                    W0().e(obj7);
                } else {
                    qk7.m(X0(), rb9Var4, 0L);
                    float f = ((zte) bo.K(this, z22.u)).f();
                    long jF = X0().f(ok7.u(f, f));
                    f33 f33Var = (f33) X0().b;
                    tre treVar = (tre) f33Var.b;
                    qt2[] qt2VarArr = treVar.d;
                    k80.o0(0, qt2VarArr.length, null, qt2VarArr);
                    treVar.e = 0;
                    tre treVar2 = (tre) f33Var.c;
                    qt2[] qt2VarArr2 = treVar2.d;
                    k80.o0(0, qt2VarArr2.length, null, qt2VarArr2);
                    treVar2.e = 0;
                    f33Var.a = 0L;
                    W0().e(new nk3(pl3.c(jF), false));
                    this.y = false;
                }
                N0();
                return;
            }
            ik3 ik3Var = (ik3) obj5;
            if (mb9Var == mb9.Initial) {
                return;
            }
            List list4 = lb9Var.a;
            int size5 = list4.size();
            int i5 = 0;
            while (true) {
                if (i5 >= size5) {
                    obj3 = null;
                    break;
                }
                obj3 = list4.get(i5);
                if (br7.q(((rb9) obj3).a, ik3Var.R)) {
                    break;
                } else {
                    i5++;
                }
            }
            rb9 rb9Var6 = (rb9) obj3;
            if (rb9Var6 == null) {
                int size6 = list4.size();
                int i6 = 0;
                while (true) {
                    if (i6 >= size6) {
                        obj4 = null;
                        break;
                    }
                    obj4 = list4.get(i6);
                    if (((rb9) obj4).d) {
                        break;
                    } else {
                        i6++;
                    }
                }
                rb9Var6 = (rb9) obj4;
                if (rb9Var6 == null) {
                    N0();
                    return;
                }
                ik3Var.R = rb9Var6.a;
            }
            if (mb9Var == mb9.Main) {
                if (rb9Var6.b()) {
                    rb9 rb9Var7 = ik3Var.Q;
                    if (rb9Var7 == null) {
                        ay0.e("AwaitTouchSlop.initialDown was not initialized");
                        return;
                    }
                    long j5 = ik3Var.R;
                    il1 il1Var = this.G;
                    if (il1Var == null) {
                        ay0.e("AwaitTouchSlop.touchSlopDetector was not initialized");
                        return;
                    }
                    O0(rb9Var7, j5, il1Var);
                } else if (mq7.x(rb9Var6)) {
                    int size7 = list4.size();
                    int i7 = 0;
                    while (true) {
                        if (i7 >= size7) {
                            break;
                        }
                        Object obj8 = list4.get(i7);
                        if (((rb9) obj8).d) {
                            obj6 = obj8;
                            break;
                        }
                        i7++;
                    }
                    rb9 rb9Var8 = (rb9) obj6;
                    if (rb9Var8 == null) {
                        N0();
                    } else {
                        ik3Var.R = rb9Var8.a;
                    }
                } else {
                    float fG = yk3.g((zte) bo.K(this, z22.u), rb9Var6.i);
                    il1 il1Var2 = this.G;
                    if (il1Var2 == null) {
                        ay0.e("Touch slop detector not initialized.");
                        return;
                    }
                    long jE = il1Var2.e(fG, mq7.F(rb9Var6, true), true);
                    if ((9223372034707292159L & jE) != 9205357640488583168L) {
                        boolean zR = R(rb9Var6);
                        ssd ssdVarR = br7.r(this, i85.p);
                        i85 i85Var2 = ssdVarR instanceof i85 ? (i85) ssdVarR : null;
                        h85 h85Var = i85Var2 != null ? i85Var2.o : null;
                        boolean z2 = h85Var != null && h85Var.R(rb9Var6);
                        if (zR || !z2) {
                            rb9Var6.a();
                            rb9 rb9Var9 = ik3Var.Q;
                            rb9Var9.getClass();
                            Z0(rb9Var9, rb9Var6, jE);
                            Y0(jE, rb9Var6);
                            long j6 = rb9Var6.a;
                            jk3 jk3Var3 = this.A;
                            if (jk3Var3 == null) {
                                jk3Var3 = new jk3();
                                jk3Var3.Q = Long.MAX_VALUE;
                                this.A = jk3Var3;
                            }
                            jk3Var3.Q = j6;
                            this.D = jk3Var3;
                        } else {
                            ik3Var.S = true;
                        }
                    } else {
                        ik3Var.S = true;
                    }
                }
            }
            if (mb9Var == mb9.Final && ik3Var.S) {
                if (!rb9Var6.b()) {
                    ik3Var.S = false;
                    return;
                }
                rb9 rb9Var10 = ik3Var.Q;
                if (rb9Var10 == null) {
                    ay0.e("AwaitTouchSlop.initialDown was not initialized");
                    return;
                }
                long j7 = ik3Var.R;
                il1 il1Var3 = this.G;
                if (il1Var3 != null) {
                    O0(rb9Var10, j7, il1Var3);
                } else {
                    ay0.e("AwaitTouchSlop.touchSlopDetector was not initialized");
                }
            }
        }
    }

    @Override // defpackage.q28
    public void z0() {
        H();
    }

    @Override // defpackage.ub9
    public final void M() {
    }
}
