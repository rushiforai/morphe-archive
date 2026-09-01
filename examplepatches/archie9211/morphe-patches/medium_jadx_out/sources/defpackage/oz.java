package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oz extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public final /* synthetic */ boolean e;
    public Object f;
    public Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ Object i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public oz(a1a a1aVar, String str, String str2, boolean z, String str3, n92 n92Var) {
        super(2, n92Var);
        this.b = 6;
        this.f = a1aVar;
        this.g = str;
        this.h = str2;
        this.e = z;
        this.i = str3;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        boolean z = this.e;
        Object obj2 = this.i;
        Object obj3 = this.h;
        switch (i) {
            case 0:
                oz ozVar = new oz(this.e, (sz) this.f, (h00) this.g, (yl2) obj3, (ad) obj2, n92Var, 0);
                ozVar.d = obj;
                return ozVar;
            case 1:
                oz ozVar2 = new oz((pya) this.g, (mu2) obj3, this.i, this.e, n92Var);
                ozVar2.d = obj;
                return ozVar2;
            case 2:
                oz ozVar3 = new oz((ub5) obj3, (yd4) obj2, z, n92Var);
                ozVar3.d = obj;
                return ozVar3;
            case 3:
                return new oz((o08) obj3, z, (pqd) obj2, n92Var);
            case 4:
                return new oz(this.e, (cie) this.f, (String) this.g, (String) obj3, (SourceParameter) obj2, n92Var, 4);
            case 5:
                oz ozVar4 = new oz(this.e, (kle) this.f, (tjd) this.g, (String) obj3, (xnc) obj2, n92Var, 5);
                ozVar4.d = obj;
                return ozVar4;
            case 6:
                oz ozVar5 = new oz((a1a) this.f, (String) this.g, (String) obj3, this.e, (String) obj2, n92Var);
                ozVar5.d = obj;
                return ozVar5;
            default:
                return new oz(this.e, (sff) this.f, (String) this.g, (String) obj3, (SourceParameter) obj2, n92Var, 7);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((oz) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((oz) create((nh4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((oz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 3:
                return ((oz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 4:
                return ((oz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 5:
                return ((oz) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 6:
                return ((oz) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((oz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:112:0x024c, code lost:
    
        if (r0.a(r2, r30) == r13) goto L113;
     */
    /* JADX WARN: Code restructure failed: missing block: B:153:0x0369, code lost:
    
        if (r0 == r2) goto L154;
     */
    /* JADX WARN: Code restructure failed: missing block: B:197:0x0457, code lost:
    
        if (r12.b(r9, r30) == r3) goto L198;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x008a, code lost:
    
        if (r0.a(r2, r30) == r13) goto L30;
     */
    /* JADX WARN: Removed duplicated region for block: B:261:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r31) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 1388
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.oz.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public oz(o08 o08Var, boolean z, pqd pqdVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 3;
        this.h = o08Var;
        this.e = z;
        this.i = pqdVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public oz(ub5 ub5Var, yd4 yd4Var, boolean z, n92 n92Var) {
        super(2, n92Var);
        this.b = 2;
        this.h = ub5Var;
        this.i = yd4Var;
        this.e = z;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public oz(pya pyaVar, mu2 mu2Var, Object obj, boolean z, n92 n92Var) {
        super(2, n92Var);
        this.b = 1;
        this.g = pyaVar;
        this.h = mu2Var;
        this.i = obj;
        this.e = z;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ oz(boolean z, Object obj, Object obj2, Object obj3, Object obj4, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = z;
        this.f = obj;
        this.g = obj2;
        this.h = obj3;
        this.i = obj4;
    }
}
