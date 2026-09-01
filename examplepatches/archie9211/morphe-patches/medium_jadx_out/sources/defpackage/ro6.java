package defpackage;

import com.medium.android.core.susi.SusiDestination;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ro6 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ to6 c;
    public final /* synthetic */ String d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SusiDestination f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ro6(to6 to6Var, String str, String str2, SusiDestination susiDestination, n92 n92Var) {
        super(2, n92Var);
        this.c = to6Var;
        this.d = str;
        this.e = str2;
        this.f = susiDestination;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new ro6(this.c, this.d, this.e, this.f, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((ro6) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x019b A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:102:0x019c A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0144  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r17) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 413
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ro6.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
