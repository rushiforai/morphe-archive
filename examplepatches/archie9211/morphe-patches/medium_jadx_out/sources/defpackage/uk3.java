package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uk3 extends uib implements b55 {
    public final /* synthetic */ int c;
    public int d;
    public /* synthetic */ Object e;
    public Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ j55 i;
    public final /* synthetic */ Object j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ uk3(Object obj, Object obj2, Object obj3, j55 j55Var, x45 x45Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.c = i;
        this.f = obj;
        this.g = obj2;
        this.h = obj3;
        this.i = j55Var;
        this.j = x45Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.c;
        Object obj2 = this.j;
        j55 j55Var = this.i;
        Object obj3 = this.h;
        Object obj4 = this.g;
        switch (i) {
            case 0:
                uk3 uk3Var = new uk3((e73) this.f, (pk3) obj4, (b55) obj3, (m45) j55Var, (r00) obj2, n92Var, 0);
                uk3Var.e = obj;
                return uk3Var;
            case 1:
                uk3 uk3Var2 = new uk3((rya) this.f, (nya) obj4, (nya) obj3, (x45) j55Var, (x45) obj2, n92Var, 1);
                uk3Var2.e = obj;
                return uk3Var2;
            default:
                uk3 uk3Var3 = new uk3((sb2) obj4, (zhd) obj3, (ws) j55Var, (f0a) obj2, n92Var);
                uk3Var3.e = obj;
                return uk3Var3;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.c;
        c1e c1eVar = c1e.a;
        u4d u4dVar = (u4d) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((uk3) create(u4dVar, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Path cross not found for [B:46:0x0168, B:48:0x016c], limit reached: 93 */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00ec  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00f8  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x011d  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:34:0x00ea -> B:37:0x00ee). Please report as a decompilation issue!!! */
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
    public final java.lang.Object invokeSuspend(java.lang.Object r22) {
        /*
            Method dump skipped, instruction units count: 578
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uk3.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uk3(sb2 sb2Var, zhd zhdVar, ws wsVar, f0a f0aVar, n92 n92Var) {
        super(2, n92Var);
        this.c = 2;
        this.g = sb2Var;
        this.h = zhdVar;
        this.i = wsVar;
        this.j = f0aVar;
    }
}
