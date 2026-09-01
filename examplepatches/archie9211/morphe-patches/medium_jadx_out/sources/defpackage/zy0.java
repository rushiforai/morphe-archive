package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zy0 extends ql0 {
    public x51 a;
    public x45 b;

    @Override // defpackage.ql0
    public final void a() {
        this.b = null;
        this.a = null;
    }

    @Override // defpackage.ql0
    public final void b(Throwable th) {
        x51 x51Var = this.a;
        if (x51Var != null) {
            x51Var.resumeWith(br7.n(th));
        }
    }
}
