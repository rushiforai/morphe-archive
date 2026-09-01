package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fvb extends p4d implements f55 {
    public /* synthetic */ uid b;
    public /* synthetic */ boolean c;
    public /* synthetic */ az5 d;
    public /* synthetic */ wub e;
    public /* synthetic */ iub f;
    public final /* synthetic */ gvb g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fvb(gvb gvbVar, n92 n92Var) {
        super(6, n92Var);
        this.g = gvbVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        zub xubVar;
        uid uidVar = this.b;
        boolean z = this.c;
        az5 az5Var = this.d;
        wub wubVar = this.e;
        iub iubVar = this.f;
        br7.v(obj);
        atb atbVar = new atb(uidVar, true, z);
        if (muc.b0(uidVar.a.b)) {
            xubVar = new xub(az5Var, wubVar);
        } else {
            gvb gvbVar = this.g;
            xubVar = new yub(iubVar, gvbVar.j, gvbVar.b);
        }
        return new avb(atbVar, xubVar);
    }

    @Override // defpackage.f55
    public final Object p(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
        boolean zBooleanValue = ((Boolean) obj2).booleanValue();
        fvb fvbVar = new fvb(this.g, (n92) obj6);
        fvbVar.b = (uid) obj;
        fvbVar.c = zBooleanValue;
        fvbVar.d = (az5) obj3;
        fvbVar.e = (wub) obj4;
        fvbVar.f = (iub) obj5;
        return fvbVar.invokeSuspend(c1e.a);
    }
}
