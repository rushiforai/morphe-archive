package defpackage;

import com.medium.android.data.post.model.ReportPostReason;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class u5b extends p4d implements d55 {
    public final /* synthetic */ int b;
    public /* synthetic */ boolean c;
    public /* synthetic */ boolean d;
    public /* synthetic */ Enum e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ u5b(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        switch (this.b) {
            case 0:
                ReportPostReason reportPostReason = (ReportPostReason) this.e;
                boolean z = this.c;
                boolean z2 = this.d;
                br7.v(obj);
                return new t5b(reportPostReason, z, (reportPostReason == null || z2) ? false : true);
            default:
                e7b e7bVar = (e7b) this.e;
                boolean z3 = this.c;
                boolean z4 = this.d;
                br7.v(obj);
                return new n7b(e7bVar, z3, (e7bVar == null || z4) ? false : true);
        }
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        int i2 = 4;
        switch (i) {
            case 0:
                boolean zBooleanValue = ((Boolean) obj2).booleanValue();
                boolean zBooleanValue2 = ((Boolean) obj3).booleanValue();
                u5b u5bVar = new u5b(i2, 0, (n92) obj4);
                u5bVar.e = (ReportPostReason) obj;
                u5bVar.c = zBooleanValue;
                u5bVar.d = zBooleanValue2;
                return u5bVar.invokeSuspend(c1eVar);
            default:
                boolean zBooleanValue3 = ((Boolean) obj2).booleanValue();
                boolean zBooleanValue4 = ((Boolean) obj3).booleanValue();
                u5b u5bVar2 = new u5b(i2, 1, (n92) obj4);
                u5bVar2.e = (e7b) obj;
                u5bVar2.c = zBooleanValue3;
                u5bVar2.d = zBooleanValue4;
                return u5bVar2.invokeSuspend(c1eVar);
        }
    }
}
