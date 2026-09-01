package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class et7 extends co6 implements b55 {
    public final /* synthetic */ l78 a;
    public final /* synthetic */ z52 b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ mkd d;
    public final /* synthetic */ int e;
    public final /* synthetic */ uid f;
    public final /* synthetic */ Integer g;
    public final /* synthetic */ x45 h;
    public final /* synthetic */ boolean i;
    public final /* synthetic */ sk6 j;
    public final /* synthetic */ pk6 k;
    public final /* synthetic */ int l;
    public final /* synthetic */ String m;
    public final /* synthetic */ uid n;
    public final /* synthetic */ ht7 o;
    public final /* synthetic */ c55 p;
    public final /* synthetic */ c55 q;
    public final /* synthetic */ l78 r;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public et7(l78 l78Var, z52 z52Var, m45 m45Var, mkd mkdVar, int i, uid uidVar, Integer num, x45 x45Var, boolean z, sk6 sk6Var, pk6 pk6Var, int i2, String str, uid uidVar2, ht7 ht7Var, c55 c55Var, c55 c55Var2, l78 l78Var2) {
        super(2);
        this.a = l78Var;
        this.b = z52Var;
        this.c = m45Var;
        this.d = mkdVar;
        this.e = i;
        this.f = uidVar;
        this.g = num;
        this.h = x45Var;
        this.i = z;
        this.j = sk6Var;
        this.k = pk6Var;
        this.l = i2;
        this.m = str;
        this.n = uidVar2;
        this.o = ht7Var;
        this.p = c55Var;
        this.q = c55Var2;
        this.r = l78Var2;
    }

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
    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        long j;
        cu cuVar;
        fn fnVar;
        boolean z;
        boolean z2;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue() & 3;
        c1e c1eVar = c1e.a;
        if (iIntValue == 2) {
            p65 p65Var = (p65) x12Var;
            if (p65Var.B()) {
                p65Var.S();
                return c1eVar;
            }
        }
        this.a.setValue(c1eVar);
        z52 z52Var = this.b;
        int i = z52Var.b;
        z52Var.f();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.Y(-442028939);
        z52 z52Var2 = (z52) z52Var.e().b;
        i52 i52VarD = z52Var2.d();
        i52 i52VarD2 = z52Var2.d();
        i52 i52VarD3 = z52Var2.d();
        i52 i52VarD4 = z52Var2.d();
        mkd mkdVarM = dl7.m(mkd.a(this.d, 0L, 0L, null, null, null, 0L, 0L, null, this.e, 0L, null, null, 16744447));
        boolean zF = p65Var2.f(i52VarD3) | p65Var2.f(i52VarD4);
        Object objM = p65Var2.M();
        Object obj3 = w12.a;
        if (zF || objM == obj3) {
            objM = new it0(i52VarD3, i52VarD4, 9);
            p65Var2.j0(objM);
        }
        y52 y52Var = new y52(i52VarD, (x45) objM);
        Object objM2 = p65Var2.M();
        if (objM2 == obj3) {
            objM2 = new ts7(this.r, 1);
            p65Var2.j0(objM2);
        }
        r28 r28VarN = bgf.N(r40.J(y52Var, (x45) objM2), "text");
        d8a d8aVar = kt7.b;
        dkc dkcVar = new dkc(((zo7) p65Var2.j(d8aVar)).n);
        Integer num = this.g;
        boolean zF2 = p65Var2.f(num);
        x45 x45Var = this.h;
        boolean zF3 = zF2 | p65Var2.f(x45Var);
        Object objM3 = p65Var2.M();
        if (zF3 || objM3 == obj3) {
            objM3 = new us7(num, x45Var, 1);
            p65Var2.j0(objM3);
        }
        yo0.a(this.f, (x45) objM3, r28VarN, this.i, mkdVarM, this.j, this.k, false, this.l, 0, null, null, dkcVar, null, p65Var2, 0, 0, 48128);
        String str = this.m;
        String str2 = str != null ? str : "";
        mkd mkdVarA = mkd.a(dl7.m(((eu7) p65Var2.j(kt7.c)).m), ((zo7) p65Var2.j(d8aVar)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
        boolean zF4 = p65Var2.f(i52VarD3) | p65Var2.f(i52VarD4);
        uid uidVar = this.n;
        boolean zF5 = zF4 | p65Var2.f(uidVar) | p65Var2.f(str);
        Object objM4 = p65Var2.M();
        if (zF5 || objM4 == obj3) {
            objM4 = new vs7(i52VarD3, i52VarD4, uidVar, str, 1);
            p65Var2.j0(objM4);
        }
        kjd.b(str2, bgf.N(new y52(i52VarD2, (x45) objM4), "placeholder"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarA, p65Var2, 0, 0, 65532);
        int i2 = ft7.a[this.o.ordinal()];
        if (i2 == 1) {
            p65Var2.Y(124383132);
            j = ((zo7) p65Var2.j(d8aVar)).n;
            p65Var2.p(false);
        } else if (i2 == 2) {
            p65Var2.Y(124386138);
            j = ((zo7) p65Var2.j(d8aVar)).u;
            p65Var2.p(false);
        } else {
            if (i2 != 3) {
                throw ho2.L(p65Var2, 124380670, false);
            }
            p65Var2.Y(124389115);
            j = ((zo7) p65Var2.j(d8aVar)).r;
            p65Var2.p(false);
        }
        upc upcVarA = wec.a(j, null, "Icon color", p65Var2, 384, 10);
        c55 c55Var = this.p;
        boolean zF6 = p65Var2.f(c55Var);
        Object objM5 = p65Var2.M();
        if (zF6 || objM5 == obj3) {
            objM5 = new ws7(c55Var, 2);
            p65Var2.j0(objM5);
        }
        y52 y52Var2 = new y52(i52VarD3, (x45) objM5);
        ar0 ar0Var = z46.d;
        zk7 zk7VarC = dy0.c(ar0Var, false);
        long j2 = p65Var2.T;
        int i3 = (int) (j2 ^ (j2 >>> 32));
        i89 i89VarL = p65Var2.l();
        r28 r28VarR = gx1.R(p65Var2, y52Var2);
        r12.W.getClass();
        m45 m45Var = q12.b;
        p65Var2.c0();
        if (p65Var2.S) {
            p65Var2.k(m45Var);
        } else {
            p65Var2.m0();
        }
        cu cuVar2 = q12.f;
        tp7.B(p65Var2, cuVar2, zk7VarC);
        cu cuVar3 = q12.e;
        tp7.B(p65Var2, cuVar3, i89VarL);
        Integer numValueOf = Integer.valueOf(i3);
        cu cuVar4 = q12.g;
        tp7.B(p65Var2, cuVar4, numValueOf);
        fn fnVar2 = q12.h;
        tp7.y(p65Var2, fnVar2);
        cu cuVar5 = q12.d;
        tp7.B(p65Var2, cuVar5, r28VarR);
        if (c55Var != null) {
            p65Var2.Y(-541161734);
            uu1 uu1Var = (uu1) upcVarA.getValue();
            cuVar = cuVar3;
            fnVar = fnVar2;
            long j3 = uu1Var.a;
            c55Var.f(uu1Var, p65Var2, 0);
            z = false;
        } else {
            cuVar = cuVar3;
            fnVar = fnVar2;
            z = false;
            p65Var2.Y(-551199720);
        }
        p65Var2.p(z);
        p65Var2.p(true);
        c55 c55Var2 = this.q;
        boolean zF7 = p65Var2.f(c55Var2);
        Object objM6 = p65Var2.M();
        if (zF7 || objM6 == obj3) {
            objM6 = new ws7(c55Var2, 3);
            p65Var2.j0(objM6);
        }
        y52 y52Var3 = new y52(i52VarD4, (x45) objM6);
        zk7 zk7VarC2 = dy0.c(ar0Var, false);
        long j4 = p65Var2.T;
        int i4 = (int) (j4 ^ (j4 >>> 32));
        i89 i89VarL2 = p65Var2.l();
        r28 r28VarR2 = gx1.R(p65Var2, y52Var3);
        p65Var2.c0();
        if (p65Var2.S) {
            p65Var2.k(m45Var);
        } else {
            p65Var2.m0();
        }
        tp7.B(p65Var2, cuVar2, zk7VarC2);
        tp7.B(p65Var2, cuVar, i89VarL2);
        ka1.z(i4, p65Var2, cuVar4, p65Var2, fnVar);
        tp7.B(p65Var2, cuVar5, r28VarR2);
        if (c55Var2 != null) {
            p65Var2.Y(1824392930);
            uu1 uu1Var2 = (uu1) upcVarA.getValue();
            long j5 = uu1Var2.a;
            c55Var2.f(uu1Var2, p65Var2, 0);
            z2 = false;
        } else {
            z2 = false;
            p65Var2.Y(1813791457);
        }
        p65Var2.p(z2);
        p65Var2.p(true);
        p65Var2.p(z2);
        if (z52Var.b != i) {
            kyd.v(this.c, p65Var2);
        }
        return c1eVar;
    }
}
