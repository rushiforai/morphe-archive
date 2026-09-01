package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ml0 extends q28 {
    public ild o;
    public final /* synthetic */ nl0 p;

    public ml0(nl0 nl0Var) {
        this.p = nl0Var;
    }

    @Override // defpackage.q28
    public final void A0() {
        nl0 nl0Var = this.p;
        if (nl0Var.b == this) {
            nl0Var.b = null;
        }
        ild ildVar = this.o;
        if (ildVar != null) {
            ildVar.b();
        }
        this.o = null;
    }

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
    public final void I0() {
        i0 i0Var = new i0(this, 12, this.p);
        aq6 aq6VarV0 = flb.v0(this);
        int i = aq6VarV0.b;
        cxa rectManager = ((mn) dq6.a(aq6VarV0)).getRectManager();
        jld jldVar = rectManager.c;
        jldVar.getClass();
        k68 k68Var = jldVar.a;
        ild ildVar = new ild(jldVar, i, this, i0Var);
        Object objB = k68Var.b(i);
        if (objB == null) {
            k68Var.i(i, ildVar);
            objB = ildVar;
        }
        ild ildVar2 = (ild) objB;
        if (ildVar2 != ildVar) {
            while (true) {
                ild ildVar3 = ildVar2.d;
                if (ildVar3 == null) {
                    break;
                } else {
                    ildVar2 = ildVar3;
                }
            }
            ildVar2.d = ildVar;
        }
        if (flb.v0(this.a).g) {
            rectManager.b.D(i, true);
        }
        rectManager.e = true;
        rectManager.i();
        this.o = ildVar;
    }

    @Override // defpackage.q28
    public final void y0() {
        nl0 nl0Var = this.p;
        nl0Var.b = this;
        if (nl0Var.c != null) {
            I0();
        }
    }
}
