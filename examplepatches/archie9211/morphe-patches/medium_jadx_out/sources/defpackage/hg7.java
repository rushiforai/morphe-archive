package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hg7 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public Object c;
    public int d;
    public final /* synthetic */ boolean e;
    public final /* synthetic */ sg7 f;
    public final /* synthetic */ String g;
    public final /* synthetic */ String h;
    public final /* synthetic */ SourceParameter i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ hg7(boolean z, sg7 sg7Var, String str, String str2, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = z;
        this.f = sg7Var;
        this.g = str;
        this.h = str2;
        this.i = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new hg7(this.e, this.f, this.g, this.h, this.i, n92Var, 0);
            default:
                return new hg7(this.e, this.f, this.g, this.h, this.i, n92Var, 1);
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
        return ((hg7) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x007c A[PHI: r0
      0x007c: PHI (r0v32 java.lang.Object) = (r0v28 java.lang.Object), (r0v28 java.lang.Object), (r0v35 java.lang.Object) binds: [B:18:0x006a, B:20:0x0079, B:10:0x003c] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00b5 A[PHI: r0
      0x00b5: PHI (r0v40 java.lang.Object) = (r0v36 java.lang.Object), (r0v36 java.lang.Object), (r0v43 java.lang.Object) binds: [B:31:0x00a3, B:33:0x00b2, B:7:0x0025] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x011f  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x012f A[PHI: r0
      0x012f: PHI (r0v10 java.lang.Object) = (r0v6 java.lang.Object), (r0v6 java.lang.Object), (r0v13 java.lang.Object) binds: [B:55:0x011d, B:57:0x012c, B:47:0x00f1] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0135  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0158  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0168 A[PHI: r0
      0x0168: PHI (r0v18 java.lang.Object) = (r0v14 java.lang.Object), (r0v14 java.lang.Object), (r0v21 java.lang.Object) binds: [B:68:0x0156, B:70:0x0165, B:44:0x00da] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:74:0x016e  */
    /* JADX WARN: Removed duplicated region for block: B:80:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:82:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:86:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:88:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r17) {
        /*
            Method dump skipped, instruction units count: 422
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hg7.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
