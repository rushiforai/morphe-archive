package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class fb7 extends t99 implements g48, bl7 {
    public cb7 f;
    public x45 g;
    public v99 h;
    public boolean i;
    public boolean j;
    public boolean k;
    public final gb7 l = new gb7(0, this);
    public e8 m;
    public f78 n;

    public static void A0(eh8 eh8Var) {
        bq6 bq6Var;
        eh8 eh8Var2 = eh8Var.p;
        aq6 aq6Var = eh8Var.o;
        if (!g76.L(eh8Var2 != null ? eh8Var2.o : null, aq6Var)) {
            aq6Var.G.p.y.f();
            return;
        }
        de deVarG = aq6Var.G.p.g();
        if (deVarG == null || (bq6Var = ((yk7) deVarG).y) == null) {
            return;
        }
        bq6Var.f();
    }

    @Override // defpackage.g48
    public final void B(boolean z) {
        fb7 fb7VarX0 = x0();
        aq6 aq6VarV0 = fb7VarX0 != null ? fb7VarX0.v0() : null;
        if (g76.L(aq6VarV0, v0())) {
            this.i = z;
            return;
        }
        if ((aq6VarV0 != null ? aq6VarV0.G.d : null) != wp6.LayingOut) {
            if ((aq6VarV0 != null ? aq6VarV0.G.d : null) != wp6.LookaheadLayingOut) {
                return;
            }
        }
        this.i = z;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void B0(g78 g78Var) {
        aq6 aq6Var;
        Object[] objArr = g78Var.b;
        long[] jArr = g78Var.a;
        int length = jArr.length - 2;
        if (length < 0) {
            return;
        }
        int i = 0;
        while (true) {
            long j = jArr[i];
            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                int i2 = 8 - ((~(i - length)) >>> 31);
                for (int i3 = 0; i3 < i2; i3++) {
                    if ((255 & j) < 128 && (aq6Var = (aq6) ((e1f) objArr[(i << 3) + i3]).get()) != null) {
                        if (W()) {
                            aq6Var.S(false);
                        } else {
                            aq6Var.U(false);
                        }
                    }
                    j >>= 8;
                }
                if (i2 != 8) {
                    return;
                }
            }
            if (i == length) {
                return;
            } else {
                i++;
            }
        }
    }

    public abstract void C0();

    @Override // defpackage.m73
    public final long J(float f) {
        return km4.j(this, f / b());
    }

    @Override // defpackage.t99
    public final int M(yd ydVar) {
        int iL0;
        if (!u0() || (iL0 = l0(ydVar)) == Integer.MIN_VALUE) {
            return Integer.MIN_VALUE;
        }
        boolean z = ydVar instanceof sse;
        long j = this.e;
        return iL0 + ((int) (z ? j >> 32 : 4294967295L & j));
    }

    @Override // defpackage.m73
    public final float N(int i) {
        return i / b();
    }

    @Override // defpackage.m73
    public final float Q(float f) {
        return f / b();
    }

    @Override // defpackage.y66
    public boolean W() {
        return false;
    }

    @Override // defpackage.m73
    public final float Z(float f) {
        return b() * f;
    }

    @Override // defpackage.m73
    public final int c0(long j) {
        return Math.round(p0(j));
    }

    @Override // defpackage.bl7
    public final al7 h0(int i, int i2, Map map, x45 x45Var, x45 x45Var2) {
        if ((i & (-16777216)) != 0 || ((-16777216) & i2) != 0) {
            b26.b("Size(" + i + " x " + i2 + ") is out of range. Each dimension must be between 0 and 16777215.");
        }
        return new eb7(i, i2, map, x45Var, x45Var2, this);
    }

    @Override // defpackage.m73
    public final /* synthetic */ int i0(float f) {
        return ho2.d(this, f);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0108  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void j0(defpackage.aq6 r32, defpackage.lr5 r33) {
        /*
            Method dump skipped, instruction units count: 394
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fb7.j0(aq6, lr5):void");
    }

    public abstract int l0(yd ydVar);

    @Override // defpackage.m73
    public final /* synthetic */ long m0(long j) {
        return ho2.g(j, this);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void n0(v99 v99Var, long j, long j2) {
        boolean z;
        char c;
        long j3;
        long j4;
        long j5;
        aq6 aq6Var;
        boolean z2;
        int i;
        char c2;
        long j6;
        px8 snapshotObserver;
        f78 f78Var = this.n;
        e8 e8Var = this.m;
        if (e8Var == null) {
            e8Var = new e8();
            this.m = e8Var;
        }
        e8 e8Var2 = e8Var;
        mx8 mx8Var = v0().n;
        if (mx8Var != null && (snapshotObserver = ((mn) mx8Var).getSnapshotObserver()) != null) {
            snapshotObserver.a.d(v99Var, zu2.u, new db7(this, j, j2, v99Var));
        }
        boolean zW = W();
        g78 g78Var = (g78) e8Var2.e;
        g78 g78Var2 = (g78) e8Var2.f;
        int i2 = e8Var2.a;
        for (int i3 = 0; i3 < i2; i3++) {
            byte b = ((byte[]) e8Var2.d)[i3];
            if (b == 3) {
                lr5 lr5Var = ((lr5[]) e8Var2.b)[i3];
                lr5Var.getClass();
                g78Var2.k(lr5Var);
            } else if (b != 0 && f78Var != null) {
                lr5 lr5Var2 = ((lr5[]) e8Var2.b)[i3];
                lr5Var2.getClass();
                g78 g78Var3 = (g78) f78Var.k(lr5Var2);
                if (g78Var3 != null) {
                    g78Var.j(g78Var3);
                }
            }
        }
        int i4 = e8Var2.a;
        int i5 = 0;
        for (int i6 = 0; i6 < i4; i6++) {
            byte[] bArr = (byte[]) e8Var2.d;
            if (bArr[i6] == 2) {
                i5++;
            } else if (i5 > 0) {
                lr5[] lr5VarArr = (lr5[]) e8Var2.b;
                lr5VarArr[i6 - i5] = lr5VarArr[i6];
            }
            bArr[i6] = 2;
        }
        int i7 = e8Var2.a;
        for (int i8 = i7 - i5; i8 < i7; i8++) {
            ((lr5[]) e8Var2.b)[i8] = null;
        }
        e8Var2.a -= i5;
        fb7 fb7VarX0 = x0();
        Object[] objArr = g78Var2.b;
        long[] jArr = g78Var2.a;
        int length = jArr.length - 2;
        char c3 = 7;
        long j7 = -9187201950435737472L;
        int i9 = 8;
        if (length >= 0) {
            j4 = 128;
            int i10 = 0;
            while (true) {
                long j8 = jArr[i10];
                j5 = 255;
                if ((((~j8) << c3) & j8 & j7) != j7) {
                    int i11 = 8 - ((~(i10 - length)) >>> 31);
                    int i12 = 0;
                    while (i12 < i11) {
                        if ((j8 & 255) < 128) {
                            c2 = c3;
                            lr5 lr5Var3 = (lr5) objArr[(i10 << 3) + i12];
                            j6 = j7;
                            fb7 fb7Var = fb7VarX0 == null ? this : fb7VarX0;
                            i = i9;
                            fb7 fb7Var2 = fb7Var;
                            while (true) {
                                e8 e8Var3 = fb7Var2.m;
                                if (e8Var3 != null) {
                                    z2 = zW;
                                    if (!k80.d0(lr5Var3, (lr5[]) e8Var3.b)) {
                                        break;
                                        break;
                                    }
                                    break;
                                }
                                z2 = zW;
                                fb7 fb7VarX02 = fb7Var2.x0();
                                if (fb7VarX02 == null) {
                                    break;
                                }
                                fb7Var2 = fb7VarX02;
                                zW = z2;
                            }
                            f78 f78Var2 = fb7Var2.n;
                            g78 g78Var4 = f78Var2 != null ? (g78) f78Var2.k(lr5Var3) : null;
                            if (g78Var4 != null) {
                                fb7Var.B0(g78Var4);
                            }
                        } else {
                            z2 = zW;
                            i = i9;
                            c2 = c3;
                            j6 = j7;
                        }
                        j8 >>= i;
                        i12++;
                        c3 = c2;
                        j7 = j6;
                        i9 = i;
                        zW = z2;
                    }
                    z = zW;
                    c = c3;
                    j3 = j7;
                    if (i11 != i9) {
                        break;
                    }
                } else {
                    z = zW;
                    c = c3;
                    j3 = j7;
                }
                if (i10 == length) {
                    break;
                }
                i10++;
                c3 = c;
                j7 = j3;
                zW = z;
                i9 = 8;
            }
        } else {
            z = zW;
            c = 7;
            j3 = -9187201950435737472L;
            j4 = 128;
            j5 = 255;
        }
        g78Var2.b();
        Object[] objArr2 = g78Var.b;
        long[] jArr2 = g78Var.a;
        int length2 = jArr2.length - 2;
        if (length2 >= 0) {
            int i13 = 0;
            while (true) {
                long j9 = jArr2[i13];
                if ((((~j9) << c) & j9 & j3) != j3) {
                    int i14 = 8 - ((~(i13 - length2)) >>> 31);
                    for (int i15 = 0; i15 < i14; i15++) {
                        if ((j9 & j5) < j4 && (aq6Var = (aq6) ((e1f) objArr2[(i13 << 3) + i15]).get()) != null) {
                            if (z) {
                                aq6Var.S(false);
                            } else {
                                aq6Var.U(false);
                            }
                        }
                        j9 >>= 8;
                    }
                    if (i14 != 8) {
                        break;
                    }
                }
                if (i13 == length2) {
                    break;
                } else {
                    i13++;
                }
            }
        }
        g78Var.b();
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0050  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void o0(defpackage.al7 r15) {
        /*
            r14 = this;
            f78 r0 = r14.n
            boolean r1 = r14.k
            if (r1 == 0) goto L8
            goto Lbd
        L8:
            x45 r1 = r15.e()
            r2 = 0
            if (r1 != 0) goto L59
            if (r0 == 0) goto Lbd
            java.lang.Object[] r15 = r0.c
            long[] r1 = r0.a
            int r3 = r1.length
            int r3 = r3 + (-2)
            if (r3 < 0) goto L55
            r4 = r2
        L1b:
            r5 = r1[r4]
            long r7 = ~r5
            r9 = 7
            long r7 = r7 << r9
            long r7 = r7 & r5
            r9 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r7 = r7 & r9
            int r7 = (r7 > r9 ? 1 : (r7 == r9 ? 0 : -1))
            if (r7 == 0) goto L50
            int r7 = r4 - r3
            int r7 = ~r7
            int r7 = r7 >>> 31
            r8 = 8
            int r7 = 8 - r7
            r9 = r2
        L35:
            if (r9 >= r7) goto L4e
            r10 = 255(0xff, double:1.26E-321)
            long r10 = r10 & r5
            r12 = 128(0x80, double:6.3E-322)
            int r10 = (r10 > r12 ? 1 : (r10 == r12 ? 0 : -1))
            if (r10 >= 0) goto L4a
            int r10 = r4 << 3
            int r10 = r10 + r9
            r10 = r15[r10]
            g78 r10 = (defpackage.g78) r10
            r14.B0(r10)
        L4a:
            long r5 = r5 >> r8
            int r9 = r9 + 1
            goto L35
        L4e:
            if (r7 != r8) goto L55
        L50:
            if (r4 == r3) goto L55
            int r4 = r4 + 1
            goto L1b
        L55:
            r0.a()
            return
        L59:
            x45 r0 = r14.g
            r3 = 1
            if (r0 == r1) goto L60
            r0 = r3
            goto L61
        L60:
            r0 = r2
        L61:
            r4 = 0
            if (r0 != 0) goto L9a
            cb7 r1 = r14.z0()
            boolean r1 = r1.a
            if (r1 == 0) goto L9a
            hp6 r0 = r14.s0()
            long r4 = r0.p(r4)
            long r4 = defpackage.d46.c0(r4)
            long r0 = r0.j()
            cb7 r6 = r14.z0()
            long r6 = r6.b
            boolean r6 = defpackage.k46.b(r4, r6)
            if (r6 == 0) goto L95
            cb7 r6 = r14.z0()
            long r6 = r6.c
            boolean r6 = defpackage.s46.a(r0, r6)
            if (r6 != 0) goto L96
        L95:
            r2 = r3
        L96:
            r3 = r4
            r5 = r0
            r0 = r2
            goto La1
        L9a:
            r1 = 9223372034707292159(0x7fffffff7fffffff, double:NaN)
            r5 = r4
            r3 = r1
        La1:
            if (r0 == 0) goto Lbd
            v99 r0 = r14.h
            if (r0 == 0) goto Lac
            r0.a = r15
        La9:
            r1 = r14
            r2 = r0
            goto Lb4
        Lac:
            v99 r0 = new v99
            r0.<init>(r15, r14)
            r14.h = r0
            goto La9
        Lb4:
            r1.n0(r2, r3, r5)
            x45 r14 = r15.e()
            r1.g = r14
        Lbd:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fb7.o0(al7):void");
    }

    @Override // defpackage.m73
    public final /* synthetic */ float p0(long j) {
        return ho2.f(j, this);
    }

    @Override // defpackage.bl7
    public final al7 q0(int i, int i2, Map map, x45 x45Var) {
        return h0(i, i2, map, null, x45Var);
    }

    @Override // defpackage.m73
    public final /* synthetic */ long r(long j) {
        return ho2.e(j, this);
    }

    public abstract fb7 r0();

    public abstract hp6 s0();

    public abstract boolean u0();

    public abstract aq6 v0();

    public abstract al7 w0();

    public abstract fb7 x0();

    public abstract long y0();

    @Override // defpackage.m73
    public final /* synthetic */ float z(long j) {
        return km4.i(j, this);
    }

    public final cb7 z0() {
        cb7 cb7Var = this.f;
        if (cb7Var != null) {
            return cb7Var;
        }
        cb7 cb7Var2 = new cb7(this);
        this.f = cb7Var2;
        return cb7Var2;
    }
}
