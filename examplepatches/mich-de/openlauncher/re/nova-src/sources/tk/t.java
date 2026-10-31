package tk;

/* loaded from: classes3.dex */
public abstract class t implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final fi.j f89438a;

    public t() {
        this.f89438a = null;
    }

    public void a(Exception exc) {
        fi.j jVar = this.f89438a;
        if (jVar != null) {
            jVar.b(exc);
        }
    }

    public abstract void b();

    @Override // java.lang.Runnable
    public final void run() {
        try {
            b();
        } catch (Exception e3) {
            a(e3);
        }
    }

    public t(fi.j jVar) {
        this.f89438a = jVar;
    }
}
