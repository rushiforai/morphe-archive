package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class gz8 implements nsb {
    public final du6 A;
    public final l78 B;
    public final l78 C;
    public final k49 D;
    public final k49 E;
    public final k49 F;
    public final k49 G;
    public boolean a;
    public yy8 b;
    public final k49 c;
    public final ft2 d;
    public int e;
    public int f;
    public long g;
    public long h;
    public float i;
    public float j;
    public final v13 k;
    public final boolean l;
    public final k49 m;
    public m73 n;
    public int o;
    public final m68 p;
    public final h49 q;
    public final h49 r;
    public final j83 s;
    public final j83 t;
    public final gu6 u;
    public final qy8 v;
    public final rz2 w;
    public final nl0 x;
    public final k49 y;
    public final sr6 z;

    public gz8(int i, float f) {
        double d = f;
        if (-0.5d > d || d > 0.5d) {
            e26.a("currentPageOffsetFraction " + f + " is not within the range -0.5 to 0.5");
        }
        this.c = qo7.u(new ip8(0L));
        ft2 ft2Var = new ft2();
        ft2Var.c = this;
        ft2Var.d = new h49(i);
        ft2Var.e = new g49(f);
        ft2Var.f = new au6(i, 30, 100);
        this.d = ft2Var;
        this.e = i;
        this.g = Long.MAX_VALUE;
        final int i2 = 0;
        this.k = new v13(new x45(this) { // from class: bz8
            public final /* synthetic */ gz8 b;

            {
                this.b = this;
            }

            /* JADX WARN: Multi-variable type inference failed */
            /* JADX WARN: Removed duplicated region for block: B:40:0x00ab  */
            /* JADX WARN: Removed duplicated region for block: B:41:0x00b6  */
            /* JADX WARN: Removed duplicated region for block: B:49:0x00e6  */
            /* JADX WARN: Type inference failed for: r0v4 */
            /* JADX WARN: Type inference failed for: r0v5 */
            /* JADX WARN: Type inference failed for: r0v7 */
            /* JADX WARN: Type inference failed for: r14v1, types: [java.lang.Float] */
            /* JADX WARN: Type inference failed for: r14v2, types: [java.lang.Number] */
            /* JADX WARN: Type inference failed for: r14v3, types: [java.lang.Long] */
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
            @Override // defpackage.x45
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public final java.lang.Object invoke(java.lang.Object r14) {
                /*
                    Method dump skipped, instruction units count: 250
                    To view this dump add '--comments-level debug' option
                */
                throw new UnsupportedOperationException("Method not decompiled: defpackage.bz8.invoke(java.lang.Object):java.lang.Object");
            }
        });
        final int i3 = 1;
        this.l = true;
        this.m = new k49(jz8.b, y3b.h);
        this.n = jz8.a;
        this.p = new m68();
        this.q = new h49(-1);
        this.r = new h49(i);
        xsa xsaVar = xsa.h;
        wx4 wx4Var = new wx4(this, 4);
        vwa vwaVar = bjc.a;
        this.s = new j83(wx4Var, xsaVar);
        this.t = new j83(new wx4(this, 5), xsaVar);
        gu6 gu6Var = new gu6(new x45(this) { // from class: bz8
            public final /* synthetic */ gz8 b;

            {
                this.b = this;
            }

            /* JADX WARN: Multi-variable type inference failed */
            /* JADX WARN: Removed duplicated region for block: B:40:0x00ab  */
            /* JADX WARN: Removed duplicated region for block: B:41:0x00b6  */
            /* JADX WARN: Removed duplicated region for block: B:49:0x00e6  */
            /* JADX WARN: Type inference failed for: r0v4 */
            /* JADX WARN: Type inference failed for: r0v5 */
            /* JADX WARN: Type inference failed for: r0v7 */
            /* JADX WARN: Type inference failed for: r14v1, types: [java.lang.Float] */
            /* JADX WARN: Type inference failed for: r14v2, types: [java.lang.Number] */
            /* JADX WARN: Type inference failed for: r14v3, types: [java.lang.Long] */
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
            @Override // defpackage.x45
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public final java.lang.Object invoke(java.lang.Object r14) {
                /*
                    Method dump skipped, instruction units count: 250
                    To view this dump add '--comments-level debug' option
                */
                throw new UnsupportedOperationException("Method not decompiled: defpackage.bz8.invoke(java.lang.Object):java.lang.Object");
            }
        });
        this.u = gu6Var;
        this.v = new qy8(new md5(26, this), gu6Var, new wx4(this, 6));
        this.w = new rz2(28);
        this.x = new nl0();
        this.y = qo7.u(null);
        this.z = new sr6(this, 3);
        h72.b(0, 0, 0, 0, 15);
        this.A = new du6();
        this.B = fo7.G();
        this.C = fo7.G();
        Boolean bool = Boolean.FALSE;
        this.D = qo7.u(bool);
        this.E = qo7.u(bool);
        this.F = qo7.u(bool);
        this.G = qo7.u(bool);
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0074, code lost:
    
        if (r9.b(r7, r8, r0) == r1) goto L24;
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
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.Object t(defpackage.gz8 r6, defpackage.s78 r7, defpackage.b55 r8, defpackage.n92 r9) {
        /*
            boolean r0 = r9 instanceof defpackage.ez8
            if (r0 == 0) goto L13
            r0 = r9
            ez8 r0 = (defpackage.ez8) r0
            int r1 = r0.g
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.g = r1
            goto L18
        L13:
            ez8 r0 = new ez8
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.e
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.g
            r3 = 0
            r4 = 2
            r5 = 1
            if (r2 == 0) goto L40
            if (r2 == r5) goto L33
            if (r2 != r4) goto L2d
            gz8 r6 = r0.b
            defpackage.br7.v(r9)
            goto L77
        L2d:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r3
        L33:
            p4d r6 = r0.d
            r8 = r6
            b55 r8 = (defpackage.b55) r8
            s78 r7 = r0.c
            gz8 r6 = r0.b
            defpackage.br7.v(r9)
            goto L55
        L40:
            defpackage.br7.v(r9)
            r0.b = r6
            r0.c = r7
            r9 = r8
            p4d r9 = (defpackage.p4d) r9
            r0.d = r9
            r0.g = r5
            java.lang.Object r9 = r6.i(r0)
            if (r9 != r1) goto L55
            goto L76
        L55:
            v13 r9 = r6.k
            boolean r9 = r9.a()
            if (r9 != 0) goto L66
            int r9 = r6.k()
            h49 r2 = r6.r
            r2.h(r9)
        L66:
            v13 r9 = r6.k
            r0.b = r6
            r0.c = r3
            r0.d = r3
            r0.g = r4
            java.lang.Object r7 = r9.b(r7, r8, r0)
            if (r7 != r1) goto L77
        L76:
            return r1
        L77:
            r7 = -1
            h49 r6 = r6.q
            r6.h(r7)
            c1e r6 = defpackage.c1e.a
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gz8.t(gz8, s78, b55, n92):java.lang.Object");
    }

    @Override // defpackage.nsb
    public final boolean a() {
        return this.k.a();
    }

    @Override // defpackage.nsb
    public final Object b(s78 s78Var, b55 b55Var, n92 n92Var) {
        return t(this, s78Var, b55Var, n92Var);
    }

    @Override // defpackage.nsb
    public final boolean c() {
        return ((Boolean) this.E.getValue()).booleanValue();
    }

    @Override // defpackage.nsb
    public final boolean d() {
        return ((Boolean) this.D.getValue()).booleanValue();
    }

    @Override // defpackage.nsb
    public final float e(float f) {
        return this.k.e(f);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(int r12, defpackage.wlc r13, defpackage.n92 r14) {
        /*
            r11 = this;
            boolean r3 = r14 instanceof defpackage.cz8
            if (r3 == 0) goto L14
            r3 = r14
            cz8 r3 = (defpackage.cz8) r3
            int r4 = r3.f
            r5 = -2147483648(0xffffffff80000000, float:-0.0)
            r6 = r4 & r5
            if (r6 == 0) goto L14
            int r4 = r4 - r5
            r3.f = r4
        L12:
            r6 = r3
            goto L1a
        L14:
            cz8 r3 = new cz8
            r3.<init>(r11, r14)
            goto L12
        L1a:
            java.lang.Object r2 = r6.d
            tb2 r7 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r6.f
            r8 = 0
            r4 = 0
            c1e r9 = defpackage.c1e.a
            r10 = 2
            r5 = 1
            if (r3 == 0) goto L40
            if (r3 == r5) goto L36
            if (r3 != r10) goto L30
            defpackage.br7.v(r2)
            return r9
        L30:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r8
        L36:
            int r0 = r6.b
            wlc r3 = r6.c
            defpackage.br7.v(r2)
            r2 = r4
            r4 = r3
            goto L69
        L40:
            defpackage.br7.v(r2)
            int r2 = r11.k()
            if (r12 != r2) goto L52
            float r2 = r11.l()
            int r2 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
            if (r2 != 0) goto L52
            goto L88
        L52:
            int r2 = r11.o()
            if (r2 != 0) goto L59
            goto L88
        L59:
            r6.c = r13
            r6.b = r12
            r6.f = r5
            java.lang.Object r3 = r11.i(r6)
            if (r3 != r7) goto L66
            goto L87
        L66:
            r0 = r12
            r2 = r4
            r4 = r13
        L69:
            int r0 = r11.j(r0)
            int r3 = r11.q()
            float r3 = (float) r3
            float r3 = r3 * r2
            r2 = r0
            dz8 r0 = new dz8
            r5 = 0
            r1 = r11
            r0.<init>(r1, r2, r3, r4, r5)
            r6.c = r8
            r6.f = r10
            s78 r2 = defpackage.s78.Default
            java.lang.Object r0 = r11.b(r2, r0, r6)
            if (r0 != r7) goto L88
        L87:
            return r7
        L88:
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gz8.f(int, wlc, n92):java.lang.Object");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:121:0x02a7  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x02aa  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x02b2  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x02bf  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x02cb  */
    /* JADX WARN: Removed duplicated region for block: B:151:0x0334 A[Catch: all -> 0x0340, TryCatch #0 {all -> 0x0340, blocks: (B:137:0x02e2, B:140:0x02eb, B:143:0x02f8, B:145:0x0304, B:153:0x033a, B:151:0x0334, B:148:0x031c), top: B:169:0x02e2 }] */
    /* JADX WARN: Removed duplicated region for block: B:159:0x0355  */
    /* JADX WARN: Removed duplicated region for block: B:161:0x035c  */
    /* JADX WARN: Removed duplicated region for block: B:164:0x0372  */
    /* JADX WARN: Removed duplicated region for block: B:169:0x02e2 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:88:0x01df  */
    /* JADX WARN: Type inference failed for: r10v22 */
    /* JADX WARN: Type inference failed for: r10v23 */
    /* JADX WARN: Type inference failed for: r10v25 */
    /* JADX WARN: Type inference failed for: r2v14, types: [int] */
    /* JADX WARN: Type inference failed for: r2v15 */
    /* JADX WARN: Type inference failed for: r2v18 */
    /* JADX WARN: Type inference failed for: r7v26 */
    /* JADX WARN: Type inference failed for: r7v27, types: [boolean] */
    /* JADX WARN: Type inference failed for: r7v30 */
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
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void h(defpackage.yy8 r20, boolean r21, boolean r22) {
        /*
            Method dump skipped, instruction units count: 890
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gz8.h(yy8, boolean, boolean):void");
    }

    public final Object i(p92 p92Var) {
        Object objM;
        return (this.m.getValue() == jz8.b && (objM = this.x.m(p92Var)) == tb2.COROUTINE_SUSPENDED) ? objM : c1e.a;
    }

    public final int j(int i) {
        if (o() > 0) {
            return iq7.v(i, 0, o() - 1);
        }
        return 0;
    }

    public final int k() {
        return ((h49) this.d.d).g();
    }

    public final float l() {
        return ((g49) this.d.e).g();
    }

    public final boolean m() {
        return ((Boolean) this.F.getValue()).booleanValue();
    }

    public final yy8 n() {
        return (yy8) this.m.getValue();
    }

    public abstract int o();

    public final int p() {
        return ((yy8) this.m.getValue()).b;
    }

    public final int q() {
        return ((yy8) this.m.getValue()).c + p();
    }

    public final long r() {
        return ((ip8) this.c.getValue()).a;
    }

    public final boolean s() {
        return ((int) Float.intBitsToFloat((int) (r() >> 32))) == 0 && ((int) Float.intBitsToFloat((int) (r() & 4294967295L))) == 0;
    }

    public final void u(float f, int i, boolean z) {
        ft2 ft2Var = this.d;
        h49 h49Var = (h49) ft2Var.d;
        g49 g49Var = (g49) ft2Var.e;
        if (h49Var.g() != i || g49Var.g() != f) {
            this.v.g();
        }
        ((h49) ft2Var.d).h(i);
        ((au6) ft2Var.f).c(i);
        g49Var.h(f);
        ft2Var.b = null;
        if (!z) {
            fo7.L(this.C);
            return;
        }
        aq6 aq6Var = (aq6) this.y.getValue();
        if (aq6Var != null) {
            aq6Var.k();
        }
    }
}
