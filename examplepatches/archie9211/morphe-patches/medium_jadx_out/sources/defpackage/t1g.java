package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t1g extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public final /* synthetic */ Object e;
    public Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t1g(b2g b2gVar, orf orfVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 1;
        this.e = b2gVar;
        this.f = orfVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.e;
        switch (i) {
            case 0:
                t1g t1gVar = new t1g((arf) this.f, (b2g) obj2, n92Var, 0);
                t1gVar.d = obj;
                return t1gVar;
            case 1:
                t1g t1gVar2 = new t1g((b2g) obj2, (orf) this.f, n92Var);
                t1gVar2.d = obj;
                return t1gVar2;
            case 2:
                t1g t1gVar3 = new t1g((x2g) this.f, (String) obj2, n92Var, 2);
                t1gVar3.d = obj;
                return t1gVar3;
            case 3:
                t1g t1gVar4 = new t1g((w3g) this.f, (String) obj2, n92Var, 3);
                t1gVar4.d = obj;
                return t1gVar4;
            case 4:
                return new t1g((w3g) this.f, (jrf) obj2, n92Var, 4);
            case 5:
                t1g t1gVar5 = new t1g((w3g) obj2, n92Var, 5);
                t1gVar5.d = obj;
                return t1gVar5;
            case 6:
                return new t1g((fdg) this.f, (e4g) obj2, n92Var, 6);
            case 7:
                t1g t1gVar6 = new t1g((d6g) obj2, n92Var, 7);
                t1gVar6.d = obj;
                return t1gVar6;
            case 8:
                return new t1g((nig) this.f, (fdg) obj2, n92Var, 8);
            default:
                t1g t1gVar7 = new t1g((tag) obj2, n92Var, 9);
                t1gVar7.d = obj;
                return t1gVar7;
        }
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((t1g) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((t1g) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((t1g) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 3:
                return ((t1g) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 4:
                return ((t1g) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 5:
                return ((t1g) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 6:
                return ((t1g) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 7:
                return ((t1g) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 8:
                return ((t1g) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((t1g) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:119:0x02e3  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x02eb  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x0311  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x0313  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x0332  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x033a  */
    /* JADX WARN: Removed duplicated region for block: B:173:0x03bd A[PHI: r1
      0x03bd: PHI (r1v18 ??) = (r1v42 ??), (r1v43 ??), (r1v44 ??) binds: [B:168:0x03af, B:161:0x038d, B:165:0x039e] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0098 A[PHI: r2 r3
      0x0098: PHI (r2v54 fdg) = (r2v53 fdg), (r2v60 fdg) binds: [B:20:0x0096, B:10:0x0028] A[DONT_GENERATE, DONT_INLINE]
      0x0098: PHI (r3v62 java.lang.Object) = (r3v61 java.lang.Object), (r3v68 java.lang.Object) binds: [B:20:0x0096, B:10:0x0028] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:264:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:266:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:274:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:275:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:283:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:64:0x016f  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x01df  */
    /* JADX WARN: Type inference failed for: r1v18 */
    /* JADX WARN: Type inference failed for: r1v42 */
    /* JADX WARN: Type inference failed for: r1v43 */
    /* JADX WARN: Type inference failed for: r1v44 */
    /* JADX WARN: Type inference failed for: r3v13 */
    /* JADX WARN: Type inference failed for: r3v7, types: [int] */
    /* JADX WARN: Type inference failed for: r3v71 */
    /* JADX WARN: Type inference failed for: r3v72 */
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
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:173:0x03bd -> B:253:0x03be). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r18) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 1382
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.t1g.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ t1g(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
        this.e = obj2;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ t1g(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
    }
}
