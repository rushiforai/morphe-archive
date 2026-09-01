package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m0 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ long d;
    public Object e;
    public /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m0(long j, vx1 vx1Var, n92 n92Var, h9g h9gVar, fdg fdgVar) {
        super(2, n92Var);
        this.b = 9;
        this.e = h9gVar;
        this.f = vx1Var;
        this.g = fdgVar;
        this.d = j;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.g;
        switch (i) {
            case 0:
                return new m0((va6) this.f, this.d, (m68) obj2, n92Var, 0);
            case 1:
                return new m0((mt6) this.f, (tj4) obj2, this.d, n92Var);
            case 2:
                return new m0((zhb) this.e, (sfb) this.f, this.d, (l78) obj2, n92Var);
            case 3:
                m0 m0Var = new m0((vsb) this.f, this.d, (oya) obj2, n92Var, 3);
                m0Var.e = obj;
                return m0Var;
            case 4:
                return new m0((chd) this.e, this.d, (hhd) this.f, (bhd) obj2, n92Var);
            case 5:
                m0 m0Var2 = new m0((iwf) this.f, this.d, (jrf) obj2, n92Var, 5);
                m0Var2.e = obj;
                return m0Var2;
            case 6:
                m0 m0Var3 = new m0((nec) this.f, this.d, (jrf) obj2, n92Var, 6);
                m0Var3.e = obj;
                return m0Var3;
            case 7:
                m0 m0Var4 = new m0((eoc) this.f, this.d, (jrf) obj2, n92Var, 7);
                m0Var4.e = obj;
                return m0Var4;
            case 8:
                m0 m0Var5 = new m0((nig) this.f, this.d, (jrf) obj2, n92Var, 8);
                m0Var5.e = obj;
                return m0Var5;
            case 9:
                h9g h9gVar = (h9g) this.e;
                return new m0(this.d, (vx1) this.f, n92Var, h9gVar, (fdg) obj2);
            case 10:
                m0 m0Var6 = new m0((m9g) obj2, this.d, n92Var);
                m0Var6.f = obj;
                return m0Var6;
            case 11:
                m0 m0Var7 = new m0((o2b) this.f, this.d, (jsf) obj2, n92Var, 11);
                m0Var7.e = obj;
                return m0Var7;
            default:
                nig nigVar = (nig) this.f;
                m0 m0Var8 = new m0(this.d, n92Var, (ntf) obj2, nigVar);
                m0Var8.e = obj;
                return m0Var8;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((m0) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:142:0x02cf, code lost:
    
        if (r0 != r5) goto L143;
     */
    /* JADX WARN: Code restructure failed: missing block: B:169:0x0341, code lost:
    
        if (((defpackage.hhd) r26.f).a((defpackage.bhd) r13, r26) == r0) goto L170;
     */
    /* JADX WARN: Code restructure failed: missing block: B:222:0x0436, code lost:
    
        if (defpackage.ou.a(r0, r1, r2, r3, r26, 4) != r14) goto L224;
     */
    /* JADX WARN: Code restructure failed: missing block: B:245:0x0497, code lost:
    
        if (r13.b(r2, r26) != r0) goto L247;
     */
    /* JADX WARN: Removed duplicated region for block: B:283:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Unreachable blocks removed: 2, instructions: 2 */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r27) throws java.lang.Exception {
        /*
            Method dump skipped, instruction units count: 1210
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.m0.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m0(long j, n92 n92Var, ntf ntfVar, nig nigVar) {
        super(2, n92Var);
        this.b = 12;
        this.d = j;
        this.f = nigVar;
        this.g = ntfVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m0(mt6 mt6Var, tj4 tj4Var, long j, n92 n92Var) {
        super(2, n92Var);
        this.b = 1;
        this.f = mt6Var;
        this.g = tj4Var;
        this.d = j;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m0(zhb zhbVar, sfb sfbVar, long j, l78 l78Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 2;
        this.e = zhbVar;
        this.f = sfbVar;
        this.d = j;
        this.g = l78Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m0(chd chdVar, long j, hhd hhdVar, bhd bhdVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 4;
        this.e = chdVar;
        this.d = j;
        this.f = hhdVar;
        this.g = bhdVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m0(Object obj, long j, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
        this.d = j;
        this.g = obj2;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m0(m9g m9gVar, long j, n92 n92Var) {
        super(2, n92Var);
        this.b = 10;
        this.g = m9gVar;
        this.d = j;
    }
}
