package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yg8 extends jh8 {
    public final q28 c;
    public final ad d;
    public final ab7 e;
    public eh8 f;
    public lb9 g;
    public boolean h;
    public boolean i;
    public boolean j;

    public yg8(q28 q28Var) {
        this.c = q28Var;
        ad adVar = new ad((char) 0, 12);
        adVar.c = new long[2];
        this.d = adVar;
        this.e = new ab7(2);
        this.i = true;
        this.j = true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:161:0x02f8  */
    /* JADX WARN: Type inference failed for: r10v10 */
    /* JADX WARN: Type inference failed for: r1v4, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r5v0, types: [q28] */
    /* JADX WARN: Type inference failed for: r5v1, types: [q28] */
    /* JADX WARN: Type inference failed for: r5v39 */
    /* JADX WARN: Type inference failed for: r5v40, types: [q28] */
    /* JADX WARN: Type inference failed for: r5v41, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r5v42 */
    /* JADX WARN: Type inference failed for: r5v43 */
    /* JADX WARN: Type inference failed for: r5v44 */
    /* JADX WARN: Type inference failed for: r5v45 */
    /* JADX WARN: Type inference failed for: r5v46 */
    /* JADX WARN: Type inference failed for: r5v47 */
    /* JADX WARN: Type inference failed for: r5v7, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r6v22 */
    /* JADX WARN: Type inference failed for: r6v6 */
    /* JADX WARN: Type inference failed for: r6v7, types: [int] */
    /* JADX WARN: Type inference failed for: r8v0 */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v19 */
    /* JADX WARN: Type inference failed for: r8v20, types: [o78] */
    /* JADX WARN: Type inference failed for: r8v21 */
    /* JADX WARN: Type inference failed for: r8v22 */
    /* JADX WARN: Type inference failed for: r8v23, types: [o78] */
    /* JADX WARN: Type inference failed for: r8v25 */
    /* JADX WARN: Type inference failed for: r8v26 */
    /* JADX WARN: Type inference failed for: r8v27 */
    /* JADX WARN: Type inference failed for: r8v28 */
    @Override // defpackage.jh8
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean a(defpackage.ab7 r56, defpackage.hp6 r57, defpackage.o72 r58, boolean r59) {
        /*
            Method dump skipped, instruction units count: 765
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yg8.a(ab7, hp6, o72, boolean):boolean");
    }

    @Override // defpackage.jh8
    public final void b(o72 o72Var) {
        super.b(o72Var);
        lb9 lb9Var = this.g;
        if (lb9Var == null) {
            return;
        }
        this.h = this.i;
        List list = lb9Var.a;
        int size = list.size();
        for (int i = 0; i < size; i++) {
            rb9 rb9Var = (rb9) list.get(i);
            boolean z = rb9Var.d;
            long j = rb9Var.a;
            boolean zA = o72Var.a(j);
            boolean z2 = this.i;
            if ((!z && !zA) || (!z && !z2)) {
                this.d.u(j);
            }
        }
        this.i = false;
        this.j = lb9Var.f == 5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v1 */
    /* JADX WARN: Type inference failed for: r1v10 */
    /* JADX WARN: Type inference failed for: r1v11 */
    /* JADX WARN: Type inference failed for: r1v12 */
    /* JADX WARN: Type inference failed for: r1v2 */
    /* JADX WARN: Type inference failed for: r1v3 */
    /* JADX WARN: Type inference failed for: r1v4, types: [o78] */
    /* JADX WARN: Type inference failed for: r1v5 */
    /* JADX WARN: Type inference failed for: r1v6 */
    /* JADX WARN: Type inference failed for: r1v7, types: [o78] */
    /* JADX WARN: Type inference failed for: r1v9 */
    /* JADX WARN: Type inference failed for: r3v6 */
    /* JADX WARN: Type inference failed for: r8v1, types: [q28] */
    /* JADX WARN: Type inference failed for: r8v10 */
    /* JADX WARN: Type inference failed for: r8v11 */
    /* JADX WARN: Type inference failed for: r8v12 */
    /* JADX WARN: Type inference failed for: r8v2, types: [q28] */
    /* JADX WARN: Type inference failed for: r8v4 */
    /* JADX WARN: Type inference failed for: r8v5, types: [q28] */
    /* JADX WARN: Type inference failed for: r8v6, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r8v7 */
    /* JADX WARN: Type inference failed for: r8v8 */
    /* JADX WARN: Type inference failed for: r8v9 */
    public final void c() {
        o78 o78Var = this.a;
        Object[] objArr = o78Var.a;
        int i = o78Var.c;
        for (int i2 = 0; i2 < i; i2++) {
            ((yg8) objArr[i2]).c();
        }
        ?? Q0 = this.c;
        ?? o78Var2 = 0;
        while (Q0 != 0) {
            if (Q0 instanceof ub9) {
                ((ub9) Q0).H();
            } else if ((Q0.c & 16) != 0 && (Q0 instanceof b43)) {
                q28 q28Var = ((b43) Q0).p;
                int i3 = 0;
                o78Var2 = o78Var2;
                Q0 = Q0;
                while (q28Var != null) {
                    if ((q28Var.c & 16) != 0) {
                        i3++;
                        o78Var2 = o78Var2;
                        if (i3 == 1) {
                            Q0 = q28Var;
                        } else {
                            if (o78Var2 == 0) {
                                o78Var2 = new o78(new q28[16]);
                            }
                            if (Q0 != 0) {
                                o78Var2.b(Q0);
                                Q0 = 0;
                            }
                            o78Var2.b(q28Var);
                        }
                    }
                    q28Var = q28Var.f;
                    o78Var2 = o78Var2;
                    Q0 = Q0;
                }
                if (i3 == 1) {
                }
            }
            Q0 = flb.q0(o78Var2);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r10v4 */
    /* JADX WARN: Type inference failed for: r7v0 */
    /* JADX WARN: Type inference failed for: r7v1, types: [q28] */
    /* JADX WARN: Type inference failed for: r7v10 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v3 */
    /* JADX WARN: Type inference failed for: r7v4, types: [q28] */
    /* JADX WARN: Type inference failed for: r7v5, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r7v6 */
    /* JADX WARN: Type inference failed for: r7v7 */
    /* JADX WARN: Type inference failed for: r7v8 */
    /* JADX WARN: Type inference failed for: r7v9 */
    /* JADX WARN: Type inference failed for: r8v0 */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v10 */
    /* JADX WARN: Type inference failed for: r8v11 */
    /* JADX WARN: Type inference failed for: r8v2 */
    /* JADX WARN: Type inference failed for: r8v3, types: [o78] */
    /* JADX WARN: Type inference failed for: r8v4 */
    /* JADX WARN: Type inference failed for: r8v5 */
    /* JADX WARN: Type inference failed for: r8v6, types: [o78] */
    /* JADX WARN: Type inference failed for: r8v8 */
    /* JADX WARN: Type inference failed for: r8v9 */
    public final boolean d(o72 o72Var) {
        aq6 aq6Var;
        ab7 ab7Var = this.e;
        boolean z = false;
        z = false;
        z = false;
        if (ab7Var.k() != 0) {
            q28 q28Var = this.c;
            if (q28Var.n) {
                eh8 eh8Var = q28Var.h;
                if ((eh8Var == null || (aq6Var = eh8Var.o) == null) ? false : aq6Var.I()) {
                    lb9 lb9Var = this.g;
                    lb9Var.getClass();
                    eh8 eh8Var2 = this.f;
                    eh8Var2.getClass();
                    long j = eh8Var2.c;
                    ?? Q0 = q28Var;
                    ?? o78Var = 0;
                    while (Q0 != 0) {
                        if (Q0 instanceof ub9) {
                            ((ub9) Q0).y(lb9Var, mb9.Final, j);
                        } else if ((Q0.c & 16) != 0 && (Q0 instanceof b43)) {
                            q28 q28Var2 = ((b43) Q0).p;
                            int i = 0;
                            Q0 = Q0;
                            o78Var = o78Var;
                            while (q28Var2 != null) {
                                if ((q28Var2.c & 16) != 0) {
                                    i++;
                                    o78Var = o78Var;
                                    if (i == 1) {
                                        Q0 = q28Var2;
                                    } else {
                                        if (o78Var == 0) {
                                            o78Var = new o78(new q28[16]);
                                        }
                                        if (Q0 != 0) {
                                            o78Var.b(Q0);
                                            Q0 = 0;
                                        }
                                        o78Var.b(q28Var2);
                                    }
                                }
                                q28Var2 = q28Var2.f;
                                Q0 = Q0;
                                o78Var = o78Var;
                            }
                            if (i == 1) {
                            }
                        }
                        Q0 = flb.q0(o78Var);
                    }
                    if (q28Var.n) {
                        o78 o78Var2 = this.a;
                        Object[] objArr = o78Var2.a;
                        int i2 = o78Var2.c;
                        for (int i3 = 0; i3 < i2; i3++) {
                            ((yg8) objArr[i3]).d(o72Var);
                        }
                    }
                    z = true;
                }
            }
        }
        b(o72Var);
        ab7Var.b();
        this.f = null;
        return z;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v10 */
    /* JADX WARN: Type inference failed for: r0v11 */
    /* JADX WARN: Type inference failed for: r0v12 */
    /* JADX WARN: Type inference failed for: r0v13 */
    /* JADX WARN: Type inference failed for: r0v2, types: [q28] */
    /* JADX WARN: Type inference failed for: r0v3, types: [q28] */
    /* JADX WARN: Type inference failed for: r0v5 */
    /* JADX WARN: Type inference failed for: r0v6, types: [q28] */
    /* JADX WARN: Type inference failed for: r0v7, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9 */
    /* JADX WARN: Type inference failed for: r10v7 */
    /* JADX WARN: Type inference failed for: r13v10 */
    /* JADX WARN: Type inference failed for: r13v11 */
    /* JADX WARN: Type inference failed for: r13v12 */
    /* JADX WARN: Type inference failed for: r13v13 */
    /* JADX WARN: Type inference failed for: r13v2 */
    /* JADX WARN: Type inference failed for: r13v3 */
    /* JADX WARN: Type inference failed for: r13v4 */
    /* JADX WARN: Type inference failed for: r13v5, types: [o78] */
    /* JADX WARN: Type inference failed for: r13v6 */
    /* JADX WARN: Type inference failed for: r13v7 */
    /* JADX WARN: Type inference failed for: r13v8, types: [o78] */
    /* JADX WARN: Type inference failed for: r14v6 */
    /* JADX WARN: Type inference failed for: r6v0 */
    /* JADX WARN: Type inference failed for: r6v1, types: [q28] */
    /* JADX WARN: Type inference failed for: r6v10, types: [q28] */
    /* JADX WARN: Type inference failed for: r6v11, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r6v12 */
    /* JADX WARN: Type inference failed for: r6v13 */
    /* JADX WARN: Type inference failed for: r6v14 */
    /* JADX WARN: Type inference failed for: r6v15 */
    /* JADX WARN: Type inference failed for: r6v16 */
    /* JADX WARN: Type inference failed for: r6v17 */
    /* JADX WARN: Type inference failed for: r6v9 */
    /* JADX WARN: Type inference failed for: r7v0 */
    /* JADX WARN: Type inference failed for: r7v1 */
    /* JADX WARN: Type inference failed for: r7v10 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v12 */
    /* JADX WARN: Type inference failed for: r7v3 */
    /* JADX WARN: Type inference failed for: r7v4, types: [o78] */
    /* JADX WARN: Type inference failed for: r7v5 */
    /* JADX WARN: Type inference failed for: r7v6 */
    /* JADX WARN: Type inference failed for: r7v7, types: [o78] */
    /* JADX WARN: Type inference failed for: r7v9 */
    public final boolean e(o72 o72Var, boolean z) {
        aq6 aq6Var;
        if (this.e.k() == 0) {
            return false;
        }
        ?? Q0 = this.c;
        if (Q0.n) {
            eh8 eh8Var = Q0.h;
            if ((eh8Var == null || (aq6Var = eh8Var.o) == null) ? false : aq6Var.I()) {
                lb9 lb9Var = this.g;
                lb9Var.getClass();
                eh8 eh8Var2 = this.f;
                eh8Var2.getClass();
                long j = eh8Var2.c;
                ?? Q02 = Q0;
                ?? o78Var = 0;
                while (Q02 != 0) {
                    if (Q02 instanceof ub9) {
                        ((ub9) Q02).y(lb9Var, mb9.Initial, j);
                    } else if ((Q02.c & 16) != 0 && (Q02 instanceof b43)) {
                        q28 q28Var = ((b43) Q02).p;
                        int i = 0;
                        Q02 = Q02;
                        o78Var = o78Var;
                        while (q28Var != null) {
                            if ((q28Var.c & 16) != 0) {
                                i++;
                                o78Var = o78Var;
                                if (i == 1) {
                                    Q02 = q28Var;
                                } else {
                                    if (o78Var == 0) {
                                        o78Var = new o78(new q28[16]);
                                    }
                                    if (Q02 != 0) {
                                        o78Var.b(Q02);
                                        Q02 = 0;
                                    }
                                    o78Var.b(q28Var);
                                }
                            }
                            q28Var = q28Var.f;
                            Q02 = Q02;
                            o78Var = o78Var;
                        }
                        if (i == 1) {
                        }
                    }
                    Q02 = flb.q0(o78Var);
                }
                if (Q0.n) {
                    o78 o78Var2 = this.a;
                    Object[] objArr = o78Var2.a;
                    int i2 = o78Var2.c;
                    for (int i3 = 0; i3 < i2; i3++) {
                        yg8 yg8Var = (yg8) objArr[i3];
                        this.f.getClass();
                        yg8Var.e(o72Var, z);
                    }
                }
                if (Q0.n) {
                    ?? o78Var3 = 0;
                    while (Q0 != 0) {
                        if (Q0 instanceof ub9) {
                            ((ub9) Q0).y(lb9Var, mb9.Main, j);
                        } else if ((Q0.c & 16) != 0 && (Q0 instanceof b43)) {
                            q28 q28Var2 = ((b43) Q0).p;
                            int i4 = 0;
                            Q0 = Q0;
                            o78Var3 = o78Var3;
                            while (q28Var2 != null) {
                                if ((q28Var2.c & 16) != 0) {
                                    i4++;
                                    o78Var3 = o78Var3;
                                    if (i4 == 1) {
                                        Q0 = q28Var2;
                                    } else {
                                        if (o78Var3 == 0) {
                                            o78Var3 = new o78(new q28[16]);
                                        }
                                        if (Q0 != 0) {
                                            o78Var3.b(Q0);
                                            Q0 = 0;
                                        }
                                        o78Var3.b(q28Var2);
                                    }
                                }
                                q28Var2 = q28Var2.f;
                                Q0 = Q0;
                                o78Var3 = o78Var3;
                            }
                            if (i4 == 1) {
                            }
                        }
                        Q0 = flb.q0(o78Var3);
                    }
                }
                return true;
            }
        }
        return false;
    }

    public final void f(long j, x68 x68Var) {
        ad adVar = this.d;
        if (adVar.g(j) && x68Var.g(this) < 0) {
            adVar.u(j);
            this.e.j(j);
        }
        o78 o78Var = this.a;
        Object[] objArr = o78Var.a;
        int i = o78Var.c;
        for (int i2 = 0; i2 < i; i2++) {
            ((yg8) objArr[i2]).f(j, x68Var);
        }
    }

    public final String toString() {
        return "Node(modifierNode=" + this.c + ", children=" + this.a + ", pointerIds=" + this.d + ')';
    }
}
