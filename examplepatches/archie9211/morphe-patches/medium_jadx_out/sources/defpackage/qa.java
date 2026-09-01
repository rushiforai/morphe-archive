package defpackage;

import com.medium.android.data.post.model.ReportPostReason;
import com.medium.android.data.post.model.ReportRepostReason;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qa extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ boolean e;
    public final /* synthetic */ Object f;
    public Object g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qa(boolean z, mt6 mt6Var, tj4 tj4Var, of5 of5Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 6;
        this.e = z;
        this.g = mt6Var;
        this.d = tj4Var;
        this.f = of5Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.f;
        Object obj3 = this.d;
        switch (i) {
            case 0:
                return new qa((ua) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 0);
            case 1:
                return new qa((id1) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 1);
            case 2:
                return new qa((qe3) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 2);
            case 3:
                return new qa((f74) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 3);
            case 4:
                return new qa((ap5) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 4);
            case 5:
                return new qa((bq5) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 5);
            case 6:
                return new qa(this.e, (mt6) this.g, (tj4) obj3, (of5) obj2, n92Var);
            case 7:
                qa qaVar = new qa((vb9) obj3, this.e, (m45) obj2, n92Var);
                qaVar.g = obj;
                return qaVar;
            case 8:
                return new qa((qx9) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 8);
            case 9:
                return new qa((lca) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 9);
            case 10:
                return new qa((rja) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 10);
            case 11:
                return new qa((pka) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 11);
            case 12:
                return new qa((nua) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 12);
            case 13:
                return new qa((v5b) obj3, (ReportPostReason) obj2, this.e, n92Var, 13);
            case 14:
                return new qa((k6b) obj3, (ReportRepostReason) obj2, this.e, n92Var, 14);
            case 15:
                return new qa((o7b) obj3, (e7b) obj2, this.e, n92Var, 15);
            case 16:
                return new qa((ou) this.g, this.e, (wlc) obj3, (m45) obj2, n92Var, 16);
            case 17:
                return new qa((ou) this.g, this.e, (cud) obj3, (m45) obj2, n92Var, 17);
            case 18:
                return new qa((had) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 18);
            case 19:
                return new qa((odd) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 19);
            case 20:
                return new qa((q9e) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 20);
            case 21:
                return new qa((cie) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 21);
            case 22:
                return new qa((ime) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 22);
            case 23:
                return new qa((kbf) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 23);
            default:
                return new qa((ref) this.g, (String) obj3, this.e, (SourceParameter) obj2, n92Var, 24);
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
        return ((qa) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:293:0x05dc, code lost:
    
        if (r0 == r14) goto L294;
     */
    /* JADX WARN: Removed duplicated region for block: B:145:0x02c9 A[PHI: r0 r4
      0x02c9: PHI (r0v84 java.lang.Object) = (r0v83 java.lang.Object), (r0v83 java.lang.Object), (r0v89 java.lang.Object) binds: [B:141:0x02af, B:143:0x02c6, B:135:0x0271] A[DONT_GENERATE, DONT_INLINE]
      0x02c9: PHI (r4v12 qa) = (r4v11 qa), (r4v11 qa), (r4v0 qa) binds: [B:141:0x02af, B:143:0x02c6, B:135:0x0271] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:147:0x02cf  */
    /* JADX WARN: Removed duplicated region for block: B:168:0x035c A[PHI: r0 r4
      0x035c: PHI (r0v73 java.lang.Object) = (r0v72 java.lang.Object), (r0v72 java.lang.Object), (r0v78 java.lang.Object) binds: [B:164:0x033f, B:166:0x0359, B:158:0x0309] A[DONT_GENERATE, DONT_INLINE]
      0x035c: PHI (r4v8 qa) = (r4v7 qa), (r4v7 qa), (r4v0 qa) binds: [B:164:0x033f, B:166:0x0359, B:158:0x0309] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:170:0x0362  */
    /* JADX WARN: Removed duplicated region for block: B:191:0x03f4 A[PHI: r0 r4
      0x03f4: PHI (r0v62 java.lang.Object) = (r0v61 java.lang.Object), (r0v61 java.lang.Object), (r0v67 java.lang.Object) binds: [B:187:0x03da, B:189:0x03f1, B:181:0x039c] A[DONT_GENERATE, DONT_INLINE]
      0x03f4: PHI (r4v4 qa) = (r4v3 qa), (r4v3 qa), (r4v0 qa) binds: [B:187:0x03da, B:189:0x03f1, B:181:0x039c] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:193:0x03fa  */
    /* JADX WARN: Removed duplicated region for block: B:413:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:417:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:421:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r18) {
        /*
            Method dump skipped, instruction units count: 1966
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qa.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qa(vb9 vb9Var, boolean z, m45 m45Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 7;
        this.d = vb9Var;
        this.e = z;
        this.f = m45Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ qa(que queVar, Enum r2, boolean z, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = queVar;
        this.f = r2;
        this.e = z;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ qa(que queVar, String str, boolean z, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.g = queVar;
        this.d = str;
        this.e = z;
        this.f = sourceParameter;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ qa(ou ouVar, boolean z, tj4 tj4Var, m45 m45Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.g = ouVar;
        this.e = z;
        this.d = tj4Var;
        this.f = m45Var;
    }
}
