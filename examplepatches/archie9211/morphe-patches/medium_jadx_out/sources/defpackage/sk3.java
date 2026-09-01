package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sk3 extends uib implements b55 {
    public lb9 c;
    public int d;
    public int e;
    public /* synthetic */ Object f;
    public final /* synthetic */ nya g;
    public final /* synthetic */ rya h;
    public final /* synthetic */ rya i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public sk3(nya nyaVar, rya ryaVar, rya ryaVar2, n92 n92Var) {
        super(2, n92Var);
        this.g = nyaVar;
        this.h = ryaVar;
        this.i = ryaVar2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        sk3 sk3Var = new sk3(this.g, this.h, this.i, n92Var);
        sk3Var.f = obj;
        return sk3Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((sk3) create((u4d) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x0091, code lost:
    
        r2 = 1;
     */
    /* JADX WARN: Removed duplicated region for block: B:12:0x003c  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00af  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00e0  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0105  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0131  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x00ce A[EDGE_INSN: B:69:0x00ce->B:45:0x00ce BREAK  A[LOOP:0: B:40:0x00bb->B:44:0x00cb], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0068 A[SYNTHETIC] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:38:0x00af -> B:39:0x00b2). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r17) {
        /*
            Method dump skipped, instruction units count: 308
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sk3.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
