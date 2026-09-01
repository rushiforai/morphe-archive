package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hx0 implements b55 {
    public final /* synthetic */ v7c a;
    public final /* synthetic */ sb2 b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ String d;
    public final /* synthetic */ String e;
    public final /* synthetic */ String f;
    public final /* synthetic */ b55 g;

    public hx0(v7c v7cVar, sb2 sb2Var, boolean z, String str, String str2, String str3, b55 b55Var) {
        this.a = v7cVar;
        this.b = sb2Var;
        this.c = z;
        this.d = str;
        this.e = str2;
        this.f = str3;
        this.g = b55Var;
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
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            v7c v7cVar = this.a;
            boolean zF = p65Var.f(v7cVar);
            sb2 sb2Var = this.b;
            boolean zH = zF | p65Var.h(sb2Var);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zH || objM == uobVar) {
                objM = new dx0(v7cVar, sb2Var, 0);
                p65Var.j0(objM);
            }
            r28 r28VarQ = hlg.q((m45) objM);
            boolean zF2 = p65Var.f(v7cVar) | p65Var.g(this.c) | p65Var.f(this.d) | p65Var.h(sb2Var) | p65Var.f(this.e) | p65Var.f(this.f);
            Object objM2 = p65Var.M();
            if (zF2 || objM2 == uobVar) {
                ex0 ex0Var = new ex0(this.a, this.c, this.d, this.e, this.f, this.b, 0);
                p65Var.j0(ex0Var);
                objM2 = ex0Var;
            }
            r28 r28VarA = wxb.a(r28VarQ, true, (x45) objM2);
            zk7 zk7VarC = dy0.c(z46.d, false);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarA);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            this.g.invoke(p65Var, 0);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
