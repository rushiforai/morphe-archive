package defpackage;

import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pz extends p4d implements x45 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pz(j00 j00Var, h00 h00Var, sz szVar, yl2 yl2Var, Set set, n92 n92Var) {
        super(1, n92Var);
        this.b = 0;
        this.d = j00Var;
        this.e = h00Var;
        this.f = szVar;
        this.g = yl2Var;
        this.h = set;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        int i = this.b;
        Object obj = this.h;
        Object obj2 = this.g;
        Object obj3 = this.f;
        Object obj4 = this.e;
        switch (i) {
            case 0:
                return new pz((j00) this.d, (h00) obj4, (sz) obj3, (yl2) obj2, (Set) obj, n92Var);
            case 1:
                return new pz((xbg) obj4, (vwa) obj3, (osf) obj2, (rya) obj, n92Var, 1);
            default:
                return new pz((xbg) obj4, (o2b) obj3, (jsf) obj2, (rya) obj, n92Var, 2);
        }
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        n92 n92Var = (n92) obj;
        switch (i) {
        }
        return ((pz) create(n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:71:0x014c, code lost:
    
        if (r1 == r9) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x0172, code lost:
    
        if (r0.b(r1, r14) != r9) goto L82;
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:?, code lost:
    
        return r9;
     */
    /* JADX WARN: Removed duplicated region for block: B:23:0x005e A[Catch: zzfx -> 0x001d, TryCatch #1 {zzfx -> 0x001d, blocks: (B:7:0x0018, B:21:0x0051, B:23:0x005e, B:25:0x006a, B:26:0x006d, B:27:0x006e, B:28:0x0079, B:12:0x0023, B:18:0x0042, B:15:0x002c), top: B:86:0x0014 }] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r15) throws com.google.android.recaptcha.internal.zzfx {
        /*
            Method dump skipped, instruction units count: 386
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pz.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ pz(xbg xbgVar, Object obj, fnf fnfVar, rya ryaVar, n92 n92Var, int i) {
        super(1, n92Var);
        this.b = i;
        this.e = xbgVar;
        this.f = obj;
        this.g = fnfVar;
        this.h = ryaVar;
    }
}
