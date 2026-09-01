package defpackage;

import android.graphics.Canvas;
import android.graphics.Outline;
import android.graphics.Path;
import android.graphics.RectF;
import android.os.Build;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class of5 {
    public static final ap6 y;
    public final qf5 a;
    public Outline f;
    public float j;
    public er7 k;
    public br l;
    public br m;
    public boolean n;
    public g61 o;
    public uq p;
    public int q;
    public boolean s;
    public long t;
    public long u;
    public long v;
    public boolean w;
    public RectF x;
    public m73 b = flb.g;
    public ip6 c = ip6.Ltr;
    public x45 d = zu2.s;
    public final ce e = new ce(22, this);
    public boolean g = true;
    public long h = 0;
    public long i = 9205357640488583168L;
    public final ms r = new ms();

    static {
        String lowerCase = Build.FINGERPRINT.toLowerCase(Locale.ROOT);
        lowerCase.getClass();
        y = lowerCase.equals("robolectric") ? h1c.g : Build.VERSION.SDK_INT >= 28 ? ep6.a : hpe.f;
    }

    public of5(qf5 qf5Var) {
        this.a = qf5Var;
        qf5Var.D(false);
        this.t = 0L;
        this.u = 0L;
        this.v = 9205357640488583168L;
    }

    public final void a() {
        Outline outline;
        if (this.g) {
            boolean z = this.w;
            Outline outline2 = null;
            qf5 qf5Var = this.a;
            if (z || qf5Var.L() > 0.0f) {
                br brVar = this.l;
                if (brVar != null) {
                    RectF rectF = this.x;
                    if (rectF == null) {
                        rectF = new RectF();
                        this.x = rectF;
                    }
                    boolean z2 = brVar instanceof br;
                    if (!z2) {
                        ik4.k("Unable to obtain android.graphics.Path");
                        return;
                    }
                    Path path = brVar.a;
                    path.computeBounds(rectF, false);
                    int i = Build.VERSION.SDK_INT;
                    if (i > 28 || path.isConvex()) {
                        outline = this.f;
                        if (outline == null) {
                            outline = new Outline();
                            this.f = outline;
                        }
                        if (i >= 30) {
                            u4.p(outline, brVar);
                        } else {
                            if (!z2) {
                                ik4.k("Unable to obtain android.graphics.Path");
                                return;
                            }
                            outline.setConvexPath(path);
                        }
                        this.n = !outline.canClip();
                    } else {
                        Outline outline3 = this.f;
                        if (outline3 != null) {
                            outline3.setEmpty();
                        }
                        this.n = true;
                        outline = null;
                    }
                    this.l = brVar;
                    if (outline != null) {
                        outline.setAlpha(qf5Var.a());
                        outline2 = outline;
                    }
                    qf5Var.h(outline2, (4294967295L & ((long) Math.round(rectF.height()))) | (((long) Math.round(rectF.width())) << 32));
                    if (this.n && this.w) {
                        qf5Var.D(false);
                        qf5Var.j();
                    } else {
                        qf5Var.D(this.w);
                    }
                } else {
                    qf5Var.D(this.w);
                    Outline outline4 = this.f;
                    if (outline4 == null) {
                        outline4 = new Outline();
                        this.f = outline4;
                    }
                    Outline outline5 = outline4;
                    long jC0 = nk7.C0(this.u);
                    long j = this.h;
                    long j2 = this.i;
                    if (j2 != 9205357640488583168L) {
                        jC0 = j2;
                    }
                    int i2 = (int) (j >> 32);
                    int i3 = (int) (j & 4294967295L);
                    int i4 = (int) (jC0 >> 32);
                    int i5 = (int) (jC0 & 4294967295L);
                    outline5.setRoundRect(Math.round(Float.intBitsToFloat(i2)), Math.round(Float.intBitsToFloat(i3)), Math.round(Float.intBitsToFloat(i4) + Float.intBitsToFloat(i2)), Math.round(Float.intBitsToFloat(i5) + Float.intBitsToFloat(i3)), this.j);
                    outline5.setAlpha(qf5Var.a());
                    qf5Var.h(outline5, (4294967295L & ((long) Math.round(Float.intBitsToFloat(i5)))) | (((long) Math.round(Float.intBitsToFloat(i4))) << 32));
                }
            } else {
                qf5Var.D(false);
                qf5Var.h(null, 0L);
            }
        }
        this.g = false;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0068  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void b() {
        /*
            r15 = this;
            boolean r0 = r15.s
            if (r0 == 0) goto L75
            int r0 = r15.q
            if (r0 != 0) goto L75
            ms r0 = r15.r
            java.lang.Object r1 = r0.b
            of5 r1 = (defpackage.of5) r1
            if (r1 == 0) goto L1c
            int r2 = r1.q
            int r2 = r2 + (-1)
            r1.q = r2
            r1.b()
            r1 = 0
            r0.b = r1
        L1c:
            java.lang.Object r0 = r0.d
            g78 r0 = (defpackage.g78) r0
            if (r0 == 0) goto L70
            java.lang.Object[] r1 = r0.b
            long[] r2 = r0.a
            int r3 = r2.length
            int r3 = r3 + (-2)
            if (r3 < 0) goto L6d
            r4 = 0
            r5 = r4
        L2d:
            r6 = r2[r5]
            long r8 = ~r6
            r10 = 7
            long r8 = r8 << r10
            long r8 = r8 & r6
            r10 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r8 = r8 & r10
            int r8 = (r8 > r10 ? 1 : (r8 == r10 ? 0 : -1))
            if (r8 == 0) goto L68
            int r8 = r5 - r3
            int r8 = ~r8
            int r8 = r8 >>> 31
            r9 = 8
            int r8 = 8 - r8
            r10 = r4
        L47:
            if (r10 >= r8) goto L66
            r11 = 255(0xff, double:1.26E-321)
            long r11 = r11 & r6
            r13 = 128(0x80, double:6.3E-322)
            int r11 = (r11 > r13 ? 1 : (r11 == r13 ? 0 : -1))
            if (r11 >= 0) goto L62
            int r11 = r5 << 3
            int r11 = r11 + r10
            r11 = r1[r11]
            of5 r11 = (defpackage.of5) r11
            int r12 = r11.q
            int r12 = r12 + (-1)
            r11.q = r12
            r11.b()
        L62:
            long r6 = r6 >> r9
            int r10 = r10 + 1
            goto L47
        L66:
            if (r8 != r9) goto L6d
        L68:
            if (r5 == r3) goto L6d
            int r5 = r5 + 1
            goto L2d
        L6d:
            r0.b()
        L70:
            qf5 r15 = r15.a
            r15.j()
        L75:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.of5.b():void");
    }

    public final void c(e61 e61Var, of5 of5Var) {
        boolean z;
        boolean z2;
        Canvas canvas;
        boolean z3;
        float f;
        if (this.s) {
            return;
        }
        a();
        qf5 qf5Var = this.a;
        if (!qf5Var.q()) {
            try {
                qf5Var.F(this.b, this.c, this, this.e);
            } catch (Throwable unused) {
            }
        }
        boolean z4 = qf5Var.L() > 0.0f;
        if (z4) {
            e61Var.t();
        }
        Canvas canvasA = qm.a(e61Var);
        boolean zIsHardwareAccelerated = canvasA.isHardwareAccelerated();
        if (!zIsHardwareAccelerated) {
            long j = this.t;
            float f2 = (int) (j >> 32);
            float f3 = (int) (j & 4294967295L);
            long j2 = this.u;
            float f4 = ((int) (j2 >> 32)) + f2;
            float f5 = ((int) (j2 & 4294967295L)) + f3;
            float fA = qf5Var.a();
            bs0 bs0VarM = qf5Var.m();
            int iO = qf5Var.O();
            if (fA < 1.0f || iO != 3 || bs0VarM != null || qf5Var.l() == 1) {
                uq uqVarZ = this.p;
                if (uqVarZ == null) {
                    uqVarZ = rx0.z();
                    this.p = uqVarZ;
                }
                uqVarZ.c(fA);
                uqVarZ.d(iO);
                uqVarZ.f(bs0VarM);
                canvasA = canvasA;
                f = f2;
                canvasA.saveLayer(f, f3, f4, f5, rx0.P(uqVarZ));
            } else {
                canvasA.save();
                canvasA = canvasA;
                f = f2;
            }
            canvasA.translate(f, f3);
            canvasA.concat(qf5Var.J());
        }
        boolean z5 = !zIsHardwareAccelerated && this.w;
        if (z5) {
            e61Var.h();
            er7 er7VarE = e();
            if (er7VarE instanceof ow8) {
                e61Var.r(((ow8) er7VarE).d);
            } else if (er7VarE instanceof pw8) {
                br brVarA = this.m;
                if (brVarA != null) {
                    brVarA.a.rewind();
                } else {
                    brVarA = er.a();
                    this.m = brVarA;
                }
                b09.n(brVarA, ((pw8) er7VarE).d);
                e61Var.n(brVarA);
            } else {
                if (!(er7VarE instanceof nw8)) {
                    ygf.a();
                    return;
                }
                e61Var.n(((nw8) er7VarE).d);
            }
        }
        if (of5Var != null) {
            ms msVar = of5Var.r;
            if (!msVar.a) {
                a26.a("Only add dependencies during a tracking");
            }
            g78 g78Var = (g78) msVar.d;
            if (g78Var != null) {
                g78Var.a(this);
            } else if (((of5) msVar.b) != null) {
                g78 g78Var2 = iqb.a;
                g78 g78Var3 = new g78();
                of5 of5Var2 = (of5) msVar.b;
                of5Var2.getClass();
                g78Var3.a(of5Var2);
                g78Var3.a(this);
                msVar.d = g78Var3;
                msVar.b = null;
            } else {
                msVar.b = this;
            }
            g78 g78Var4 = (g78) msVar.e;
            if (g78Var4 != null) {
                z3 = !g78Var4.l(this);
            } else if (((of5) msVar.c) != this) {
                z3 = true;
            } else {
                msVar.c = null;
                z3 = false;
            }
            if (z3) {
                this.q++;
            }
        }
        if (((pm) e61Var).a.isHardwareAccelerated()) {
            z = z4;
            z2 = z5;
            canvas = canvasA;
            qf5Var.k(e61Var);
        } else {
            g61 g61Var = this.o;
            if (g61Var == null) {
                g61Var = new g61();
                this.o = g61Var;
            }
            m50 m50Var = g61Var.b;
            m73 m73Var = this.b;
            ip6 ip6Var = this.c;
            long jC0 = nk7.C0(this.u);
            m73 m73VarY = m50Var.y();
            ip6 ip6VarA = m50Var.A();
            e61 e61VarX = m50Var.x();
            z2 = z5;
            canvas = canvasA;
            long jB = m50Var.B();
            z = z4;
            of5 of5Var3 = (of5) m50Var.c;
            m50Var.O(m73Var);
            m50Var.P(ip6Var);
            m50Var.M(e61Var);
            m50Var.Q(jC0);
            m50Var.c = this;
            e61Var.h();
            try {
                d(g61Var);
            } finally {
                e61Var.q();
                m50Var.O(m73VarY);
                m50Var.P(ip6VarA);
                m50Var.M(e61VarX);
                m50Var.Q(jB);
                m50Var.c = of5Var3;
            }
        }
        if (z2) {
            e61Var.q();
        }
        if (z) {
            e61Var.k();
        }
        if (zIsHardwareAccelerated) {
            return;
        }
        canvas.restore();
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0094  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void d(defpackage.zl3 r14) {
        /*
            r13 = this;
            ms r0 = r13.r
            java.lang.Object r1 = r0.b
            of5 r1 = (defpackage.of5) r1
            r0.c = r1
            java.lang.Object r1 = r0.d
            g78 r1 = (defpackage.g78) r1
            if (r1 == 0) goto L29
            boolean r2 = r1.h()
            if (r2 == 0) goto L29
            java.lang.Object r2 = r0.e
            g78 r2 = (defpackage.g78) r2
            if (r2 != 0) goto L23
            g78 r2 = defpackage.iqb.a
            g78 r2 = new g78
            r2.<init>()
            r0.e = r2
        L23:
            r2.j(r1)
            r1.b()
        L29:
            r1 = 1
            r0.a = r1
            x45 r13 = r13.d
            r13.invoke(r14)
            r13 = 0
            r0.a = r13
            java.lang.Object r14 = r0.c
            of5 r14 = (defpackage.of5) r14
            if (r14 == 0) goto L43
            int r1 = r14.q
            int r1 = r1 + (-1)
            r14.q = r1
            r14.b()
        L43:
            java.lang.Object r14 = r0.e
            g78 r14 = (defpackage.g78) r14
            if (r14 == 0) goto L9c
            boolean r0 = r14.h()
            if (r0 == 0) goto L9c
            java.lang.Object[] r0 = r14.b
            long[] r1 = r14.a
            int r2 = r1.length
            int r2 = r2 + (-2)
            if (r2 < 0) goto L99
            r3 = r13
        L59:
            r4 = r1[r3]
            long r6 = ~r4
            r8 = 7
            long r6 = r6 << r8
            long r6 = r6 & r4
            r8 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r6 = r6 & r8
            int r6 = (r6 > r8 ? 1 : (r6 == r8 ? 0 : -1))
            if (r6 == 0) goto L94
            int r6 = r3 - r2
            int r6 = ~r6
            int r6 = r6 >>> 31
            r7 = 8
            int r6 = 8 - r6
            r8 = r13
        L73:
            if (r8 >= r6) goto L92
            r9 = 255(0xff, double:1.26E-321)
            long r9 = r9 & r4
            r11 = 128(0x80, double:6.3E-322)
            int r9 = (r9 > r11 ? 1 : (r9 == r11 ? 0 : -1))
            if (r9 >= 0) goto L8e
            int r9 = r3 << 3
            int r9 = r9 + r8
            r9 = r0[r9]
            of5 r9 = (defpackage.of5) r9
            int r10 = r9.q
            int r10 = r10 + (-1)
            r9.q = r10
            r9.b()
        L8e:
            long r4 = r4 >> r7
            int r8 = r8 + 1
            goto L73
        L92:
            if (r6 != r7) goto L99
        L94:
            if (r3 == r2) goto L99
            int r3 = r3 + 1
            goto L59
        L99:
            r14.b()
        L9c:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.of5.d(zl3):void");
    }

    public final er7 e() {
        er7 ow8Var;
        er7 er7Var = this.k;
        br brVar = this.l;
        if (er7Var != null) {
            return er7Var;
        }
        if (brVar != null) {
            nw8 nw8Var = new nw8(brVar);
            this.k = nw8Var;
            return nw8Var;
        }
        long jC0 = nk7.C0(this.u);
        long j = this.h;
        long j2 = this.i;
        if (j2 != 9205357640488583168L) {
            jC0 = j2;
        }
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j & 4294967295L));
        float fIntBitsToFloat3 = Float.intBitsToFloat((int) (jC0 >> 32)) + fIntBitsToFloat;
        float fIntBitsToFloat4 = Float.intBitsToFloat((int) (jC0 & 4294967295L)) + fIntBitsToFloat2;
        float f = this.j;
        if (f > 0.0f) {
            long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(f)) << 32) | (((long) Float.floatToRawIntBits(f)) & 4294967295L);
            float fIntBitsToFloat5 = Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32));
            float fIntBitsToFloat6 = Float.intBitsToFloat((int) (jFloatToRawIntBits & 4294967295L));
            long jFloatToRawIntBits2 = (((long) Float.floatToRawIntBits(fIntBitsToFloat5)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat6)) & 4294967295L);
            ow8Var = new pw8(new wlb(fIntBitsToFloat, fIntBitsToFloat2, fIntBitsToFloat3, fIntBitsToFloat4, jFloatToRawIntBits2, jFloatToRawIntBits2, jFloatToRawIntBits2, jFloatToRawIntBits2));
        } else {
            ow8Var = new ow8(new zwa(fIntBitsToFloat, fIntBitsToFloat2, fIntBitsToFloat3, fIntBitsToFloat4));
        }
        this.k = ow8Var;
        return ow8Var;
    }

    public final void f(m73 m73Var, ip6 ip6Var, long j, x45 x45Var) {
        boolean zA = s46.a(this.u, j);
        qf5 qf5Var = this.a;
        if (!zA) {
            this.u = j;
            long j2 = this.t;
            qf5Var.o((int) (j2 >> 32), (int) (j2 & 4294967295L), j);
            if (this.i == 9205357640488583168L) {
                this.g = true;
                a();
            }
        }
        this.b = m73Var;
        this.c = ip6Var;
        this.d = x45Var;
        qf5Var.F(m73Var, ip6Var, this, this.e);
    }

    public final void g(float f) {
        qf5 qf5Var = this.a;
        if (qf5Var.a() == f) {
            return;
        }
        qf5Var.u(f);
    }

    public final void h(float f, long j, long j2) {
        if (ip8.b(this.h, j) && dfc.a(this.i, j2) && this.j == f && this.l == null) {
            return;
        }
        this.k = null;
        this.l = null;
        this.g = true;
        this.n = false;
        this.h = j;
        this.i = j2;
        this.j = f;
        a();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object i(defpackage.p92 r5) {
        /*
            r4 = this;
            boolean r0 = r5 instanceof defpackage.nf5
            if (r0 == 0) goto L13
            r0 = r5
            nf5 r0 = (defpackage.nf5) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            nf5 r0 = new nf5
            r0.<init>(r4, r5)
        L18:
            java.lang.Object r5 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r5)
            goto L3c
        L27:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L2e:
            defpackage.br7.v(r5)
            r0.d = r3
            ap6 r5 = defpackage.of5.y
            java.lang.Object r5 = r5.f0(r4, r0)
            if (r5 != r1) goto L3c
            return r1
        L3c:
            android.graphics.Bitmap r5 = (android.graphics.Bitmap) r5
            wp r4 = new wp
            r4.<init>(r5)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.of5.i(p92):java.lang.Object");
    }
}
