package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qw9 extends p4d implements b55 {
    public Object b;
    public sw9 c;
    public Throwable d;
    public int e;
    public int f;
    public final /* synthetic */ sw9 g;
    public final /* synthetic */ int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qw9(int i, n92 n92Var, sw9 sw9Var) {
        super(2, n92Var);
        this.g = sw9Var;
        this.h = i;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new qw9(this.h, n92Var, this.g);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((qw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x00fb, code lost:
    
        if (r3.a(r4, r17) != r9) goto L36;
     */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00c6 A[PHI: r0
      0x00c6: PHI (r0v12 java.lang.Object) = (r0v10 java.lang.Object), (r0v11 java.lang.Object), (r0v24 java.lang.Object) binds: [B:20:0x0094, B:26:0x00c3, B:13:0x0039] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00cd  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r18) {
        /*
            Method dump skipped, instruction units count: 257
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qw9.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
