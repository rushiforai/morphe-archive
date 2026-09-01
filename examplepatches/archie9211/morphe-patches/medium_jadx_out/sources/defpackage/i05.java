package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i05 extends uib implements b55 {
    public final /* synthetic */ int c;
    public int d;
    public Object e;
    public Object f;
    public final /* synthetic */ Object g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i05(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.c = i;
        this.f = obj;
        this.g = obj2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.c;
        Object obj2 = this.g;
        switch (i) {
            case 0:
                i05 i05Var = new i05((ib2) this.f, (b55) obj2, n92Var, 0);
                i05Var.e = obj;
                return i05Var;
            case 1:
                i05 i05Var2 = new i05((rhd) obj2, n92Var, 1);
                i05Var2.e = obj;
                return i05Var2;
            case 2:
                i05 i05Var3 = new i05((m45) obj2, n92Var, 2);
                i05Var3.f = obj;
                return i05Var3;
            default:
                i05 i05Var4 = new i05((mb9) this.f, (rya) obj2, n92Var, 3);
                i05Var4.e = obj;
                return i05Var4;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.c;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((i05) create((u4d) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((i05) create((u4d) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((i05) create((nzb) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((i05) create((u4d) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:102:0x01dc A[Catch: CancellationException -> 0x01c2, TRY_ENTER, TryCatch #0 {CancellationException -> 0x01c2, blocks: (B:102:0x01dc, B:105:0x01ea, B:92:0x01bd, B:97:0x01ca), top: B:118:0x01a1 }] */
    /* JADX WARN: Removed duplicated region for block: B:142:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r0v12, types: [b55] */
    /* JADX WARN: Type inference failed for: r5v0, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v2, types: [java.lang.Object, u4d] */
    /* JADX WARN: Type inference failed for: r5v3, types: [java.lang.Object, u4d] */
    /* JADX WARN: Type inference failed for: r5v31 */
    /* JADX WARN: Type inference failed for: r5v32 */
    /* JADX WARN: Type inference failed for: r5v33 */
    /* JADX WARN: Type inference failed for: r5v34 */
    /* JADX WARN: Type inference failed for: r5v35 */
    /* JADX WARN: Type inference failed for: r5v4, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r5v5 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:108:0x01f5 -> B:100:0x01d6). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:114:0x0209 -> B:100:0x01d6). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:32:0x00a4 -> B:34:0x00a8). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:53:0x010d -> B:56:0x0112). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:55:0x0111 -> B:56:0x0112). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:71:0x016b -> B:73:0x016f). Please report as a decompilation issue!!! */
    /*  JADX ERROR: JadxOverflowException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxOverflowException: Regions count limit reached
        	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:59)
        	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:31)
        	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:19)
        */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r18) {
        /*
            Method dump skipped, instruction units count: 538
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.i05.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i05(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.c = i;
        this.g = obj;
    }
}
