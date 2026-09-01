package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class dgc extends uib implements b55 {
    public Object c;
    public Iterator d;
    public int e;
    public int f;
    public int g;
    public /* synthetic */ Object h;
    public final /* synthetic */ int i;
    public final /* synthetic */ int j;
    public final /* synthetic */ Iterator k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dgc(int i, int i2, Iterator it2, n92 n92Var) {
        super(2, n92Var);
        this.i = i;
        this.j = i2;
        this.k = it2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        dgc dgcVar = new dgc(this.i, this.j, this.k, n92Var);
        dgcVar.h = obj;
        return dgcVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((dgc) create((nzb) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0150  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0156  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0172  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x00b4 A[SYNTHETIC] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:33:0x00a9 -> B:17:0x0065). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:47:0x0102 -> B:58:0x0127). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:60:0x0143 -> B:62:0x0146). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:69:0x016b -> B:71:0x016e). Please report as a decompilation issue!!! */
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
    public final java.lang.Object invokeSuspend(java.lang.Object r20) {
        /*
            Method dump skipped, instruction units count: 399
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dgc.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
