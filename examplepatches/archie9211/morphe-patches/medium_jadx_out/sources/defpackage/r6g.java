package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r6g extends p4d implements b55 {
    public fdg b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ bh4 e;
    public final /* synthetic */ long f;
    public final /* synthetic */ long g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r6g(bh4 bh4Var, long j, long j2, n92 n92Var) {
        super(2, n92Var);
        this.e = bh4Var;
        this.f = j;
        this.g = j2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        r6g r6gVar = new r6g(this.e, this.f, this.g, n92Var);
        r6gVar.d = obj;
        return r6gVar;
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        return ((r6g) create((fdg) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00d6  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00e8 A[RETURN] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r17) {
        /*
            Method dump skipped, instruction units count: 234
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.r6g.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
