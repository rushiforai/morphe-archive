package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ltd extends p4d implements b55 {
    public gn8[] b;
    public mtd c;
    public jrd d;
    public int e;
    public int f;
    public int g;
    public int h;
    public final /* synthetic */ gn8[] i;
    public final /* synthetic */ mtd j;
    public final /* synthetic */ jrd k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ltd(gn8[] gn8VarArr, mtd mtdVar, jrd jrdVar, n92 n92Var) {
        super(2, n92Var);
        this.i = gn8VarArr;
        this.j = mtdVar;
        this.k = jrdVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new ltd(this.i, this.j, this.k, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((ltd) create((w49) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0074, code lost:
    
        if (r8.f(r7, r13, r12) == r0) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x005c, code lost:
    
        r6 = r10;
     */
    /* JADX WARN: Removed duplicated region for block: B:11:0x0033  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x007a  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:26:0x0077 -> B:27:0x0078). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r13) {
        /*
            r12 = this;
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r12.h
            r2 = 0
            r3 = 2
            r4 = 1
            if (r1 == 0) goto L23
            if (r1 == r4) goto Ld
            if (r1 != r3) goto L1d
        Ld:
            int r1 = r12.g
            int r5 = r12.f
            int r6 = r12.e
            jrd r7 = r12.d
            mtd r8 = r12.c
            gn8[] r9 = r12.b
            defpackage.br7.v(r13)
            goto L5c
        L1d:
            java.lang.String r12 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r12)
            return r2
        L23:
            defpackage.br7.v(r13)
            gn8[] r13 = r12.i
            int r1 = r13.length
            r5 = 0
            mtd r6 = r12.j
            jrd r7 = r12.k
            r9 = r13
            r13 = r5
            r8 = r6
        L31:
            if (r5 >= r1) goto L7a
            r6 = r9[r5]
            int r10 = r13 + 1
            int[] r11 = defpackage.ktd.a
            int r6 = r6.ordinal()
            r6 = r11[r6]
            if (r6 == r4) goto L77
            if (r6 == r3) goto L62
            r11 = 3
            if (r6 != r11) goto L5e
            r12.b = r9
            r12.c = r8
            r12.d = r7
            r12.e = r10
            r12.f = r5
            r12.g = r1
            r12.h = r3
            java.lang.Object r13 = r8.g(r7, r13, r12)
            if (r13 != r0) goto L5b
            goto L76
        L5b:
            r6 = r10
        L5c:
            r13 = r6
            goto L78
        L5e:
            defpackage.ygf.a()
            return r2
        L62:
            r12.b = r9
            r12.c = r8
            r12.d = r7
            r12.e = r10
            r12.f = r5
            r12.g = r1
            r12.h = r4
            java.lang.Object r13 = r8.f(r7, r13, r12)
            if (r13 != r0) goto L5b
        L76:
            return r0
        L77:
            r13 = r10
        L78:
            int r5 = r5 + r4
            goto L31
        L7a:
            c1e r12 = defpackage.c1e.a
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ltd.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
