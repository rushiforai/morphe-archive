package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hub implements pub {
    public final /* synthetic */ jtb a;
    public final /* synthetic */ gvb b;

    public hub(jtb jtbVar, gvb gvbVar) {
        this.a = jtbVar;
        this.b = gvbVar;
    }

    @Override // defpackage.pub
    public final void a() {
        k40.X(((htb) this.a).a).f();
    }

    @Override // defpackage.pub
    public final void b(uid uidVar) {
        gvb gvbVar = this.b;
        xpc xpcVar = gvbVar.g;
        xpcVar.getClass();
        xpcVar.m(null, uidVar);
        gvbVar.f.d("search", uidVar.a.b);
    }

    @Override // defpackage.pub
    public final void c() {
        gvb gvbVar = this.b;
        xpc xpcVar = gvbVar.g;
        uid uidVar = new uid((String) null, 7, 0L);
        xpcVar.getClass();
        xpcVar.m(null, uidVar);
        gvbVar.f.d("search", "");
    }

    @Override // defpackage.pub
    public final void d(boolean z) {
        gvb gvbVar = this.b;
        if (!gvbVar.i) {
            gvbVar.i = true;
            return;
        }
        xpc xpcVar = gvbVar.h;
        Boolean boolValueOf = Boolean.valueOf(z);
        xpcVar.getClass();
        xpcVar.m(null, boolValueOf);
    }

    @Override // defpackage.pub
    public final void e() {
        gvb gvbVar = this.b;
        gvbVar.c.a(((uid) gvbVar.g.getValue()).a.b);
        xpc xpcVar = gvbVar.h;
        Boolean bool = Boolean.FALSE;
        xpcVar.getClass();
        xpcVar.m(null, bool);
    }
}
