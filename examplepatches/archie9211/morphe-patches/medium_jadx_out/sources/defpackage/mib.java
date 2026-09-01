package defpackage;

import com.medium.android.graphql.type.ResponseSortType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mib extends p4d implements c55 {
    public /* synthetic */ Object b;
    public /* synthetic */ bib c;
    public final /* synthetic */ nib d;
    public final /* synthetic */ ResponseSortType e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mib(nib nibVar, ResponseSortType responseSortType, n92 n92Var) {
        super(3, n92Var);
        this.d = nibVar;
        this.e = responseSortType;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        Object obj4 = ((bjb) obj).a;
        mib mibVar = new mib(this.d, this.e, (n92) obj3);
        mibVar.b = obj4;
        mibVar.c = (bib) obj2;
        return mibVar.invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:62:0x0159  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r39) throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 691
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mib.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
