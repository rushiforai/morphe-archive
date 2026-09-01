package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cd1 extends p4d implements b55 {
    public Object b;
    public id1 c;
    public Throwable d;
    public int e;
    public int f;
    public final /* synthetic */ id1 g;
    public final /* synthetic */ int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cd1(int i, id1 id1Var, n92 n92Var) {
        super(2, n92Var);
        this.g = id1Var;
        this.h = i;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new cd1(this.h, this.g, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((cd1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x009b  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00f0 A[PHI: r0
      0x00f0: PHI (r0v13 java.lang.Object) = (r0v6 java.lang.Object), (r0v10 java.lang.Object), (r0v20 java.lang.Object) binds: [B:25:0x0099, B:33:0x00ed, B:9:0x002e] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00fc  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x013f A[RETURN] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r31) {
        /*
            Method dump skipped, instruction units count: 342
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cd1.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
