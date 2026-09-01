package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g12 extends uib implements b55 {
    public int c;
    public int d;
    public int e;
    public int f;
    public /* synthetic */ Object g;
    public final /* synthetic */ h12 h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g12(h12 h12Var, n92 n92Var) {
        super(2, n92Var);
        this.h = h12Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        g12 g12Var = new g12(this.h, n92Var);
        g12Var.g = obj;
        return g12Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((g12) create((nzb) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0178  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x016e -> B:31:0x0170). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r18) {
        /*
            Method dump skipped, instruction units count: 404
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g12.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
