package defpackage;

import com.drew.lang.RandomAccessStreamReader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class fh8 {
    public static final t68 a;

    static {
        t68 t68Var = om8.a;
        a = new t68();
    }

    public static final void a(q28 q28Var, int i, int i2) {
        if (!(q28Var instanceof b43)) {
            b(q28Var, i & q28Var.c, i2);
            return;
        }
        b43 b43Var = (b43) q28Var;
        int i3 = b43Var.o;
        b(q28Var, i3 & i, i2);
        int i4 = (~i3) & i;
        for (q28 q28Var2 = b43Var.p; q28Var2 != null; q28Var2 = q28Var2.f) {
            a(q28Var2, i4, i2);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void b(q28 q28Var, int i, int i2) {
        if (i2 != 0 || q28Var.v0()) {
            if ((i & 2) != 0 && (q28Var instanceof sp6)) {
                gx1.M((sp6) q28Var);
                if (i2 == 2) {
                    flb.t0(q28Var, 2).a1();
                }
            }
            if ((i & 128) != 0 && i2 != 2) {
                flb.v0(q28Var).E();
            }
            if ((4194304 & i) != 0 && i2 != 2) {
                flb.v0(q28Var).U(false);
            }
            if ((i & 256) != 0 && (q28Var instanceof od5)) {
                if (i2 == 1) {
                    aq6 aq6VarV0 = flb.v0(q28Var);
                    aq6VarV0.a0(aq6VarV0.P + 1);
                } else if (i2 == 2) {
                    flb.v0(q28Var).a0(r0.P - 1);
                }
                if (i2 != 2) {
                    aq6 aq6VarV02 = flb.v0(q28Var);
                    if (aq6VarV02.P != 0 && !aq6VarV02.p() && !aq6VarV02.q() && !aq6VarV02.O) {
                        mn mnVar = (mn) dq6.a(aq6VarV02);
                        gg5 gg5Var = (gg5) mnVar.o0.f;
                        if (aq6VarV02.P > 0) {
                            ((o78) gg5Var.b).b(aq6VarV02);
                            aq6VarV02.O = true;
                        }
                        mnVar.G(null);
                    }
                }
            }
            if ((i & 4) != 0 && (q28Var instanceof xl3)) {
                wgf.y((xl3) q28Var);
            }
            if ((i & 8) != 0 && (q28Var instanceof xxb)) {
                flb.v0(q28Var).r = true;
            }
            if ((i & 64) != 0 && (q28Var instanceof m49)) {
                eq6 eq6Var = flb.v0((m49) q28Var).G;
                eq6Var.p.r = true;
                mb7 mb7Var = eq6Var.q;
                if (mb7Var != null) {
                    mb7Var.x = true;
                }
            }
            if ((i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 && (q28Var instanceof rr4)) {
                rr4 rr4Var = (rr4) q28Var;
                o51.b = null;
                rr4Var.C(o51.a);
                if (o51.b != null) {
                    q28 q28Var2 = (q28) rr4Var;
                    if (!q28Var2.a.n) {
                        b26.b("visitChildren called on an unattached node");
                    }
                    o78 o78Var = new o78(new q28[16]);
                    q28 q28Var3 = q28Var2.a;
                    q28 q28Var4 = q28Var3.f;
                    if (q28Var4 == null) {
                        flb.X(o78Var, q28Var3);
                    } else {
                        o78Var.b(q28Var4);
                    }
                    while (true) {
                        int i3 = o78Var.c;
                        if (i3 == 0) {
                            break;
                        }
                        q28 q28VarQ0 = (q28) o78Var.m(i3 - 1);
                        if ((q28VarQ0.d & 1024) == 0) {
                            flb.X(o78Var, q28VarQ0);
                        } else {
                            while (true) {
                                if (q28VarQ0 == null) {
                                    break;
                                }
                                if ((q28VarQ0.c & 1024) != 0) {
                                    o78 o78Var2 = null;
                                    while (q28VarQ0 != null) {
                                        if (q28VarQ0 instanceof es4) {
                                            es4 es4Var = (es4) q28VarQ0;
                                            jr4 jr4Var = ((or4) ((mn) flb.w0(es4Var)).getFocusOwner()).d;
                                            if (jr4Var.c.a(es4Var)) {
                                                jr4Var.a();
                                            }
                                        } else if ((q28VarQ0.c & 1024) != 0 && (q28VarQ0 instanceof b43)) {
                                            int i4 = 0;
                                            for (q28 q28Var5 = ((b43) q28VarQ0).p; q28Var5 != null; q28Var5 = q28Var5.f) {
                                                if ((q28Var5.c & 1024) != 0) {
                                                    i4++;
                                                    if (i4 == 1) {
                                                        q28VarQ0 = q28Var5;
                                                    } else {
                                                        if (o78Var2 == null) {
                                                            o78Var2 = new o78(new q28[16]);
                                                        }
                                                        if (q28VarQ0 != null) {
                                                            o78Var2.b(q28VarQ0);
                                                            q28VarQ0 = null;
                                                        }
                                                        o78Var2.b(q28Var5);
                                                    }
                                                }
                                            }
                                            if (i4 == 1) {
                                            }
                                        }
                                        q28VarQ0 = flb.q0(o78Var2);
                                    }
                                } else {
                                    q28VarQ0 = q28VarQ0.f;
                                }
                            }
                        }
                    }
                }
            }
            if ((i & 4096) != 0 && (q28Var instanceof cr4)) {
                cr4 cr4Var = (cr4) q28Var;
                jr4 jr4Var2 = ((or4) ((mn) flb.w0(cr4Var)).getFocusOwner()).d;
                if (jr4Var2.d.a(cr4Var)) {
                    jr4Var2.a();
                }
            }
            if ((i & 2097152) != 0 && (q28Var instanceof g16) && i2 == 2) {
                ((g16) q28Var).a0();
            }
        }
    }

    public static final void c(q28 q28Var) {
        if (!q28Var.n) {
            b26.b("autoInvalidateUpdatedNode called on unattached node");
        }
        a(q28Var, -1, 0);
    }

    public static final int d(p28 p28Var) {
        int i = p28Var instanceof qp6 ? 3 : 1;
        if (p28Var instanceof t06) {
            i |= 4;
        }
        if (p28Var instanceof vxb) {
            i |= 8;
        }
        if (p28Var instanceof yb9) {
            i |= 16;
        }
        if (p28Var instanceof l49) {
            i |= 64;
        }
        return p28Var instanceof my0 ? 524288 | i : i;
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0067  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0088  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0096  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final int e(defpackage.q28 r4) {
        /*
            int r0 = r4.c
            if (r0 == 0) goto L5
            return r0
        L5:
            java.lang.Class r0 = r4.getClass()
            t68 r1 = defpackage.fh8.a
            int r2 = r1.d(r0)
            if (r2 < 0) goto L16
            int[] r4 = r1.c
            r4 = r4[r2]
            return r4
        L16:
            boolean r2 = r4 instanceof defpackage.sp6
            if (r2 == 0) goto L1c
            r2 = 3
            goto L1d
        L1c:
            r2 = 1
        L1d:
            boolean r3 = r4 instanceof defpackage.xl3
            if (r3 == 0) goto L23
            r2 = r2 | 4
        L23:
            boolean r3 = r4 instanceof defpackage.xxb
            if (r3 == 0) goto L29
            r2 = r2 | 8
        L29:
            boolean r3 = r4 instanceof defpackage.ub9
            if (r3 == 0) goto L2f
            r2 = r2 | 16
        L2f:
            boolean r3 = r4 instanceof defpackage.t28
            if (r3 == 0) goto L35
            r2 = r2 | 32
        L35:
            boolean r3 = r4 instanceof defpackage.m49
            if (r3 == 0) goto L3b
            r2 = r2 | 64
        L3b:
            boolean r3 = r4 instanceof defpackage.gr8
            if (r3 == 0) goto L43
            r3 = 4194304(0x400000, float:5.877472E-39)
        L41:
            r2 = r2 | r3
            goto L51
        L43:
            boolean r3 = r4 instanceof defpackage.fp6
            if (r3 == 0) goto L4b
            r3 = 4194432(0x400080, float:5.877651E-39)
            goto L41
        L4b:
            boolean r3 = r4 instanceof defpackage.fl7
            if (r3 == 0) goto L51
            r2 = r2 | 128(0x80, float:1.8E-43)
        L51:
            boolean r3 = r4 instanceof defpackage.od5
            if (r3 == 0) goto L57
            r2 = r2 | 256(0x100, float:3.59E-43)
        L57:
            boolean r3 = r4 instanceof defpackage.es4
            if (r3 == 0) goto L5d
            r2 = r2 | 1024(0x400, float:1.435E-42)
        L5d:
            boolean r3 = r4 instanceof defpackage.rr4
            if (r3 == 0) goto L63
            r2 = r2 | 2048(0x800, float:2.87E-42)
        L63:
            boolean r3 = r4 instanceof defpackage.cr4
            if (r3 == 0) goto L69
            r2 = r2 | 4096(0x1000, float:5.74E-42)
        L69:
            boolean r3 = r4 instanceof defpackage.lk6
            if (r3 == 0) goto L6f
            r2 = r2 | 8192(0x2000, float:1.148E-41)
        L6f:
            boolean r3 = r4 instanceof defpackage.ym
            if (r3 == 0) goto L75
            r2 = r2 | 16384(0x4000, float:2.2959E-41)
        L75:
            boolean r3 = r4 instanceof defpackage.u22
            if (r3 == 0) goto L7d
            r3 = 32768(0x8000, float:4.5918E-41)
            r2 = r2 | r3
        L7d:
            boolean r3 = r4 instanceof defpackage.ssd
            if (r3 == 0) goto L84
            r3 = 262144(0x40000, float:3.67342E-40)
            r2 = r2 | r3
        L84:
            boolean r3 = r4 instanceof defpackage.my0
            if (r3 == 0) goto L8b
            r3 = 524288(0x80000, float:7.34684E-40)
            r2 = r2 | r3
        L8b:
            boolean r3 = r4 instanceof defpackage.g16
            if (r3 == 0) goto L92
            r3 = 2097152(0x200000, float:2.938736E-39)
            r2 = r2 | r3
        L92:
            boolean r4 = r4 instanceof defpackage.gt6
            if (r4 == 0) goto L99
            r4 = 8388608(0x800000, float:1.1754944E-38)
            r2 = r2 | r4
        L99:
            r1.g(r2, r0)
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fh8.e(q28):int");
    }

    public static final int f(q28 q28Var) {
        if (!(q28Var instanceof b43)) {
            return e(q28Var);
        }
        b43 b43Var = (b43) q28Var;
        int iF = b43Var.o;
        for (q28 q28Var2 = b43Var.p; q28Var2 != null; q28Var2 = q28Var2.f) {
            iF |= f(q28Var2);
        }
        return iF;
    }

    public static final boolean g(int i) {
        return ((i & 128) != 0) | ((i & 4194304) != 0);
    }
}
