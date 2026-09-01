package defpackage;

import android.view.KeyEvent;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cw1 extends r0 {
    public final p68 M;
    public final p68 N;
    public rb9 O;
    public enc P;
    public enc Q;
    public boolean R;
    public boolean S;
    public long X;
    public boolean Y;
    public y06 Z;
    public enc l0;
    public enc m0;
    public boolean n0;
    public boolean o0;
    public long p0;
    public boolean q0;

    public cw1(m45 m45Var, m68 m68Var) {
        super(m68Var, null, false, true, null, null, m45Var);
        int i = ma7.a;
        this.M = new p68(6);
        this.N = new p68(6);
        this.X = -1L;
        this.p0 = -1L;
    }

    @Override // defpackage.q28
    public final void C0() {
        b1();
    }

    @Override // defpackage.r0, defpackage.ub9
    public final void H() {
        super.H();
        Y0(false);
    }

    @Override // defpackage.r0
    public final w4d M0() {
        return null;
    }

    @Override // defpackage.r0
    public final void U0() {
        b1();
    }

    @Override // defpackage.r0
    public final boolean V0(KeyEvent keyEvent) {
        return false;
    }

    @Override // defpackage.r0
    public final void W0(KeyEvent keyEvent) {
        long jP0 = nk7.p0(keyEvent);
        p68 p68Var = this.M;
        boolean z = false;
        if (p68Var.d(jP0) != null) {
            va6 va6Var = (va6) p68Var.d(jP0);
            if (va6Var != null) {
                if (va6Var.f()) {
                    va6Var.m(null);
                } else {
                    z = true;
                }
            }
            p68Var.f(jP0);
        }
        if (z) {
            return;
        }
        this.w.invoke();
    }

    public final void Y0(boolean z) {
        if (z) {
            this.Z = null;
            enc encVar = this.l0;
            if (encVar != null) {
                encVar.m(null);
            }
            this.l0 = null;
            enc encVar2 = this.m0;
            if (encVar2 != null) {
                encVar2.m(null);
            }
            this.m0 = null;
            this.n0 = false;
            this.o0 = false;
            this.p0 = -1L;
            this.q0 = false;
        } else {
            this.O = null;
            enc encVar3 = this.P;
            if (encVar3 != null) {
                encVar3.m(null);
            }
            this.P = null;
            enc encVar4 = this.Q;
            if (encVar4 != null) {
                encVar4.m(null);
            }
            this.Q = null;
            this.R = false;
            this.S = false;
            this.X = -1L;
            this.Y = false;
        }
        P0(z);
    }

    public final void Z0(long j, y06 y06Var) {
        if (this.v && !this.q0) {
            Q0(y06Var.c, true);
            this.p0 = j;
            if (!this.o0 && !this.n0) {
                this.w.invoke();
            }
        }
        this.Z = null;
        this.q0 = false;
        this.n0 = false;
        enc encVar = this.l0;
        if (encVar != null) {
            encVar.m(null);
        }
        this.l0 = null;
        this.o0 = false;
    }

    @Override // defpackage.g16
    public final void a0() {
        Y0(true);
    }

    public final void a1(long j, rb9 rb9Var) {
        if (this.v && !this.Y) {
            Q0(rb9Var.c, false);
            this.X = j;
            if (!this.S && !this.R) {
                this.w.invoke();
            }
        }
        this.O = null;
        this.Y = false;
        this.R = false;
        enc encVar = this.P;
        if (encVar != null) {
            encVar.m(null);
        }
        this.P = null;
        this.S = false;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x009d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void b1() {
        /*
            r24 = this;
            r0 = r24
            p68 r1 = r0.M
            java.lang.Object[] r2 = r1.c
            long[] r3 = r1.a
            int r4 = r3.length
            int r4 = r4 + (-2)
            r5 = 0
            r10 = 7
            r11 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            r13 = 8
            r14 = 0
            if (r4 < 0) goto L5c
            r15 = r14
            r16 = 128(0x80, double:6.3E-322)
        L1a:
            r6 = r3[r15]
            r18 = 255(0xff, double:1.26E-321)
            long r8 = ~r6
            long r8 = r8 << r10
            long r8 = r8 & r6
            long r8 = r8 & r11
            int r8 = (r8 > r11 ? 1 : (r8 == r11 ? 0 : -1))
            if (r8 == 0) goto L53
            int r8 = r15 - r4
            int r8 = ~r8
            int r8 = r8 >>> 31
            int r8 = 8 - r8
            r9 = r14
        L2e:
            if (r9 >= r8) goto L4e
            long r20 = r6 & r18
            int r20 = (r20 > r16 ? 1 : (r20 == r16 ? 0 : -1))
            if (r20 >= 0) goto L46
            int r20 = r15 << 3
            int r20 = r20 + r9
            r20 = r2[r20]
            r21 = r10
            r10 = r20
            va6 r10 = (defpackage.va6) r10
            r10.m(r5)
            goto L48
        L46:
            r21 = r10
        L48:
            long r6 = r6 >> r13
            int r9 = r9 + 1
            r10 = r21
            goto L2e
        L4e:
            r21 = r10
            if (r8 != r13) goto L62
            goto L55
        L53:
            r21 = r10
        L55:
            if (r15 == r4) goto L62
            int r15 = r15 + 1
            r10 = r21
            goto L1a
        L5c:
            r21 = r10
            r16 = 128(0x80, double:6.3E-322)
            r18 = 255(0xff, double:1.26E-321)
        L62:
            r1.a()
            p68 r0 = r0.N
            java.lang.Object[] r1 = r0.c
            long[] r2 = r0.a
            int r3 = r2.length
            int r3 = r3 + (-2)
            if (r3 < 0) goto La2
            r4 = r14
        L71:
            r6 = r2[r4]
            long r8 = ~r6
            long r8 = r8 << r21
            long r8 = r8 & r6
            long r8 = r8 & r11
            int r8 = (r8 > r11 ? 1 : (r8 == r11 ? 0 : -1))
            if (r8 == 0) goto L9d
            int r8 = r4 - r3
            int r8 = ~r8
            int r8 = r8 >>> 31
            int r8 = 8 - r8
            r9 = r14
        L84:
            if (r9 >= r8) goto L9b
            long r22 = r6 & r18
            int r10 = (r22 > r16 ? 1 : (r22 == r16 ? 0 : -1))
            if (r10 < 0) goto L90
            long r6 = r6 >> r13
            int r9 = r9 + 1
            goto L84
        L90:
            int r0 = r4 << 3
            int r0 = r0 + r9
            r0 = r1[r0]
            bw1 r0 = (defpackage.bw1) r0
            r0.getClass()
            throw r5
        L9b:
            if (r8 != r13) goto La2
        L9d:
            if (r4 == r3) goto La2
            int r4 = r4 + 1
            goto L71
        La2:
            r0.a()
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cw1.b1():void");
    }

    @Override // defpackage.g16
    public final void w(xp xpVar, mb9 mb9Var) {
        ArrayList arrayList = (ArrayList) xpVar.c;
        T0();
        if (this.v && this.A == null) {
            i85 i85Var = new i85(this);
            I0(i85Var);
            this.A = i85Var;
        }
        int i = 0;
        if (mb9Var != mb9.Main) {
            if (mb9Var != mb9.Final || this.Z == null || this.o0) {
                return;
            }
            int size = arrayList.size();
            while (i < size) {
                y06 y06Var = (y06) arrayList.get(i);
                if (y06Var.i && y06Var != this.Z) {
                    Y0(true);
                    return;
                }
                i++;
            }
            return;
        }
        if (this.Z == null) {
            int size2 = arrayList.size();
            for (int i2 = 0; i2 < size2; i2++) {
                if (t40.C((y06) arrayList.get(i2))) {
                    y06 y06Var2 = (y06) arrayList.get(0);
                    y06Var2.i = true;
                    this.Z = y06Var2;
                    if (this.v) {
                        enc encVar = this.m0;
                        if (encVar != null && encVar.f()) {
                            ((zte) bo.K(this, z22.u)).getClass();
                            if (y06Var2.b - this.p0 < 40) {
                                this.q0 = true;
                                return;
                            }
                            this.n0 = true;
                            enc encVar2 = this.m0;
                            if (encVar2 != null) {
                                encVar2.m(null);
                            }
                            this.m0 = null;
                        }
                        this.o0 = false;
                        R0(y06Var2);
                        return;
                    }
                    return;
                }
            }
            return;
        }
        if (this.o0) {
            int size3 = arrayList.size();
            for (int i3 = 0; i3 < size3; i3++) {
                y06 y06Var3 = (y06) arrayList.get(i3);
                if (!y06Var3.h || y06Var3.d) {
                    int size4 = arrayList.size();
                    while (i < size4) {
                        ((y06) arrayList.get(i)).i = true;
                        i++;
                    }
                    return;
                }
            }
            y06 y06Var4 = (y06) arrayList.get(0);
            y06Var4.i = true;
            long j = y06Var4.b;
            y06 y06Var5 = this.Z;
            y06Var5.getClass();
            Z0(j, y06Var5);
            return;
        }
        int size5 = arrayList.size();
        for (int i4 = 0; i4 < size5; i4++) {
            y06 y06Var6 = (y06) arrayList.get(i4);
            if (y06Var6.i || !y06Var6.h || y06Var6.d) {
                float fG = ((zte) bo.K(this, z22.u)).g();
                int size6 = arrayList.size();
                for (int i5 = 0; i5 < size6; i5++) {
                    y06 y06Var7 = (y06) arrayList.get(i5);
                    long j2 = y06Var7.c;
                    y06 y06Var8 = this.Z;
                    y06Var8.getClass();
                    boolean z = Math.abs(ip8.c(ip8.d(j2, y06Var8.c))) > fG;
                    if (y06Var7.i || z) {
                        Y0(true);
                        return;
                    }
                }
                return;
            }
        }
        y06 y06Var9 = (y06) arrayList.get(0);
        y06Var9.i = true;
        long j3 = y06Var9.b;
        y06 y06Var10 = this.Z;
        y06Var10.getClass();
        Z0(j3, y06Var10);
    }

    @Override // defpackage.r0, defpackage.ub9
    public final void y(lb9 lb9Var, mb9 mb9Var, long j) {
        super.y(lb9Var, mb9Var, j);
        if (mb9Var != mb9.Main) {
            if (mb9Var != mb9.Final || this.O == null || this.S) {
                return;
            }
            List list = lb9Var.a;
            int size = list.size();
            for (int i = 0; i < size; i++) {
                rb9 rb9Var = (rb9) list.get(i);
                if (rb9Var.b() && rb9Var != this.O) {
                    Y0(false);
                    return;
                }
            }
            return;
        }
        if (this.O == null) {
            if (qfd.e(lb9Var, true)) {
                rb9 rb9Var2 = (rb9) lb9Var.a.get(0);
                rb9Var2.a();
                this.O = rb9Var2;
                if (this.v) {
                    enc encVar = this.Q;
                    if (encVar != null && encVar.f()) {
                        ((zte) bo.K(this, z22.u)).getClass();
                        if (rb9Var2.b - this.X < 40) {
                            this.Y = true;
                            return;
                        }
                        this.R = true;
                        enc encVar2 = this.Q;
                        if (encVar2 != null) {
                            encVar2.m(null);
                        }
                        this.Q = null;
                    }
                    this.S = false;
                    S0(rb9Var2);
                    return;
                }
                return;
            }
            return;
        }
        int i2 = lb9Var.c;
        List list2 = lb9Var.a;
        if (this.S) {
            int size2 = list2.size();
            for (int i3 = 0; i3 < size2; i3++) {
                if (!mq7.x((rb9) list2.get(i3))) {
                    int size3 = list2.size();
                    for (int i4 = 0; i4 < size3; i4++) {
                        ((rb9) list2.get(i4)).a();
                    }
                    return;
                }
            }
            rb9 rb9Var3 = (rb9) list2.get(0);
            rb9Var3.a();
            long j2 = rb9Var3.b;
            rb9 rb9Var4 = this.O;
            rb9Var4.getClass();
            a1(j2, rb9Var4);
            return;
        }
        int size4 = list2.size();
        for (int i5 = 0; i5 < size4; i5++) {
            if (!mq7.w((rb9) list2.get(i5))) {
                long jO0 = O0(j);
                int size5 = list2.size();
                for (int i6 = 0; i6 < size5; i6++) {
                    rb9 rb9Var5 = (rb9) list2.get(i6);
                    if (rb9Var5.b() || mq7.C(rb9Var5, j, jO0)) {
                        Y0(false);
                        return;
                    }
                }
                return;
            }
        }
        rb9 rb9Var6 = (rb9) list2.get(0);
        rb9Var6.a();
        long j3 = rb9Var6.b;
        rb9 rb9Var7 = this.O;
        rb9Var7.getClass();
        a1(j3, rb9Var7);
    }

    @Override // defpackage.r0
    public final void L0(jyb jybVar) {
    }
}
