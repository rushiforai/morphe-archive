package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h2g extends p4d implements b55 {
    public long b;
    public boolean c;
    public int d;
    public final /* synthetic */ x2g e;
    public final /* synthetic */ rya f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h2g(x2g x2gVar, rya ryaVar, n92 n92Var) {
        super(2, n92Var);
        this.e = x2gVar;
        this.f = ryaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new h2g(this.e, this.f, n92Var);
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        return ((h2g) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x002e, code lost:
    
        if (r9 != r0) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0072, code lost:
    
        if (defpackage.gsa.X(r5, r8) != r0) goto L6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0077, code lost:
    
        return r0;
     */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0026 A[Catch: Exception -> 0x001c, TRY_ENTER, TryCatch #0 {Exception -> 0x001c, blocks: (B:14:0x0026, B:16:0x0030, B:20:0x0038, B:8:0x0018), top: B:45:0x0018 }] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0079  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:21:0x003f -> B:13:0x0024). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:38:0x0072 -> B:6:0x0013). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r9) throws java.lang.Exception {
        /*
            r8 = this;
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r8.d
            x2g r2 = r8.e
            r3 = 0
            r4 = 1
            if (r1 == 0) goto L1e
            if (r1 == r4) goto L16
            boolean r1 = r8.c
            long r5 = r8.b
            defpackage.br7.v(r9)
        L13:
            r9 = r1
            goto L75
        L16:
            long r5 = r8.b
            defpackage.br7.v(r9)     // Catch: java.lang.Exception -> L1c
            goto L30
        L1c:
            r9 = move-exception
            goto L41
        L1e:
            defpackage.br7.v(r9)
            r5 = 1000(0x3e8, double:4.94E-321)
            r9 = r4
        L24:
            if (r9 == 0) goto L79
            r8.b = r5     // Catch: java.lang.Exception -> L1c
            r8.d = r4     // Catch: java.lang.Exception -> L1c
            java.lang.Object r9 = r2.a(r8)     // Catch: java.lang.Exception -> L1c
            if (r9 == r0) goto L77
        L30:
            shf r9 = (defpackage.shf) r9     // Catch: java.lang.Exception -> L1c
            vx1 r1 = r2.f     // Catch: java.lang.Exception -> L1c
            if (r1 == 0) goto L37
            goto L38
        L37:
            r1 = 0
        L38:
            r1.V(r9)     // Catch: java.lang.Exception -> L1c
            zi5 r9 = defpackage.zi5.k     // Catch: java.lang.Exception -> L1c
            r2.b = r9     // Catch: java.lang.Exception -> L1c
            r9 = r3
            goto L24
        L41:
            rya r1 = r8.f
            r1.a = r9
            boolean r1 = r9 instanceof com.google.android.play.core.integrity.StandardIntegrityException
            if (r1 == 0) goto L62
            r1 = r9
            com.google.android.play.core.integrity.StandardIntegrityException r1 = (com.google.android.play.core.integrity.StandardIntegrityException) r1
            com.google.android.gms.common.api.Status r1 = r1.a
            int r1 = r1.a
            r7 = -100
            if (r1 == r7) goto L64
            r7 = -18
            if (r1 == r7) goto L64
            r7 = -12
            if (r1 == r7) goto L64
            r7 = -8
            if (r1 == r7) goto L64
            r7 = -3
            if (r1 == r7) goto L64
        L62:
            r1 = r3
            goto L65
        L64:
            r1 = r4
        L65:
            if (r1 == 0) goto L78
            r8.b = r5
            r8.c = r4
            r9 = 2
            r8.d = r9
            java.lang.Object r9 = defpackage.gsa.X(r5, r8)
            if (r9 == r0) goto L77
            goto L13
        L75:
            long r5 = r5 + r5
            goto L24
        L77:
            return r0
        L78:
            throw r9
        L79:
            c1e r8 = defpackage.c1e.a
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.h2g.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
