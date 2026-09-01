package defpackage;

import com.medium.android.profile.ui.view.m;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sje extends p4d implements b55 {
    public final /* synthetic */ int b = 0;
    public o33 c;
    public Object d;
    public int e;
    public /* synthetic */ Object f;
    public final /* synthetic */ String g;
    public final /* synthetic */ m h;
    public final /* synthetic */ String i;
    public final /* synthetic */ SourceParameter j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public sje(m mVar, String str, SourceParameter sourceParameter, String str2, n92 n92Var) {
        super(2, n92Var);
        this.h = mVar;
        this.g = str;
        this.j = sourceParameter;
        this.i = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                sje sjeVar = new sje(this.h, this.g, this.j, this.i, n92Var);
                sjeVar.f = obj;
                return sjeVar;
            default:
                sje sjeVar2 = new sje(this.g, this.h, this.i, this.j, n92Var);
                sjeVar2.f = obj;
                return sjeVar2;
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
        return ((sje) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:100:0x024f, code lost:
    
        if (r1.a(r2, r19) == r14) goto L101;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00f4, code lost:
    
        if (r0 != r9) goto L53;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x010f, code lost:
    
        if (r1.a(r2, r19) == r9) goto L52;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x012a, code lost:
    
        if (r1.a(r2, r19) == r9) goto L52;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x01f5, code lost:
    
        if (r0 != r14) goto L61;
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x0210, code lost:
    
        if (r1.a(r2, r19) == r14) goto L101;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x022e, code lost:
    
        if (r1.a(r2, r19) == r14) goto L101;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:20:0x009f A[PHI: r3 r4 r5 r9
      0x009f: PHI (r3v27 o33) = (r3v25 o33), (r3v30 o33) binds: [B:18:0x009b, B:9:0x0034] A[DONT_GENERATE, DONT_INLINE]
      0x009f: PHI (r4v9 java.lang.Object) = (r4v7 java.lang.Object), (r4v14 java.lang.Object) binds: [B:18:0x009b, B:9:0x0034] A[DONT_GENERATE, DONT_INLINE]
      0x009f: PHI (r5v12 java.lang.Object) = (r5v11 java.lang.Object), (r5v18 java.lang.Object) binds: [B:18:0x009b, B:9:0x0034] A[DONT_GENERATE, DONT_INLINE]
      0x009f: PHI (r9v5 tb2) = (r9v3 tb2), (r9v6 tb2) binds: [B:18:0x009b, B:9:0x0034] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00f9  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0112  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x01b4 A[PHI: r3 r5
      0x01b4: PHI (r3v10 java.lang.Object) = (r3v7 java.lang.Object), (r3v22 java.lang.Object) binds: [B:69:0x01b0, B:63:0x0158] A[DONT_GENERATE, DONT_INLINE]
      0x01b4: PHI (r5v5 java.lang.Object) = (r5v3 java.lang.Object), (r5v8 java.lang.Object) binds: [B:69:0x01b0, B:63:0x0158] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:73:0x01ba  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x01bc  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x01f4  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x01fa  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0213  */
    /* JADX WARN: Type inference failed for: r5v14 */
    /* JADX WARN: Type inference failed for: r5v15, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r5v19 */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r20) throws java.lang.Exception {
        /*
            Method dump skipped, instruction units count: 646
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sje.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public sje(String str, m mVar, String str2, SourceParameter sourceParameter, n92 n92Var) {
        super(2, n92Var);
        this.g = str;
        this.h = mVar;
        this.i = str2;
        this.j = sourceParameter;
    }
}
