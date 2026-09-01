package defpackage;

import com.medium.android.data.post.model.ReportPostReason;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lj1 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ boolean d;
    public Object e;
    public final /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lj1(que queVar, Object obj, boolean z, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = queVar;
        this.f = obj;
        this.d = z;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        boolean z = this.d;
        Object obj2 = this.f;
        switch (i) {
            case 0:
                return new lj1(this.d, (mj1) this.e, (rg1) obj2, n92Var, 0);
            case 1:
                return new lj1((uf3) obj2, z, n92Var, 1);
            case 2:
                return new lj1(this.d, (ht3) this.e, (rg1) obj2, n92Var, 2);
            case 3:
                return new lj1((ju3) this.e, (e7e) obj2, this.d, n92Var, 3);
            case 4:
                return new lj1((xm4) this.e, this.d, (String) obj2, n92Var, 4);
            case 5:
                return new lj1(this.d, (rb9) this.e, (m45) obj2, n92Var, 5);
            case 6:
                return new lj1(this.d, (sw9) this.e, (rg1) obj2, n92Var, 6);
            case 7:
                return new lj1(this.d, (kv6) this.e, (upc) obj2, n92Var, 7);
            case 8:
                return new lj1((lma) obj2, z, n92Var, 8);
            case 9:
                return new lj1((a7b) this.e, (ReportPostReason) obj2, this.d, n92Var, 9);
            case 10:
                return new lj1((ou) this.e, this.d, (wlc) obj2, n92Var, 10);
            case 11:
                return new lj1((ou) this.e, this.d, (cud) obj2, n92Var, 11);
            case 12:
                return new lj1((xmc) this.e, (String) obj2, this.d, n92Var, 12);
            case 13:
                return new lj1(z, (odd) obj2, n92Var);
            case 14:
                return new lj1(this.d, (odd) this.e, (rg1) obj2, n92Var, 14);
            default:
                return new lj1(this.d, (ide) this.e, (rg1) obj2, n92Var, 15);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((lj1) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x004e, code lost:
    
        if (r0 == r14) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:162:0x0360, code lost:
    
        if (r0 == r14) goto L168;
     */
    /* JADX WARN: Code restructure failed: missing block: B:242:0x04b6, code lost:
    
        if (r0 == r14) goto L248;
     */
    /* JADX WARN: Code restructure failed: missing block: B:276:0x054f, code lost:
    
        if (r0 == r14) goto L282;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00a3, code lost:
    
        if (r0 == r14) goto L38;
     */
    /* JADX WARN: Removed duplicated region for block: B:130:0x0288  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x02b8 A[PHI: r1
      0x02b8: PHI (r1v45 java.lang.Object) = (r1v44 java.lang.Object), (r1v44 java.lang.Object), (r1v50 java.lang.Object) binds: [B:129:0x0286, B:131:0x02b5, B:121:0x0256] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:135:0x02be  */
    /* JADX WARN: Removed duplicated region for block: B:179:0x039b  */
    /* JADX WARN: Removed duplicated region for block: B:183:0x03b3  */
    /* JADX WARN: Removed duplicated region for block: B:223:0x0453 A[Catch: Exception -> 0x0426, TryCatch #0 {Exception -> 0x0426, blocks: (B:209:0x0422, B:212:0x0428, B:221:0x044d, B:223:0x0453, B:226:0x0463, B:227:0x046a, B:218:0x0440), top: B:284:0x040e }] */
    /* JADX WARN: Removed duplicated region for block: B:226:0x0463 A[Catch: Exception -> 0x0426, TryCatch #0 {Exception -> 0x0426, blocks: (B:209:0x0422, B:212:0x0428, B:221:0x044d, B:223:0x0453, B:226:0x0463, B:227:0x046a, B:218:0x0440), top: B:284:0x040e }] */
    /* JADX WARN: Removed duplicated region for block: B:290:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:293:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:296:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:298:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:312:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:322:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:324:? A[ADDED_TO_REGION, RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:336:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:343:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0121  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0154  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:182:0x03b1 -> B:178:0x0399). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r17) {
        /*
            Method dump skipped, instruction units count: 1426
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lj1.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lj1(que queVar, boolean z, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = queVar;
        this.d = z;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lj1(Object obj, boolean z, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
        this.d = z;
        this.f = obj2;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lj1(boolean z, odd oddVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 13;
        this.d = z;
        this.f = oddVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lj1(boolean z, Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = z;
        this.e = obj;
        this.f = obj2;
    }
}
