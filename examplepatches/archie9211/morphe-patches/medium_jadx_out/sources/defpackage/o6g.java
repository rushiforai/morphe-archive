package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o6g extends p4d implements b55 {
    public Object b;
    public fdg c;
    public double d;
    public double e;
    public int f;
    public /* synthetic */ Object g;
    public final /* synthetic */ long h;
    public final /* synthetic */ bh4 i;
    public final /* synthetic */ String j;
    public final /* synthetic */ jrf k;
    public final /* synthetic */ String l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o6g(long j, bh4 bh4Var, String str, jrf jrfVar, String str2, n92 n92Var) {
        super(2, n92Var);
        this.h = j;
        this.i = bh4Var;
        this.j = str;
        this.k = jrfVar;
        this.l = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        o6g o6gVar = new o6g(this.h, this.i, this.j, this.k, this.l, n92Var);
        o6gVar.g = obj;
        return o6gVar;
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        return ((o6g) create((fdg) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x00e0  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0105  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x011b  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x014d  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0161  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0183  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0194 A[RETURN] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r28) {
        /*
            Method dump skipped, instruction units count: 426
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.o6g.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
