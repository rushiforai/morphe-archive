package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d47 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ x47 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d47(x47 x47Var, n92 n92Var) {
        super(2, n92Var);
        this.c = x47Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new d47(this.c, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((d47) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:57:0x00f9 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00fa A[RETURN] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r12) {
        /*
            Method dump skipped, instruction units count: 251
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.d47.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
