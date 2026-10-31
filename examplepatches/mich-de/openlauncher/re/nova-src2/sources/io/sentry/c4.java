package io.sentry;

/* loaded from: classes4.dex */
public final /* synthetic */ class c4 implements j2, k4 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ f4 f67154a;

    public /* synthetic */ c4(f4 f4Var) {
        this.f67154a = f4Var;
    }

    @Override // io.sentry.k4
    public void a(i4 i4Var) {
        f4 f4Var = this.f67154a;
        t4 t4Var = f4Var.f67238q;
        if (t4Var != null) {
            t4Var.a(i4Var);
        }
        e4 e4Var = f4Var.f67229f;
        s4 s4Var = f4Var.f67239r;
        if (s4Var.f67768e == null) {
            if (e4Var.f67211a) {
                f4Var.q(e4Var.f67212b, null);
            }
        } else if (!s4Var.f67767d || f4Var.v()) {
            f4Var.m();
        }
    }

    @Override // io.sentry.j2
    public void j(m0 m0Var) {
        f4 f4Var = this.f67154a;
        f4Var.getClass();
        i2 i2Var = (i2) m0Var;
        synchronized (i2Var.f67309l) {
            if (i2Var.f67298a == f4Var) {
                ((i2) m0Var).a();
            }
        }
    }
}
