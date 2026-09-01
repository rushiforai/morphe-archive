package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wrd implements upc {
    public final bsd a;
    public x45 b;
    public x45 c;
    public final /* synthetic */ xrd d;

    public wrd(xrd xrdVar, bsd bsdVar, x45 x45Var, x45 x45Var2) {
        this.d = xrdVar;
        this.a = bsdVar;
        this.b = x45Var;
        this.c = x45Var2;
    }

    public final void c(zrd zrdVar) {
        Object objInvoke = this.c.invoke(zrdVar.c());
        boolean zG = this.d.c.g();
        bsd bsdVar = this.a;
        if (zG) {
            bsdVar.g(this.c.invoke(zrdVar.a()), objInvoke, (tj4) this.b.invoke(zrdVar));
        } else {
            bsdVar.h(objInvoke, (tj4) this.b.invoke(zrdVar));
        }
    }

    @Override // defpackage.upc
    public final Object getValue() {
        c(this.d.c.f());
        return this.a.j.getValue();
    }
}
