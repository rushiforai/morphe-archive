package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i82 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public long c;
    public int d;
    public Object e;
    public Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ Object i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i82(qa9 qa9Var, String str, long j, bkd bkdVar, lid lidVar, yqa yqaVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 2;
        this.e = qa9Var;
        this.f = str;
        this.c = j;
        this.g = bkdVar;
        this.h = lidVar;
        this.i = yqaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.h;
        Object obj3 = this.g;
        Object obj4 = this.i;
        switch (i) {
            case 0:
                i82 i82Var = new i82((d4e) this.f, (k82) obj3, (xy0) obj2, this.c, (va6) obj4, n92Var);
                i82Var.e = obj;
                return i82Var;
            case 1:
                i82 i82Var2 = new i82((ms) this.f, (jt5) obj3, (h00) obj2, (yl2) obj4, n92Var);
                i82Var2.e = obj;
                return i82Var2;
            case 2:
                return new i82((qa9) this.e, (String) this.f, this.c, (bkd) obj3, (lid) obj2, (yqa) obj4, n92Var);
            case 3:
                return new i82((fdg) this.f, (iwf) obj3, (String) obj2, (arf) obj4, this.c, n92Var, 3);
            case 4:
                i82 i82Var3 = new i82((nec) this.f, (String) obj3, (fdg) obj2, (arf) obj4, this.c, n92Var, 4);
                i82Var3.e = obj;
                return i82Var3;
            case 5:
                i82 i82Var4 = new i82((bh4) this.f, (String) obj3, (jrf) obj2, (arf) obj4, this.c, n92Var, 5);
                i82Var4.e = obj;
                return i82Var4;
            case 6:
                i82 i82Var5 = new i82(this.c, n92Var, (fa4) obj2, (o2b) this.f, (String) obj3, (adg) obj4);
                i82Var5.e = obj;
                return i82Var5;
            case 7:
                i82 i82Var6 = new i82((h9g) obj3, this.c, (String) obj2, (awa) obj4, n92Var);
                i82Var6.e = obj;
                return i82Var6;
            default:
                long j = this.c;
                i82 i82Var7 = new i82((String) this.f, (dsf) obj3, (jrf) obj2, (o2b) obj4, j, n92Var, 8);
                i82Var7.e = obj;
                return i82Var7;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((i82) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:258:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x013a  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x013d  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0164  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r25) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 1492
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.i82.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i82(ms msVar, jt5 jt5Var, h00 h00Var, yl2 yl2Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 1;
        this.f = msVar;
        this.g = jt5Var;
        this.h = h00Var;
        this.i = yl2Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i82(long j, n92 n92Var, fa4 fa4Var, o2b o2bVar, String str, adg adgVar) {
        super(2, n92Var);
        this.b = 6;
        this.f = o2bVar;
        this.g = str;
        this.c = j;
        this.h = fa4Var;
        this.i = adgVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i82(d4e d4eVar, k82 k82Var, xy0 xy0Var, long j, va6 va6Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 0;
        this.f = d4eVar;
        this.g = k82Var;
        this.h = xy0Var;
        this.c = j;
        this.i = va6Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i82(Object obj, Object obj2, Object obj3, Object obj4, long j, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
        this.g = obj2;
        this.h = obj3;
        this.i = obj4;
        this.c = j;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i82(h9g h9gVar, long j, String str, awa awaVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 7;
        this.g = h9gVar;
        this.c = j;
        this.h = str;
        this.i = awaVar;
    }
}
