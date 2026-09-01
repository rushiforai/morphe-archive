package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class l0f extends p4d implements b55 {
    public rya b;
    public nya c;
    public Object d;
    public int e;
    public /* synthetic */ Object f;
    public final /* synthetic */ m0f g;
    public final /* synthetic */ String h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l0f(m0f m0fVar, String str, n92 n92Var) {
        super(2, n92Var);
        this.g = m0fVar;
        this.h = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        l0f l0fVar = new l0f(this.g, this.h, n92Var);
        l0fVar.f = obj;
        return l0fVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((l0f) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x00e5, code lost:
    
        if (defpackage.r6c.m(r13, r1, r12) == r0) goto L44;
     */
    /* JADX WARN: Removed duplicated region for block: B:26:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00ab A[PHI: r1 r6 r13
      0x00ab: PHI (r1v5 java.lang.Object) = (r1v4 java.lang.Object), (r1v8 java.lang.Object) binds: [B:25:0x0089, B:33:0x00aa] A[DONT_GENERATE, DONT_INLINE]
      0x00ab: PHI (r6v5 rya) = (r6v4 rya), (r6v6 rya) binds: [B:25:0x0089, B:33:0x00aa] A[DONT_GENERATE, DONT_INLINE]
      0x00ab: PHI (r13v6 nya) = (r13v5 nya), (r13v7 nya) binds: [B:25:0x0089, B:33:0x00aa] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00cc  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r13) {
        /*
            Method dump skipped, instruction units count: 236
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.l0f.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
