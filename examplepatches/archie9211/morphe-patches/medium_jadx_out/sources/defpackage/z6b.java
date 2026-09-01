package defpackage;

import com.medium.android.data.post.model.ReportPostReason;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class z6b extends p4d implements e55 {
    public /* synthetic */ ReportPostReason b;
    public /* synthetic */ boolean c;
    public /* synthetic */ boolean d;
    public /* synthetic */ boolean e;
    public final /* synthetic */ a7b f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z6b(a7b a7bVar, n92 n92Var) {
        super(5, n92Var);
        this.f = a7bVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        ReportPostReason reportPostReason = this.b;
        boolean z = this.c;
        boolean z2 = this.d;
        boolean z3 = this.e;
        br7.v(obj);
        return new x6b(reportPostReason, z2, z, (reportPostReason == null || z3) ? false : true, this.f.b.getCanHideResponse());
    }

    @Override // defpackage.e55
    public final Object s(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        boolean zBooleanValue = ((Boolean) obj2).booleanValue();
        boolean zBooleanValue2 = ((Boolean) obj3).booleanValue();
        boolean zBooleanValue3 = ((Boolean) obj4).booleanValue();
        z6b z6bVar = new z6b(this.f, (n92) obj5);
        z6bVar.b = (ReportPostReason) obj;
        z6bVar.c = zBooleanValue;
        z6bVar.d = zBooleanValue2;
        z6bVar.e = zBooleanValue3;
        return z6bVar.invokeSuspend(c1e.a);
    }
}
