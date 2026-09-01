package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uh3 implements p3b {
    public final x45 a;
    public vh3 b;

    public uh3(x45 x45Var) {
        this.a = x45Var;
    }

    @Override // defpackage.p3b
    public final void c() {
        vh3 vh3Var = this.b;
        if (vh3Var != null) {
            vh3Var.dispose();
        }
        this.b = null;
    }

    @Override // defpackage.p3b
    public final void d() {
        this.b = (vh3) this.a.invoke(kyd.g);
    }

    @Override // defpackage.p3b
    public final void b() {
    }
}
