package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ev extends co6 implements c55 {
    public final /* synthetic */ ejc a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ ov c;
    public final /* synthetic */ mz1 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ev(ejc ejcVar, Object obj, ov ovVar, mz1 mz1Var) {
        super(3);
        this.a = ejcVar;
        this.b = obj;
        this.c = ovVar;
        this.d = mz1Var;
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
    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        lw lwVar = (lw) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Number) obj3).intValue();
        if ((iIntValue & 6) == 0) {
            iIntValue |= (iIntValue & 8) == 0 ? ((p65) x12Var).f(lwVar) : ((p65) x12Var).h(lwVar) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            ejc ejcVar = this.a;
            boolean zF = p65Var.f(ejcVar);
            Object obj4 = this.b;
            boolean zH = zF | p65Var.h(obj4);
            ov ovVar = this.c;
            boolean zH2 = zH | p65Var.h(ovVar);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zH2 || objM == uobVar) {
                objM = new vt(ejcVar, obj4, ovVar, 1);
                p65Var.j0(objM);
            }
            kyd.h(lwVar, (x45) objM, p65Var);
            f78 f78Var = ovVar.d;
            lwVar.getClass();
            f78Var.m(obj4, ((mw) lwVar).a);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new iv();
                p65Var.j0(objM2);
            }
            this.d.k((iv) objM2, obj4, p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
