package defpackage;

import java.util.LinkedHashSet;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public final class qs6 implements m45 {
    public final /* synthetic */ int a;
    public final ts6 b;

    public /* synthetic */ qs6(ts6 ts6Var, int i) {
        this.a = i;
        this.b = ts6Var;
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
    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        ts6 ts6Var = this.b;
        switch (i) {
            case 0:
                p83 p83Var = p83.m;
                ev7.a.getClass();
                x45 x45Var = h06.x;
                p83Var.getClass();
                List list = p83Var.a;
                ng8 ng8Var = ng8.WHEN_GET_ALL_DESCRIPTORS;
                LinkedHashSet linkedHashSet = new LinkedHashSet();
                if (p83Var.a(p83.l)) {
                    for (n98 n98Var : ts6Var.h(p83Var, x45Var)) {
                        x45Var.invoke(n98Var);
                        co1 co1VarD = ts6Var.d(n98Var, ng8Var);
                        if (co1VarD != null) {
                            linkedHashSet.add(co1VarD);
                        }
                    }
                }
                if (p83Var.a(p83.i) && !list.contains(l83.a)) {
                    for (n98 n98Var2 : ts6Var.i(p83Var, x45Var)) {
                        x45Var.invoke(n98Var2);
                        linkedHashSet.addAll(ts6Var.a(n98Var2, ng8Var));
                    }
                }
                if (p83Var.a(p83.j) && !list.contains(l83.a)) {
                    for (n98 n98Var3 : ts6Var.o(p83Var)) {
                        x45Var.invoke(n98Var3);
                        linkedHashSet.addAll(ts6Var.f(n98Var3, ng8Var));
                    }
                }
                return bu1.m1(linkedHashSet);
            case 1:
                return ts6Var.k();
            case 2:
                return ts6Var.i(p83.p, null);
            case 3:
                return ts6Var.o(p83.q);
            default:
                return ts6Var.h(p83.o, null);
        }
    }
}
