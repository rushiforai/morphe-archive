package ads_mobile_sdk;

/* loaded from: classes.dex */
public abstract class e13 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final fi.j f2705a;

    public e13() {
        this.f2705a = null;
    }

    public abstract void a();

    @Override // java.lang.Runnable
    public final void run() {
        try {
            a();
        } catch (Exception e3) {
            fi.j jVar = this.f2705a;
            if (jVar != null) {
                jVar.b(e3);
            }
        }
    }

    public e13(fi.j jVar) {
        this.f2705a = jVar;
    }
}
