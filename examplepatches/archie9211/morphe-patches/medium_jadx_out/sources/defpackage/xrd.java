package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xrd {
    public final hud a;
    public final k49 b = qo7.u(null);
    public final /* synthetic */ dsd c;

    public xrd(dsd dsdVar, hud hudVar, String str) {
        this.c = dsdVar;
        this.a = hudVar;
    }

    public final wrd a(x45 x45Var, x45 x45Var2) {
        k49 k49Var = this.b;
        wrd wrdVar = (wrd) k49Var.getValue();
        dsd dsdVar = this.c;
        if (wrdVar == null) {
            Object objInvoke = x45Var2.invoke(dsdVar.a.o0());
            Object objInvoke2 = x45Var2.invoke(dsdVar.a.o0());
            hud hudVar = this.a;
            dx dxVar = (dx) hudVar.a.invoke(objInvoke2);
            dxVar.d();
            bsd bsdVar = new bsd(dsdVar, objInvoke, dxVar, hudVar);
            wrdVar = new wrd(this, bsdVar, x45Var, x45Var2);
            k49Var.setValue(wrdVar);
            dsdVar.i.add(bsdVar);
        }
        wrdVar.c = x45Var2;
        wrdVar.b = x45Var;
        wrdVar.c(dsdVar.f());
        return wrdVar;
    }
}
