package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wob implements cy6, AutoCloseable {
    public final String a;
    public final vob b;
    public boolean c;

    public wob(vob vobVar, String str) {
        this.a = str;
        this.b = vobVar;
    }

    @Override // defpackage.cy6
    public final void f(iy6 iy6Var, ux6 ux6Var) {
        if (ux6Var == ux6.ON_DESTROY) {
            this.c = false;
            iy6Var.getLifecycle().b(this);
        }
    }

    public final void m(epb epbVar, wx6 wx6Var) {
        epbVar.getClass();
        wx6Var.getClass();
        if (this.c) {
            ygf.f("Already attached to lifecycleOwner");
            return;
        }
        this.c = true;
        wx6Var.a(this);
        epbVar.c(this.a, (ny1) this.b.b.f);
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
    }
}
