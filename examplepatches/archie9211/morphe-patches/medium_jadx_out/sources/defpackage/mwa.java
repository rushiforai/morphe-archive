package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mwa {
    public q22 a;
    public int b;
    public k65 c;
    public b55 d;
    public int e;
    public t68 f;
    public f78 g;

    public mwa(q22 q22Var) {
        this.a = q22Var;
    }

    public final boolean a() {
        if (this.a != null) {
            k65 k65Var = this.c;
            if (k65Var != null ? k65Var.a() : false) {
                return true;
            }
        }
        return false;
    }

    public final void b() {
        q22 q22Var = this.a;
        if (q22Var != null) {
            q22Var.s(this, null);
        }
    }

    public final s76 c(Object obj) {
        s76 s76VarS;
        q22 q22Var = this.a;
        return (q22Var == null || (s76VarS = q22Var.s(this, obj)) == null) ? s76.IGNORED : s76VarS;
    }

    public final void d() {
        q22 q22Var = this.a;
        if (q22Var != null) {
            q22Var.o = true;
            q22Var.t.c();
        }
        this.a = null;
        this.f = null;
        this.g = null;
        this.d = null;
    }

    public final void e(boolean z) {
        int i = this.b;
        this.b = z ? i | 32 : i & (-33);
    }
}
