package bb0;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Queue;
import java.util.concurrent.LinkedBlockingQueue;

/* loaded from: classes5.dex */
public final class d implements za0.b {

    /* renamed from: a, reason: collision with root package name */
    public final String f17802a;

    /* renamed from: b, reason: collision with root package name */
    public volatile za0.b f17803b;

    /* renamed from: c, reason: collision with root package name */
    public Boolean f17804c;

    /* renamed from: d, reason: collision with root package name */
    public Method f17805d;

    /* renamed from: e, reason: collision with root package name */
    public ab0.a f17806e;

    /* renamed from: f, reason: collision with root package name */
    public final Queue f17807f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f17808g;

    public d(String str, LinkedBlockingQueue linkedBlockingQueue, boolean z11) {
        this.f17802a = str;
        this.f17807f = linkedBlockingQueue;
        this.f17808g = z11;
    }

    @Override // za0.b
    public final boolean a() {
        return j().a();
    }

    @Override // za0.b
    public final boolean b() {
        return j().b();
    }

    @Override // za0.b
    public final void c() {
        j().c();
    }

    @Override // za0.b
    public final boolean d() {
        return j().d();
    }

    @Override // za0.b
    public final boolean e() {
        return j().e();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return obj != null && d.class == obj.getClass() && this.f17802a.equals(((d) obj).f17802a);
    }

    @Override // za0.b
    public final void f(Throwable th2) {
        j().f(th2);
    }

    @Override // za0.b
    public final boolean g() {
        return j().g();
    }

    @Override // za0.b
    public final void h(String str) {
        j().h(str);
    }

    public final int hashCode() {
        return this.f17802a.hashCode();
    }

    @Override // za0.b
    public final boolean i(int i5) {
        return j().i(i5);
    }

    public final za0.b j() {
        if (this.f17803b != null) {
            return this.f17803b;
        }
        if (this.f17808g) {
            return b.f17799a;
        }
        if (this.f17806e == null) {
            Queue queue = this.f17807f;
            ab0.a aVar = new ab0.a();
            aVar.f780a = this;
            aVar.f781b = queue;
            this.f17806e = aVar;
        }
        return this.f17806e;
    }

    public final String k() {
        return this.f17802a;
    }

    public final boolean l() {
        Boolean bool = this.f17804c;
        if (bool != null) {
            return bool.booleanValue();
        }
        try {
            this.f17805d = this.f17803b.getClass().getMethod("log", ab0.b.class);
            this.f17804c = Boolean.TRUE;
        } catch (NoSuchMethodException unused) {
            this.f17804c = Boolean.FALSE;
        }
        return this.f17804c.booleanValue();
    }

    public final boolean m() {
        return this.f17803b instanceof b;
    }

    public final boolean n() {
        return this.f17803b == null;
    }

    public final void o(ab0.b bVar) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        if (l()) {
            try {
                this.f17805d.invoke(this.f17803b, bVar);
            } catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException unused) {
            }
        }
    }

    public final void p(za0.b bVar) {
        this.f17803b = bVar;
    }
}
