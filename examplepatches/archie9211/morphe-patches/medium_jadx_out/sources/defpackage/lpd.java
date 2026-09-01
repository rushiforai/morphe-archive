package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class lpd implements c55 {
    public final /* synthetic */ Object a;
    public final /* synthetic */ mpd b;
    public final /* synthetic */ xpd c;

    public lpd(Object obj, mpd mpdVar, xpd xpdVar) {
        this.a = obj;
        this.b = mpdVar;
        this.c = xpdVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        r28 r28Var = (r28) obj;
        ((Number) obj3).intValue();
        r28Var.getClass();
        p65 p65Var = (p65) ((x12) obj2);
        p65Var.Y(-539066904);
        boolean zF = p65Var.f(this.a);
        Object objM = p65Var.M();
        if (zF || objM == w12.a) {
            objM = qo7.u(Boolean.FALSE);
            p65Var.j0(objM);
        }
        r28 r28VarV = pwd.V(r28Var, new v67((l78) objM, this.b, this.c, 1));
        p65Var.p(false);
        return r28VarV;
    }
}
