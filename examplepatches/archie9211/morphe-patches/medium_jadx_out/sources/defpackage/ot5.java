package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class ot5 {
    public final ybb a;
    public final u31 b;
    public final y92 c;

    public ot5(ybb ybbVar, u31 u31Var, y92 y92Var) {
        this.a = ybbVar;
        this.b = u31Var;
        this.c = y92Var;
    }

    public abstract Object a(sp8 sp8Var, Object[] objArr);

    /* JADX WARN: Code restructure failed: missing block: B:52:0x011a, code lost:
    
        throw defpackage.vv2.R(r30, null, "@Headers value must be in the form \"Name: Value\". Found: \"%s\"", r14);
     */
    /* JADX WARN: Removed duplicated region for block: B:386:0x08f7  */
    /* JADX WARN: Removed duplicated region for block: B:596:0x08fb A[SYNTHETIC] */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$ArrayArg
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
    public static defpackage.ot5 b(defpackage.kjb r28, java.lang.Class r29, java.lang.reflect.Method r30) {
        /*
            Method dump skipped, instruction units count: 2849
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ot5.b(kjb, java.lang.Class, java.lang.reflect.Method):ot5");
    }
}
