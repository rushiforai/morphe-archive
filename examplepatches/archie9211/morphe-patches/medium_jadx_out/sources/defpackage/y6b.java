package defpackage;

import com.medium.android.data.post.model.ReportPostReason;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class y6b extends p4d implements b55 {
    public db6 b;
    public Object c;
    public int d;
    public /* synthetic */ Object e;
    public final /* synthetic */ a7b f;
    public final /* synthetic */ boolean g;
    public final /* synthetic */ ReportPostReason h;
    public final /* synthetic */ boolean i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y6b(a7b a7bVar, boolean z, ReportPostReason reportPostReason, boolean z2, n92 n92Var) {
        super(2, n92Var);
        this.f = a7bVar;
        this.g = z;
        this.h = reportPostReason;
        this.i = z2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        y6b y6bVar = new y6b(this.f, this.g, this.h, this.i, n92Var);
        y6bVar.e = obj;
        return y6bVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((y6b) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00ea  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00ef  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00f4  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x010a A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x010b A[RETURN] */
    /* JADX WARN: Type inference failed for: r2v13 */
    /* JADX WARN: Type inference failed for: r2v15 */
    /* JADX WARN: Type inference failed for: r2v6, types: [n33] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r19) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 268
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.y6b.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
