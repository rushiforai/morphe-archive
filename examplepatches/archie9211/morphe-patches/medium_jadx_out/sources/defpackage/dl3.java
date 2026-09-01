package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dl3 extends p4d implements b55 {
    public final /* synthetic */ int b = 1;
    public rya c;
    public rya d;
    public int e;
    public /* synthetic */ Object f;
    public final /* synthetic */ el3 g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dl3(rya ryaVar, el3 el3Var, n92 n92Var) {
        super(2, n92Var);
        this.d = ryaVar;
        this.g = el3Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        el3 el3Var = this.g;
        switch (i) {
            case 0:
                dl3 dl3Var = new dl3(this.d, el3Var, n92Var);
                dl3Var.f = obj;
                return dl3Var;
            default:
                dl3 dl3Var2 = new dl3(el3Var, n92Var);
                dl3Var2.f = obj;
                return dl3Var2;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((dl3) create((x45) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((dl3) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:51:0x00e7, code lost:
    
        if (r4.T0(r8) != r0) goto L12;
     */
    /* JADX WARN: Path cross not found for [B:45:0x00ca, B:41:0x00b8], limit reached: 87 */
    /* JADX WARN: Path cross not found for [B:47:0x00ce, B:20:0x005e], limit reached: 87 */
    /* JADX WARN: Removed duplicated region for block: B:15:0x003a A[PHI: r3 r6
      0x003a: PHI (r3v19 rya) = (r3v11 rya), (r3v23 rya) binds: [B:14:0x0037, B:37:0x00af] A[DONT_GENERATE, DONT_INLINE]
      0x003a: PHI (r6v8 sb2) = (r6v6 sb2), (r6v9 sb2) binds: [B:14:0x0037, B:37:0x00af] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x005e A[PHI: r7
      0x005e: PHI (r7v14 sb2) = (r7v7 sb2), (r7v10 sb2), (r7v10 sb2), (r7v10 sb2), (r7v12 sb2), (r7v15 sb2) binds: [B:19:0x0056, B:46:0x00cc, B:48:0x00d9, B:42:0x00c5, B:31:0x0089, B:12:0x002f] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00b8 A[Catch: CancellationException -> 0x00c8, TryCatch #2 {CancellationException -> 0x00c8, blocks: (B:39:0x00b2, B:41:0x00b8, B:45:0x00ca, B:47:0x00ce), top: B:85:0x00b2 }] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00ca A[Catch: CancellationException -> 0x00c8, TryCatch #2 {CancellationException -> 0x00c8, blocks: (B:39:0x00b2, B:41:0x00b8, B:45:0x00ca, B:47:0x00ce), top: B:85:0x00b2 }] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0112  */
    /* JADX WARN: Removed duplicated region for block: B:88:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:89:? A[ADDED_TO_REGION, RETURN, SYNTHETIC] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:31:0x0089 -> B:20:0x005e). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:42:0x00c5 -> B:20:0x005e). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:46:0x00cc -> B:20:0x005e). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:48:0x00d9 -> B:20:0x005e). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:51:0x00e7 -> B:12:0x002f). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:75:0x0135 -> B:76:0x0136). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:77:0x0139 -> B:78:0x013b). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r9) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 344
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dl3.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dl3(el3 el3Var, n92 n92Var) {
        super(2, n92Var);
        this.g = el3Var;
    }
}
