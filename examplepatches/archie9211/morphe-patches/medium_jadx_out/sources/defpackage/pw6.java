package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pw6 implements nsb {
    public static final mya x = kng.K(new p44(21), new vx5(15));
    public boolean a;
    public jw6 b;
    public final i00 c;
    public final k49 d = new k49(kw6.a, y3b.h);
    public final xp e = new xp(7, (byte) 0);
    public final k49 f;
    public final k49 g;
    public aq6 h;
    public final sr6 i;
    public final nl0 j;
    public final rz2 k;
    public final boolean l;
    public final gu6 m;
    public final v13 n;
    public float o;
    public int p;
    public final k68 q;
    public final m68 r;
    public final du6 s;
    public final st6 t;
    public final l78 u;
    public final l78 v;
    public final gg5 w;

    public pw6(int[] iArr, int[] iArr2) {
        this.c = new i00(iArr, iArr2, new xi1(2, this, pw6.class, "fillNearestIndices", "fillNearestIndices(II)[I", 0, 10));
        Boolean bool = Boolean.FALSE;
        this.f = qo7.u(bool);
        this.g = qo7.u(bool);
        this.i = new sr6(this, 2);
        this.j = new nl0();
        this.k = new rz2(28);
        this.l = true;
        this.m = new gu6(null);
        this.n = new v13(new ff4(22, this));
        this.p = -1;
        k68 k68Var = j46.a;
        this.q = new k68();
        this.r = new m68();
        this.s = new du6();
        this.t = new st6();
        this.u = fo7.G();
        this.v = fo7.G();
        this.w = new gg5(10);
    }

    @Override // defpackage.nsb
    public final boolean a() {
        return this.n.a();
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x0067, code lost:
    
        if (r6.n.b(r7, r8, r0) == r1) goto L23;
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
            boolean r0 = r9 instanceof defpackage.ow6
            if (r0 == 0) goto L13
            r0 = r9
            ow6 r0 = (defpackage.ow6) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            ow6 r0 = new ow6
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
            k49 r9 = r6.d
            java.lang.Object r9 = r9.getValue()
            jw6 r2 = defpackage.kw6.a
            if (r9 != r2) goto L5b
            r0.b = r7
            r9 = r8
            p4d r9 = (defpackage.p4d) r9
            r0.c = r9
            r0.f = r5
            nl0 r9 = r6.j
            java.lang.Object r9 = r9.m(r0)
            if (r9 != r1) goto L5b
            goto L69
        L5b:
            r0.b = r3
            r0.c = r3
            r0.f = r4
            v13 r6 = r6.n
            java.lang.Object r6 = r6.b(r7, r8, r0)
            if (r6 != r1) goto L6a
        L69:
            return r1
        L6a:
            c1e r6 = defpackage.c1e.a
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pw6.b(s78, b55, n92):java.lang.Object");
    }

    @Override // defpackage.nsb
    public final boolean c() {
        return ((Boolean) this.g.getValue()).booleanValue();
    }

    @Override // defpackage.nsb
    public final boolean d() {
        return ((Boolean) this.f.getValue()).booleanValue();
    }

    @Override // defpackage.nsb
    public final float e(float f) {
        return this.n.e(f);
    }

    /* JADX WARN: Removed duplicated region for block: B:71:0x0146  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void f(defpackage.jw6 r22, boolean r23, boolean r24) {
        /*
            Method dump skipped, instruction units count: 384
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pw6.f(jw6, boolean, boolean):void");
    }

    public final jw6 g() {
        return (jw6) this.d.getValue();
    }

    public final void h(float f, jw6 jw6Var) {
        k68 k68Var;
        int iN;
        int i;
        long jH;
        if (!this.l || jw6Var.m.isEmpty()) {
            return;
        }
        boolean z = f < 0.0f;
        List list = jw6Var.m;
        int i2 = z ? ((lw6) bu1.H0(list)).a : ((lw6) bu1.x0(list)).a;
        if (i2 == this.p) {
            return;
        }
        this.p = i2;
        int[] iArr = r46.a;
        l68 l68Var = new l68();
        hx4 hx4Var = jw6Var.i;
        int[] iArr2 = (int[]) hx4Var.c;
        int length = iArr2.length;
        int i3 = 0;
        while (true) {
            k68Var = this.q;
            if (i3 >= length) {
                break;
            }
            xp xpVar = this.e;
            if (z) {
                iN = i2 + 1;
                int length2 = xpVar.b + ((int[]) xpVar.c).length;
                while (true) {
                    if (iN >= length2) {
                        iN = xpVar.b + ((int[]) xpVar.c).length;
                        break;
                    } else if (xpVar.g(iN, i3)) {
                        break;
                    } else {
                        iN++;
                    }
                }
            } else {
                iN = xpVar.n(i2, i3);
            }
            int i4 = iN;
            if (i4 < 0 || i4 >= jw6Var.l || l68Var.c(i4)) {
                break;
            }
            l68Var.b[l68Var.d(i4)] = i4;
            if (!k68Var.a(i4)) {
                boolean zN = jw6Var.j.N(i4);
                int i5 = zN ? 0 : i3;
                int i6 = zN ? length : 1;
                if (i6 == 1) {
                    i = iArr2[i5];
                } else {
                    int[] iArr3 = (int[]) hx4Var.b;
                    int i7 = iArr3[i5];
                    int i8 = (i5 + i6) - 1;
                    i = (iArr3[i8] + iArr2[i8]) - i7;
                }
                if (jw6Var.u == hw8.Vertical) {
                    if (i < 0) {
                        d26.a("width must be >= 0");
                    }
                    jH = h72.h(i, i, 0, Integer.MAX_VALUE);
                } else {
                    if (i < 0) {
                        d26.a("height must be >= 0");
                    }
                    jH = h72.h(0, Integer.MAX_VALUE, i, i);
                }
                k68Var.i(i4, this.m.a(i4, jH, true, null));
            }
            i3++;
            i2 = i4;
        }
        long[] jArr = k68Var.a;
        int length3 = jArr.length - 2;
        if (length3 < 0) {
            return;
        }
        int i9 = 0;
        while (true) {
            long j = jArr[i9];
            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                int i10 = 8 - ((~(i9 - length3)) >>> 31);
                for (int i11 = 0; i11 < i10; i11++) {
                    if ((255 & j) < 128) {
                        int i12 = (i9 << 3) + i11;
                        int i13 = k68Var.b[i12];
                        fu6 fu6Var = (fu6) k68Var.c[i12];
                        boolean zC = l68Var.c(i13);
                        if (!zC) {
                            fu6Var.cancel();
                        }
                        if (!zC) {
                            k68Var.h(i12);
                        }
                    }
                    j >>= 8;
                }
                if (i10 != 8) {
                    return;
                }
            }
            if (i9 == length3) {
                return;
            } else {
                i9++;
            }
        }
    }
}
