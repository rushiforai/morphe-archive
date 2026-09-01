package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class pwb {
    public final Object a;
    public final c55 b;
    public final c55 c;
    public final Object d;
    public final p4d e;
    public final c55 f;
    public Object g;
    public int h = -1;
    public final /* synthetic */ rwb i;

    public pwb(rwb rwbVar, Object obj, c55 c55Var, c55 c55Var2, Object obj2, p4d p4dVar, c55 c55Var3) {
        this.i = rwbVar;
        this.a = obj;
        this.b = c55Var;
        this.c = c55Var2;
        this.d = obj2;
        this.e = p4dVar;
        this.f = c55Var3;
    }

    public final void a() {
        Object obj = this.g;
        if (obj instanceof jwb) {
            ((jwb) obj).h(this.h, this.i.a);
            return;
        }
        yh3 yh3Var = obj instanceof yh3 ? (yh3) obj : null;
        if (yh3Var != null) {
            yh3Var.dispose();
        }
    }
}
