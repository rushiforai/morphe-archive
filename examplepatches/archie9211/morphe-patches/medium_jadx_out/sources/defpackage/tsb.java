package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tsb {
    public final /* synthetic */ vsb a;

    public tsb(vsb vsbVar) {
        this.a = vsbVar;
    }

    public final long a(int i, long j) {
        vsb vsbVar = this.a;
        vsbVar.j = i;
        fx8 fx8Var = vsbVar.b;
        return (fx8Var == null || !(vsbVar.a.d() || vsbVar.a.c())) ? vsbVar.c(vsbVar.k, j, i) : fx8Var.b(j, vsbVar.j, vsbVar.m);
    }
}
