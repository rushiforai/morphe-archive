package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q41 {
    public Object a;
    public t41 b;
    public dcb c;
    public boolean d;

    public final void a(Object obj) {
        this.d = true;
        t41 t41Var = this.b;
        if (t41Var == null || !t41Var.b.k(obj)) {
            return;
        }
        this.a = null;
        this.b = null;
        this.c = null;
    }

    public final void b(Throwable th) {
        this.d = true;
        t41 t41Var = this.b;
        if (t41Var == null || !t41Var.b.l(th)) {
            return;
        }
        this.a = null;
        this.b = null;
        this.c = null;
    }

    public final void finalize() {
        dcb dcbVar;
        t41 t41Var = this.b;
        if (t41Var != null) {
            s41 s41Var = t41Var.b;
            if (!s41Var.isDone()) {
                s41Var.l(new d2("The completer object was garbage collected - this future would otherwise never complete. The tag was: " + this.a, 1));
            }
        }
        if (this.d || (dcbVar = this.c) == null) {
            return;
        }
        dcbVar.k(null);
    }
}
