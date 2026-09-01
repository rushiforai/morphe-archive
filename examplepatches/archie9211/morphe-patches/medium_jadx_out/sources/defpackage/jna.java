package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jna extends p4d implements b55 {
    public final /* synthetic */ int b;
    public Object c;
    public int d;
    public final /* synthetic */ nna e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ jna(nna nnaVar, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = nnaVar;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        SourceParameter sourceParameter = this.f;
        nna nnaVar = this.e;
        switch (i) {
            case 0:
                return new jna(nnaVar, sourceParameter, n92Var, 0);
            case 1:
                return new jna(nnaVar, sourceParameter, n92Var, 1);
            case 2:
                return new jna(nnaVar, sourceParameter, n92Var, 2);
            default:
                return new jna(nnaVar, sourceParameter, n92Var, 3);
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
        return ((jna) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:100:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:108:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0069 A[PHI: r0
      0x0069: PHI (r0v31 java.lang.Object) = (r0v30 java.lang.Object), (r0v30 java.lang.Object), (r0v36 java.lang.Object) binds: [B:19:0x0054, B:21:0x0066, B:11:0x002b] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x013d A[PHI: r0
      0x013d: PHI (r0v13 java.lang.Object) = (r0v12 java.lang.Object), (r0v12 java.lang.Object), (r0v18 java.lang.Object) binds: [B:66:0x0128, B:68:0x013a, B:58:0x00ff] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0143  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r14) {
        /*
            Method dump skipped, instruction units count: 450
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jna.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
