package vk;

import java.io.Serializable;

/* loaded from: classes.dex */
public final class v implements u, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final u f92833a;

    /* renamed from: b, reason: collision with root package name */
    public volatile transient boolean f92834b;

    /* renamed from: c, reason: collision with root package name */
    public transient Object f92835c;

    public v(u uVar) {
        uVar.getClass();
        this.f92833a = uVar;
    }

    @Override // vk.u
    public final Object get() {
        if (!this.f92834b) {
            synchronized (this) {
                try {
                    if (!this.f92834b) {
                        Object obj = this.f92833a.get();
                        this.f92835c = obj;
                        this.f92834b = true;
                        return obj;
                    }
                } finally {
                }
            }
        }
        return this.f92835c;
    }

    public final String toString() {
        Object obj;
        StringBuilder sb2 = new StringBuilder("Suppliers.memoize(");
        if (this.f92834b) {
            obj = "<supplier that returned " + this.f92835c + ">";
        } else {
            obj = this.f92833a;
        }
        sb2.append(obj);
        sb2.append(")");
        return sb2.toString();
    }
}
