package ab0;

import bb0.d;
import java.io.Serializable;
import java.util.Queue;

/* loaded from: classes5.dex */
public final class a implements za0.b, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public d f780a;

    /* renamed from: b, reason: collision with root package name */
    public Queue f781b;

    @Override // za0.b
    public final boolean a() {
        return true;
    }

    @Override // za0.b
    public final boolean b() {
        return true;
    }

    @Override // za0.b
    public final void c() {
        j(2);
    }

    @Override // za0.b
    public final boolean d() {
        return true;
    }

    @Override // za0.b
    public final boolean e() {
        return true;
    }

    @Override // za0.b
    public final void f(Throwable th2) {
        j(4);
    }

    @Override // za0.b
    public final boolean g() {
        return true;
    }

    @Override // za0.b
    public final void h(String str) {
        j(5);
    }

    public final void j(int i5) {
        b bVar = new b();
        bVar.f782a = i5;
        bVar.f783b = this.f780a;
        Thread.currentThread().getClass();
        this.f781b.add(bVar);
    }
}
