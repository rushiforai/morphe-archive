package defpackage;

import android.content.res.Resources;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class st4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ nhc d;
    public final /* synthetic */ Resources e;
    public final /* synthetic */ fu4 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public st4(fu4 fu4Var, nhc nhcVar, Resources resources, n92 n92Var) {
        super(2, n92Var);
        this.b = 2;
        this.f = fu4Var;
        this.d = nhcVar;
        this.e = resources;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new st4(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new st4(this.d, this.e, this.f, n92Var, 1);
            default:
                return new st4(this.f, this.d, this.e, n92Var);
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
        return ((st4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x0055, code lost:
    
        if (r0 == r9) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0076, code lost:
    
        if (r0 == r9) goto L22;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r11) {
        /*
            Method dump skipped, instruction units count: 244
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.st4.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ st4(nhc nhcVar, Resources resources, fu4 fu4Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = nhcVar;
        this.e = resources;
        this.f = fu4Var;
    }
}
