package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class i5d extends p4d implements b55 {
    public int b;
    public final /* synthetic */ ou c;
    public final /* synthetic */ float d;
    public final /* synthetic */ boc e;
    public final /* synthetic */ koc f;
    public final /* synthetic */ float g;
    public final /* synthetic */ ou h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i5d(ou ouVar, float f, boc bocVar, koc kocVar, float f2, ou ouVar2, n92 n92Var) {
        super(2, n92Var);
        this.c = ouVar;
        this.d = f;
        this.e = bocVar;
        this.f = kocVar;
        this.g = f2;
        this.h = ouVar2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new i5d(this.c, this.d, this.e, this.f, this.g, this.h, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((i5d) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x004d, code lost:
    
        if (defpackage.o7f.s(r7, r13) == r0) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0087, code lost:
    
        if (defpackage.o7f.s(r7, r13) == r0) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x009d, code lost:
    
        if (defpackage.o7f.s(r14, r13) == r0) goto L31;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r14) {
        /*
            r13 = this;
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r13.b
            boc r2 = r13.e
            r3 = 3
            r4 = 2
            r5 = 1
            koc r6 = r13.f
            if (r1 == 0) goto L27
            if (r1 == r5) goto L23
            if (r1 == r4) goto L1f
            if (r1 != r3) goto L18
            defpackage.br7.v(r14)
            goto La0
        L18:
            java.lang.String r13 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r13)
            r13 = 0
            return r13
        L1f:
            defpackage.br7.v(r14)
            goto L8a
        L23:
            defpackage.br7.v(r14)
            goto L50
        L27:
            defpackage.br7.v(r14)
            ou r8 = r13.c
            java.lang.Object r14 = r8.d()
            java.lang.Number r14 = (java.lang.Number) r14
            float r14 = r14.floatValue()
            float r1 = r13.d
            int r14 = (r14 > r1 ? 1 : (r14 == r1 ? 0 : -1))
            float r9 = r13.g
            r11 = 0
            ou r10 = r13.h
            if (r14 <= 0) goto L6c
            f5d r7 = new f5d
            r12 = 1
            r7.<init>(r8, r9, r10, r11, r12)
            r13.b = r5
            java.lang.Object r13 = defpackage.o7f.s(r7, r13)
            if (r13 != r0) goto L50
            goto L9f
        L50:
            boolean r13 = r2 instanceof defpackage.nca
            if (r13 == 0) goto L5e
            nca r2 = (defpackage.nca) r2
            java.lang.String r13 = r2.a
            gen.model.SourceParameter r14 = r2.j
            r6.a(r13, r14)
            goto La0
        L5e:
            boolean r13 = r2 instanceof defpackage.hae
            if (r13 == 0) goto La0
            hae r2 = (defpackage.hae) r2
            java.lang.String r13 = r2.a
            gen.model.SourceParameter r14 = r2.h
            r6.b(r13, r14)
            goto La0
        L6c:
            java.lang.Object r14 = r8.d()
            java.lang.Number r14 = (java.lang.Number) r14
            float r14 = r14.floatValue()
            float r1 = -r1
            int r14 = (r14 > r1 ? 1 : (r14 == r1 ? 0 : -1))
            if (r14 >= 0) goto L92
            f5d r7 = new f5d
            r12 = 2
            r7.<init>(r8, r9, r10, r11, r12)
            r13.b = r4
            java.lang.Object r13 = defpackage.o7f.s(r7, r13)
            if (r13 != r0) goto L8a
            goto L9f
        L8a:
            java.lang.String r13 = r2.getId()
            r6.c(r13)
            goto La0
        L92:
            pm1 r14 = new pm1
            r14.<init>(r8, r10, r11, r5)
            r13.b = r3
            java.lang.Object r13 = defpackage.o7f.s(r14, r13)
            if (r13 != r0) goto La0
        L9f:
            return r0
        La0:
            c1e r13 = defpackage.c1e.a
            return r13
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.i5d.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
