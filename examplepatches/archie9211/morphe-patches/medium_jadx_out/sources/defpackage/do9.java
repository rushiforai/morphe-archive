package defpackage;

import com.medium.android.profile.ui.view.m;
import gen.model.SourceParameter;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class do9 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public Object c;
    public String d;
    public String e;
    public int f;
    public int g;
    public final /* synthetic */ String h;
    public final /* synthetic */ Serializable i;
    public que j;
    public final /* synthetic */ que k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public do9(m mVar, String str, SourceParameter sourceParameter, String str2, String str3, n92 n92Var) {
        super(2, n92Var);
        this.b = 2;
        this.k = mVar;
        this.d = str;
        this.i = sourceParameter;
        this.e = str2;
        this.h = str3;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Serializable serializable = this.i;
        que queVar = this.k;
        switch (i) {
            case 0:
                return new do9((ko9) queVar, this.h, (String) serializable, n92Var, 0);
            case 1:
                return new do9((nib) queVar, this.h, (String) serializable, n92Var, 1);
            default:
                return new do9((m) queVar, this.d, (SourceParameter) serializable, this.e, this.h, n92Var);
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
        return ((do9) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:112:0x030e A[PHI: r0 r4
      0x030e: PHI (r0v6 java.lang.Object) = (r0v4 java.lang.Object), (r0v5 java.lang.Object), (r0v16 java.lang.Object) binds: [B:104:0x02d5, B:110:0x030b, B:97:0x028b] A[DONT_GENERATE, DONT_INLINE]
      0x030e: PHI (r4v4 java.lang.String) = (r4v2 java.lang.String), (r4v3 java.lang.String), (r4v9 java.lang.String) binds: [B:104:0x02d5, B:110:0x030b, B:97:0x028b] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:114:0x0314  */
    /* JADX WARN: Removed duplicated region for block: B:120:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:124:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:126:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:130:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00c9 A[PHI: r1 r5 r6
      0x00c9: PHI (r1v33 java.lang.Object) = (r1v31 java.lang.Object), (r1v32 java.lang.Object), (r1v43 java.lang.Object) binds: [B:20:0x009a, B:29:0x00c6, B:12:0x003b] A[DONT_GENERATE, DONT_INLINE]
      0x00c9: PHI (r5v18 do9) = (r5v16 do9), (r5v17 do9), (r5v21 do9) binds: [B:20:0x009a, B:29:0x00c6, B:12:0x003b] A[DONT_GENERATE, DONT_INLINE]
      0x00c9: PHI (r6v24 tb2) = (r6v21 tb2), (r6v22 tb2), (r6v27 tb2) binds: [B:20:0x009a, B:29:0x00c6, B:12:0x003b] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00cf  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x01a5  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x01da A[PHI: r1 r2 r6 r7
      0x01da: PHI (r1v24 java.lang.String) = (r1v22 java.lang.String), (r1v23 java.lang.String), (r1v14 java.lang.String) binds: [B:56:0x01a3, B:62:0x01d7, B:41:0x0107] A[DONT_GENERATE, DONT_INLINE]
      0x01da: PHI (r2v34 java.lang.Object) = (r2v27 java.lang.Object), (r2v31 java.lang.Object), (r2v38 java.lang.Object) binds: [B:56:0x01a3, B:62:0x01d7, B:41:0x0107] A[DONT_GENERATE, DONT_INLINE]
      0x01da: PHI (r6v18 do9) = (r6v12 do9), (r6v14 do9), (r6v19 do9) binds: [B:56:0x01a3, B:62:0x01d7, B:41:0x0107] A[DONT_GENERATE, DONT_INLINE]
      0x01da: PHI (r7v10 tb2) = (r7v5 tb2), (r7v7 tb2), (r7v11 tb2) binds: [B:56:0x01a3, B:62:0x01d7, B:41:0x0107] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x01e0  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0215  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0249 A[PHI: r2 r4 r6 r8
      0x0249: PHI (r2v22 java.lang.Object) = (r2v15 java.lang.Object), (r2v19 java.lang.Object), (r2v26 java.lang.Object) binds: [B:73:0x0213, B:79:0x0246, B:44:0x0139] A[DONT_GENERATE, DONT_INLINE]
      0x0249: PHI (r4v18 java.lang.String) = (r4v13 java.lang.String), (r4v15 java.lang.String), (r4v19 java.lang.String) binds: [B:73:0x0213, B:79:0x0246, B:44:0x0139] A[DONT_GENERATE, DONT_INLINE]
      0x0249: PHI (r6v10 do9) = (r6v4 do9), (r6v6 do9), (r6v11 do9) binds: [B:73:0x0213, B:79:0x0246, B:44:0x0139] A[DONT_GENERATE, DONT_INLINE]
      0x0249: PHI (r8v9 tb2) = (r8v4 tb2), (r8v6 tb2), (r8v10 tb2) binds: [B:73:0x0213, B:79:0x0246, B:44:0x0139] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:83:0x024f  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r19) {
        /*
            Method dump skipped, instruction units count: 842
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.do9.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ do9(que queVar, String str, String str2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.k = queVar;
        this.h = str;
        this.i = str2;
    }
}
