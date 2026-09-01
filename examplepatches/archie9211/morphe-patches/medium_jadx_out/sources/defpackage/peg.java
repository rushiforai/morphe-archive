package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class peg extends p4d implements b55 {
    public final /* synthetic */ int b;
    public Object c;
    public Object d;
    public int e;
    public final /* synthetic */ Object f;
    public Object g;
    public Object h;
    public final /* synthetic */ Object i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public peg(tag tagVar, jrf jrfVar, fdg fdgVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 3;
        this.f = tagVar;
        this.h = jrfVar;
        this.i = fdgVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.i;
        Object obj3 = this.f;
        switch (i) {
            case 0:
                peg pegVar = new peg((veg) obj3, (j8e) obj2, n92Var, 0);
                pegVar.c = obj;
                return pegVar;
            case 1:
                peg pegVar2 = new peg((veg) obj3, (arf) obj2, n92Var, 1);
                pegVar2.h = obj;
                return pegVar2;
            case 2:
                peg pegVar3 = new peg((veg) obj3, (emf) obj2, n92Var, 2);
                pegVar3.c = obj;
                return pegVar3;
            default:
                peg pegVar4 = new peg((tag) obj3, (jrf) this.h, (fdg) obj2, n92Var);
                pegVar4.d = obj;
                return pegVar4;
        }
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        xbg xbgVar = (xbg) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((peg) create(xbgVar, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Can't wrap try/catch for region: R(4:151|(1:(1:(4:79|80|102|105)(8:84|156|85|86|95|99|(2:101|102)|105))(1:89))(3:90|(1:92)|105)|145|93) */
    /* JADX WARN: Code restructure failed: missing block: B:125:0x0433, code lost:
    
        if (r8 != r1) goto L126;
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:0x0388, code lost:
    
        if (r8 != r1) goto L95;
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x038d, code lost:
    
        r16 = r6;
        r6 = r2;
        r2 = r7;
        r7 = r16;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:159:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:160:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:21:0x01ba A[PHI: r4 r10 r11
      0x01ba: PHI (r4v36 lrf) = (r4v32 lrf), (r4v41 lrf) binds: [B:20:0x01b8, B:15:0x009c] A[DONT_GENERATE, DONT_INLINE]
      0x01ba: PHI (r10v5 xbg) = (r10v3 xbg), (r10v7 xbg) binds: [B:20:0x01b8, B:15:0x009c] A[DONT_GENERATE, DONT_INLINE]
      0x01ba: PHI (r11v20 java.lang.Object) = (r11v19 java.lang.Object), (r11v22 java.lang.Object) binds: [B:20:0x01b8, B:15:0x009c] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x01c2  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x01ee  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0209 A[PHI: r3 r4 r7
      0x0209: PHI (r3v22 java.lang.Object) = (r3v19 java.lang.Object), (r3v29 java.lang.Object) binds: [B:30:0x0207, B:12:0x006a] A[DONT_GENERATE, DONT_INLINE]
      0x0209: PHI (r4v51 xbg) = (r4v48 xbg), (r4v52 xbg) binds: [B:30:0x0207, B:12:0x006a] A[DONT_GENERATE, DONT_INLINE]
      0x0209: PHI (r7v37 fdg) = (r7v36 fdg), (r7v39 fdg) binds: [B:30:0x0207, B:12:0x006a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0218  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x021a  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0245  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0258  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x026d A[PHI: r3 r7
      0x026d: PHI (r3v44 java.lang.Object) = (r3v41 java.lang.Object), (r3v49 java.lang.Object) binds: [B:45:0x026b, B:8:0x0035] A[DONT_GENERATE, DONT_INLINE]
      0x026d: PHI (r7v45 xbg) = (r7v43 xbg), (r7v46 xbg) binds: [B:45:0x026b, B:8:0x0035] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x026f  */
    /* JADX WARN: Type inference failed for: r1v10, types: [y88] */
    /* JADX WARN: Type inference failed for: r1v2 */
    /* JADX WARN: Type inference failed for: r1v3 */
    /* JADX WARN: Type inference failed for: r1v33 */
    /* JADX WARN: Type inference failed for: r1v4, types: [y88] */
    /* JADX WARN: Type inference failed for: r1v5 */
    /* JADX WARN: Type inference failed for: r1v8 */
    /* JADX WARN: Type inference failed for: r2v1, types: [int] */
    /* JADX WARN: Type inference failed for: r2v10 */
    /* JADX WARN: Type inference failed for: r2v15, types: [int] */
    /* JADX WARN: Type inference failed for: r2v16, types: [y88] */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v3, types: [x45] */
    /* JADX WARN: Type inference failed for: r2v33 */
    /* JADX WARN: Type inference failed for: r2v37 */
    /* JADX WARN: Type inference failed for: r2v38 */
    /* JADX WARN: Type inference failed for: r2v39 */
    /* JADX WARN: Type inference failed for: r2v40 */
    /* JADX WARN: Type inference failed for: r4v0 */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v2, types: [veg] */
    /* JADX WARN: Type inference failed for: r4v68 */
    /* JADX WARN: Type inference failed for: r4v69 */
    /* JADX WARN: Type inference failed for: r4v7 */
    /* JADX WARN: Type inference failed for: r4v70 */
    /* JADX WARN: Type inference failed for: r4v71 */
    /* JADX WARN: Type inference failed for: r6v3, types: [y88] */
    /* JADX WARN: Type inference failed for: r6v37 */
    /* JADX WARN: Type inference failed for: r6v38 */
    /* JADX WARN: Type inference failed for: r6v4 */
    /* JADX WARN: Type inference failed for: r7v2, types: [xbg] */
    /* JADX WARN: Type inference failed for: r7v51 */
    /* JADX WARN: Type inference failed for: r7v52 */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r18) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 1172
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.peg.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ peg(veg vegVar, Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = vegVar;
        this.i = obj;
    }
}
