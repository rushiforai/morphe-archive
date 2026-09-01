package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mp0 extends uib implements b55 {
    public xpc c;
    public mb9 d;
    public long e;
    public int f;
    public /* synthetic */ Object g;
    public final /* synthetic */ sb2 h;
    public final /* synthetic */ pod i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mp0(sb2 sb2Var, pod podVar, n92 n92Var) {
        super(2, n92Var);
        this.h = sb2Var;
        this.i = podVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        mp0 mp0Var = new mp0(this.h, this.i, n92Var);
        mp0Var.g = obj;
        return mp0Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((mp0) create((u4d) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00c5 A[Catch: all -> 0x0019, TRY_LEAVE, TryCatch #1 {all -> 0x0019, blocks: (B:8:0x0014, B:41:0x00c1, B:43:0x00c5), top: B:50:0x0014 }] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r14) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 221
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mp0.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
