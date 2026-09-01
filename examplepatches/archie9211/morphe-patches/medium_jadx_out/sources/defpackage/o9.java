package defpackage;

import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class o9 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public int d;
    public Object e;
    public Object f;
    public final /* synthetic */ Object g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ o9(Object obj, int i, Object obj2, Object obj3, n92 n92Var, int i2) {
        super(2, n92Var);
        this.b = i2;
        this.e = obj;
        this.d = i;
        this.f = obj2;
        this.g = obj3;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.g;
        switch (i) {
            case 0:
                return new o9((r9) obj2, n92Var, 0);
            case 1:
                return new o9((yd0) this.f, (Exception) obj2, n92Var);
            case 2:
                return new o9((bo4[]) this.e, this.d, (AtomicInteger) this.f, (uz0) obj2, n92Var, 2);
            case 3:
                return new o9((o08) obj2, n92Var, 3);
            case 4:
                return new o9((ko9) obj2, n92Var, 4);
            case 5:
                o9 o9Var = new o9(this.d, n92Var, (jbb) obj2);
                o9Var.e = obj;
                return o9Var;
            default:
                return new o9((kv6) this.e, this.d, (upc) this.f, (l78) obj2, n92Var, 6);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((o9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((o9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((o9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 3:
                return ((o9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 4:
                return ((o9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 5:
                return ((o9) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((o9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:111:0x0221 A[Catch: all -> 0x01c9, TryCatch #1 {all -> 0x01c9, blocks: (B:94:0x01bf, B:109:0x021d, B:111:0x0221, B:113:0x0226, B:116:0x022e, B:119:0x0235, B:120:0x0263, B:121:0x0273, B:123:0x0279), top: B:237:0x01bf }] */
    /* JADX WARN: Removed duplicated region for block: B:123:0x0279 A[Catch: all -> 0x01c9, TRY_LEAVE, TryCatch #1 {all -> 0x01c9, blocks: (B:94:0x01bf, B:109:0x021d, B:111:0x0221, B:113:0x0226, B:116:0x022e, B:119:0x0235, B:120:0x0263, B:121:0x0273, B:123:0x0279), top: B:237:0x01bf }] */
    /* JADX WARN: Removed duplicated region for block: B:186:0x0372  */
    /* JADX WARN: Removed duplicated region for block: B:189:0x03a4  */
    /* JADX WARN: Removed duplicated region for block: B:212:0x0487  */
    /* JADX WARN: Removed duplicated region for block: B:213:0x048c  */
    /* JADX WARN: Removed duplicated region for block: B:217:0x04a7 A[PHI: r1 r5 r9
      0x04a7: PHI (r1v4 java.lang.Object) = (r1v3 java.lang.Object), (r1v7 java.lang.Object) binds: [B:215:0x04a4, B:198:0x0410] A[DONT_GENERATE, DONT_INLINE]
      0x04a7: PHI (r5v3 o9) = (r5v2 o9), (r5v0 o9) binds: [B:215:0x04a4, B:198:0x0410] A[DONT_GENERATE, DONT_INLINE]
      0x04a7: PHI (r9v5 tb2) = (r9v4 tb2), (r9v6 tb2) binds: [B:215:0x04a4, B:198:0x0410] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:219:0x04ab  */
    /* JADX WARN: Removed duplicated region for block: B:226:0x04de A[PHI: r1 r5 r9
      0x04de: PHI (r1v11 java.lang.Object) = (r1v4 java.lang.Object), (r1v8 java.lang.Object), (r1v16 java.lang.Object) binds: [B:218:0x04a9, B:224:0x04db, B:196:0x03f2] A[DONT_GENERATE, DONT_INLINE]
      0x04de: PHI (r5v5 o9) = (r5v3 o9), (r5v4 o9), (r5v0 o9) binds: [B:218:0x04a9, B:224:0x04db, B:196:0x03f2] A[DONT_GENERATE, DONT_INLINE]
      0x04de: PHI (r9v10 tb2) = (r9v5 tb2), (r9v7 tb2), (r9v11 tb2) binds: [B:218:0x04a9, B:224:0x04db, B:196:0x03f2] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:228:0x04e4  */
    /* JADX WARN: Removed duplicated region for block: B:256:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:265:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:269:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0157  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x018e A[PHI: r1
      0x018e: PHI (r1v30 java.lang.Object) = (r1v28 java.lang.Object), (r1v29 java.lang.Object), (r1v40 java.lang.Object) binds: [B:72:0x0155, B:81:0x018b, B:61:0x010c] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0194  */
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
    public final java.lang.Object invokeSuspend(java.lang.Object r32) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 1316
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.o9.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o9(yd0 yd0Var, Exception exc, n92 n92Var) {
        super(2, n92Var);
        this.b = 1;
        this.f = yd0Var;
        this.g = exc;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o9(int i, n92 n92Var, jbb jbbVar) {
        super(2, n92Var);
        this.b = 5;
        this.g = jbbVar;
        this.d = i;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ o9(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.g = obj;
    }
}
