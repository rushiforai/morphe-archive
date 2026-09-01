package defpackage;

import android.content.res.Resources;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o91 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ nhc d;
    public final /* synthetic */ Resources e;
    public final /* synthetic */ bc1 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o91(Resources resources, bc1 bc1Var, nhc nhcVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 3;
        this.e = resources;
        this.f = bc1Var;
        this.d = nhcVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new o91(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new o91(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new o91(this.f, this.d, this.e, n92Var, 2);
            case 3:
                return new o91(this.e, this.f, this.d, n92Var);
            case 4:
                return new o91(this.f, this.d, this.e, n92Var, 4);
            case 5:
                return new o91(this.d, this.e, this.f, n92Var, 5);
            case 6:
                return new o91(this.d, this.e, this.f, n92Var, 6);
            case 7:
                return new o91(this.d, this.e, this.f, n92Var, 7);
            case 8:
                return new o91(this.d, this.e, this.f, n92Var, 8);
            default:
                return new o91(this.d, this.e, this.f, n92Var, 9);
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
        return ((o91) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:103:0x0247, code lost:
    
        if (r0 == r10) goto L115;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x027b, code lost:
    
        if (r0 == r10) goto L115;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x0162, code lost:
    
        if (r0 == r10) goto L71;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x0198, code lost:
    
        if (r0 == r10) goto L71;
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x0225, code lost:
    
        if (r0 == r10) goto L115;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r13) {
        /*
            Method dump skipped, instruction units count: 804
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.o91.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ o91(nhc nhcVar, Resources resources, bc1 bc1Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = nhcVar;
        this.e = resources;
        this.f = bc1Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ o91(bc1 bc1Var, nhc nhcVar, Resources resources, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = bc1Var;
        this.d = nhcVar;
        this.e = resources;
    }
}
