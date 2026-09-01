package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yh implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ do4 b;

    public /* synthetic */ yh(do4 do4Var, int i) {
        this.a = i;
        this.b = do4Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:110:0x01a8  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x01ef  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x0229  */
    /* JADX WARN: Removed duplicated region for block: B:169:0x0285  */
    /* JADX WARN: Removed duplicated region for block: B:184:0x02c3  */
    /* JADX WARN: Removed duplicated region for block: B:199:0x0305  */
    /* JADX WARN: Removed duplicated region for block: B:217:0x0349  */
    /* JADX WARN: Removed duplicated region for block: B:232:0x0387  */
    /* JADX WARN: Removed duplicated region for block: B:261:0x03e4  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:292:0x045f  */
    /* JADX WARN: Removed duplicated region for block: B:309:0x0499  */
    /* JADX WARN: Removed duplicated region for block: B:326:0x04d3  */
    /* JADX WARN: Removed duplicated region for block: B:346:0x051b  */
    /* JADX WARN: Removed duplicated region for block: B:366:0x0562  */
    /* JADX WARN: Removed duplicated region for block: B:381:0x059f  */
    /* JADX WARN: Removed duplicated region for block: B:420:0x0634  */
    /* JADX WARN: Removed duplicated region for block: B:438:0x0677  */
    /* JADX WARN: Removed duplicated region for block: B:465:0x06d4  */
    /* JADX WARN: Removed duplicated region for block: B:485:0x071a  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:500:0x0752  */
    /* JADX WARN: Removed duplicated region for block: B:510:0x0776  */
    /* JADX WARN: Removed duplicated region for block: B:525:0x07ae  */
    /* JADX WARN: Removed duplicated region for block: B:542:0x07ef  */
    /* JADX WARN: Removed duplicated region for block: B:565:0x0844  */
    /* JADX WARN: Removed duplicated region for block: B:597:0x08d6  */
    /* JADX WARN: Removed duplicated region for block: B:629:0x0966  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x012c  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0023  */
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
    @Override // defpackage.do4
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.Object r11, defpackage.n92 r12) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 2596
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yh.a(java.lang.Object, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object b(defpackage.bo4 r5, defpackage.n92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.hp4
            if (r0 == 0) goto L13
            r0 = r6
            hp4 r0 = (defpackage.hp4) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            hp4 r0 = new hp4
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r6)
            goto L3c
        L27:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L2e:
            defpackage.br7.v(r6)
            r0.d = r3
            do4 r4 = r4.b
            java.lang.Object r4 = defpackage.wgf.l(r4, r5, r0)
            if (r4 != r1) goto L3c
            return r1
        L3c:
            c1e r4 = defpackage.c1e.a
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yh.b(bo4, n92):java.lang.Object");
    }
}
