package defpackage;

import com.medium.android.donkey.main.MainActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cf7 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ MainActivity c;
    public final /* synthetic */ d2f d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cf7(MainActivity mainActivity, d2f d2fVar, n92 n92Var) {
        super(2, n92Var);
        this.c = mainActivity;
        this.d = d2fVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new cf7(this.c, this.d, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((cf7) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:37:0x00a2, code lost:
    
        if (defpackage.gr7.u(r3, r4, (defpackage.xjb) r2, r18) == r1) goto L38;
     */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0099  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r19) throws java.lang.Exception {
        /*
            Method dump skipped, instruction units count: 231
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cf7.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
