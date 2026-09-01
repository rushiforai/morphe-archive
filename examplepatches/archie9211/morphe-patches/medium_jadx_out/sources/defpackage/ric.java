package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ric extends uib implements b55 {
    public long[] c;
    public int d;
    public int e;
    public int f;
    public /* synthetic */ Object g;
    public final /* synthetic */ sic h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ric(sic sicVar, n92 n92Var) {
        super(2, n92Var);
        this.h = sicVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        ric ricVar = new ric(this.h, n92Var);
        ricVar.g = obj;
        return ricVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((ric) create((nzb) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x0079, code lost:
    
        if (r14.b(r22, r15) == r8) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x00a6, code lost:
    
        if (r9.b(r22, r12) == r8) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00d9, code lost:
    
        if (r6.b(r22, r7) == r8) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00db, code lost:
    
        return r8;
     */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00ba  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:17:0x0079 -> B:19:0x007c). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:28:0x00a6 -> B:30:0x00a9). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:31:0x00ac -> B:30:0x00a9). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:40:0x00d9 -> B:42:0x00dc). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:43:0x00df -> B:42:0x00dc). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r23) {
        /*
            Method dump skipped, instruction units count: 232
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ric.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
