package defpackage;

import com.medium.android.graphql.FullPostQuery;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hm9 extends p4d implements b55 {
    public int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ gn9 d;
    public final /* synthetic */ String e;
    public final /* synthetic */ FullPostQuery f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hm9(gn9 gn9Var, String str, FullPostQuery fullPostQuery, n92 n92Var) {
        super(2, n92Var);
        this.d = gn9Var;
        this.e = str;
        this.f = fullPostQuery;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        hm9 hm9Var = new hm9(this.d, this.e, this.f, n92Var);
        hm9Var.c = obj;
        return hm9Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((hm9) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:49:0x00eb, code lost:
    
        if (r2.a(r5, r17) == r3) goto L50;
     */
    /* JADX WARN: Removed duplicated region for block: B:24:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00d1 A[Catch: all -> 0x00b6, TRY_LEAVE, TryCatch #2 {all -> 0x00b6, blocks: (B:32:0x00a2, B:36:0x00ae, B:39:0x00b8, B:40:0x00bf, B:41:0x00c0, B:42:0x00d0, B:43:0x00d1), top: B:55:0x00a2, outer: #3 }] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r18) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 243
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hm9.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
