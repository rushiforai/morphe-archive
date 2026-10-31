package kk;

/* loaded from: classes3.dex */
public abstract class h implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final fi.j f71534a;

    public h() {
        this.f71534a = null;
    }

    public abstract void a();

    @Override // java.lang.Runnable
    public final void run() {
        try {
            a();
        } catch (Exception e3) {
            fi.j jVar = this.f71534a;
            if (jVar != null) {
                jVar.b(e3);
            }
        }
    }

    public h(fi.j jVar) {
        this.f71534a = jVar;
    }
}
