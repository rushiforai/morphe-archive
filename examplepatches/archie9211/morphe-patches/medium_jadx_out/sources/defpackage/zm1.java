package defpackage;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class zm1 extends u55 implements p72 {
    public final boolean E;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zm1(y28 y28Var, p72 p72Var, ly lyVar, boolean z, e41 e41Var, jkc jkcVar) {
        super(lyVar, e41Var, y28Var, p72Var, olc.e, jkcVar);
        if (y28Var == null) {
            f0(0);
            throw null;
        }
        if (lyVar == null) {
            f0(1);
            throw null;
        }
        if (e41Var == null) {
            f0(2);
            throw null;
        }
        if (jkcVar == null) {
            f0(3);
            throw null;
        }
        this.E = z;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x000e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static /* synthetic */ void f0(int r8) {
        /*
            Method dump skipped, instruction units count: 354
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zm1.f0(int):void");
    }

    @Override // defpackage.u55, defpackage.f41
    public final f41 A(yv2 yv2Var, c28 c28Var, g93 g93Var, e41 e41Var) {
        return (zm1) y0(yv2Var, c28Var, g93Var, e41Var);
    }

    @Override // defpackage.u55, defpackage.yv2
    public final Object F(cw2 cw2Var, Object obj) {
        return cw2Var.h0(this, obj);
    }

    @Override // defpackage.u55
    /* JADX INFO: renamed from: I0, reason: merged with bridge method [inline-methods] */
    public zm1 A0(ly lyVar, e41 e41Var, yv2 yv2Var, s55 s55Var, n98 n98Var, jkc jkcVar) {
        if (yv2Var == null) {
            f0(23);
            throw null;
        }
        if (e41Var == null) {
            f0(24);
            throw null;
        }
        if (lyVar == null) {
            f0(25);
            throw null;
        }
        e41 e41Var2 = e41.DECLARATION;
        if (e41Var == e41Var2 || e41Var == e41.SYNTHESIZED) {
            return new zm1((y28) yv2Var, this, lyVar, this.E, e41Var2, jkcVar);
        }
        throw new IllegalStateException("Attempt at creating a constructor that is not a declaration: \ncopy from: " + this + "\nnewOwner: " + yv2Var + "\nkind: " + e41Var);
    }

    @Override // defpackage.bw2, defpackage.yv2
    /* JADX INFO: renamed from: J0, reason: merged with bridge method [inline-methods] */
    public final y28 h() {
        y28 y28Var = (y28) super.h();
        if (y28Var != null) {
            return y28Var;
        }
        f0(17);
        throw null;
    }

    @Override // defpackage.bw2
    /* JADX INFO: renamed from: K0, reason: merged with bridge method [inline-methods] */
    public final zm1 x0() {
        zm1 zm1Var = (zm1) super.x0();
        if (zm1Var != null) {
            return zm1Var;
        }
        f0(19);
        throw null;
    }

    public final void L0(List list, g93 g93Var) {
        if (list == null) {
            f0(13);
            throw null;
        }
        if (g93Var != null) {
            M0(list, g93Var, h().g0());
        } else {
            f0(14);
            throw null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0021  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void M0(java.util.List r12, defpackage.g93 r13, java.util.List r14) {
        /*
            r11 = this;
            r0 = 0
            if (r12 == 0) goto L61
            if (r13 == 0) goto L5b
            if (r14 == 0) goto L55
            y28 r1 = r11.h()
            boolean r2 = r1.g()
            if (r2 == 0) goto L21
            yv2 r1 = r1.h()
            boolean r2 = r1 instanceof defpackage.y28
            if (r2 == 0) goto L21
            y28 r1 = (defpackage.y28) r1
            yq6 r1 = r1.k0()
            r4 = r1
            goto L22
        L21:
            r4 = r0
        L22:
            y28 r1 = r11.h()
            java.util.List r2 = r1.a0()
            boolean r2 = r2.isEmpty()
            if (r2 != 0) goto L3e
            java.util.List r1 = r1.a0()
            if (r1 == 0) goto L38
        L36:
            r5 = r1
            goto L43
        L38:
            r11 = 15
            f0(r11)
            throw r0
        L3e:
            java.util.List r1 = java.util.Collections.EMPTY_LIST
            if (r1 == 0) goto L4f
            goto L36
        L43:
            r8 = 0
            c28 r9 = defpackage.c28.FINAL
            r3 = 0
            r2 = r11
            r7 = r12
            r10 = r13
            r6 = r14
            r2.D0(r3, r4, r5, r6, r7, r8, r9, r10)
            return
        L4f:
            r11 = 16
            f0(r11)
            throw r0
        L55:
            r11 = 12
            f0(r11)
            throw r0
        L5b:
            r11 = 11
            f0(r11)
            throw r0
        L61:
            r11 = 10
            f0(r11)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zm1.M0(java.util.List, g93, java.util.List):void");
    }

    @Override // defpackage.u55, defpackage.s55, defpackage.s0d
    /* JADX INFO: renamed from: N0, reason: merged with bridge method [inline-methods] */
    public final zm1 f(ixd ixdVar) {
        if (ixdVar != null) {
            return (zm1) super.f(ixdVar);
        }
        f0(20);
        throw null;
    }

    @Override // defpackage.u55, defpackage.f41
    public final void Z(Collection collection) {
        if (collection != null) {
            return;
        }
        f0(22);
        throw null;
    }

    @Override // defpackage.u55, defpackage.f41, defpackage.c41
    public final Collection i() {
        Set set = Collections.EMPTY_SET;
        if (set != null) {
            return set;
        }
        f0(21);
        throw null;
    }

    @Override // defpackage.p72
    public final boolean q() {
        return this.E;
    }

    @Override // defpackage.p72
    public final y28 r() {
        y28 y28VarH = h();
        if (y28VarH != null) {
            return y28VarH;
        }
        f0(18);
        throw null;
    }
}
