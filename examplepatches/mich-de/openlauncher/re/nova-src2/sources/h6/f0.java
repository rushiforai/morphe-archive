package h6;

/* loaded from: classes.dex */
public final class f0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ j0 f59364a;

    public f0(j0 j0Var) {
        this.f59364a = j0Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Object obj;
        synchronized (this.f59364a.f59387a) {
            obj = this.f59364a.f59392f;
            this.f59364a.f59392f = j0.f59386k;
        }
        this.f59364a.j(obj);
    }
}
