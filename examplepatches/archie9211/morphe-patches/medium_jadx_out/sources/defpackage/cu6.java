package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cu6 {
    public final Object a;
    public final du6 b;
    public int d;
    public cu6 e;
    public boolean f;
    public int c = -1;
    public final k49 g = qo7.u(null);

    public cu6(Object obj, du6 du6Var) {
        this.a = obj;
        this.b = du6Var;
    }

    public final cu6 a() {
        if (this.f) {
            e26.c("Pin should not be called on an already disposed item ");
        }
        if (this.d == 0) {
            this.b.a.add(this);
            cu6 cu6Var = (cu6) this.g.getValue();
            if (cu6Var != null) {
                cu6Var.a();
            } else {
                cu6Var = null;
            }
            this.e = cu6Var;
        }
        this.d++;
        return this;
    }

    public final void b() {
        if (this.f) {
            return;
        }
        if (this.d <= 0) {
            e26.c("Release should only be called once");
        }
        int i = this.d - 1;
        this.d = i;
        if (i == 0) {
            this.b.a.remove(this);
            cu6 cu6Var = this.e;
            if (cu6Var != null) {
                cu6Var.b();
            }
            this.e = null;
        }
    }
}
