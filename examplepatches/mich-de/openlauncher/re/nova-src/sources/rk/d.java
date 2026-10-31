package rk;

import fi.j;

/* loaded from: classes3.dex */
public abstract class d implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final j f86015a;

    public d() {
        this.f86015a = null;
    }

    public abstract void a();

    @Override // java.lang.Runnable
    public final void run() {
        try {
            a();
        } catch (Exception e3) {
            j jVar = this.f86015a;
            if (jVar != null) {
                jVar.b(e3);
            }
        }
    }

    public d(j jVar) {
        this.f86015a = jVar;
    }
}
