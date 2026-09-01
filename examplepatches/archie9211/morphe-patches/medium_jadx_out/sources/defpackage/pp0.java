package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pp0 extends uib implements b55 {
    public final /* synthetic */ int c;
    public int d;
    public /* synthetic */ Object e;
    public Object f;
    public Object g;
    public final /* synthetic */ Object h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pp0(xp xpVar, o72 o72Var, rhd rhdVar, n92 n92Var) {
        super(2, n92Var);
        this.c = 2;
        this.f = xpVar;
        this.g = o72Var;
        this.h = rhdVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.c;
        Object obj2 = this.h;
        switch (i) {
            case 0:
                pp0 pp0Var = new pp0((sb2) this.g, (pod) obj2, n92Var);
                pp0Var.e = obj;
                return pp0Var;
            case 1:
                pp0 pp0Var2 = new pp0((gz8) obj2, n92Var, 1);
                pp0Var2.e = obj;
                return pp0Var2;
            case 2:
                pp0 pp0Var3 = new pp0((xp) this.f, (o72) this.g, (rhd) obj2, n92Var);
                pp0Var3.e = obj;
                return pp0Var3;
            default:
                pp0 pp0Var4 = new pp0((yuc) obj2, n92Var, 3);
                pp0Var4.e = obj;
                return pp0Var4;
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
        return ((pp0) create(u4dVar, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:234:0x0430  */
    /* JADX WARN: Removed duplicated region for block: B:238:0x0442  */
    /* JADX WARN: Removed duplicated region for block: B:244:0x045f  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:135:0x023a -> B:137:0x023e). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:215:0x03bc -> B:217:0x03c0). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:233:0x042e -> B:236:0x0432). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:38:0x00d1 -> B:40:0x00d5). Please report as a decompilation issue!!! */
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
    public final java.lang.Object invokeSuspend(java.lang.Object r23) {
        /*
            Method dump skipped, instruction units count: 1134
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pp0.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pp0(sb2 sb2Var, pod podVar, n92 n92Var) {
        super(2, n92Var);
        this.c = 0;
        this.g = sb2Var;
        this.h = podVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ pp0(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.c = i;
        this.h = obj;
    }
}
