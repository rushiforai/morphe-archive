package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cb6 extends uib implements b55 {
    public gh8 c;
    public hl1 d;
    public int e;
    public int f;
    public int g;
    public /* synthetic */ Object h;
    public final /* synthetic */ db6 i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cb6(n92 n92Var, db6 db6Var) {
        super(2, n92Var);
        this.i = db6Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        cb6 cb6Var = new cb6(n92Var, this.i);
        cb6Var.h = obj;
        return cb6Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((cb6) create((nzb) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0040, code lost:
    
        if (r0.b(r8, r9) == r1) goto L26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x007b, code lost:
    
        if (r0.b(r8, r7) == r1) goto L26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x007d, code lost:
    
        return r1;
     */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0062  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:23:0x0064 -> B:27:0x007e). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x007b -> B:27:0x007e). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r9) {
        /*
            r8 = this;
            java.lang.Object r0 = r8.h
            nzb r0 = (defpackage.nzb) r0
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r8.g
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L27
            if (r2 == r4) goto L23
            if (r2 != r3) goto L1d
            int r2 = r8.f
            int r4 = r8.e
            hl1 r5 = r8.d
            gh8 r6 = r8.c
            defpackage.br7.v(r9)
            goto L7e
        L1d:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r5
        L23:
            defpackage.br7.v(r9)
            goto L83
        L27:
            defpackage.br7.v(r9)
            db6 r9 = r8.i
            java.lang.Object r9 = r9.H()
            boolean r2 = r9 instanceof defpackage.hl1
            if (r2 == 0) goto L43
            hl1 r9 = (defpackage.hl1) r9
            db6 r9 = r9.e
            r8.h = r5
            r8.g = r4
            tb2 r8 = r0.b(r8, r9)
            if (r8 != r1) goto L83
            goto L7d
        L43:
            boolean r2 = r9 instanceof defpackage.m06
            if (r2 == 0) goto L83
            m06 r9 = (defpackage.m06) r9
            gh8 r9 = r9.g()
            if (r9 == 0) goto L83
            java.lang.Object r2 = r9.e()
            r2.getClass()
            y67 r2 = (defpackage.y67) r2
            r4 = 0
            r6 = r9
            r5 = r2
            r2 = r4
        L5c:
            boolean r9 = r5.equals(r6)
            if (r9 != 0) goto L83
            boolean r9 = r5 instanceof defpackage.hl1
            if (r9 == 0) goto L7e
            r9 = r5
            hl1 r9 = (defpackage.hl1) r9
            db6 r7 = r9.e
            r8.h = r0
            r8.c = r6
            r8.d = r9
            r8.e = r4
            r8.f = r2
            r8.g = r3
            tb2 r9 = r0.b(r8, r7)
            if (r9 != r1) goto L7e
        L7d:
            return r1
        L7e:
            y67 r5 = r5.h()
            goto L5c
        L83:
            c1e r8 = defpackage.c1e.a
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cb6.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
