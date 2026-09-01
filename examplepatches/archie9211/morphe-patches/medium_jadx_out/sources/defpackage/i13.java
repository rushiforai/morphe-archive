package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class i13 extends p4d implements b55 {
    public final /* synthetic */ int b = 1;
    public int c;
    public final /* synthetic */ boolean d;
    public Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i13(sw9 sw9Var, String str, g08 g08Var, boolean z, String str2, n92 n92Var) {
        super(2, n92Var);
        this.e = sw9Var;
        this.f = str;
        this.g = g08Var;
        this.d = z;
        this.h = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.h;
        Object obj3 = this.g;
        Object obj4 = this.f;
        switch (i) {
            case 0:
                i13 i13Var = new i13(this.d, (l13) obj4, (h00) obj3, (bo4) obj2, n92Var);
                i13Var.e = obj;
                return i13Var;
            case 1:
                return new i13((sw9) this.e, (String) obj4, (g08) obj3, this.d, (String) obj2, n92Var);
            case 2:
                return new i13((sw9) obj4, (String) obj3, this.d, (SourceParameter) obj2, n92Var);
            default:
                return new i13((sw9) obj4, (String) obj3, (String) obj2, this.d, n92Var);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((i13) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0070 A[PHI: r0
      0x0070: PHI (r0v8 java.lang.Object) = (r0v7 java.lang.Object), (r0v7 java.lang.Object), (r0v13 java.lang.Object) binds: [B:17:0x005b, B:19:0x006d, B:11:0x002f] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00dc A[PHI: r1
      0x00dc: PHI (r1v10 md9) = (r1v9 md9), (r1v9 md9), (r1v14 md9) binds: [B:40:0x00c5, B:42:0x00d9, B:34:0x00a2] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:69:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:73:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r15) {
        /*
            Method dump skipped, instruction units count: 338
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.i13.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i13(sw9 sw9Var, String str, String str2, boolean z, n92 n92Var) {
        super(2, n92Var);
        this.f = sw9Var;
        this.g = str;
        this.h = str2;
        this.d = z;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i13(sw9 sw9Var, String str, boolean z, SourceParameter sourceParameter, n92 n92Var) {
        super(2, n92Var);
        this.f = sw9Var;
        this.g = str;
        this.d = z;
        this.h = sourceParameter;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i13(boolean z, l13 l13Var, h00 h00Var, bo4 bo4Var, n92 n92Var) {
        super(2, n92Var);
        this.d = z;
        this.f = l13Var;
        this.g = h00Var;
        this.h = bo4Var;
    }
}
