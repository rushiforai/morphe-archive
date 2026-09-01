package defpackage;

import com.medium.android.graphql.type.ResponseSortType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class a0f extends p4d implements b55 {
    public rya b;
    public nya c;
    public nya d;
    public Object e;
    public int f;
    public /* synthetic */ Object g;
    public final /* synthetic */ b0f h;
    public final /* synthetic */ uze i;
    public final /* synthetic */ agb j;
    public final /* synthetic */ ResponseSortType k;
    public final /* synthetic */ String l;
    public final /* synthetic */ String m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a0f(b0f b0fVar, uze uzeVar, agb agbVar, ResponseSortType responseSortType, String str, String str2, n92 n92Var) {
        super(2, n92Var);
        this.h = b0fVar;
        this.i = uzeVar;
        this.j = agbVar;
        this.k = responseSortType;
        this.l = str;
        this.m = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        a0f a0fVar = new a0f(this.h, this.i, this.j, this.k, this.l, this.m, n92Var);
        a0fVar.g = obj;
        return a0fVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((a0f) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x0183, code lost:
    
        if (defpackage.r6c.m(r14, r1, r15) == r12) goto L44;
     */
    /* JADX WARN: Removed duplicated region for block: B:18:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x00cf  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0102  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0108  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0130  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x015f  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r16) {
        /*
            Method dump skipped, instruction units count: 412
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a0f.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
