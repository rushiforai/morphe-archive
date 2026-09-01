package defpackage;

import com.medium.android.profile.ui.view.UserProfileReference;
import com.medium.android.susi.data.CreateAccountData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qd0 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public Object c;
    public Object d;
    public int e;
    public int f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qd0(int i, n92 n92Var, ht3 ht3Var, String str, String str2) {
        super(2, n92Var);
        this.b = 3;
        this.d = ht3Var;
        this.f = i;
        this.g = str;
        this.h = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.h;
        Object obj3 = this.g;
        switch (i) {
            case 0:
                return new qd0((yd0) obj3, (CreateAccountData) obj2, n92Var, 0);
            case 1:
                return new qd0((yd0) obj3, (q62) obj2, n92Var, 1);
            case 2:
                return new qd0((id1) obj3, (yd4) obj2, n92Var, 2);
            case 3:
                return new qd0(this.f, n92Var, (ht3) this.d, (String) obj3, (String) obj2);
            case 4:
                return new qd0((ko9) this.d, (String) obj3, this.f, (String) obj2, n92Var, 4);
            case 5:
                return new qd0((nib) this.d, (String) obj3, this.f, (String) obj2, n92Var, 5);
            default:
                qd0 qd0Var = new qd0((hhe) obj3, (UserProfileReference) obj2, n92Var, 6);
                qd0Var.c = obj;
                return qd0Var;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((qd0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((qd0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((qd0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 3:
                return ((qd0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 4:
                return ((qd0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 5:
                return ((qd0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((qd0) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x009e, code lost:
    
        if (defpackage.r6c.m(r4, r19, r6) != r1) goto L29;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:104:0x0232 A[Catch: Exception -> 0x01d6, TRY_ENTER, TryCatch #1 {Exception -> 0x01d6, blocks: (B:88:0x01d1, B:114:0x0286, B:116:0x028a, B:118:0x0290, B:120:0x0294, B:123:0x029d, B:126:0x02a6, B:128:0x02b2, B:91:0x01d9, B:108:0x0240, B:110:0x0246, B:129:0x02ca, B:130:0x02d1, B:131:0x02d2, B:132:0x02d9, B:104:0x0232), top: B:302:0x01bc }] */
    /* JADX WARN: Removed duplicated region for block: B:106:0x023c  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x023e A[PHI: r2
      0x023e: PHI (r2v53 java.lang.Object) = (r2v52 java.lang.Object), (r2v55 java.lang.Object) binds: [B:105:0x023a, B:92:0x01dc] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:108:0x0240 A[Catch: Exception -> 0x01d6, TryCatch #1 {Exception -> 0x01d6, blocks: (B:88:0x01d1, B:114:0x0286, B:116:0x028a, B:118:0x0290, B:120:0x0294, B:123:0x029d, B:126:0x02a6, B:128:0x02b2, B:91:0x01d9, B:108:0x0240, B:110:0x0246, B:129:0x02ca, B:130:0x02d1, B:131:0x02d2, B:132:0x02d9, B:104:0x0232), top: B:302:0x01bc }] */
    /* JADX WARN: Removed duplicated region for block: B:116:0x028a A[Catch: Exception -> 0x01d6, TryCatch #1 {Exception -> 0x01d6, blocks: (B:88:0x01d1, B:114:0x0286, B:116:0x028a, B:118:0x0290, B:120:0x0294, B:123:0x029d, B:126:0x02a6, B:128:0x02b2, B:91:0x01d9, B:108:0x0240, B:110:0x0246, B:129:0x02ca, B:130:0x02d1, B:131:0x02d2, B:132:0x02d9, B:104:0x0232), top: B:302:0x01bc }] */
    /* JADX WARN: Removed duplicated region for block: B:117:0x028f  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x0294 A[Catch: Exception -> 0x01d6, TryCatch #1 {Exception -> 0x01d6, blocks: (B:88:0x01d1, B:114:0x0286, B:116:0x028a, B:118:0x0290, B:120:0x0294, B:123:0x029d, B:126:0x02a6, B:128:0x02b2, B:91:0x01d9, B:108:0x0240, B:110:0x0246, B:129:0x02ca, B:130:0x02d1, B:131:0x02d2, B:132:0x02d9, B:104:0x0232), top: B:302:0x01bc }] */
    /* JADX WARN: Removed duplicated region for block: B:121:0x0299  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x029d A[Catch: Exception -> 0x01d6, TryCatch #1 {Exception -> 0x01d6, blocks: (B:88:0x01d1, B:114:0x0286, B:116:0x028a, B:118:0x0290, B:120:0x0294, B:123:0x029d, B:126:0x02a6, B:128:0x02b2, B:91:0x01d9, B:108:0x0240, B:110:0x0246, B:129:0x02ca, B:130:0x02d1, B:131:0x02d2, B:132:0x02d9, B:104:0x0232), top: B:302:0x01bc }] */
    /* JADX WARN: Removed duplicated region for block: B:124:0x02a2  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x02a6 A[Catch: Exception -> 0x01d6, TryCatch #1 {Exception -> 0x01d6, blocks: (B:88:0x01d1, B:114:0x0286, B:116:0x028a, B:118:0x0290, B:120:0x0294, B:123:0x029d, B:126:0x02a6, B:128:0x02b2, B:91:0x01d9, B:108:0x0240, B:110:0x0246, B:129:0x02ca, B:130:0x02d1, B:131:0x02d2, B:132:0x02d9, B:104:0x0232), top: B:302:0x01bc }] */
    /* JADX WARN: Removed duplicated region for block: B:127:0x02b0  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x02d2 A[Catch: Exception -> 0x01d6, TryCatch #1 {Exception -> 0x01d6, blocks: (B:88:0x01d1, B:114:0x0286, B:116:0x028a, B:118:0x0290, B:120:0x0294, B:123:0x029d, B:126:0x02a6, B:128:0x02b2, B:91:0x01d9, B:108:0x0240, B:110:0x0246, B:129:0x02ca, B:130:0x02d1, B:131:0x02d2, B:132:0x02d9, B:104:0x0232), top: B:302:0x01bc }] */
    /* JADX WARN: Removed duplicated region for block: B:162:0x0368  */
    /* JADX WARN: Removed duplicated region for block: B:167:0x038e  */
    /* JADX WARN: Removed duplicated region for block: B:170:0x03a9  */
    /* JADX WARN: Removed duplicated region for block: B:191:0x0473  */
    /* JADX WARN: Removed duplicated region for block: B:201:0x04ba A[PHI: r0 r1 r6 r12 r33
      0x04ba: PHI (r0v42 java.lang.Object) = (r0v38 java.lang.Object), (r0v40 java.lang.Object), (r0v49 java.lang.Object) binds: [B:190:0x0471, B:199:0x04b6, B:178:0x03f2] A[DONT_GENERATE, DONT_INLINE]
      0x04ba: PHI (r1v36 q62) = (r1v28 q62), (r1v33 q62), (r1v52 q62) binds: [B:190:0x0471, B:199:0x04b6, B:178:0x03f2] A[DONT_GENERATE, DONT_INLINE]
      0x04ba: PHI (r6v12 qd0) = (r6v10 qd0), (r6v11 qd0), (r6v0 qd0) binds: [B:190:0x0471, B:199:0x04b6, B:178:0x03f2] A[DONT_GENERATE, DONT_INLINE]
      0x04ba: PHI (r12v6 boolean) = (r12v2 boolean), (r12v4 boolean), (r12v7 boolean) binds: [B:190:0x0471, B:199:0x04b6, B:178:0x03f2] A[DONT_GENERATE, DONT_INLINE]
      0x04ba: PHI (r33v5 r6c) = (r33v1 r6c), (r33v3 r6c), (r33v6 r6c) binds: [B:190:0x0471, B:199:0x04b6, B:178:0x03f2] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:203:0x04c0  */
    /* JADX WARN: Removed duplicated region for block: B:210:0x04e2  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:257:0x060d  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:267:0x0655  */
    /* JADX WARN: Removed duplicated region for block: B:268:0x0656 A[PHI: r0 r6
      0x0656: PHI (r0v15 java.lang.Object) = (r0v4 java.lang.Object), (r0v12 java.lang.Object), (r0v22 java.lang.Object) binds: [B:256:0x060b, B:267:0x0655, B:245:0x05b9] A[DONT_GENERATE, DONT_INLINE]
      0x0656: PHI (r6v5 qd0) = (r6v3 qd0), (r6v4 qd0), (r6v0 qd0) binds: [B:256:0x060b, B:267:0x0655, B:245:0x05b9] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:270:0x065c  */
    /* JADX WARN: Removed duplicated region for block: B:307:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:311:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:320:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:323:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:326:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:328:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:331:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:333:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:335:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0110 A[PHI: r0
      0x0110: PHI (r0v97 java.lang.Object) = (r0v96 java.lang.Object), (r0v96 java.lang.Object), (r0v102 java.lang.Object) binds: [B:44:0x00f2, B:49:0x010d, B:38:0x00c5] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0116  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0194 A[PHI: r0
      0x0194: PHI (r0v86 java.lang.Object) = (r0v85 java.lang.Object), (r0v85 java.lang.Object), (r0v91 java.lang.Object) binds: [B:70:0x0176, B:75:0x0191, B:64:0x0149] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:79:0x019a  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r35) {
        /*
            Method dump skipped, instruction units count: 1868
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qd0.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ qd0(que queVar, String str, int i, String str2, n92 n92Var, int i2) {
        super(2, n92Var);
        this.b = i2;
        this.d = queVar;
        this.g = str;
        this.f = i;
        this.h = str2;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ qd0(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.g = obj;
        this.h = obj2;
    }
}
