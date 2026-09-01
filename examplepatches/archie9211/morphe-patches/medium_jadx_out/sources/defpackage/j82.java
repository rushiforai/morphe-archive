package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j82 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public final /* synthetic */ long e;
    public Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j82(long j, o2b o2bVar, xbg xbgVar, jsf jsfVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 10;
        this.e = j;
        this.f = o2bVar;
        this.g = xbgVar;
        this.h = jsfVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.h;
        Object obj3 = this.g;
        switch (i) {
            case 0:
                j82 j82Var = new j82((k82) this.f, (d4e) obj3, (xy0) obj2, this.e, n92Var, 0);
                j82Var.d = obj;
                return j82Var;
            case 1:
                j82 j82Var2 = new j82((nec) this.f, (String) obj3, (arf) obj2, this.e, n92Var, 1);
                j82Var2.d = obj;
                return j82Var2;
            case 2:
                return new j82((fdg) this.f, (iwf) obj3, this.e, (jrf) obj2, n92Var, 2);
            case 3:
                j82 j82Var3 = new j82((nec) this.f, (fdg) obj3, this.e, (jrf) obj2, n92Var, 3);
                j82Var3.d = obj;
                return j82Var3;
            case 4:
                j82 j82Var4 = new j82((eoc) this.f, (String) obj3, (arf) obj2, this.e, n92Var, 4);
                j82Var4.d = obj;
                return j82Var4;
            case 5:
                j82 j82Var5 = new j82((xbg) this.f, (nig) obj3, this.e, (jrf) obj2, n92Var, 5);
                j82Var5.d = obj;
                return j82Var5;
            case 6:
                return new j82((fdg) this.f, (bh4) obj3, (jrf) obj2, this.e, n92Var, 6);
            case 7:
                j82 j82Var6 = new j82((o2b) this.f, (String) obj3, this.e, (fa4) obj2, n92Var, 7);
                j82Var6.d = obj;
                return j82Var6;
            case 8:
                j82 j82Var7 = new j82((h9g) obj3, this.e, (vx1) obj2, n92Var);
                j82Var7.d = obj;
                return j82Var7;
            case 9:
                j82 j82Var8 = new j82((m9g) this.f, (String) obj3, (awa) obj2, this.e, n92Var, 9);
                j82Var8.d = obj;
                return j82Var8;
            case 10:
                return new j82(this.e, (o2b) this.f, (xbg) obj3, (jsf) obj2, n92Var);
            case 11:
                long j = this.e;
                j82 j82Var9 = new j82(j, n92Var, (ntf) obj2, (nig) obj3);
                j82Var9.d = obj;
                return j82Var9;
            default:
                return new j82((fdg) this.f, (nig) obj3, (ntf) obj2, this.e, n92Var, 12);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((j82) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((j82) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((j82) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 3:
                return ((j82) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 4:
                return ((j82) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 5:
                return ((j82) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 6:
                return ((j82) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 7:
                return ((j82) create((adg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 8:
                return ((j82) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 9:
                return ((j82) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 10:
                return ((j82) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 11:
                return ((j82) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((j82) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:277:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:278:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:281:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:283:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x011e  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0191  */
    /* JADX WARN: Type inference failed for: r1v2, types: [zm7] */
    /* JADX WARN: Type inference failed for: r7v0, types: [java.lang.String, java.util.concurrent.CancellationException, n92] */
    /* JADX WARN: Type inference failed for: r7v1, types: [java.util.concurrent.CancellationException] */
    /* JADX WARN: Type inference failed for: r7v2, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r7v3 */
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
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r21) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 1368
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.j82.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j82(long j, n92 n92Var, ntf ntfVar, nig nigVar) {
        super(2, n92Var);
        this.b = 11;
        this.g = nigVar;
        this.h = ntfVar;
        this.e = j;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j82(Object obj, Object obj2, long j, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
        this.g = obj2;
        this.e = j;
        this.h = obj3;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j82(Object obj, Object obj2, Object obj3, long j, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
        this.g = obj2;
        this.h = obj3;
        this.e = j;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j82(h9g h9gVar, long j, vx1 vx1Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 8;
        this.g = h9gVar;
        this.e = j;
        this.h = vx1Var;
    }
}
