package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e04 extends uib implements b55 {
    public final /* synthetic */ int c;
    public long[] d;
    public int e;
    public int f;
    public int g;
    public int h;
    public long i;
    public int j;
    public /* synthetic */ Object k;
    public Object l;
    public final /* synthetic */ Object m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e04(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.c = i;
        this.m = obj;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.c;
        Object obj2 = this.m;
        switch (i) {
            case 0:
                e04 e04Var = new e04((f04) obj2, n92Var, 0);
                e04Var.k = obj;
                return e04Var;
            case 1:
                e04 e04Var2 = new e04((f04) obj2, n92Var, 1);
                e04Var2.k = obj;
                return e04Var2;
            case 2:
                e04 e04Var3 = new e04((jqb) obj2, n92Var, 2);
                e04Var3.k = obj;
                return e04Var3;
            default:
                e04 e04Var4 = new e04((mvc) obj2, n92Var, 3);
                e04Var4.k = obj;
                return e04Var4;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.c;
        c1e c1eVar = c1e.a;
        nzb nzbVar = (nzb) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((e04) create(nzbVar, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x00a8  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0107  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x011a  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0142  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x014a  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x01a0  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x01b3  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x01db  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x01e3  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0238  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x024c  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x028b  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0294  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0297  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:13:0x006d -> B:24:0x00af). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:14:0x006f -> B:15:0x007e). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:17:0x0084 -> B:21:0x00a5). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:19:0x00a1 -> B:21:0x00a5). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:36:0x0105 -> B:47:0x0148). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:37:0x0107 -> B:38:0x0118). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:40:0x011e -> B:44:0x013f). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:42:0x013b -> B:44:0x013f). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:59:0x019e -> B:70:0x01e1). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:60:0x01a0 -> B:61:0x01b1). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:63:0x01b7 -> B:67:0x01d8). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:65:0x01d4 -> B:67:0x01d8). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:83:0x0238 -> B:84:0x024a). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:86:0x0250 -> B:90:0x0281). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:88:0x027d -> B:91:0x0284). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:95:0x0294 -> B:96:0x0295). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r27) {
        /*
            Method dump skipped, instruction units count: 678
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.e04.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
