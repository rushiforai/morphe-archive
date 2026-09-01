package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class jn0 implements o52 {
    public final q62 a;

    public jn0(q62 q62Var) {
        q62Var.getClass();
        this.a = q62Var;
    }

    @Override // defpackage.o52
    public final boolean a(c8f c8fVar) {
        return c(c8fVar) && e(this.a.c());
    }

    @Override // defpackage.o52
    public final l41 b(e72 e72Var) {
        e72Var.getClass();
        return o7f.l(new j0(this, null, 25));
    }

    public abstract int d();

    public abstract boolean e(Object obj);
}
